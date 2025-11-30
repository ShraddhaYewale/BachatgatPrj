using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System.Data.SqlClient;
using System.Data;


public partial class Report_catReport : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd = new SqlCommand();
    DataSet ds = new DataSet();
    DataTable dt = new DataTable();
    ReportDocument crpt = new ReportDocument();
    protected void Page_Load(object sender, EventArgs e)
    {
        cn.Open();
        SqlDataAdapter da = new SqlDataAdapter("select * from Category", cn);
        da.Fill(ds, "Category");
        da.Fill(ds);
        crpt.Load(Server.MapPath("~/Report/catReport.rpt"));
        crpt.SetDataSource(ds);
        CrystalReportViewer1.ReportSource = crpt;
        crpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat,Response,false,"Category");
        crpt.Refresh();
        cn.Close();
    }
}