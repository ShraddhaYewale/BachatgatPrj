<%@ Page Title="" Language="C#" MasterPageFile="~/User/Bachatgat.master"
    AutoEventWireup="true" CodeFile="User1.aspx.cs" Inherits="User_User1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #003366, #005f99);
            margin: 0;
            padding: 0;
        }

        .login-container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 85vh;
        }

        .login-card {
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
            padding: 40px 50px;
            width: 450px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .login-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.25);
        }

        .login-title {
            background-color: #003366;
            color: white;
            text-align: center;
            font-size: 1.6em;
            font-weight: bold;
            border-radius: 8px;
            padding: 15px 0;
            margin-bottom: 30px;
        }

        .login-card label {
            display: block;
            font-weight: 600;
            color: #003366;
            margin-bottom: 6px;
        }

        .login-card input[type="text"],
        .login-card input[type="password"] {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
            margin-bottom: 10px;
            transition: border-color 0.3s ease;
        }

        .login-card input[type="text"]:focus,
        .login-card input[type="password"]:focus {
            border-color: #005f99;
            outline: none;
        }

        .btn {
            background-color: #003366;
            color: #fff;
            border: none;
            border-radius: 6px;
            padding: 10px 0;
            font-weight: bold;
            font-size: 15px;
            width: 45%;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .btn:hover {
            background-color: #005f99;
            transform: translateY(-2px);
        }

        .btn-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .validation-error {
            color: red;
            font-size: 13px;
        }
    </style>

    <div class="login-container">
        <div class="login-card">
            <div class="login-title">Customer Login</div>

            <div>
                <label for="txtusername">Username</label>
                <asp:TextBox ID="txtusername" runat="server" Height="35px" Width="100%"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="txtusername"
                    ErrorMessage="Username should be valid"
                    CssClass="validation-error">
                </asp:RequiredFieldValidator>
            </div>

            <div style="margin-top: 15px;">
                <label for="txtpassword">Password</label>
                <asp:TextBox ID="txtpassword" runat="server" Height="35px" Width="100%" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="txtpassword"
                    ErrorMessage="Password should be valid"
                    CssClass="validation-error">
                </asp:RequiredFieldValidator>
            </div>

            <div class="btn-container">
                <asp:Button ID="btnlogin" runat="server" CssClass="btn" Text="Login" OnClick="btnlogin_Click" />
                <asp:Button ID="btncancle" runat="server" CssClass="btn" Text="Cancel" OnClick="btncancle_Click" />
            </div>
        </div>
    </div>
</asp:Content>
