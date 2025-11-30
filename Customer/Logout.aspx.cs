using System;
using System.Web.UI;

public partial class Customer_Logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Redirect to Home if session already expired or user not logged in
        if (Session["User"] == null)
        {
            Response.Redirect("~/User/Home.aspx");
        }
    }

    protected void btnLogout_Click(object sender, EventArgs e)
    {
        // Clear session
        Session.Clear();
        Session.Abandon();

        // Redirect to Home page after logout
        Response.Redirect("~/User/Home.aspx");
    }
}
