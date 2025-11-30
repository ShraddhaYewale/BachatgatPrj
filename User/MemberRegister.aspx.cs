using System;
using System.Web.UI;
using System.Data.SqlClient;

public partial class User_MemberRegister : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd = new SqlCommand();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            int n;
            cn.Open();
            cmd = new SqlCommand("SELECT COUNT(M_id) FROM BachatgatMember", cn);
            int count = Convert.ToInt32(cmd.ExecuteScalar());
            cn.Close();

            if (count == 0)
                n = 1;
            else
            {
                cn.Open();
                cmd = new SqlCommand("SELECT MAX(M_id) FROM BachatgatMember", cn);
                n = Convert.ToInt32(cmd.ExecuteScalar()) + 1;
                cn.Close();
            }

            txtMid.Text = n.ToString();
        }
    }

    protected void btnsignup_Click(object sender, EventArgs e)
    {
        try
        {
            cn.Open();
            cmd.Connection = cn;

            // Use parameters to prevent SQL injection & handle text safely
            cmd.CommandText = @"INSERT INTO BachatgatMember
                (M_id, M_name, B_Name, Contact, City, Address, Status, Designation, JoinDate, AadharNo,
                 BankName, Branch, IFSC, AccountNo, Photo, Occupation, NomineeName, NomineeContact,
                 Income, Username, Password, Email)
                 VALUES (@Mid, @Mname, @Bname, @Contact, @City, @Address, @Status, @Designation, @JoinDate,
                 @AadharNo, @BankName, @Branch, @IFSC, @AccountNo, @Photo, @Occupation, @NomineeName,
                 @NomineeContact, @Income, @Username, @Password, @Email)";

            cmd.Parameters.AddWithValue("@Mid", txtMid.Text);
            cmd.Parameters.AddWithValue("@Mname", txtMname.Text);
            cmd.Parameters.AddWithValue("@Bname", DropDownList1.Text); // Bachatgat Name
            cmd.Parameters.AddWithValue("@Contact", txtconct.Text);
            cmd.Parameters.AddWithValue("@City", txtcity.Text);
            cmd.Parameters.AddWithValue("@Address", txtaddress.Text);
            cmd.Parameters.AddWithValue("@Status", txtstatus.Text);
            cmd.Parameters.AddWithValue("@Designation", txtDesignation.Text);
            cmd.Parameters.AddWithValue("@JoinDate", txtjoindate.Text);
            cmd.Parameters.AddWithValue("@AadharNo", txtaadharno.Text);
            cmd.Parameters.AddWithValue("@BankName", txtbankname.Text); // ✅ replaced DropDownList2
            cmd.Parameters.AddWithValue("@Branch", txtbranch.Text);
            cmd.Parameters.AddWithValue("@IFSC", txtifsc.Text);
            cmd.Parameters.AddWithValue("@AccountNo", txtaccno.Text);
            cmd.Parameters.AddWithValue("@Photo", Image1.ImageUrl);
            cmd.Parameters.AddWithValue("@Occupation", txtoccupation.Text);
            cmd.Parameters.AddWithValue("@NomineeName", txtnomineename.Text);
            cmd.Parameters.AddWithValue("@NomineeContact", txtcontactno.Text);
            cmd.Parameters.AddWithValue("@Income", txtincome.Text);
            cmd.Parameters.AddWithValue("@Username", txtusername.Text);
            cmd.Parameters.AddWithValue("@Password", txtpassword.Text);
            cmd.Parameters.AddWithValue("@Email", txtemail.Text);

            cmd.ExecuteNonQuery();
            cn.Close();

            clear();
            ClientScript.RegisterStartupScript(Page.GetType(), "Register", "<script>alert('Registered Successfully');</script>");
        }
        catch (Exception ex)
        {
            cn.Close();
            ClientScript.RegisterStartupScript(Page.GetType(), "Error", "<script>alert('Error: {ex.Message}');</script>");
        }
    }

    protected void btncancle_Click(object sender, EventArgs e)
    {
        clear();
    }

    protected void clear()
    {
        txtMid.Text = "";
        txtMname.Text = "";
        DropDownList1.ClearSelection();
        txtconct.Text = "";
        txtcity.Text = "";
        txtaddress.Text = "";
        txtstatus.Text = "";
        txtDesignation.Text = "";
        txtjoindate.Text = "";
        txtaadharno.Text = "";
        txtbankname.Text = ""; 
        txtbranch.Text = "";
        txtifsc.Text = "";
        txtaccno.Text = "";
        Image1.ImageUrl = "";
        txtoccupation.Text = "";
        txtnomineename.Text = "";
        txtcontactno.Text = "";
        txtincome.Text = "";
        txtusername.Text = "";
        txtpassword.Text = "";
        txtemail.Text = "";
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileUpload2.HasFile)
        {
            string path = Server.MapPath("~/Images/" + FileUpload2.FileName);
            FileUpload2.SaveAs(path);
            Image1.ImageUrl = "~/Images/" + FileUpload2.FileName;
        }
    }
}
