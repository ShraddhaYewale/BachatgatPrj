using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Bachatgat_LoanReturnHistory : System.Web.UI.Page
{
    string cs = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;Integrated Security=True;User Instance=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadMembers();
            GenerateID(); // Generate automatic LReturn_id
        }
    }

    private void LoadMembers()
    {
        string bname = GetBachatgatName();

        using (SqlConnection cn = new SqlConnection(cs))
        using (SqlCommand cmd = new SqlCommand("SELECT M_id, M_name FROM BachatgatMember WHERE Bachatgat_name=@bname", cn))
        {
            cmd.Parameters.AddWithValue("@bname", bname);
            cn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            ddlMember.DataSource = dr;
            ddlMember.DataTextField = "M_name";
            ddlMember.DataValueField = "M_id";
            ddlMember.DataBind();
            cn.Close();
        }
        ddlMember.Items.Insert(0, new ListItem("-- Select Member --", "0"));
    }

    // Get Bachatgat name from session
    private string GetBachatgatName()
    {
        string username = Session["BachatGat"].ToString() ?? "";
        if (string.IsNullOrEmpty(username)) return "";

        using (SqlConnection cn = new SqlConnection(cs))
        using (SqlCommand cmd = new SqlCommand("SELECT B_Name FROM Bachatgat_Reg WHERE Username=@u", cn))
        {
            cmd.Parameters.AddWithValue("@u", username);
            cn.Open();
            object o = cmd.ExecuteScalar();
            cn.Close();
            return o.ToString() ?? "";
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (ddlMember.SelectedValue == "0")
        {
            lblMsg.Text = "Please select a member.";
            return;
        }

        int memberId = Convert.ToInt32(ddlMember.SelectedValue);
        string bname = GetBachatgatName();
        string loanDate = txtLoanDate.Text;
        int loanAvl = Convert.ToInt32(txtLoanAvl.Text);
        int loanAmt = Convert.ToInt32(txtLoanAmt.Text);
        int loanPaid = Convert.ToInt32(txtLoanPaid.Text);
        int interest = Convert.ToInt32(txtInterest.Text);
        int totalPaid = Convert.ToInt32(txtTotalPaid.Text);
        int lReturnId = Convert.ToInt32(txtid.Text); // use generated ID

        using (SqlConnection cn = new SqlConnection(cs))
        using (SqlCommand cmd = new SqlCommand(
            @"INSERT INTO LoanReturn (LReturn_id, loan_date, Bachatgat_name, Loan_avl_amt, Loan_amt, Loan_paid_amt, interest, Total_paid)
              VALUES (@id, @date, @bname, @avl, @amt, @paid, @int, @total)", cn))
        {
            cmd.Parameters.AddWithValue("@id", lReturnId);
            cmd.Parameters.AddWithValue("@date", loanDate);
            cmd.Parameters.AddWithValue("@bname", bname);
            cmd.Parameters.AddWithValue("@avl", loanAvl);
            cmd.Parameters.AddWithValue("@amt", loanAmt);
            cmd.Parameters.AddWithValue("@paid", loanPaid);
            cmd.Parameters.AddWithValue("@int", interest);
            cmd.Parameters.AddWithValue("@total", totalPaid);

            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
        }

        lblMsg.Text = "Loan return record saved successfully.";
        ClearForm();
        GenerateID(); // Generate new ID for next entry
    }

    private void ClearForm()
    {
        ddlMember.SelectedIndex = 0;
        txtLoanDate.Text = "";
        txtLoanAvl.Text = "";
        txtLoanAmt.Text = "";
        txtLoanPaid.Text = "";
        txtInterest.Text = "";
        txtTotalPaid.Text = "";
    }

    private void GenerateID()
    {
        int newId = 1;
        using (SqlConnection cn = new SqlConnection(cs))
        {
            cn.Open();
            SqlCommand cmd = new SqlCommand("SELECT ISNULL(MAX(LReturn_id), 0) FROM LoanReturn", cn);
            newId = Convert.ToInt32(cmd.ExecuteScalar()) + 1;
            cn.Close();
        }
        txtid.Text = newId.ToString();
    }
}
