using System;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User_Customer_register : Page
{
    string cs = ConfigurationManager.ConnectionStrings[@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;Integrated Security=True;User Instance=True"].ConnectionString;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GenerateID();
        }
    }

    private void GenerateID()
    {
        int newId = 1;
        using (SqlConnection cn = new SqlConnection(cs))
        {
            cn.Open();
            SqlCommand cmd = new SqlCommand("SELECT ISNULL(MAX(B_id), 0) FROM Bachatgat_Reg", cn);
            newId = Convert.ToInt32(cmd.ExecuteScalar()) + 1;
        }
        txtid.Text = newId.ToString();
    }

    protected void btnsignup_Click(object sender, EventArgs e)
    {
        try
        {
            using (SqlConnection cn = new SqlConnection(cs))
            {
                string query = @"INSERT INTO Bachatgat_Reg
                    (B_id, Name, Address, Village, District, State, Pincode, ContactName, ContactNo, NoOfMembers, Products, Email, Image1, Username, Password, Image2)
                    VALUES (@B_id, @Name, @Address, @Village, @District, @State, @Pincode, @ContactName, @ContactNo, @NoOfMembers, @Products, @Email, @Image1, @Username, @Password, @Image2)";

                SqlCommand cmd = new SqlCommand(query, cn);

                cmd.Parameters.AddWithValue("@B_id", txtid.Text.Trim());
                cmd.Parameters.AddWithValue("@Name", txtname.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", txtaddress.Text.Trim());
                cmd.Parameters.AddWithValue("@Village", txtvillage.Text.Trim());
                cmd.Parameters.AddWithValue("@District", txtDist.Text.Trim());
                cmd.Parameters.AddWithValue("@State", txtstate.Text.Trim());
                cmd.Parameters.AddWithValue("@Pincode", txtpincode.Text.Trim());
                cmd.Parameters.AddWithValue("@ContactName", txtcontactname.Text.Trim());
                cmd.Parameters.AddWithValue("@ContactNo", txtcontactno.Text.Trim());
                cmd.Parameters.AddWithValue("@NoOfMembers", txtnoofmembers.Text.Trim());
                cmd.Parameters.AddWithValue("@Products", txtproducts.Text.Trim());
                cmd.Parameters.AddWithValue("@Email", txtemail.Text.Trim());
                cmd.Parameters.AddWithValue("@Image1", Image1.ImageUrl);
                cmd.Parameters.AddWithValue("@Username", txtusername.Text.Trim());
                cmd.Parameters.AddWithValue("@Password", txtpassword.Text.Trim());
                cmd.Parameters.AddWithValue("@Image2", Image2.ImageUrl);

                cn.Open();
                cmd.ExecuteNonQuery();
            }

            ClientScript.RegisterStartupScript(Page.GetType(), "Success", "alert('Registered Successfully');", true);
            ClearForm();
            GenerateID();
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "Error", "alert('Error: {ex.Message}');", true);
        }
    }

    protected void btncancle_Click(object sender, EventArgs e)
    {
        ClearForm();
        GenerateID();
    }

    private void ClearForm()
    {
        txtname.Text = "";
        txtaddress.Text = "";
        txtvillage.Text = "";
        txtDist.Text = "";
        txtstate.Text = "";
        txtpincode.Text = "";
        txtcontactname.Text = "";
        txtcontactno.Text = "";
        txtnoofmembers.Text = "";
        txtproducts.Text = "";
        txtemail.Text = "";
        txtusername.Text = "";
        txtpassword.Text = "";
        txtcpass.Text = "";
        Image1.ImageUrl = "";
        Image2.ImageUrl = "";
    }

    protected void btnupload_Click(object sender, EventArgs e)
    {
        UploadFile(FileUpload1, Image2); // Bachatgat Image
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        UploadFile(FileUpload2, Image1); // Payment QR Code
    }

    private void UploadFile(FileUpload fileUpload, Image imgControl)
    {
        if (fileUpload.HasFile)
        {
            string folderPath = Server.MapPath("~/Images/");
            if (!Directory.Exists(folderPath))
                Directory.CreateDirectory(folderPath);

            string filePath = Path.Combine(folderPath, fileUpload.FileName);
            fileUpload.SaveAs(filePath);
            imgControl.ImageUrl = "~/Images/" + fileUpload.FileName;
        }
    }
}
