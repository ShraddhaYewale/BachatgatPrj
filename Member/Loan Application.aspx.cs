using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Member_Loan_Application : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;Integrated Security=True;User Instance=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Member"] == null) Response.Redirect("~/User/memberlogin.aspx");

            LoadMemberDetails();
            LoadBachatgatNames();
            GenerateLoanId();
        }
    }

    void LoadMemberDetails()
    {
        string username = Session["Member"].ToString();
        using (SqlCommand cmd = new SqlCommand("SELECT M_name, Bachatgat_name FROM BachatgatMember WHERE Username=@u", cn))
        {
            cmd.Parameters.AddWithValue("@u", username);
            cn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                txtMemberName.Text = dr["M_name"].ToString();
                ddlBachatgat.SelectedValue = dr["Bachatgat_name"].ToString();
            }
            dr.Close();
            cn.Close();
        }

        // Load total saving for this member
        using (SqlCommand cmd2 = new SqlCommand("SELECT SUM(SavingAmount) FROM SavingInfo WHERE MemberName=@m", cn))
        {
            cmd2.Parameters.AddWithValue("@m", txtMemberName.Text);
            cn.Open();
            object o = cmd2.ExecuteScalar();
            txtSavingAmt.Text = (o == DBNull.Value || o == null) ? "0" : o.ToString();
            cn.Close();
        }
    }

    void LoadBachatgatNames()
    {
        // Fill dropdown with distinct Bachatgat names
        using (SqlCommand cmd = new SqlCommand("SELECT DISTINCT Bachatgat_name FROM BachatgatMember", cn))
        {
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            ddlBachatgat.DataSource = dt;
            ddlBachatgat.DataTextField = "Bachatgat_name";
            ddlBachatgat.DataValueField = "Bachatgat_name";
            ddlBachatgat.DataBind();
        }
    }

    void GenerateLoanId()
    {
        // Simple auto-increment Loan ID
        using (SqlCommand cmd = new SqlCommand("SELECT ISNULL(MAX(loan_id),0)+1 FROM LoanApplication", cn))
        {
            cn.Open();
            object o = cmd.ExecuteScalar();
            txtLoanId.Text = o.ToString();
            cn.Close();
        }
    }

    protected void btnCalc_Click(object sender, EventArgs e)
    {
        // EMI Calculation: E = P*r*(1+r)^n / ((1+r)^n-1)
        double P, r, n;
        if (!double.TryParse(txtLoanRequire.Text, out P) || !double.TryParse(txtInterestRate.Text, out r) || !double.TryParse(txtTermMonths.Text, out n))
        {
            litEMI.Text = "Enter valid numeric values for Loan, Interest, Term.";
            return;
        }

        r = r / 12 / 100; // monthly interest rate
        double emi = P * r * Math.Pow(1 + r, n) / (Math.Pow(1 + r, n) - 1);
        litEMI.Text = "Estimated Monthly EMI: ₹ " + Math.Round(emi, 2);
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(txtLoanRequire.Text) || string.IsNullOrEmpty(txtTermMonths.Text))
        {
            lblMsg.Text = "Please fill all required fields.";
            return;
        }

        int loanId = Convert.ToInt32(txtLoanId.Text);

        using (SqlCommand cmd = new SqlCommand("INSERT INTO LoanApplication (loan_id, bachatgat_name, member_name, SavingAmt, Loan_Require, Loan_appl_date) VALUES(@id,@b,@m,@sav,@loan,@date)", cn))
        {
            cmd.Parameters.AddWithValue("@id", loanId); // FIX: include loan_id
            cmd.Parameters.AddWithValue("@b", ddlBachatgat.SelectedValue);
            cmd.Parameters.AddWithValue("@m", txtMemberName.Text);
            cmd.Parameters.AddWithValue("@sav", Convert.ToInt32(txtSavingAmt.Text));
            cmd.Parameters.AddWithValue("@loan", Convert.ToInt32(txtLoanRequire.Text));
            cmd.Parameters.AddWithValue("@date", DateTime.Now.ToString("yyyy-MM-dd"));

            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();

            lblMsg.Text = "Loan application submitted successfully!";
            GenerateLoanId(); // regenerate next loan ID
        }
    }
}
