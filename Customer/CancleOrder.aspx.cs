using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;


public partial class Customer_CancleOrder : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd = new SqlCommand();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Cancle_Click(object sender, EventArgs e)
    {
        Button btn = sender as Button;
        int str = Convert.ToInt32(btn.CommandArgument);

        cn.Open();
        cmd.CommandText = "Delete from [Order] where OD_id=" + str + "";
        cmd.Connection = cn;
        cmd.ExecuteNonQuery();
        cn.Close();
       
        cn.Open();
        cmd.CommandText = "Delete from Order_details where OD_id=" + str + "";
        cmd.Connection = cn;
        cmd.ExecuteNonQuery();
        cn.Close();
        ClientScript.RegisterStartupScript(Page.GetType(), "Cancle", "< script language = 'javascript'>alert('Order is Removed From Cart')</Script>");

        }
    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
} 