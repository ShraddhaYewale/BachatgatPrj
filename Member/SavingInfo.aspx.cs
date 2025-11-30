using System;
using System.Data;
using System.Data.SqlClient;

public partial class Member_SavingInfo : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;Integrated Security=True;User Instance=True");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Member"] == null) Response.Redirect("http://localhost:60642/Bachatgat/User/memberlogin.aspx");
            BindSaving();
        }
    }

    void BindSaving()
    {
        string username = Session["Member"].ToString();
        string memberName = GetMemberName(username);

        SqlCommand cmd = new SqlCommand("SELECT * FROM SavingInfo WHERE MemberName=@mem ORDER BY Saving_id DESC", cn);
        cmd.Parameters.AddWithValue("@mem", memberName);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataTable dt = new DataTable();
        da.Fill(dt);

        gvSaving.DataSource = dt;
        gvSaving.DataBind();
    }

    string GetMemberName(string username)
    {
        SqlCommand cmd = new SqlCommand("SELECT M_name FROM BachatgatMember WHERE Username=@u", cn);
        cmd.Parameters.AddWithValue("@u", username);
        cn.Open();
        object o = cmd.ExecuteScalar();
        cn.Close();
        return (o == null) ? "" : o.ToString();
    }
}
