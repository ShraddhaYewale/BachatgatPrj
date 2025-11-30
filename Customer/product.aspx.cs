using System;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Customer_product : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            // If no category selected, show all products
            Session["Category"] = null;
            DataList2.DataBind();
        }
    }

    // Category button click
    protected void Category_Click(object sender, EventArgs e)
    {
        Button btn = sender as Button;
        string selectedCategory = btn.CommandArgument;

        Session["Category"] = selectedCategory;

        // Rebind products
        DataList2.DataBind();
    }

    // View More button click
    protected void btn_Click(object sender, EventArgs e)
    {
        Button btn = sender as Button;
        string productId = btn.CommandArgument;

        // Save selected product id in session
        Session["pid"] = productId;

        // Redirect to product details page
        Response.Redirect("~/Customer/productDetails.aspx");
    }
}
