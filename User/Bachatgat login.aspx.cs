using System;
using System.Data.SqlClient;
using System.Web.UI;

public partial class User_Bachatgat_login : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;Integrated Security=True;User Instance=True");

    protected void btnlogin_Click(object sender, EventArgs e)
    {
        string username = txtusername.Text.Trim();
        string password = txtpassword.Text.Trim();

        if (username == "" || password == "")
            return;

        try
        {
            cn.Open();
            SqlCommand cmd = new SqlCommand(
              "SELECT Username, B_Name, Verified FROM Bachatgat_Reg WHERE Username=@username AND Password=@password", cn);

            cmd.Parameters.AddWithValue("@username", username);
            cmd.Parameters.AddWithValue("@password", password);

            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                bool isVerified = Convert.ToBoolean(dr["Verified"]);

                if (!isVerified)
                {
                    Response.Write("<script>alert('Your Bachatgat is not verified by Admin yet.');</script>");
                }
                else
                {
                    // Store correct username
                    Session["BachatGat"] = dr["Username"].ToString();
                    Response.Redirect("~/Bachatgat/Home.aspx");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Username or Password');</script>");
            }

            dr.Close();
        }
        finally
        {
            cn.Close();
        }
    }

}
