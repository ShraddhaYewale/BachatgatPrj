using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class User_Customer_Reg : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd = new SqlCommand();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        int n;
        cn.Open();
        cmd.CommandText = "select count(cm_id) from Customer_Reg";
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
            cmd.CommandText = "select Max(cm_id) from Customer_Reg";
            cmd.Connection = cn;
            n = Convert.ToInt32(cmd.ExecuteScalar());
            cn.Close();
            n++;
            txtid.Text = n.ToString();

        }

    }
    protected void btnsignup_Click(object sender, EventArgs e)
    {
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "Insert into Customer_Reg values(" + txtid.Text + ",'" + txtcname.Text + "','" + txtaddress.Text + "'," +txtnumber.Text+ ",'"+ txtemail.Text + "','" + txtusername.Text + "','" + txtpassword.Text + "')";
        cmd.ExecuteNonQuery();
        cn.Close();
        clear();
        ClientScript.RegisterStartupScript(Page.GetType(), "Register", "<script language='javascript'>alert('Registered SuccessFully')</script>");
    

    }
    protected void btncancle_Click(object sender, EventArgs e)
    {
        clear();

    }
    protected void clear()
    {
        txtid.Text="";
        txtcname.Text="";
        txtaddress.Text="";
        txtnumber.Text = "";
        txtemail.Text = "";
        txtusername.Text = "";
        txtpassword.Text = "";
    }
}