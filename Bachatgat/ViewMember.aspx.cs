using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Bachatgat_ViewMember : System.Web.UI.Page
{
    string cs = @"Data Source=.\SQLEXPRESS;AttachDbFilename=C:\Bachatgat\App_Data\BachatgatPrj.mdf;Integrated Security=True;User Instance=True";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindMembers();
        }
    }

    void BindMembers(string search = "")
    {
        DataTable dt = new DataTable();
        using (SqlConnection cn = new SqlConnection(cs))
        using (SqlCommand cmd = new SqlCommand())
        {
            cmd.Connection = cn;
            if (string.IsNullOrEmpty(search))
                cmd.CommandText = "SELECT * FROM BachatgatMember";
            else
            {
                cmd.CommandText = @"SELECT * FROM BachatgatMember WHERE M_name LIKE '%' + @search + '%' 
                                    OR City LIKE '%' + @search + '%' 
                                    OR Bachatgat_name LIKE '%' + @search + '%'";
                cmd.Parameters.AddWithValue("@search", search);
            }
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }

        DataList1.DataSource = dt;
        DataList1.DataBind();
        lblNoData.Visible = dt.Rows.Count == 0;
        lblNoData.Text = lblNoData.Visible ? "No members found for your search." : "";
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        BindMembers(txtSearch.Text.Trim());
    }

    protected void btnViewMore_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        DataListItem item = (DataListItem)btn.NamingContainer;
        Panel pnlDetails = (Panel)item.FindControl("pnlDetails");
        pnlDetails.Visible = !pnlDetails.Visible;

        int memberId = Convert.ToInt32(btn.CommandArgument);

        ((GridView)item.FindControl("gvSaving")).DataSource = GetSavingInfo(memberId);
        ((GridView)item.FindControl("gvSaving")).DataBind();

        ((GridView)item.FindControl("gvLoanApplication")).DataSource = GetLoanApplication(memberId);
        ((GridView)item.FindControl("gvLoanApplication")).DataBind();

        ((GridView)item.FindControl("gvLoanApproval")).DataSource = GetLoanApproval(memberId);
        ((GridView)item.FindControl("gvLoanApproval")).DataBind();

        ((GridView)item.FindControl("gvLoanReturn")).DataSource = GetLoanReturn(memberId);
        ((GridView)item.FindControl("gvLoanReturn")).DataBind();

        ((GridView)item.FindControl("gvWithdraw")).DataSource = GetWithdrawInfo(memberId);
        ((GridView)item.FindControl("gvWithdraw")).DataBind();
    }

    DataTable GetSavingInfo(int memberId)
    {
        DataTable dt = new DataTable();
        using (SqlConnection cn = new SqlConnection(cs))
        using (SqlCommand cmd = new SqlCommand("SELECT * FROM SavingInfo WHERE MemberName=(SELECT M_name FROM BachatgatMember WHERE M_id=@mid)", cn))
        {
            cmd.Parameters.AddWithValue("@mid", memberId);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        return dt;
    }

    DataTable GetLoanApplication(int memberId)
    {
        DataTable dt = new DataTable();
        using (SqlConnection cn = new SqlConnection(cs))
        using (SqlCommand cmd = new SqlCommand("SELECT * FROM LoanApplication WHERE member_name=(SELECT M_name FROM BachatgatMember WHERE M_id=@mid)", cn))
        {
            cmd.Parameters.AddWithValue("@mid", memberId);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        return dt;
    }

    DataTable GetLoanApproval(int memberId)
    {
        DataTable dt = new DataTable();
        using (SqlConnection cn = new SqlConnection(cs))
        using (SqlCommand cmd = new SqlCommand("SELECT * FROM LoanApproval WHERE Bachatgat_name=(SELECT Bachatgat_name FROM BachatgatMember WHERE M_id=@mid) AND Loan_id IN (SELECT loan_id FROM LoanApplication WHERE member_name=(SELECT M_name FROM BachatgatMember WHERE M_id=@mid))", cn))
        {
            cmd.Parameters.AddWithValue("@mid", memberId);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        return dt;
    }

    DataTable GetLoanReturn(int memberId)
    {
        DataTable dt = new DataTable();
        using (SqlConnection cn = new SqlConnection(cs))
        using (SqlCommand cmd = new SqlCommand("SELECT * FROM LoanReturn WHERE Bachatgat_name=(SELECT Bachatgat_name FROM BachatgatMember WHERE M_id=@mid)", cn))
        {
            cmd.Parameters.AddWithValue("@mid", memberId);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        return dt;
    }

    DataTable GetWithdrawInfo(int memberId)
    {
        DataTable dt = new DataTable();
        using (SqlConnection cn = new SqlConnection(cs))
        using (SqlCommand cmd = new SqlCommand("SELECT * FROM Withdrawlinfo WHERE MemberName=(SELECT M_name FROM BachatgatMember WHERE M_id=@mid)", cn))
        {
            cmd.Parameters.AddWithValue("@mid", memberId);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
        }
        return dt;
    }
}
