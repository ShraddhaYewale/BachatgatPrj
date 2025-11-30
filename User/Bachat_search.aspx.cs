using System;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Bachat_search : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DataList1.DataBind();
        }
    }

    protected void btnapply_Click(object sender, EventArgs e)
    {
        string searchText = TextBox1.Text.Trim();

        if (!string.IsNullOrEmpty(searchText))
        {
            Session["bsearch"] = searchText;
            DataList1.DataBind();

            // ✅ Check if any Bachatgat found
            if (DataList1.Items.Count == 0)
            {
                lblMessage.Text = "We’re sorry! There are currently no registered Bachatgats in this city or village. " +
                                  "Please check the spelling or try searching for a nearby location.";
                lblMessage.ForeColor = System.Drawing.Color.FromArgb(192, 0, 0); // Dark red
                lblMessage.Visible = true;
            }
            else
            {
                lblMessage.Visible = false;
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "Alert", "alert('Please enter a City or Village to search.');", true);
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string searchText = TextBox1.Text.Trim();

        if (!string.IsNullOrEmpty(searchText))
        {
            Session["bsearch"] = searchText;
            DataList1.DataBind();

            if (DataList1.Items.Count == 0)
            {
                lblMessage.Text = "We’re sorry! There are currently no registered Bachatgats in this city or village. " +
                                  "Please check the spelling or try searching for a nearby location.";
                lblMessage.ForeColor = System.Drawing.Color.FromArgb(192, 0, 0);
                lblMessage.Visible = true;
            }
            else
            {
                lblMessage.Visible = false;
                Response.Redirect("~/User/Bachatgat_profile.aspx");
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "Alert", "alert('Please enter a City or Village to search.');", true);
        }
    }
}
