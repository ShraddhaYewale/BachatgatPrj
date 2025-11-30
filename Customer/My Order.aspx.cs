using System;
using System.Data.SqlClient; // Add this
using System.Configuration;  // Add this
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Customer_My_Order : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        int orderId = Convert.ToInt32(btn.CommandArgument);

        // Update order status to "Cancelled"
        string query = "UPDATE [Order] SET Order_status='Cancelled' WHERE OD_id=@OD_id";
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
        {
            using (SqlCommand cmd = new SqlCommand(query, con))
            {
                cmd.Parameters.AddWithValue("@OD_id", orderId);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }

        // Refresh DataList
        DataList1.DataBind();
    }
}
