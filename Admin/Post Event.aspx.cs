using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Admin_Post_Event : System.Web.UI.Page
{
    SqlConnection cn = new SqlConnection(
        @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;Integrated Security=True;User Instance=True"
    );

    SqlCommand cmd;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindGrid();
        }
    }

    // Generate new Event ID
    protected void btnadd_Click(object sender, EventArgs e)
    {
        cn.Open();
        cmd = new SqlCommand("SELECT ISNULL(MAX(Event_id), 0) + 1 FROM Event", cn);
        int newId = Convert.ToInt32(cmd.ExecuteScalar());
        cn.Close();

        txtid.Text = newId.ToString();
    }

    // Upload Image
    protected void btnupload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            string folderPath = Server.MapPath("~/Images/");
            string fileName = FileUpload1.FileName;
            string filePath = folderPath + fileName;
            string dbPath = "~/Images/" + fileName;

            FileUpload1.SaveAs(filePath);
            Image2.ImageUrl = dbPath;
        }
    }

    // Save (Insert)
    protected void btnsave_Click(object sender, EventArgs e)
    {
        try
        {
            string status = ddlStatus.SelectedValue;
            if (string.IsNullOrEmpty(status))
                status = (Convert.ToDateTime(txtdate.Text) >= DateTime.Now.Date) ? "Upcoming" : "Past";

            string query = @"INSERT INTO Event 
                             (Event_id, Event_name, Event_date, Event_time, Venue, Contact_name, Contact_no, Reg_fees, Advert_img, Event_description, Status)
                             VALUES (@id, @name, @date, @time, @venue, @person, @number, @fees, @img, @desc, @status)";

            cmd = new SqlCommand(query, cn);
            cmd.Parameters.AddWithValue("@id", txtid.Text);
            cmd.Parameters.AddWithValue("@name", txtename.Text);
            cmd.Parameters.AddWithValue("@date", txtdate.Text);
            cmd.Parameters.AddWithValue("@time", txttime.Text);
            cmd.Parameters.AddWithValue("@venue", txtvenue.Text);
            cmd.Parameters.AddWithValue("@person", txtperson.Text);
            cmd.Parameters.AddWithValue("@number", txtnumber.Text);
            cmd.Parameters.AddWithValue("@fees", txtfees.Text);
            cmd.Parameters.AddWithValue("@img", Image2.ImageUrl);
            cmd.Parameters.AddWithValue("@desc", txtdesc.Text);
            cmd.Parameters.AddWithValue("@status", status);

            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();

            BindGrid();
            ClearFields();

            ClientScript.RegisterStartupScript(Page.GetType(), "Success", "<script>alert('Event saved successfully!');</script>");
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "Error", "<script>alert('Error: {ex.Message}');</script>");
        }
    }

    // Update Event
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        try
        {
            string query = @"UPDATE Event SET 
                             Event_name=@name, Event_date=@date, Event_time=@time, Venue=@venue,
                             Contact_name=@person, Contact_no=@number, Reg_fees=@fees,
                             Advert_img=@img, Event_description=@desc, Status=@status
                             WHERE Event_id=@id";

            cmd = new SqlCommand(query, cn);
            cmd.Parameters.AddWithValue("@id", txtid.Text);
            cmd.Parameters.AddWithValue("@name", txtename.Text);
            cmd.Parameters.AddWithValue("@date", txtdate.Text);
            cmd.Parameters.AddWithValue("@time", txttime.Text);
            cmd.Parameters.AddWithValue("@venue", txtvenue.Text);
            cmd.Parameters.AddWithValue("@person", txtperson.Text);
            cmd.Parameters.AddWithValue("@number", txtnumber.Text);
            cmd.Parameters.AddWithValue("@fees", txtfees.Text);
            cmd.Parameters.AddWithValue("@img", Image2.ImageUrl);
            cmd.Parameters.AddWithValue("@desc", txtdesc.Text);
            cmd.Parameters.AddWithValue("@status", ddlStatus.SelectedValue);

            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();

            BindGrid();
            ClearFields();

            ClientScript.RegisterStartupScript(Page.GetType(), "Success", "<script>alert('Event updated successfully!');</script>");
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "Error", "<script>alert('Error: {ex.Message}');</script>");
        }
    }

    // Clear all input fields
    protected void btnclear_Click(object sender, EventArgs e)
    {
        ClearFields();
    }

    private void ClearFields()
    {
        txtid.Text = "";
        txtename.Text = "";
        txtdate.Text = "";
        txttime.Text = "";
        txtvenue.Text = "";
        txtperson.Text = "";
        txtnumber.Text = "";
        txtfees.Text = "";
        txtdesc.Text = "";
        ddlStatus.SelectedIndex = 0;
        Image2.ImageUrl = "";
    }

    // Bind data to GridView
    private void BindGrid()
    {
        SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Event ORDER BY Event_date DESC", cn);
        DataTable dt = new DataTable();
        da.Fill(dt);
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }

    // On selecting a row from GridView
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridViewRow row = GridView1.SelectedRow;
        txtid.Text = row.Cells[1].Text;
        txtename.Text = row.Cells[2].Text;
        txtdate.Text = row.Cells[3].Text;
        txttime.Text = row.Cells[4].Text;
        txtvenue.Text = row.Cells[5].Text;
        txtperson.Text = row.Cells[6].Text;
        txtnumber.Text = row.Cells[7].Text;
        txtfees.Text = row.Cells[8].Text;
        ddlStatus.SelectedValue = row.Cells[9].Text;

        // Access the ImageField correctly
        Image img = (Image)row.FindControl("imgField");
        if (img != null)
            Image2.ImageUrl = img.ImageUrl;

        txtdesc.Text = row.Cells[10].Text.Replace("&nbsp;", "");
    }
}
