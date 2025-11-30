using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Bachatgat_Post_Product : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd = new SqlCommand();
    SqlDataAdapter da = new SqlDataAdapter();
    DataTable dt = new DataTable();

        
    protected void Page_Load(object sender, EventArgs e)
    {
        cn.Open();
        string unm = Session["BachatGat"].ToString();
        cmd.CommandText="select B_Name from Bachatgat_Reg  where Username='"+unm+"'";
        cmd.Connection=cn;
        string y=Convert.ToString(cmd.ExecuteScalar());
        txtb_name.Text=y;
        cn.Close();
    }
    
    protected void btnnew_Click(object sender, EventArgs e)
    {
        int n;
        cn.Open();
        cmd.CommandText = "select count(P_id) from Product";
        cmd.Connection = cn;
        int y = Convert.ToInt32(cmd.ExecuteScalar());
        cn.Close();
        if (y == 0)
        {
            n = 1;
            txtid.Text = n.ToString();
        }
        else
        {
            n = 0;
            cn.Open();
            cmd.CommandText = "select Max(P_id) from Product";
            cmd.Connection = cn;
            n = Convert.ToInt32(cmd.ExecuteScalar());
            cn.Close();
            n++;
            txtid.Text = n.ToString();
        
    }
}
    protected void btnsave_Click(object sender, EventArgs e)
    {
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "Insert into Product values(" + txtid.Text + ",'" + txtpname.Text + "','"+Image2.ImageUrl+"','" + DropDownList1.Text + "','" + txtunit.Text + "'," + txtquantity.Text + "," + txtprice.Text + ",'" + txtexpdate.Text + "','"+txtspecify.Text+"','"+txtingredients.Text+"','"+txtb_name.Text+"')";
        cmd.ExecuteNonQuery();
        GridView1.DataBind();
        cn.Close();
        clear();
        ClientScript.RegisterStartupScript(Page.GetType(), "Register", "<script language='javascript'>alert('Product Added SuccessFully')</script>");
    

    }
    protected void btnclear_Click(object sender, EventArgs e)
    {
        clear();  
    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "Update Product set P_name='" + txtpname.Text + "',P_img='" + Image2.ImageUrl + "',P_category='" + DropDownList1.Text + "',Sell_unit='" + txtunit.Text + "',Available_Quantity=" + txtquantity.Text + ",Price=" + txtprice.Text + ",exp_date='" + txtexpdate.Text + "',P_details='" + txtspecify.Text + "',ingredients='" + txtingredients.Text + "',b_name='" + txtb_name.Text + "'where P_id="+txtid.Text+"";
        cmd.ExecuteNonQuery();
        GridView1.DataBind();
        cn.Close();
        clear();
        ClientScript.RegisterStartupScript(Page.GetType(), "Update", "<script language='javascript'>alert('Updated SuccessFully')</script>");
    }
    protected void clear() 
    {
        txtid.Text = "";
        txtpname.Text = "";
        Image2.ImageUrl = "";     
        txtunit.Text = "";
        txtquantity.Text = "";
        txtprice.Text = "";
        txtexpdate.Text = "";
        txtspecify.Text = "";
        txtingredients.Text = "";
        
 
    }
    protected void btnupload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile == true)
        {
            FileUpload1.SaveAs(Server.MapPath("~//Images//" + FileUpload1.FileName));
            Image2.ImageUrl = "~//Images//" + FileUpload1.FileName;
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtid.Text = GridView1.SelectedRow.Cells[1].Text;
        txtpname.Text = GridView1.SelectedRow.Cells[2].Text;
        Image2.ImageUrl = GridView1.SelectedRow.Cells[3].Text;
        DropDownList1.Text = GridView1.SelectedRow.Cells[4].Text;
        txtunit.Text = GridView1.SelectedRow.Cells[5].Text;
        txtquantity.Text = GridView1.SelectedRow.Cells[6].Text;
        txtprice.Text = GridView1.SelectedRow.Cells[7].Text;
        txtexpdate.Text = GridView1.SelectedRow.Cells[8].Text;
        txtspecify.Text = GridView1.SelectedRow.Cells[9].Text;
        txtingredients.Text = GridView1.SelectedRow.Cells[10].Text;
        txtb_name.Text = GridView1.SelectedRow.Cells[11].Text;
       
    }
    protected void txtcategory_TextChanged(object sender, EventArgs e)
    {

    }
    protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
    {

    }
}