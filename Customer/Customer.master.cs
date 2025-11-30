using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Customer_Customer : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Customer"] != null)
        {
            Label1.Text = "Welcome, " + Session["Customer"].ToString();
        }
        else
        {
            Label1.Text = "Welcome, Guest";
        }
    }

}
