using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Customer_Cart : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd = new SqlCommand();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadOrderDetails();
            MarkOutOfStockItems();
        }
    }

    private void LoadOrderDetails()
    {
        lblname.Text = Session["Customer"].ToString();
        lblodate.Text = DateTime.Now.ToShortDateString();
        lblo_time.Text = DateTime.Now.ToShortTimeString();

        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "SELECT ISNULL(MAX(OD_id),0)+1 FROM [Order]";
        lblid.Text = cmd.ExecuteScalar().ToString();

        cmd.CommandText = "SELECT ISNULL(SUM(total),0) FROM Cart_Details WHERE Username='" + lblname.Text + "'";
        lbltot.Text = cmd.ExecuteScalar().ToString();
        cn.Close();
    }

    private void MarkOutOfStockItems()
    {
        foreach (GridViewRow row in GridView1.Rows)
        {
            Label lblStock = (Label)row.FindControl("lblStock");
            Label lblOutOfStock = (Label)row.FindControl("lblOutOfStock");

            if (Convert.ToInt32(lblStock.Text) <= 0)
            {
                lblStock.Visible = false;
                lblOutOfStock.Visible = true;
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        bool stockIssue = false;
        string customer = Session["Customer"].ToString();
        int oid = Convert.ToInt32(lblid.Text);

        foreach (GridViewRow row in GridView1.Rows)
        {
            int id = Convert.ToInt32(row.Cells[0].Text);
            string cat = row.Cells[1].Text;
            string pname = row.Cells[2].Text;
            int price = Convert.ToInt32(row.Cells[4].Text);
            int qty = Convert.ToInt32(row.Cells[5].Text);
            int tot = Convert.ToInt32(row.Cells[6].Text);

            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "SELECT Available_Quantity FROM Product WHERE P_id=" + id;
            int available = Convert.ToInt32(cmd.ExecuteScalar());
            cn.Close();

            if (available <= 0)
            {
                stockIssue = true;
                ClientScript.RegisterStartupScript(Page.GetType(), "Stock", "alert('Product {pname} is Out of Stock');");
                continue;
            }
            else if (qty > available)
            {
                stockIssue = true;
                ClientScript.RegisterStartupScript(Page.GetType(), "Stock", "alert('Only {available} units of {pname} available');");
                continue;
            }

            // Insert into Order_details
            cn.Open();
            cmd.CommandText = "INSERT INTO Order_details VALUES(" + oid + "," + id + ",'" + customer + "','" + cat + "','" + pname + "'," + qty + "," + price + "," + tot + ",'" + txtaddr.Text + "')";
            cmd.ExecuteNonQuery();
            cn.Close();

            // Update stock
            cn.Open();
            cmd.CommandText = "UPDATE Product SET Available_Quantity = Available_Quantity - " + qty + " WHERE P_id=" + id;
            cmd.ExecuteNonQuery();
            cn.Close();

            // Remove from cart
            cn.Open();
            cmd.CommandText = "DELETE FROM Cart_Details WHERE pid=" + id + " AND Username='" + customer + "'";
            cmd.ExecuteNonQuery();
            cn.Close();
        }

        if (!stockIssue)
        {
            // Insert into Order table
            string Status = "In Process";
            cn.Open();
            cmd.CommandText = "INSERT INTO [Order] VALUES(" + lblid.Text + ",'" + txtaddr.Text + "'," + txtcontact.Text + ",'" + lblodate.Text + "','" + lblname.Text + "'," + lbltot.Text + ",'" + Status + "','" + txtcity.Text + "')";
            cmd.ExecuteNonQuery();
            cn.Close();

            Session["id"] = lblid.Text;
            Session["Total"] = lbltot.Text;
            ClientScript.RegisterStartupScript(Page.GetType(), "Save", "<script>alert('Order Confirmed');</script>");
            Response.Redirect("~/Customer/Payment.aspx");
        }
    }
}
