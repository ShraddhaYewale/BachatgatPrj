using System;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Bachatgat_Withdrawl_info : System.Web.UI.Page
{
    // Update this connection string to match your environment if needed
    string cs = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;Integrated Security=True;User Instance=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GenerateID();
            LoadBachatgats();
            // prepare member dropdown empty
            ddlMember.Items.Clear();
            ddlMember.Items.Add(new ListItem("-- Select Member --", "0"));
            lblMsg.Text = "";
        }
    }

    // Generate next Withdrawl_id using the correct table name WithdrawlInfo
    private void GenerateID()
    {
        int newId = 1;
        using (SqlConnection cn = new SqlConnection(cs))
        {
            cn.Open();
            using (SqlCommand cmd = new SqlCommand("SELECT ISNULL(MAX(Withdrawl_id), 0) FROM WithdrawlInfo", cn))
            {
                object val = cmd.ExecuteScalar();
                if (val != null && val != DBNull.Value)
                {
                    newId = Convert.ToInt32(val) + 1;
                }
            }
        }
        txtWId.Text = newId.ToString();
    }

    // Load bachatgats -> we store Username in value and B_Name in text
    private void LoadBachatgats()
    {
        ddlBachatgat.Items.Clear();
        ddlBachatgat.Items.Add(new ListItem("-- Select Bachatgat --", "0"));

        using (SqlConnection cn = new SqlConnection(cs))
        using (SqlCommand cmd = new SqlCommand("SELECT Username, B_Name FROM Bachatgat_Reg ORDER BY B_Name", cn))
        {
            cn.Open();
            using (SqlDataReader dr = cmd.ExecuteReader())
            {
                while (dr.Read())
                {
                    string username = dr["Username"].ToString() ?? "";
                    string bname = dr["B_Name"].ToString() ?? username;
                    ddlBachatgat.Items.Add(new ListItem(bname, username));
                }
            }
        }
    }

    // When Bachatgat changes, load its members
    protected void ddlBachatgat_SelectedIndexChanged(object sender, EventArgs e)
    {
        string selectedUsername = ddlBachatgat.SelectedValue;
        LoadMembersForBachatgat(selectedUsername);
    }

    private void LoadMembersForBachatgat(string bachatgatUsername)
    {
        ddlMember.Items.Clear();
        ddlMember.Items.Add(new ListItem("-- Select Member --", "0"));

        if (string.IsNullOrEmpty(bachatgatUsername) || bachatgatUsername == "0") return;

        // Get B_Name from Bachatgat_Reg using Username
        string bName = bachatgatUsername;
        using (SqlConnection cn = new SqlConnection(cs))
        using (SqlCommand cmd = new SqlCommand("SELECT B_Name FROM Bachatgat_Reg WHERE Username=@u", cn))
        {
            cmd.Parameters.AddWithValue("@u", bachatgatUsername);
            cn.Open();
            object o = cmd.ExecuteScalar();
            cn.Close();
            if (o != null && o != DBNull.Value) bName = o.ToString();
        }

        // Now load members for this Bachatgat (using Bachatgat_name column)
        using (SqlConnection cn = new SqlConnection(cs))
        using (SqlCommand cmd = new SqlCommand("SELECT M_id, M_name FROM BachatgatMember WHERE Bachatgat_name=@b ORDER BY M_name", cn))
        {
            cmd.Parameters.AddWithValue("@b", bName);
            cn.Open();
            using (SqlDataReader dr = cmd.ExecuteReader())
            {
                while (dr.Read())
                {
                    ddlMember.Items.Add(new ListItem(dr["M_name"].ToString(), dr["M_id"].ToString()));
                }
            }
        }
    }

    // Save withdrawl row into WithdrawlInfo (correct table & columns)
    protected void btnSave_Click(object sender, EventArgs e)
    {
        // basic validation
        if (ddlBachatgat.SelectedIndex == 0)
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please select a Bachatgat.";
            return;
        }

        if (ddlMember.SelectedIndex == 0)
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please select a Member.";
            return;
        }

        if (string.IsNullOrWhiteSpace(txtAmt.Text))
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Please enter withdrawl amount.";
            return;
        }
/*
        if (!decimal.TryParse(txtAmt.Text.Trim(), out decimal amount))
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Enter a valid numeric amount.";
            return;
        }
        */
        int withdrawlId = 0;
        if (!int.TryParse(txtWId.Text, out withdrawlId))
        {
            lblMsg.ForeColor = System.Drawing.Color.Red;
            lblMsg.Text = "Invalid withdrawl id.";
            return;
        }

        string withdrawlDate = txtDate.Text;
        if (string.IsNullOrEmpty(withdrawlDate))
            withdrawlDate = DateTime.Now.ToString("yyyy-MM-dd");

        // Get Bachatgat display name (B_Name)
        string selectedBgUsername = ddlBachatgat.SelectedValue;
        string bName = selectedBgUsername;
        using (SqlConnection cn = new SqlConnection(cs))
        using (SqlCommand cmd = new SqlCommand("SELECT B_Name FROM Bachatgat_Reg WHERE Username=@u", cn))
        {
            cmd.Parameters.AddWithValue("@u", selectedBgUsername);
            cn.Open();
            object o = cmd.ExecuteScalar();
            cn.Close();
            if (o != null && o != DBNull.Value) bName = o.ToString();
        }

        string memberName = ddlMember.SelectedItem.Text;

        // Insert into WithdrawlInfo table (exact columns)
        using (SqlConnection cn = new SqlConnection(cs))
        using (SqlCommand cmd = new SqlCommand(
            "INSERT INTO WithdrawlInfo (Withdrawl_id, Bachatgat_name, MemberName, Withdrawl_date, Total_saving) " +
            "VALUES (@id, @bg, @mem, @date, @total)", cn))
        {
            cmd.Parameters.AddWithValue("@id", withdrawlId);
            cmd.Parameters.AddWithValue("@bg", bName);
            cmd.Parameters.AddWithValue("@mem", memberName);
            cmd.Parameters.AddWithValue("@date", withdrawlDate);
            cmd.Parameters.AddWithValue("@total", amount);

            cn.Open();
            cmd.ExecuteNonQuery();
            cn.Close();
        }

        // Success message
        ClientScript.RegisterStartupScript(this.GetType(), "msg", "alert('Withdrawl added successfully');", true);

        // Reset form and generate next ID
        ClearForm();
        GenerateID();
    }

    private void ClearForm()
    {
        txtDate.Text = "";
        txtAmt.Text = "";
        ddlBachatgat.SelectedIndex = 0;
        ddlMember.Items.Clear();
        ddlMember.Items.Add(new ListItem("-- Select Member --", "0"));
        lblMsg.Text = "";
    }
}
