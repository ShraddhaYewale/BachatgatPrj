using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Feedback : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;Integrated Security=True;User Instance=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindFeedback();
        }
    }

    void BindFeedback()
    {
        try
        {
            string query = "SELECT Feedback_id, Bachatgat_name, Contact_no, Feedback_date, Feedback_message FROM Bachatgat_Feedback ORDER BY Feedback_id DESC";
            SqlDataAdapter da = new SqlDataAdapter(query, cn);
            DataTable dt = new DataTable();
            da.Fill(dt);
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }
        catch (Exception ex)
        {
            Response.Write("<script>alert('Error loading feedback: " + ex.Message + "');</script>");
        }
    }

    protected void GridView1_RowDeleting(object sender, System.Web.UI.WebControls.GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);
        SqlCommand cmd = new SqlCommand("DELETE FROM Bachatgat_Feedback WHERE Feedback_id=@id", cn);
        cmd.Parameters.AddWithValue("@id", id);
        cn.Open();
        cmd.ExecuteNonQuery();
        cn.Close();
        BindFeedback();
    }
}
