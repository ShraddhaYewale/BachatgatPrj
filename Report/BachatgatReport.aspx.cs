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

public partial class Report_BachatgatReport : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd = new SqlCommand();
    DataSet ds = new DataSet();
    DataTable dt = new DataTable();
    ReportDocument crpt = new ReportDocument();
    protected void Page_Load(object sender, EventArgs e)
    {
        cn.Open();
        SqlDataAdapter da = new SqlDataAdapter("select * from Bachatgat_Reg", cn);
        da.Fill(ds, "Bachatgat_Reg");
        da.Fill(ds);
        crpt.Load(Server.MapPath("~/Report/BachatgatReport.rpt"));
        crpt.SetDataSource(ds);
        CrystalReportViewer1.ReportSource = crpt;
        crpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, false, "Bachatgat_Reg");
        crpt.Refresh();
        cn.Close();

    }
}