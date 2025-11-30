using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Bachatgat_LoanApproval : System.Web.UI.Page
{
    string cs = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;Integrated Security=True;User Instance=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["BachatGat"] == null)
            {
                Response.Redirect("~/User/Bachatgat login.aspx");
                return;
            }
            LoadLoans();
        }
    }

    string GetBachatgatName()
    {
        string username = (Session["BachatGat"] ?? "").ToString();
        if (string.IsNullOrEmpty(username)) return "";

        using (SqlConnection cn = new SqlConnection(cs))
        using (SqlCommand cmd = new SqlCommand("SELECT B_Name FROM Bachatgat_Reg WHERE Username=@u", cn))
        {
            cmd.Parameters.AddWithValue("@u", username);
            cn.Open();
            object o = cmd.ExecuteScalar();
            cn.Close();
            return (o != null && o != DBNull.Value) ? o.ToString() : "";
        }
    }

    void LoadLoans()
    {
        string bname = GetBachatgatName();
        DataTable dt = new DataTable();
        string sql = @"
            SELECT la.loan_id, la.member_name, la.SavingAmt, la.Loan_Require, la.Loan_appl_date,
                   ISNULL(lap.Appl_status,'') AS Appl_status,
                   ISNULL(lap.DeclineReason,'') AS DeclineReason
            FROM LoanApplication la
            LEFT JOIN LoanApproval lap ON la.loan_id = lap.Loan_id
            WHERE la.bachatgat_name=@bg
            ORDER BY la.loan_id DESC";

        using (SqlConnection cn = new SqlConnection(cs))
        using (SqlCommand cmd = new SqlCommand(sql, cn))
        {
            cmd.Parameters.AddWithValue("@bg", bname);
            using (SqlDataAdapter da = new SqlDataAdapter(cmd))
            {
                da.Fill(dt);
            }
        }
        gvLoans.DataSource = dt;
        gvLoans.DataBind();
    }

    protected void gvLoans_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvLoans.EditIndex = e.NewEditIndex;
        LoadLoans();
    }

    protected void gvLoans_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvLoans.EditIndex = -1;
        LoadLoans();
    }

    protected void gvLoans_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int loanId = Convert.ToInt32(gvLoans.DataKeys[e.RowIndex].Value);

        GridViewRow row = gvLoans.Rows[e.RowIndex];
        DropDownList ddlStatus = (DropDownList)row.FindControl("ddlStatus");
        TextBox txtReason = (TextBox)row.FindControl("txtReason");

        string status = ddlStatus.SelectedValue;
        string reason = txtReason.Text.Trim();

        UpsertLoanApproval(loanId, status, reason);

        gvLoans.EditIndex = -1;
        LoadLoans();
        lblMsg.Text = "Loan approval updated successfully!";
    }

    void UpsertLoanApproval(int loanId, string status, string reason)
    {
        bool exists = false;
        using (SqlConnection cn = new SqlConnection(cs))
        using (SqlCommand cmd = new SqlCommand("SELECT COUNT(1) FROM LoanApproval WHERE Loan_id=@id", cn))
        {
            cmd.Parameters.AddWithValue("@id", loanId);
            cn.Open();
            exists = Convert.ToInt32(cmd.ExecuteScalar()) > 0;
            cn.Close();
        }

        string today = DateTime.Now.ToString("yyyy-MM-dd");
        int loanReq = 0;

        using (SqlConnection cn = new SqlConnection(cs))
        using (SqlCommand cmdGet = new SqlCommand("SELECT Loan_Require FROM LoanApplication WHERE loan_id=@id", cn))
        {
            cmdGet.Parameters.AddWithValue("@id", loanId);
            cn.Open();
            using (SqlDataReader dr = cmdGet.ExecuteReader())
            {
                if (dr.Read() && dr["Loan_Require"] != DBNull.Value)
                    loanReq = Convert.ToInt32(dr["Loan_Require"]);
            }
            cn.Close();
        }

        string bname = GetBachatgatName();

        if (exists)
        {
            using (SqlConnection cn = new SqlConnection(cs))
            using (SqlCommand cmd = new SqlCommand(
                "UPDATE LoanApproval SET Appl_status=@s, Loan_appr_date=@d, DeclineReason=@r WHERE Loan_id=@id", cn))
            {
                cmd.Parameters.AddWithValue("@s", status);
                cmd.Parameters.AddWithValue("@d", today);
                cmd.Parameters.AddWithValue("@r", (object)reason ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@id", loanId);
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
            }
        }
        else
        {
            int nextApproveId = GetNextApproveId();
            using (SqlConnection cn = new SqlConnection(cs))
            using (SqlCommand cmd = new SqlCommand(
                "INSERT INTO LoanApproval(Approve_id, Loan_id, Bachatgat_name, Loan_req, Loan_appr_date, Appl_status, DeclineReason) " +
                "VALUES(@aid,@lid,@bname,@req,@d,@s,@r)", cn))
            {
                cmd.Parameters.AddWithValue("@aid", nextApproveId);
                cmd.Parameters.AddWithValue("@lid", loanId);
                cmd.Parameters.AddWithValue("@bname", bname);
                cmd.Parameters.AddWithValue("@req", loanReq);
                cmd.Parameters.AddWithValue("@d", today);
                cmd.Parameters.AddWithValue("@s", status);
                cmd.Parameters.AddWithValue("@r", (object)reason ?? DBNull.Value);
                cn.Open();
                cmd.ExecuteNonQuery();
                cn.Close();
            }
        }
    }

    int GetNextApproveId()
    {
        int next = 1;
        using (SqlConnection cn = new SqlConnection(cs))
        using (SqlCommand cmd = new SqlCommand("SELECT ISNULL(MAX(Approve_id),0) FROM LoanApproval", cn))
        {
            cn.Open();
            object o = cmd.ExecuteScalar();
            cn.Close();
            if (o != null && o != DBNull.Value) next = Convert.ToInt32(o) + 1;
        }
        return next;
    }
}
