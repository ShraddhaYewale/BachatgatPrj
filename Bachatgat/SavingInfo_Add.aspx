<%@ Page Title="Add Saving Info" Language="C#" 
    MasterPageFile="~/Bachatgat/BachatGat.master" 
    AutoEventWireup="true" 
    CodeFile="SavingInfo_Add.aspx.cs" 
    Inherits="Bachatgat_SavingInfo_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>
        .form-box {
            width: 550px;
            margin: 35px auto;
            background: #f1f7ff;
            padding: 25px 30px;
            border-radius: 12px;
            border-left: 5px solid #007bff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            font-family: Arial;
        }
        h2 {
            color: #007bff;
            text-align: center;
            margin-bottom: 20px;
        }
        table td {
            padding: 8px;
        }
        input, select {
            width: 100%;
            padding: 8px;
            border-radius: 5px;
            border: 1px solid #007bff;
        }
        .btn-submit {
            background: #007bff;
            color: white;
            padding: 10px 15px;
            border-radius: 6px;
            border: none;
            width: 100%;
            font-size: 16px;
            cursor: pointer;
        }
        .btn-submit:hover { background: #0056b3; }
    </style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="form-box">
        <h2>Add Saving Information</h2>

        <table>
        <tr>
    <td>Saving ID:</td>
    <td><asp:TextBox ID="txtSavingID" runat="server" ReadOnly="true"></asp:TextBox></td>
</tr>

            <tr>
                <td>Bachatgat Name:</td>
                <td>
                    <asp:TextBox ID="txtBachatgat" runat="server" ReadOnly="true"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>Member Name:</td>
                <td>
                    <asp:DropDownList ID="ddlMember" runat="server"></asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td>Amount Paid (₹):</td>
                <td><asp:TextBox ID="txtAmountPaid" runat="server"></asp:TextBox></td>
            </tr>

            <tr>
                <td>Payment Date:</td>
                <td><asp:TextBox ID="txtPaymentDate" runat="server" TextMode="Date"></asp:TextBox></td>
            </tr>

            <tr>
                <td>Month:</td>
                <td>
                    <asp:DropDownList ID="ddlMonth" runat="server">
                        <asp:ListItem>January</asp:ListItem>
                        <asp:ListItem>February</asp:ListItem>
                        <asp:ListItem>March</asp:ListItem>
                        <asp:ListItem>April</asp:ListItem>
                        <asp:ListItem>May</asp:ListItem>
                        <asp:ListItem>June</asp:ListItem>
                        <asp:ListItem>July</asp:ListItem>
                        <asp:ListItem>August</asp:ListItem>
                        <asp:ListItem>September</asp:ListItem>
                        <asp:ListItem>October</asp:ListItem>
                        <asp:ListItem>November</asp:ListItem>
                        <asp:ListItem>December</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td>Year:</td>
                <td>
                    <asp:DropDownList ID="ddlYear" runat="server"></asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td>Saving Amount:</td>
                <td><asp:TextBox ID="txtSavingAmount" runat="server"></asp:TextBox></td>
            </tr>

            <tr>
                <td colspan="2">
                    <asp:Button ID="btnSubmit" runat="server" Text="Save Record" CssClass="btn-submit" OnClick="btnSubmit_Click" />
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <asp:Label ID="lblMsg" runat="server" ForeColor="Green"></asp:Label>
                </td>
            </tr>

        </table>
    </div>

</asp:Content>
