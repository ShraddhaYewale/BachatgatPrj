using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Member_Member : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Member"] != null)
            {
                Label1.Text = Session["Member"].ToString();
            }
            else
            {
                Label1.Text = "Guest"; // fallback
            }
        }
    }
}

