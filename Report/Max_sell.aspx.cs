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

public partial class Report_Max_sell : System.Web.UI.Page
{
     SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd = new SqlCommand();
    DataSet ds = new DataSet();
    DataTable dt = new DataTable();
    ReportDocument crpt = new ReportDocument();
    protected void Page_Load(object sender, EventArgs e)
    {
         cn.Open();
        SqlDataAdapter da = new SqlDataAdapter("select * from Max_sell", cn);
        da.Fill(ds, "Max_sell");
        da.Fill(ds);
        crpt.Load(Server.MapPath("~/Report/MaxsellReport.rpt"));
        crpt.SetDataSource(ds);
        CrystalReportViewer1.ReportSource = crpt;
        crpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat,Response,false,"Max_sell");
        crpt.Refresh();
        cn.Close();
    }
}
/*Select P_name , SUM(Quantity) As Expr1
From Max_sell
Group by P_name
Order by Expr1 DESC*/