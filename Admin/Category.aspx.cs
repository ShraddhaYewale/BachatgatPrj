using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Admin_Category : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd = new SqlCommand();
    protected void Page_Load(object sender, EventArgs e)
    {
        int n;
        cn.Open();
        cmd.CommandText = "select count(c_id) from Category";
        cmd.Connection = cn;
        int y = Convert.ToInt32(cmd.ExecuteScalar());
        cn.Close();
        if (y == 0)
        {
            n = 1;
            txtcid.Text = n.ToString();
        }
        else
        {
            n = 0;
            cn.Open();
            cmd.CommandText = "select Max(c_id) from Category";
            cmd.Connection = cn;
            n = Convert.ToInt32(cmd.ExecuteScalar());
            cn.Close();
            n++;
            txtcid.Text = n.ToString();

        }
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "Insert into Category values("+txtcid.Text+",'"+txtcname.Text+"','"+Image1.ImageUrl+"')";
        cmd.ExecuteNonQuery();
        cn.Close();
        clear();
        ClientScript.RegisterStartupScript(Page.GetType(),"Submit","<script language='javascript'>alert(Submitted Successfully.)</script>");
    }
    protected void btncancle_Click(object sender, EventArgs e)
    {
        clear();

    }
    protected void clear()
    {
        txtcid.Text = "";
        txtcname.Text = "";
        Image1.ImageUrl = "";
    }
    protected void btnupload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile == true)
        {
            FileUpload1.SaveAs(Server.MapPath("~//Images//" + FileUpload1.FileName));
            Image1.ImageUrl = "~//Images//" + FileUpload1.FileName;
        }

    }
}