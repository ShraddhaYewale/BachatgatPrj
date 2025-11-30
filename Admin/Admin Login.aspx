<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin Login.aspx.cs" Inherits="Admin_Admin_Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Sahayog Admin Login</title>
    <style>
        body, html {
            margin: 0;
            padding: 0;
            height: 100%;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #003366, #0055aa);
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-container {
            background: #ffffff;
            width: 400px;
            padding: 40px 35px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.2);
            text-align: center;
            animation: fadeIn 0.8s ease;
        }
        @keyframes fadeIn { from { opacity: 0; transform: translateY(20px); } to { opacity: 1; transform: translateY(0); } }
        .login-header img {
            width: 70px;
            height: 70px;
            border-radius: 50%;
            margin-bottom: 10px;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.15);
        }
        .login-header h2 { color: #003366; font-size: 26px; margin-bottom: 25px; font-weight: 700; }
        .form-group { margin-bottom: 20px; text-align: left; }
        .form-group label { display: block; font-weight: 600; color: #003366; margin-bottom: 6px; }
        .form-control {
            width: 100%; height: 38px; border: 1px solid #ccc; border-radius: 8px; padding: 8px 12px;
            font-size: 15px; transition: border-color 0.3s, box-shadow 0.3s;
        }
        .form-control:focus { border-color: #ff6600; box-shadow: 0 0 8px rgba(255, 102, 0, 0.3); }
        .btn {
            width: 48%; height: 40px; border: none; border-radius: 8px; font-weight: bold;
            font-size: 16px; cursor: pointer; transition: all 0.3s ease;
        }
        .btn-login { background: linear-gradient(135deg, #003366, #0055aa); color: #fff; }
        .btn-login:hover { background: linear-gradient(135deg, #0055aa, #003366); transform: translateY(-2px); }
        .btn-cancel { background: #ff6600; color: #fff; }
        .btn-cancel:hover { background: #e65c00; transform: translateY(-2px); }
        .login-footer { margin-top: 25px; font-size: 13px; color: #555; }
        .login-footer span { color: #003366; font-weight: bold; }
        @media (max-width: 480px) { .login-container { width: 90%; padding: 25px; } }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <div class="login-header">
                <img src="~/Images/bachat.png" alt="Admin Logo" />
                <h2>Admin Login</h2>
            </div>

            <div class="form-group">
                <label for="txtUsername">Username</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" placeholder="Enter Username"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtpassword">Password</label>
                <asp:TextBox ID="txtpassword" runat="server" CssClass="form-control" TextMode="Password" placeholder="Enter Password"></asp:TextBox>
            </div>

            <div style="display: flex; justify-content: space-between;">
                <asp:Button ID="btnlogin" runat="server" Text="Login"
                    CssClass="btn btn-login" OnClick="btnlogin_Click" />

                <asp:Button ID="btncancle" runat="server" Text="Cancel"
                    CssClass="btn btn-cancel" OnClick="btncancle_Click" />
            </div>

            <div class="login-footer">
                Projected By: <span>Shraddha Yewale</span>
            </div>
        </div>
    </form>
</body>
</html>
