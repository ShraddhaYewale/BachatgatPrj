using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System.Configuration;
using System.Net.Mail;
using System.Net;


public partial class Customer_Payment : System.Web.UI.Page
{
    string smtpUserName, smtpPassword;
    string y;

    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd = new SqlCommand();
    DataSet ds = new DataSet();
    ReportDocument crpt = new ReportDocument();
    DataTable dt = new DataTable();


    protected void Page_Load(object sender, EventArgs e)
    {
        cn.Open();
        cmd.CommandText = "select count(Pay_id) from Payment";
        cmd.Connection = cn;
        int x = Convert.ToInt32(cmd.ExecuteScalar());
        x++;
        lblpayid.Text = x.ToString();
        cn.Close();
        lbloid.Text = Session["id"].ToString();
        lblpdat.Text = System.DateTime.Now.ToShortDateString();
        lblcname.Text = Session["Customer"].ToString();
        lbltamt.Text = Session["Total"].ToString();
        double t = Convert.ToDouble(lbltamt.Text);
        double dis = Convert.ToDouble(lbldis.Text);
        double net = t - (t * dis / 100);
        lblnet.Text = net.ToString();

        cn.Open();
        cmd.CommandText = "select email from Customer_Reg where Username='" + lblcname.Text + "'";
        cmd.Connection = cn;
        y = Convert.ToString(cmd.ExecuteScalar());
        cn.Close();

    }
    protected void btnplaceord_Click(object sender, EventArgs e)
    {
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "insert into Payment values(" + lblpayid.Text + "," + lbloid.Text + ",'" + lblpdat.Text + "','" + lblcname.Text + "',@p1," + lbldis.Text + "," + lblnet.Text + "," + lbltamt.Text + ")";

        if (rbncod.Checked == true)
            cmd.Parameters.AddWithValue("@p1", rbncod.Text);
        else
            cmd.Parameters.AddWithValue("@p1", rbnupi.Text);
        cmd.ExecuteNonQuery();
        cn.Close();

        try
        {
            MailMessage mail = new MailMessage();
            SmtpClient smtp_Client = new SmtpClient(System.Configuration.ConfigurationSettings.AppSettings["smtpClient"]);
            smtpUserName = System.Configuration.ConfigurationSettings.AppSettings["smtpUserName"];
            smtpPassword = System.Configuration.ConfigurationSettings.AppSettings["smtpPassword"];
            mail.From = new MailAddress(smtpUserName);
            mail.To.Add(y);
            mail.Subject = " Thank you for your purchase!";
            mail.Body = "Hii" + lblcname.Text + "" + Environment.NewLine + "Thank You for your order on Sahayog.";
            smtp_Client.Port = Convert.ToInt32(System.Configuration.ConfigurationSettings.AppSettings["smtpPort"]);
            smtp_Client.Credentials = new System.Net.NetworkCredential(smtpUserName, smtpPassword);
            smtp_Client.EnableSsl = Convert.ToBoolean(System.Configuration.ConfigurationSettings.AppSettings["enableSSL"]);
            smtp_Client.Send(mail);
            ClientScript.RegisterStartupScript(Page.GetType(), "Place order", "<script language='javascript'>alert('Order Placed Successfully!')</script>");

        }
        catch (Exception ex)
        {
            Label2.Text = ex.Message;
        }
    }
    protected void rbncod_CheckedChanged(object sender, EventArgs e)
    {
        if (rbncod.Checked == true)
        {
            Image2.Visible = false;
            btnplaceord.Enabled = true;
        }
    }
    protected void rbnupi_CheckedChanged(object sender, EventArgs e)
    {
        if (rbnupi.Checked == true)
        {
            Image2.Visible = true;
            btnplaceord.Enabled = true;
        }
    }
    protected void btnbill_Click(object sender, EventArgs e)
    {
        cn.Open();
        SqlDataAdapter dal = new SqlDataAdapter("select distinct * from  bill where OD_id=" + lbloid.Text + "", cn);
        dal.Fill(ds, "bill");
        dal.Fill(ds);
        crpt.Load(Server.MapPath(@"~/Report/Bill.rpt"));
        crpt.SetDataSource(ds);
        CrystalReportViewer1.ReportSource = crpt;
        crpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "bill");
        crpt.Refresh();
        cn.Close();
    }

}