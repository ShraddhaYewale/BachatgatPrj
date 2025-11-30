using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

public partial class User_Get_In_Touch : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Nothing needed here
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            try
            {
                string cs = ConfigurationManager.ConnectionStrings["BachatgatDB"].ConnectionString;

                using (SqlConnection con = new SqlConnection(cs))
                {
                    string query = "INSERT INTO Enquiry (Name, Email, Mob_no, Subject, Enq_Msg) VALUES (@Name, @Email, @Mob, @Subject, @Message)";
                    SqlCommand cmd = new SqlCommand(query, con);

                    cmd.Parameters.AddWithValue("@Name", txtName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    cmd.Parameters.AddWithValue("@Mob", txtMob.Text.Trim());
                    cmd.Parameters.AddWithValue("@Subject", txtSubject.Text.Trim());
                    cmd.Parameters.AddWithValue("@Message", txtMessage.Text.Trim());

                    con.Open();
                    cmd.ExecuteNonQuery();
                }

                lblMessage.Text = "Your enquiry has been submitted successfully!";
                lblMessage.CssClass = "success-message";

                // Clear form
                txtName.Text = txtEmail.Text = txtMob.Text = txtSubject.Text = txtMessage.Text = "";
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
                lblMessage.CssClass = "error-message";
            }
        }
    }
}
