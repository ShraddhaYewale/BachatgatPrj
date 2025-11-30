<%@ Page Title="" Language="C#" MasterPageFile="~/User/Bachatgat.master" AutoEventWireup="true" CodeFile="Customer_Reg.aspx.cs" Inherits="User_Customer_Reg" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        /* === GENERAL STYLING === */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana;
            background: linear-gradient(to right, #f5f7fa, #c3cfe2);
        }

        table.style1 {
            background: #ffffffcc; /* semi-transparent white */
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
            padding: 30px;
            animation: fadeIn 1s ease-in-out;
        }

        th, td {
            padding: 10px;
        }

        td strong {
            font-size: 24px;
            letter-spacing: 1px;
        }

        /* === INPUT STYLING === */
        input[type="text"], input[type="password"], textarea, .aspNetTextBox {
            border: 2px solid #ccc;
            border-radius: 10px;
            padding: 10px;
            font-size: 16px;
            transition: 0.3s all;
        }

        input[type="text"]:focus, input[type="password"]:focus, textarea:focus {
            border-color: #003366;
            box-shadow: 0 0 10px rgba(0, 51, 102, 0.5);
            outline: none;
        }

        /* === BUTTON STYLING === */
        .btn-custom {
            border-radius: 10px;
            font-weight: bold;
            padding: 10px 20px;
            transition: 0.3s all;
            cursor: pointer;
            border: none;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        #<%= btnsignup.ClientID %> {
            background: linear-gradient(135deg, #ff7e5f, #feb47b);
            color: #fff;
        }

        #<%= btnsignup.ClientID %>:hover {
            background: linear-gradient(135deg, #feb47b, #ff7e5f);
            transform: translateY(-3px);
        }

        #<%= btncancle.ClientID %> {
            background: linear-gradient(135deg, #6a11cb, #2575fc);
            color: #fff;
        }

        #<%= btncancle.ClientID %>:hover {
            background: linear-gradient(135deg, #2575fc, #6a11cb);
            transform: translateY(-3px);
        }

        /* === ERROR STYLING === */
        .aspNetRequiredFieldValidator, .aspNetRegularExpressionValidator, .aspNetCompareValidator {
            font-weight: bold;
            font-size: 13px;
        }

        /* === ANIMATION === */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-20px);}
            to { opacity: 1; transform: translateY(0);}
        }

        /* === TABLE HEADER === */
        table.style1 tr:first-child td {
            background: linear-gradient(135deg, #003366, #336699);
            color: white;
            font-size: 22px;
            border-radius: 15px 15px 0 0;
            text-align: center;
        }

        /* === TEXTAREA CUSTOM HEIGHT === */
        textarea {
            min-height: 80px;
        }
    </style>

    <table align="center" cellpadding="4" class="style1">
        <tr>
            <td colspan="2">
                <strong>Customer Registration</strong>
            </td>
        </tr>
        <tr>
            <td>Customer ID</td>
            <td>
                <asp:TextBox ID="txtid" runat="server" Enabled="False" CssClass="aspNetTextBox"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>Customer Name</td>
            <td>
                <asp:TextBox ID="txtcname" runat="server" CssClass="aspNetTextBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                    ControlToValidate="txtcname" ErrorMessage="Name must be filled" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Address</td>
            <td>
                <asp:TextBox ID="txtaddress" runat="server" TextMode="MultiLine" CssClass="aspNetTextBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                    ControlToValidate="txtaddress" ErrorMessage="Address must be filled" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Contact No.</td>
            <td>
                <asp:TextBox ID="txtnumber" runat="server" CssClass="aspNetTextBox"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtnumber" ErrorMessage="Mobile no. must be 10 digits" 
                    ForeColor="Red" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>Email</td>
            <td>
                <asp:TextBox ID="txtemail" runat="server" CssClass="aspNetTextBox"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="txtemail" ErrorMessage="Invalid Email" ForeColor="Red" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>Username</td>
            <td>
                <asp:TextBox ID="txtusername" runat="server" CssClass="aspNetTextBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                    ControlToValidate="txtusername" ErrorMessage="Username must be filled" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Password</td>
            <td>
                <asp:TextBox ID="txtpassword" runat="server" TextMode="Password" CssClass="aspNetTextBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                    ControlToValidate="txtpassword" ErrorMessage="Password must be filled" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td>Confirm Password</td>
            <td>
                <asp:TextBox ID="txtcpass" runat="server" TextMode="Password" CssClass="aspNetTextBox"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                    ControlToValidate="txtcpass" ErrorMessage="Confirm Password must be filled" ForeColor="Red"></asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="txtpassword" ControlToValidate="txtcpass" 
                    ErrorMessage="Passwords must match" ForeColor="Red"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center; padding-top: 20px;">
                <asp:Button ID="btnsignup" runat="server" CssClass="btn-custom" 
                    onclick="btnsignup_Click" Text="Sign Up" Width="150px" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btncancle" runat="server" CssClass="btn-custom" 
                    onclick="btncancle_Click" Text="Cancel" Width="150px" />
            </td>
        </tr>
    </table>
</asp:Content>
