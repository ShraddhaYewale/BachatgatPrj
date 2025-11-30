using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Admin_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnlogin_Click(object sender, EventArgs e)
    {
        string username = txtUsername.Text.Trim();
        string password = txtpassword.Text.Trim();

        // SQL Connection
        SqlConnection con =new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;Integrated Security=True;User Instance=True");

        SqlCommand cmd = new SqlCommand(
            "SELECT COUNT(*) FROM Admin WHERE Name=@u AND Password=@p", con);

        cmd.Parameters.AddWithValue("@u", username);
        cmd.Parameters.AddWithValue("@p", password);

        con.Open();
        int check = Convert.ToInt32(cmd.ExecuteScalar());
        con.Close();

        if (check == 1)
        {
            // Store admin session (optional but recommended)
            Session["AdminUser"] = username;

            // Redirect to Admin Dashboard
            Response.Redirect("http://localhost:60642/Bachatgat/Admin/AdminHome.aspx");
        }
        else
        {
            // Invalid login alert
            ClientScript.RegisterStartupScript(this.GetType(), "alert",
                "alert('Invalid Username or Password');", true);
        }
    }

    protected void btncancle_Click(object sender, EventArgs e)
    {
        txtUsername.Text = "";
        txtpassword.Text = "";
    }
}
