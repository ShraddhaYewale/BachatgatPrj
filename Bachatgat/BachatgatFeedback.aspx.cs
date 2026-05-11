using System;
using System.Data.SqlClient;

public partial class Bachatgat_BachatgatFeedback : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(
        @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;Integrated Security=True;User Instance=True"
    );

    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        try
        {
            if (string.IsNullOrWhiteSpace(txtBachatgatName.Text) ||
                string.IsNullOrWhiteSpace(txtContact.Text) ||
                string.IsNullOrWhiteSpace(txtMessage.Text))
            {
                lblMessage.CssClass = "error-message";
                lblMessage.Text = "⚠️ Please fill in all the fields.";
                return;
            }

            string query = @"INSERT INTO Bachatgat_Feedback (Bachatgat_name, Contact_no, Feedback_date, Feedback_message)
                             VALUES (@name, @contact, GETDATE(), @message)";

            SqlCommand cmd = new SqlCommand(query, cn);
            cmd.Parameters.AddWithValue("@name", txtBachatgatName.Text);
            cmd.Parameters.AddWithValue("@contact", txtContact.Text);
            cmd.Parameters.AddWithValue("@message", txtMessage.Text);

            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();

            lblMessage.CssClass = "success-message";
            lblMessage.Text = "✅ Feedback submitted successfully!";

            txtBachatgatName.Text = "";
            txtContact.Text = "";
            txtMessage.Text = "";
        }
        catch (Exception ex)
        {
            lblMessage.CssClass = "error-message";
            lblMessage.Text = "❌ Error: " + ex.Message;
        }
    }
}
