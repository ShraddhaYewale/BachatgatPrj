<%@ Page Title="Logout" Language="C#" MasterPageFile="~/Bachatgat/BachatGat.master" AutoEventWireup="true" CodeFile="Logout.aspx.cs" Inherits="Bachatgat_Logout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        /* PAGE LAYOUT */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6f9;
            margin: 0;
            padding: 0;
        }

        .logout-container {
            background-color: #fff;
            max-width: 450px;
            margin: 80px auto;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0px 6px 18px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .logout-container h2 {
            font-size: 24px;
            color: #333;
            margin-bottom: 15px;
        }

        .logout-container p {
            font-size: 16px;
            color: #666;
            margin-bottom: 25px;
        }

        .btn-logout {
            background-color: #0078d7;
            color: #fff;
            border: none;
            padding: 10px 25px;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-logout:hover {
            background-color: #005fa3;
        }

        .btn-cancel {
            background-color: #e0e0e0;
            color: #333;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-left: 10px;
        }

        .btn-cancel:hover {
            background-color: #c9c9c9;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="logout-container">
        <h2>Confirm Logout</h2>
        <p>Are you sure you want to log out from your account?</p>

        <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn-logout" OnClick="btnLogout_Click" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn-cancel"
            PostBackUrl="~/Bachatgat/Dashboard.aspx" />
    </div>
</asp:Content>
