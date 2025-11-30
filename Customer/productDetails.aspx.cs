using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Customer_productDetails : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd = new SqlCommand();

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        {
            Label lblStock = (Label)e.Item.FindControl("lblstock");
            Label lblOutOfStock = (Label)e.Item.FindControl("lblOutOfStock");
            DropDownList ddl = (DropDownList)e.Item.FindControl("DropDownList1");
            Button btnAdd = (Button)e.Item.FindControl("btnaddcart");

            int stock = Convert.ToInt32(lblStock.Text);

            if (stock <= 0)
            {
                lblStock.Visible = false;
                lblOutOfStock.Visible = true;
                ddl.Enabled = false;
                btnAdd.Enabled = false;
            }
            else
            {
                // Populate dropdown with max stock available
                ddl.Items.Clear();
                ddl.Items.Add("Select Items");
                for (int i = 1; i <= stock && i <= 10; i++)
                {
                    ddl.Items.Add(i.ToString());
                }
            }
        }
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        foreach (DataListItem item in DataList1.Items)
        {
            Label lblprice = item.FindControl("lblprice") as Label;
            DropDownList ddl = item.FindControl("DropDownList1") as DropDownList;
            Label lbltot = item.FindControl("lbltot") as Label;

            if (ddl.SelectedIndex > 0)
            {
                int price = Convert.ToInt32(lblprice.Text);
                int qty = Convert.ToInt32(ddl.SelectedValue);
                lbltot.Text = (price * qty).ToString();
            }
        }
    }

    protected void btnaddcart_Click(object sender, EventArgs e)
    {
        string customer = Session["Customer"].ToString();

        foreach (DataListItem item in DataList1.Items)
        {
            DropDownList ddl = item.FindControl("DropDownList1") as DropDownList;
            if (ddl.SelectedIndex <= 0) continue; // skip if nothing selected

            Label lblid = item.FindControl("lblid") as Label;
            Label lblpname = item.FindControl("lblpname") as Label;
            Label lblcat = item.FindControl("lblcat") as Label;
            Label lblb_name = item.FindControl("lblb_name") as Label;
            Label lblprice = item.FindControl("lblprice") as Label;
            Label lbltot = item.FindControl("lbltot") as Label;

            int id = Convert.ToInt32(lblid.Text);
            string pname = lblpname.Text;
            string cat = lblcat.Text;
            string b_name = lblb_name.Text;
            int price = Convert.ToInt32(lblprice.Text);
            int qty = Convert.ToInt32(ddl.SelectedValue);
            int tot = Convert.ToInt32(lbltot.Text);

            // Check stock before inserting
            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "SELECT Available_Quantity FROM Product WHERE P_id=" + id;
            int stock = Convert.ToInt32(cmd.ExecuteScalar());

            if (qty > stock)
            {
                cn.Close();
                ClientScript.RegisterStartupScript(Page.GetType(), "Stock", "alert('Only {stock} units available for {pname}');");
                return;
            }

            // Insert into Cart
            cmd.CommandText = "INSERT INTO Cart_Details VALUES(" + id + ",'" + cat + "','" + pname + "','" + customer + "'," + price + "," + qty + "," + tot + ",'" + b_name + "')";
            cmd.ExecuteNonQuery();
            cn.Close();

            ClientScript.RegisterStartupScript(Page.GetType(), "submit", "<script>alert('Added To Cart Successfully');</script>");
        }
    }
}
