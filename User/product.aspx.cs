using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_product : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Button btn = sender as Button;
        string str = btn.CommandArgument;
        Session["Category"] = str;
    }
    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
   
    protected void btn_Click(object sender, EventArgs e)
    {
        Button btn = sender as Button;
        string id = btn.CommandArgument;
        Session["pid"] = id;
        Response.Redirect("~/User/User1.aspx");
    }
}