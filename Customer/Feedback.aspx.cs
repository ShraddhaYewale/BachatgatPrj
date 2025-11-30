using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

public partial class Customer_Feedback : System.Web.UI.Page
{
    private readonly string connString = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;Integrated Security=True;User Instance=True";

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string insertQuery = @"
            INSERT INTO Feedback
            (cm_name, B_name, email, Contact_no, P_Quality, P_Price, O_process, Delivery, Msg)
            VALUES
            (@cm_name, @B_name, @Email, @Contact_no, @P_Quality, @P_Price, @O_process, @Delivery, @Msg)";

        try
        {
            using (SqlConnection cn = new SqlConnection(connString))
            using (SqlCommand cmd = new SqlCommand(insertQuery, cn))
            {
                cmd.Parameters.Add("@cm_name", SqlDbType.VarChar, 300).Value = txtname.Text.Trim();
                cmd.Parameters.Add("@B_name", SqlDbType.VarChar).Value = txtb_name.Text.Trim();
                cmd.Parameters.Add("@Email", SqlDbType.VarChar).Value = txtemail.Text.Trim();
                cmd.Parameters.Add("@Contact_no", SqlDbType.BigInt).Value = Convert.ToInt64(string.IsNullOrEmpty(txtnumber.Text) ? "0" : txtnumber.Text.Trim());
                cmd.Parameters.Add("@P_Quality", SqlDbType.VarChar, 150).Value = lblpq.Text.Trim();
                cmd.Parameters.Add("@P_Price", SqlDbType.VarChar, 150).Value = lblpp.Text.Trim();
                cmd.Parameters.Add("@O_process", SqlDbType.VarChar, 150).Value = lblop.Text.Trim();
                cmd.Parameters.Add("@Delivery", SqlDbType.VarChar, 150).Value = lblds.Text.Trim();
                cmd.Parameters.Add("@Msg", SqlDbType.VarChar).Value = txtmsg.Text.Trim();

                cn.Open();
                int rows = cmd.ExecuteNonQuery();
                cn.Close();

                if (rows > 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "Submit", "alert('Feedback submitted successfully!');", true);
                    clear();
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "SubmitFail", "alert('Submission failed. Please try again.');", true);
                }
            }
        }
        catch (Exception ex)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "Error", "alert('Error: {ex.Message}');", true);
        }
    }

    protected void btnreset_Click(object sender, EventArgs e)
    {
        clear();
    }

    protected void clear()
    {
        txtname.Text = "";
        txtb_name.Text = "";
        txtemail.Text = "";
        txtnumber.Text = "";
        txtmsg.Text = "";
        lblpq.Text = "";
        lblpp.Text = "";
        lblop.Text = "";
        lblds.Text = "";
        ResetStars();
    }

    private void ResetStars()
    {
        // Reset all rating stars to empty
        string empty = "~/Images/Star.gif";

        imgbtnpq1.ImageUrl = imgbtnpq2.ImageUrl = imgbtnpq3.ImageUrl = imgbtnpq4.ImageUrl = imgbtnpq5.ImageUrl = empty;
        imgbtnpp1.ImageUrl = imgbtnpp2.ImageUrl = imgbtnpp3.ImageUrl = imgbtnpp4.ImageUrl = imgbtnpp5.ImageUrl = empty;
        imgbtnop1.ImageUrl = imgbtnop2.ImageUrl = imgbtnop3.ImageUrl = imgbtnop4.ImageUrl = imgbtnop5.ImageUrl = empty;
        imgbtnds1.ImageUrl = imgbtnds2.ImageUrl = imgbtnds3.ImageUrl = imgbtnds4.ImageUrl = imgbtnds5.ImageUrl = empty;
    }

    // ---------- Star Rating Handlers ----------
    protected void imgbtnpq1_Click(object sender, ImageClickEventArgs e) { SetStars("pq", 1); }
    protected void imgbtnpq2_Click(object sender, ImageClickEventArgs e) { SetStars("pq", 2); }
    protected void imgbtnpq3_Click(object sender, ImageClickEventArgs e) { SetStars("pq", 3); }
    protected void imgbtnpq4_Click(object sender, ImageClickEventArgs e) { SetStars("pq", 4); }
    protected void imgbtnpq5_Click(object sender, ImageClickEventArgs e) { SetStars("pq", 5); }

    protected void imgbtnpp1_Click(object sender, ImageClickEventArgs e) { SetStars("pp", 1); }
    protected void imgbtnpp2_Click(object sender, ImageClickEventArgs e) { SetStars("pp", 2); }
    protected void imgbtnpp3_Click(object sender, ImageClickEventArgs e) { SetStars("pp", 3); }
    protected void imgbtnpp4_Click(object sender, ImageClickEventArgs e) { SetStars("pp", 4); }
    protected void imgbtnpp5_Click(object sender, ImageClickEventArgs e) { SetStars("pp", 5); }

    protected void imgbtnop1_Click(object sender, ImageClickEventArgs e) { SetStars("op", 1); }
    protected void imgbtnop2_Click(object sender, ImageClickEventArgs e) { SetStars("op", 2); }
    protected void imgbtnop3_Click(object sender, ImageClickEventArgs e) { SetStars("op", 3); }
    protected void imgbtnop4_Click(object sender, ImageClickEventArgs e) { SetStars("op", 4); }
    protected void imgbtnop5_Click(object sender, ImageClickEventArgs e) { SetStars("op", 5); }

    protected void imgbtnds1_Click(object sender, ImageClickEventArgs e) { SetStars("ds", 1); }
    protected void imgbtnds2_Click(object sender, ImageClickEventArgs e) { SetStars("ds", 2); }
    protected void imgbtnds3_Click(object sender, ImageClickEventArgs e) { SetStars("ds", 3); }
    protected void imgbtnds4_Click(object sender, ImageClickEventArgs e) { SetStars("ds", 4); }
    protected void imgbtnds5_Click(object sender, ImageClickEventArgs e) { SetStars("ds", 5); }

    private void SetStars(string category, int count)
    {
        string filled = "~/Images/FilledStar.gif";
        string empty = "~/Images/Star.gif";

        switch (category)
        {
            case "pq":
                imgbtnpq1.ImageUrl = (count >= 1) ? filled : empty;
                imgbtnpq2.ImageUrl = (count >= 2) ? filled : empty;
                imgbtnpq3.ImageUrl = (count >= 3) ? filled : empty;
                imgbtnpq4.ImageUrl = (count >= 4) ? filled : empty;
                imgbtnpq5.ImageUrl = (count >= 5) ? filled : empty;
                lblpq.Text = count + " Star";
                break;

            case "pp":
                imgbtnpp1.ImageUrl = (count >= 1) ? filled : empty;
                imgbtnpp2.ImageUrl = (count >= 2) ? filled : empty;
                imgbtnpp3.ImageUrl = (count >= 3) ? filled : empty;
                imgbtnpp4.ImageUrl = (count >= 4) ? filled : empty;
                imgbtnpp5.ImageUrl = (count >= 5) ? filled : empty;
                lblpp.Text = count + " Star";
                break;

            case "op":
                imgbtnop1.ImageUrl = (count >= 1) ? filled : empty;
                imgbtnop2.ImageUrl = (count >= 2) ? filled : empty;
                imgbtnop3.ImageUrl = (count >= 3) ? filled : empty;
                imgbtnop4.ImageUrl = (count >= 4) ? filled : empty;
                imgbtnop5.ImageUrl = (count >= 5) ? filled : empty;
                lblop.Text = count + " Star";
                break;

            case "ds":
                imgbtnds1.ImageUrl = (count >= 1) ? filled : empty;
                imgbtnds2.ImageUrl = (count >= 2) ? filled : empty;
                imgbtnds3.ImageUrl = (count >= 3) ? filled : empty;
                imgbtnds4.ImageUrl = (count >= 4) ? filled : empty;
                imgbtnds5.ImageUrl = (count >= 5) ? filled : empty;
                lblds.Text = count + " Star";
                break;
        }
    }
}
