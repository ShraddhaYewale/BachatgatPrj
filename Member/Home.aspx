<%@ Page Title="Member Dashboard" Language="C#" MasterPageFile="~/Member/Member.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Member_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fa;
            margin: 0;
            padding: 0;
        }

        /* Dashboard Header */
        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: linear-gradient(135deg, #6a11cb 0%, #2575fc 100%);
            padding: 25px 40px;
            color: #fff;
            border-radius: 0 0 25px 25px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.2);
        }

        .dashboard-header h1 {
            margin: 0;
            font-size: 28px;
            font-weight: 700;
        }

        .dashboard-header p {
            margin: 5px 0 0 0;
            font-size: 16px;
            opacity: 0.85;
        }

        /* Dashboard Container */
        .dashboard-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin: 40px 20px;
            gap: 25px;
        }

        /* Member Profile Card */
        .profile-card {
            background: #fff;
            border-radius: 20px;
            width: 280px;
            padding: 30px 20px;
            text-align: center;
            box-shadow: 0 8px 25px rgba(0,0,0,0.1);
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .profile-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 40px rgba(0,0,0,0.2);
        }

        .profile-card img {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid #2575fc;
            margin-bottom: 20px;
            transition: transform 0.3s;
        }

        .profile-card img:hover {
            transform: scale(1.05);
        }

        .profile-card h2 {
            font-size: 24px;
            color: #2575fc;
            margin-bottom: 10px;
        }

        .profile-card p {
            font-size: 14px;
            color: #555;
            margin: 5px 0;
        }

        /* Bachatgat Card */
        .bachatgat-card {
            background: #fff;
            border-radius: 20px;
            width: 320px;
            padding: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.08);
            position: relative;
            overflow: hidden;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .bachatgat-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 18px 40px rgba(0,0,0,0.15);
        }

        .bachatgat-card .card-header {
            position: relative;
        }

        .bachatgat-card img.b-img {
            width: 100%;
            height: 170px;
            object-fit: cover;
            border-radius: 20px 20px 0 0;
            transition: transform 0.3s;
        }

        .bachatgat-card img.b-img:hover {
            transform: scale(1.05);
        }

        .bachatgat-card img.qr-img {
            width: 70px;
            height: 70px;
            position: absolute;
            top: 15px;
            right: 15px;
            border-radius: 10px;
            border: 3px solid #2575fc;
            background: #fff;
        }

        .bachatgat-card h3 {
            font-size: 22px;
            color: #2575fc;
            margin: 15px 0 8px 0;
        }

        .bachatgat-card p {
            font-size: 14px;
            color: #555;
            margin: 4px 0;
        }

        .bachatgat-card p span {
            font-weight: 600;
            color: #333;
        }

        .bachatgat-card .badge {
            display: inline-block;
            padding: 3px 10px;
            background: #2575fc;
            color: #fff;
            border-radius: 15px;
            font-size: 12px;
            margin-top: 5px;
        }

        @media (max-width: 768px) {
            .dashboard-container {
                flex-direction: column;
                align-items: center;
            }

            .profile-card {
                width: 90%;
            }

            .bachatgat-card {
                width: 90%;
            }
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Dashboard Header -->
    <div class="dashboard-header">
        <div>
            <h1>Welcome, <asp:Label ID="lblUsername" runat="server" Text="Member"></asp:Label>!</h1>
            <p>Your Bachatgat dashboard</p>
        </div>
    </div>

    <!-- Dashboard Cards -->
    <div class="dashboard-container">

        <!-- Member Profile Card -->
        <div class="profile-card">
            <asp:Image ID="imgMember" runat="server" Width="120px" Height="120px" />
            <h2><asp:Label ID="lblMName" runat="server" Text="Member Name"></asp:Label></h2>
            <p><strong>City:</strong> <span><asp:Label ID="lblCity" runat="server" Text=""></asp:Label></span></p>
            <p><strong>Contact:</strong> <span><asp:Label ID="lblContact" runat="server" Text=""></asp:Label></span></p>
            <p><strong>Email:</strong> <span><asp:Label ID="lblEmail" runat="server" Text=""></asp:Label></span></p>
        </div>

        <!-- Bachatgat Cards -->
        <asp:Repeater ID="rptBachatgat" runat="server">
            <ItemTemplate>
                <div class="bachatgat-card">
                    <div class="card-header">
                        <img class="b-img" src='<%# Eval("B_img") %>' alt="Bachatgat Image" />
                        <img class="qr-img" src='<%# Eval("QRcode") %>' alt="QR Code" />
                    </div>
                    <h3><%# Eval("B_Name") %></h3>
                    <p><strong>Address:</strong> <span><%# Eval("B_Address") %>, <%# Eval("B_village") %></span></p>
                    <p><strong>District/State:</strong> <span><%# Eval("District") %>, <%# Eval("State") %></span></p>
                    <p><strong>Pincode:</strong> <span><%# Eval("Pincode") %></span></p>
                    <p><strong>Contact:</strong> <span><%# Eval("Contact_name") %> - <%# Eval("contact_no") %></span></p>
                    <p><strong>Members:</strong> <span class="badge"><%# Eval("No_Of_Members") %></span></p>
                    <p><strong>Products:</strong> <span><%# Eval("Products") %></span></p>
                    <p><strong>Email:</strong> <span><%# Eval("Email") %></span></p>
                </div>
            </ItemTemplate>
        </asp:Repeater>

    </div>

</asp:Content>
