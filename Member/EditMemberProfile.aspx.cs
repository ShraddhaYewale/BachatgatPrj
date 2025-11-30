using System;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;

public partial class Member_EditMemberProfile : System.Web.UI.Page
{
    string connectionString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;Integrated Security=True;User Instance=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadMemberDetails();
        }
    }

    private void LoadMemberDetails()
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
            string query = "SELECT * FROM BachatgatMember WHERE Username=@Username";
            using (SqlCommand cmd = new SqlCommand(query, cn))
            {
                cmd.Parameters.AddWithValue("@Username", username);
                using (SqlDataReader dr = cmd.ExecuteReader())
                {
                    if (dr.Read())
                    {
                        txtMid.Text = dr["M_id"].ToString();
                        txtMname.Text = dr["M_name"].ToString();
                        txtBachatgatName.Text = dr["Bachatgat_name"].ToString();
                        txtContact.Text = dr["Contact"].ToString();
                        txtCity.Text = dr["City"].ToString();
                        txtAddress.Text = dr["Address"].ToString();
                        txtOccupation.Text = dr["Occupation"].ToString();
                        txtEmail.Text = dr["Email"].ToString();
                        imgMember.ImageUrl = !string.IsNullOrEmpty(dr["MemberPhoto"].ToString()) ? dr["MemberPhoto"].ToString() : "~/Images/default-user.png";
                        txtPassword.Attributes["placeholder"] = "Enter password";
                        txtPassword.Text = dr["Password"].ToString(); // Plain text
                    }
                }
            }
        }
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        using (SqlConnection cn = new SqlConnection(connectionString))
        {
            cn.Open();
            string query = @"UPDATE BachatgatMember SET 
                                M_name=@M_name,
                                Bachatgat_name=@Bachatgat_name,
                                Contact=@Contact,
                                City=@City,
                                Address=@Address,
                                Occupation=@Occupation,
                                Email=@Email,
                                Password=@Password,
                                MemberPhoto=@MemberPhoto
                            WHERE M_id=@M_id";

            using (SqlCommand cmd = new SqlCommand(query, cn))
            {
                cmd.Parameters.AddWithValue("@M_id", txtMid.Text);
                cmd.Parameters.AddWithValue("@M_name", txtMname.Text);
                cmd.Parameters.AddWithValue("@Bachatgat_name", txtBachatgatName.Text);
                cmd.Parameters.AddWithValue("@Contact", txtContact.Text);
                cmd.Parameters.AddWithValue("@City", txtCity.Text);
                cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                cmd.Parameters.AddWithValue("@Occupation", txtOccupation.Text);
                cmd.Parameters.AddWithValue("@Email", txtEmail.Text);
                cmd.Parameters.AddWithValue("@Password", txtPassword.Text); // Plain text
                cmd.Parameters.AddWithValue("@MemberPhoto", imgMember.ImageUrl);

                int rows = cmd.ExecuteNonQuery();
                if (rows > 0)
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "Update", "<script>alert('Profile updated successfully!');</script>");
                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "Update", "<script>alert('No changes were made.');</script>");
                }
            }
        }
    }

    protected void btnUpload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            string fileName = Path.GetFileName(FileUpload1.FileName);
            string uniqueFileName = DateTime.Now.Ticks + "_" + fileName;
            string filePath = "~/Images/" + uniqueFileName;
            FileUpload1.SaveAs(Server.MapPath(filePath));
            imgMember.ImageUrl = filePath;
        }
    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Member/Home.aspx");
    }
}
