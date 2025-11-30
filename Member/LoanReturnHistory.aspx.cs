using System;
using System.Data;
using System.Data.SqlClient;

public partial class Member_LoanReturnHistory : System.Web.UI.Page
{
    string cs = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;Integrated Security=True;User Instance=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Member"] == null)
            {
                Response.Redirect("~/User/memberlogin.aspx");
                return;
            }

            BindLoanReturnHistory();
        }
    }

    void BindLoanReturnHistory()
    {
        string username = Session["Member"].ToString();
        string memberName = GetMemberName(username);

        if (string.IsNullOrEmpty(memberName))
        {
            lblMsg.Text = "Member not found.";
            return;
        }

        DataTable dt = new DataTable();

        using (SqlConnection cn = new SqlConnection(cs))
        {
            string query = @"
                SELECT LReturn_id, loan_date, Bachatgat_name, Loan_avl_amt, Loan_amt, Loan_paid_amt, interest, Total_paid
                FROM LoanReturn
                WHERE Bachatgat_name IN (SELECT Bachatgat_name FROM BachatgatMember WHERE M_name=@m)
                ORDER BY LReturn_id DESC
            ";

            using (SqlCommand cmd = new SqlCommand(query, cn))
            {
                cmd.Parameters.AddWithValue("@m", memberName);
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                }
            }
        }

        if (dt.Rows.Count > 0)
        {
            gvLoanReturn.DataSource = dt;
            gvLoanReturn.DataBind();
            lblMsg.Text = "";
        }
        else
        {
            gvLoanReturn.DataSource = null;
            gvLoanReturn.DataBind();
            lblMsg.Text = "No loan return records found.";
        }
    }

    string GetMemberName(string username)
    {
        using (SqlConnection cn = new SqlConnection(cs))
        using (SqlCommand cmd = new SqlCommand("SELECT M_name FROM BachatgatMember WHERE Username=@u", cn))
        {
            cmd.Parameters.AddWithValue("@u", username);
            cn.Open();
            object o = cmd.ExecuteScalar();
            cn.Close();
            return (o == null) ? "" : o.ToString();
        }
    }
}
