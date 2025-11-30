using System;
using System.Data.SqlClient;
using System.Net.Mail;
using System.Web.UI.WebControls;

public partial class Admin_Manage_Order : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(@"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;Integrated Security=True;User Instance=True");
    SqlCommand cmd = new SqlCommand();
    string customerEmail = "";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GridView1.DataBind();
        }
    }

    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblid.Text = GridView1.SelectedRow.Cells[1].Text;
        lblstatus.Text = GridView1.SelectedRow.Cells[7].Text;
        lblamount.Text = GridView1.SelectedRow.Cells[6].Text;
        lblcname.Text = GridView1.SelectedRow.Cells[5].Text; // Assuming cm_name column

        DropDownList1.SelectedValue = lblstatus.Text;

        // Fetch customer email
        cn.Open();
        cmd.Connection = cn;
        cmd.CommandText = "SELECT email FROM Customer_Reg WHERE Username=@username";
        cmd.Parameters.Clear();
        cmd.Parameters.AddWithValue("@username", lblcname.Text);
        object result = cmd.ExecuteScalar();
        if (result != null) customerEmail = result.ToString();
        cn.Close();
    }

    protected void btnupdate_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(lblid.Text)) return;

        // Fetch email if not already fetched
        if (string.IsNullOrEmpty(customerEmail))
        {
            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "SELECT email FROM Customer_Reg WHERE Username=@username";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@username", lblcname.Text);
            object result = cmd.ExecuteScalar();
            if (result != null) customerEmail = result.ToString();
            cn.Close();
        }

        try
        {
            // Update order status
            cn.Open();
            cmd.Connection = cn;
            cmd.CommandText = "UPDATE [Order] SET Order_status=@status WHERE OD_id=@id";
            cmd.Parameters.Clear();
            cmd.Parameters.AddWithValue("@status", DropDownList1.SelectedValue);
            cmd.Parameters.AddWithValue("@id", lblid.Text);
            cmd.ExecuteNonQuery();
            cn.Close();

            GridView1.DataBind();

            ClientScript.RegisterStartupScript(Page.GetType(), "Update", "alert('Order Updated Successfully!');", true);
        }
        catch (Exception ex)
        {
            Label2.Text = "Database Error: " + ex.Message;
            return;
        }

        // Send email to customer
        try
        {
            if (!string.IsNullOrEmpty(customerEmail))
            {
                MailMessage mail = new MailMessage();
                SmtpClient smtp_Client = new SmtpClient(System.Configuration.ConfigurationManager.AppSettings["smtpClient"]);

                string smtpUserName = System.Configuration.ConfigurationManager.AppSettings["smtpUserName"];
                string smtpPassword = System.Configuration.ConfigurationManager.AppSettings["smtpPassword"];

                mail.From = new MailAddress(smtpUserName);
                mail.To.Add(customerEmail);
                mail.Subject = "Order Status Updated!";
                mail.Body = "Hi {lblcname.Text},\n\nYour order status is now '{DropDownList1.SelectedValue}' on Sahayog.\n\nThank you for your purchase!";

                smtp_Client.Port = Convert.ToInt32(System.Configuration.ConfigurationManager.AppSettings["smtpPort"]);
                smtp_Client.Credentials = new System.Net.NetworkCredential(smtpUserName, smtpPassword);
                smtp_Client.EnableSsl = Convert.ToBoolean(System.Configuration.ConfigurationManager.AppSettings["enableSSL"]);

                smtp_Client.Send(mail);
                ClientScript.RegisterStartupScript(Page.GetType(), "Email", "alert('Notification email sent to customer.');", true);
            }
        }
        catch (Exception ex)
        {
            Label2.Text = "Email Error: " + ex.Message;
        }
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        // Only apply to data rows
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string status = e.Row.Cells[7].Text; // Order_status column
            switch (status)
            {
                case "Delivered":
                    e.Row.BackColor = System.Drawing.Color.LightGreen;
                    break;
                case "in Process":
                    e.Row.BackColor = System.Drawing.Color.LightYellow;
                    break;
                case "Rejected":
                    e.Row.BackColor = System.Drawing.Color.LightCoral;
                    break;
                case "Dispatched":
                    e.Row.BackColor = System.Drawing.Color.LightBlue;
                    break;
                default:
                    e.Row.BackColor = System.Drawing.Color.White;
                    break;
            }
        }
    }
}
