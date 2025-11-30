using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Admin_ManageBachatgat : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;Integrated Security=True;User Instance=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadBachatgats();
        }
    }

    private void LoadBachatgats(string search = "")
    {
        try
        {
            cn.Open();
            SqlCommand cmd;

            if (!string.IsNullOrEmpty(search))
            {
                cmd = new SqlCommand(@"SELECT * FROM Bachatgat_Reg 
                                       WHERE B_Name LIKE @search OR District LIKE @search OR State LIKE @search
                                       ORDER BY B_id DESC", cn);
                cmd.Parameters.AddWithValue("@search", "%" + search + "%");
            }
            else
            {
                cmd = new SqlCommand("SELECT * FROM Bachatgat_Reg ORDER BY B_id DESC", cn);
            }

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            da.Fill(dt);
            gvBachatgat.DataSource = dt;
            gvBachatgat.DataBind();
        }
        finally
        {
            cn.Close();
        }
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        LoadBachatgats(txtSearch.Text.Trim());
    }

    protected void btnRefresh_Click(object sender, EventArgs e)
    {
        txtSearch.Text = "";
        LoadBachatgats();
    }

    protected void gvBachatgat_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvBachatgat.PageIndex = e.NewPageIndex;
        LoadBachatgats(txtSearch.Text.Trim());
    }

    protected void btnVerify_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        int id = Convert.ToInt32(btn.CommandArgument);
        UpdateVerification(id, true);
    }

    protected void btnUnverify_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        int id = Convert.ToInt32(btn.CommandArgument);
        UpdateVerification(id, false);
    }

    private void UpdateVerification(int id, bool verify)
    {
        try
        {
            cn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE Bachatgat_Reg SET Verified=@v WHERE B_id=@id", cn);
            cmd.Parameters.AddWithValue("@v", verify);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.ExecuteNonQuery();
        }
        finally
        {
            cn.Close();
        }
        LoadBachatgats(txtSearch.Text.Trim());
    }
}
