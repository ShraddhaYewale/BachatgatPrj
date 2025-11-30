using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

public partial class User_memberlogin : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd = new SqlCommand();
    SqlDataAdapter da = new SqlDataAdapter();
    DataTable dt = new DataTable();
    protected void Page_Load(object sender, EventArgs e)
    {


    }
    protected void btnlogin_Click(object sender, EventArgs e)
    {
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "select Username,Password from BachatgatMember where Username='" + txtusername.Text + "'and Password='" + txtpassword.Text + "'";
        cmd.ExecuteNonQuery();
        da.SelectCommand = cmd;
        da.Fill(dt);
        string a = txtusername.Text;
        if (dt.Rows.Count > 0)
        {
            Session["Member"] = txtusername.Text;
            Response.Redirect("~/Member/Home.aspx");
            ClientScript.RegisterStartupScript(Page.GetType(), "login", "<script language='javascript'>alert('login Successfully')</script>");
        }
        else
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "login", "<script language='javascript'>alert('Error Occured')</script>");
        }
        cn.Close();
        clear();

    }
    protected void btncancle_Click(object sender, EventArgs e)
    {
        clear();
    }
    protected void clear()
    {
        txtusername.Text = "";
        txtpassword.Text = "";
    }
}