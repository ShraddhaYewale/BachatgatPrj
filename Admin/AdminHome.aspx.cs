using System;
using System.Data.SqlClient;

public partial class Admin_AdminHome : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;Integrated Security=True;User Instance=True");

    public int BachatgatCount = 0;
    public int MembersCount = 0;
    public int UsersCount = 0;
    public int DistrictCount = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) LoadStats();
    }

    private void LoadStats()
    {
        try
        {
            cn.Open();
            SqlCommand cmd;

            cmd = new SqlCommand("SELECT COUNT(*) FROM Bachatgat_Reg", cn);
            BachatgatCount = Convert.ToInt32(cmd.ExecuteScalar());

            cmd = new SqlCommand("SELECT COUNT(*) FROM BachatgatMember", cn);
            MembersCount = Convert.ToInt32(cmd.ExecuteScalar());

            cmd = new SqlCommand("SELECT COUNT(*) FROM Customer_Reg", cn);
            UsersCount = Convert.ToInt32(cmd.ExecuteScalar());

            cmd = new SqlCommand("SELECT COUNT(DISTINCT District) FROM Bachatgat_Reg", cn);
            DistrictCount = Convert.ToInt32(cmd.ExecuteScalar());
        }
        finally { cn.Close(); }
    }
}
