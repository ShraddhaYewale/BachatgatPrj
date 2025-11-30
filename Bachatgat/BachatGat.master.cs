using System;
using System.Web.UI;

public partial class Bachatgat_BachatGat : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["BachatGat"] != null)
            {
                // Display the logged-in BachatGat name
                Label1.Text = "Welcome, " + Session["BachatGat"].ToString();
            }
            else
            {
                Label1.Text = "Welcome, Guest";
            }
        }
    }
}
