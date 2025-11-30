using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class Admin_ManageAdmin : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd = new SqlCommand();
    SqlDataAdapter da = new SqlDataAdapter();
    DataTable dt = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "Insert into Admin values('"+txtadmin.Text+"','"+txtnewpass.Text+"')";
        cmd.ExecuteNonQuery();
        GridView1.DataBind();
        cn.Close();
        clear();
        ClientScript.RegisterStartupScript(Page.GetType(), "Saved", "<script language='javascript'>alert('Saved SuccessFully')</script>");
    

    }
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "Update Admin set Password='"+txtnewpass.Text+"' where Name='"+txtadmin.Text+"' ";
        cmd.ExecuteNonQuery();
        GridView1.DataBind();
        cn.Close();
        clear();
        ClientScript.RegisterStartupScript(Page.GetType(), "Updated", "<script language='javascript'>alert('Updated SuccessFully')</script>");
    
        

    }
    protected void btndelete_Click(object sender, EventArgs e)
    {
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "delete from Admin where Name='"+txtadmin.Text+"'";
        cmd.ExecuteNonQuery();
        GridView1.DataBind();
        cn.Close();
        clear();
        ClientScript.RegisterStartupScript(Page.GetType(), "Deleted", "<script language='javascript'>alert('Deleted SuccessFully')</script>");
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtadmin.Text = GridView1.SelectedRow.Cells[1].Text;
        txtpass.Text = GridView1.SelectedRow.Cells[2].Text;
    }
    protected void clear()
    {
        txtadmin.Text = "";
        txtpass.Text = "";
        txtrepass.Text = "";
        txtnewpass.Text = "";
    }
}