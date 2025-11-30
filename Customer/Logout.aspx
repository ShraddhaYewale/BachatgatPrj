<%@ Page Title="Logout" Language="C#" MasterPageFile="~/Customer/Customer.master" AutoEventWireup="true" CodeFile="Logout.aspx.cs" Inherits="Customer_Logout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* PAGE STYLING */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
        }

        .logout-card {
            max-width: 450px;
            margin: 100px auto;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
            padding: 40px 30px;
            text-align: center;
        }

        .logout-card h2 {
            color: #003366;
            font-size: 24px;
            margin-bottom: 15px;
        }

        .logout-card p {
            font-size: 16px;
            color: #555;
            margin-bottom: 30px;
        }

        .btn-logout {
            background-color: #003366;
            color: #fff;
            border: none;
            padding: 12px 30px;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-logout:hover {
            background-color: #0055a5;
        }

        .btn-cancel {
            background-color: #e0e0e0;
            color: #333;
            border: none;
            padding: 12px 25px;
            font-size: 16px;
            border-radius: 8px;
            cursor: pointer;
            margin-left: 10px;
            transition: all 0.3s ease;
        }

        .btn-cancel:hover {
            background-color: #c9c9c9;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="logout-card">
        <h2>Confirm Logout</h2>
        <p>Are you sure you want to log out from your account?</p>

        <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn-logout" OnClick="btnLogout_Click" />
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn-cancel"
            PostBackUrl="~/Customer/Dashboard.aspx" />
    </div>
</asp:Content>
