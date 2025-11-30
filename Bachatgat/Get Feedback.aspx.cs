using System;

public partial class Bachatgat_Get_Feedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Check if session exists
        if (Session["BachatGat"] == null)
        {
            // Redirect to login page
            Response.Redirect("~/User/Home.aspx");
            return;
        }

        if (!IsPostBack)
        {
            // Show Bachatgat name on the label
            string username = Session["BachatGat"].ToString();
            lblBachatName.Text = "Welcome," + username;
        }
    }
}
