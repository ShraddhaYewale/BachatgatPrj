using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

public partial class User_User1 : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;Integrated Security=True;User Instance=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        // Optional: clear error messages or setup logic on first load
    }

   protected void btnlogin_Click(object sender, EventArgs e)
{
    try
    {
        using (SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;Integrated Security=True;User Instance=True"))
        {
            string query = "SELECT Username FROM Customer_Reg WHERE Username=@Username AND Password=@Password";
            SqlCommand cmd = new SqlCommand(query, cn);
            cmd.Parameters.AddWithValue("@Username", txtusername.Text.Trim());
            cmd.Parameters.AddWithValue("@Password", txtpassword.Text.Trim());

            cn.Open();
            object result = cmd.ExecuteScalar();

            if (result != null)
            {
                Session["Customer"] = txtusername.Text.Trim();
                ClientScript.RegisterStartupScript(this.GetType(), "loginSuccess",
                  "alert('Login Successful!');", true);
                Response.Redirect("~/Customer/productDetails.aspx", false);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "loginError",
                    "alert('Invalid username or password.');", true);
            }
        }
    }
    catch (Exception ex)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "error",
            "alert('An error occurred: {ex.Message}');", true);
    }
    finally
    {
        clear();
    }
}

protected void btncancle_Click(object sender, EventArgs e)
{
    clear();
}

protected void clear()
{
    txtusername.Text = "";
    txtpassword.Text = "";
}

}
