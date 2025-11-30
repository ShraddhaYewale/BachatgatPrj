using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Bachatgat_Logout : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    if (Session["BachatGat"] == null)
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
