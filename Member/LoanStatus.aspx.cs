using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Member_LoanStatus : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;Integrated Security=True;User Instance=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Member"] == null) Response.Redirect("~/Login.aspx");
            BindLoanStatus();
        }
    }

    void BindLoanStatus()
    {
        string username = Session["Member"].ToString();
        string memberName = GetMemberName(username);

        SqlCommand cmd = new SqlCommand("SELECT la.Loan_id, la.Loan_req, la.Loan_appr_date, la.Appl_status, la.DeclineReason FROM LoanApproval la INNER JOIN LoanApplication l ON la.Loan_id=l.loan_id WHERE l.member_name=@mem", cn);
        cmd.Parameters.AddWithValue("@mem", memberName);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);

        gvLoanStatus.DataSource = dt;
        gvLoanStatus.DataBind();
    }

    string GetMemberName(string username)
    {
        SqlCommand cmd = new SqlCommand("SELECT M_name FROM BachatgatMember WHERE Username=@u", cn);
        cmd.Parameters.AddWithValue("@u", username);
        cn.Open();
        object o = cmd.ExecuteScalar();
        cn.Close();
        return (o == null) ? "" : o.ToString();
    }

    protected void gvLoanStatus_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string status = e.Row.Cells[3].Text.ToLower();
            if (status == "approved") e.Row.CssClass = "approved";
            else if (status == "rejected") e.Row.CssClass = "rejected";
            else e.Row.CssClass = "scrutiny";
        }
    }
}
