using System;
using System.Data;
using System.Data.SqlClient;

public partial class Member_Home : System.Web.UI.Page
{
    string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;Integrated Security=True;User Instance=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadMemberProfile();
            LoadBachatgatDetails();
        }
    }

    private void LoadMemberProfile()
    {
        string username = Session["Member"] != null ? Session["Member"].ToString() : null;
        if (string.IsNullOrEmpty(username))
        {
            Response.Redirect("~/User/memberlogin.aspx");
            return;
        }

        using (SqlConnection cn = new SqlConnection(connectionString))
        {
            cn.Open();
            string query = @"SELECT M_name, Contact, City, Email, MemberPhoto 
                             FROM BachatgatMember 
                             WHERE Username=@Username";
            using (SqlCommand cmd = new SqlCommand(query, cn))
            {
                cmd.Parameters.AddWithValue("@Username", username);
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    if (dr.Read())
                    {
                        lblUsername.Text = username;
                        lblMName.Text = dr["M_name"].ToString();
                        lblCity.Text = dr["City"].ToString();
                        lblContact.Text = dr["Contact"].ToString();
                        lblEmail.Text = dr["Email"].ToString();
                        imgMember.ImageUrl = dr["MemberPhoto"].ToString();
                    }
                }
            }
        }
    }

    private void LoadBachatgatDetails()
    {
        string username = Session["Member"] != null ? Session["Member"].ToString() : null;
        if (string.IsNullOrEmpty(username)) return;

        using (SqlConnection cn = new SqlConnection(connectionString))
        {
            cn.Open();
            string query = @"
                SELECT r.B_Name, r.B_Address, r.B_village, r.District, r.State, r.Pincode, 
                       r.Contact_name, r.contact_no, r.No_Of_Members, r.Products, r.Email, r.B_img, r.QRcode
                FROM BachatgatMember m
                INNER JOIN Bachatgat_Reg r ON m.Bachatgat_name = r.B_Name
                WHERE m.Username = @Username";
            using (SqlCommand cmd = new SqlCommand(query, cn))
            {
                cmd.Parameters.AddWithValue("@Username", username);
                DataTable dt = new DataTable();
                using (SqlDataAdapter da = new SqlDataAdapter(cmd))
                {
                    da.Fill(dt);
                    rptBachatgat.DataSource = dt;
                    rptBachatgat.DataBind();
                }
            }
        }
    }
}
