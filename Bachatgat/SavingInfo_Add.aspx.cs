using System;
using System.Data;
using System.Data.SqlClient;

public partial class Bachatgat_SavingInfo_Add : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(
        @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;
          Integrated Security=True;User Instance=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["BachatGat"] == null)
            Response.Redirect("~/User/Bachatgat login.aspx");

        if (!IsPostBack)
        {
            txtBachatgat.Text = Session["BachatGat"].ToString();
            GenerateSavingID();    // <-- NEW
            LoadMembers();
            LoadYears();
        }
    }

    // =========================================
    //   GENERATE SAVING ID (AUTO LIKE YOUR B_id)
    // =========================================
    void GenerateSavingID()
    {
        int newId = 1;

        using (SqlCommand cmd = new SqlCommand("SELECT ISNULL(MAX(Saving_id), 0) FROM SavingInfo", cn))
        {
            cn.Open();
            newId = Convert.ToInt32(cmd.ExecuteScalar()) + 1;
            cn.Close();
        }

        txtSavingID.Text = newId.ToString(); // YOU MUST ADD THIS TEXTBOX IN ASPX
    }

    void LoadMembers()
    {
        try
        {
            // Step 1: Get username from session
            string username = Session["BachatGat"].ToString();

            // Step 2: Fetch B_Name of this Bachatgat
            string bachatgatName = "";
            SqlCommand cmd1 = new SqlCommand("SELECT B_Name FROM Bachatgat_Reg WHERE Username=@u", cn);
            cmd1.Parameters.AddWithValue("@u", username);

            cn.Open();
            object result = cmd1.ExecuteScalar();
            cn.Close();

            if (result != null)
                bachatgatName = result.ToString();
            else
                return;

            txtBachatgat.Text = bachatgatName;

            // Step 3: Load members by correct Bachatgat_name
            SqlCommand cmd2 = new SqlCommand(
                "SELECT M_id, M_name FROM BachatgatMember WHERE Bachatgat_name=@b ORDER BY M_name",
                cn);

            cmd2.Parameters.AddWithValue("@b", bachatgatName);

            cn.Open();
            SqlDataReader dr = cmd2.ExecuteReader();

            ddlMember.Items.Clear();
            ddlMember.Items.Add("-- Select Member --");

            while (dr.Read())
            {
                ddlMember.Items.Add(dr["M_name"].ToString());
            }

            cn.Close();
        }
        catch (Exception ex)
        {
            lblMsg.Text = "Error loading members: " + ex.Message;
            lblMsg.ForeColor = System.Drawing.Color.Red;
        }
    }


    void LoadYears()
    {
        int year = DateTime.Now.Year;

        for (int i = year; i >= year - 20; i--)
        {
            ddlYear.Items.Add(i.ToString());
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            string query = @"
                INSERT INTO SavingInfo
                (Saving_id, Bachatgat_name, MemberName, AmountPaid, PaymentDate, Year, Month, SavingAmount)
                VALUES(@id, @b, @m, @amt, @date, @y, @month, @save)";

            SqlCommand cmd = new SqlCommand(query, cn);

            cmd.Parameters.AddWithValue("@id", txtSavingID.Text);     // NEW
            cmd.Parameters.AddWithValue("@b", txtBachatgat.Text);
            cmd.Parameters.AddWithValue("@m", ddlMember.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@amt", txtAmountPaid.Text);
            cmd.Parameters.AddWithValue("@date", txtPaymentDate.Text);
            cmd.Parameters.AddWithValue("@y", ddlYear.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@month", ddlMonth.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@save", txtSavingAmount.Text);

            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();

            lblMsg.Text = "Saving information added successfully!";

            GenerateSavingID(); // generate next ID after insert
        }
        catch (Exception ex)
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Error: " + ex.Message;
        }
    }
}
