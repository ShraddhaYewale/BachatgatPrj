<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ManageAdmin.aspx.cs" Inherits="Admin_ManageAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <style>
    /* Base Styles */
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: #f4f6f8;
    }

    /* Main container */
    .admin-container {
        width: 60%;
        margin: 40px auto;
        background: #fff;
        border-radius: 10px;
        box-shadow: 0 5px 15px rgba(0,0,0,0.08);
        padding: 35px 45px;
        border-top: 5px solid #0055aa; /* Blue top highlight */
    }

    h2 {
        text-align: center;
        color: #003366;
        font-size: 28px;
        font-weight: 700;
        margin-bottom: 25px;
    }

    /* Labels & TextBoxes */
    td {
        padding: 10px;
        font-size: 16px;
        color: #333;
        font-weight: 500;
    }

    asp\:TextBox, input[type=text], input[type=password] {
        border: 1px solid #ccc;
        background: #f9fcff;
        border-radius: 6px;
        padding: 10px 14px;
        width: 100%;
        font-size: 16px;
        transition: 0.25s ease;
    }

    input[type=text]:focus,
    input[type=password]:focus {
        border-color: #0055aa;
        box-shadow: 0 0 6px rgba(0, 85, 170, 0.4);
        background: #ffffff;
    }

    /* Buttons (Blue Theme) */
    .btn {
        padding: 8px 25px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        color: #fff;
        font-weight: 600;
        margin: 5px;
        transition: 0.3s ease;
        background: #0055aa;
    }

    .btn:hover {
        background: #0056cc;
        transform: scale(1.05);
    }

    /* GridView */
    .gridview-container {
        margin-top: 30px;
        border-radius: 10px;
        overflow: hidden;
        border: 1px solid #dce5f1;
    }

    .gridview-container table {
        width: 100%;
        border-collapse: collapse;
    }

    .gridview-container th {
        background: #0055aa !important;
        color: #fff !important;
        padding: 12px;
        text-align: center;
        font-size: 16px;
    }

    .gridview-container td {
        padding: 10px;
        background: #fff;
        border-bottom: 1px solid #eee;
        text-align: center;
    }

    .gridview-container tr:hover td {
        background: #f1f9ff;
    }

    /* Validation */
    .validator {
        color: red;
        font-size: 13px;
    }

    @media(max-width: 768px) {
        .admin-container {
            width: 90%;
            padding: 20px;
        }
    }
</style>


</asp:Content>

<asp:Content ID="Content2" runat="server" contentplaceholderid="ContentPlaceHolder1">
    <div class="admin-container">
        <h2>Manage Admin</h2>

        <table width="100%">
            <tr>
                <td>Admin Name</td>
                <td>
                    <asp:TextBox ID="txtadmin" runat="server" Height="35px" Width="100%"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>Password</td>
                <td>
                    <asp:TextBox ID="txtpass" runat="server" TextMode="Password" Height="35px" Width="100%"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>Enter New Password</td>
                <td>
                    <asp:TextBox ID="txtnewpass" runat="server" TextMode="Password" Height="35px" Width="100%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                        ControlToValidate="txtnewpass" ErrorMessage="Must be valid" CssClass="validator" />
                </td>
            </tr>

            <tr>
                <td>Retype Password</td>
                <td>
                    <asp:TextBox ID="txtrepass" runat="server" TextMode="Password" Height="35px" Width="100%"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                        ControlToValidate="txtrepass" ErrorMessage="Must be matched" CssClass="validator" />
                    <asp:CompareValidator ID="CompareValidator1" runat="server"
                        ControlToCompare="txtnewpass" ControlToValidate="txtrepass"
                        ErrorMessage="Must be matched" CssClass="validator" />
                </td>
            </tr>

            <tr>
                <td colspan="2" style="text-align: center;">
                    <asp:Button ID="btnsave" runat="server" Text="Save" CssClass="btn" OnClick="btnsave_Click" />
                    <asp:Button ID="btnupdate" runat="server" Text="Update" CssClass="btn" OnClick="btnupdate_Click" />
                    <asp:Button ID="btndelete" runat="server" Text="Delete" CssClass="btn" OnClick="btndelete_Click" />
                </td>
            </tr>
        </table>

        <div class="gridview-container">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                DataSourceID="SqlDataSource1" CssClass="gridview"
                OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                    <asp:BoundField DataField="Password" HeaderText="Password" SortExpression="Password" />
                </Columns>
            </asp:GridView>
        </div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
            SelectCommand="SELECT * FROM [Admin]"></asp:SqlDataSource>
    </div>
</asp:Content>
