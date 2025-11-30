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


public partial class Report_OrderDetails : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd = new SqlCommand();
    DataSet ds = new DataSet();
    ReportDocument crpt = new ReportDocument();
    DataTable dt = new DataTable();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btndsearch_Click(object sender, EventArgs e)
    {
        cn.Open();
        SqlDataAdapter dal = new SqlDataAdapter("select * from  OrderDetails where Ord_date>='" + txtfromdate.Text + "'AND Ord_date<='" + txttodate.Text + "'", cn);
       // "SELECT * FROM [OrderDetails] where Ord_date BETWEEN '" + txtfromdate.Text + "'AND '" + txttodate.Text + "'"
      
        dal.Fill(ds, "OrderDetails");
        dal.Fill(ds);
        crpt.Load(Server.MapPath(@"~/Report/OrderDetailsReport.rpt"));
        crpt.SetDataSource(ds);
        CrystalReportViewer1.ReportSource = crpt;
        crpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "OrderDetails");
        crpt.Refresh();
        cn.Close();

    }
    protected void btncsearch_Click(object sender, EventArgs e)
    {
        cn.Open();
        SqlDataAdapter dal = new SqlDataAdapter("select * from  OrderDetails where city='" +DropDownList1.Text+ "'", cn);
        dal.Fill(ds, "OrderDetails");
        dal.Fill(ds);
        crpt.Load(Server.MapPath(@"~/Report/OrderDetailsReport.rpt"));
        crpt.SetDataSource(ds);
        CrystalReportViewer1.ReportSource = crpt;
        crpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "OrderDetails");
        crpt.Refresh();
        cn.Close();


    }
    protected void btncatsearch_Click(object sender, EventArgs e)
    {
        cn.Open();
        SqlDataAdapter dal = new SqlDataAdapter("select * from  OrderDetails where Cat_name='" + DropDownList2.Text + "'", cn);
        dal.Fill(ds, "OrderDetails");
        dal.Fill(ds);
        crpt.Load(Server.MapPath(@"~/Report/OrderDetailsReport.rpt"));
        crpt.SetDataSource(ds);
        CrystalReportViewer1.ReportSource = crpt;
        crpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "OrderDetails");
        crpt.Refresh();
        cn.Close();

    }
    protected void btnpsearch_Click(object sender, EventArgs e)
    {
        cn.Open();
        SqlDataAdapter dal = new SqlDataAdapter("select * from  OrderDetails where P_name='" + DropDownList3.Text + "'", cn);
        dal.Fill(ds, "OrderDetails");
        dal.Fill(ds);
        crpt.Load(Server.MapPath(@"~/Report/OrderDetailsReport.rpt"));
        crpt.SetDataSource(ds);
        CrystalReportViewer1.ReportSource = crpt;
        crpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "OrderDetails");
        crpt.Refresh();
        cn.Close();
    }
}