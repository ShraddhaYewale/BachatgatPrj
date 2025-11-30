<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master"
    AutoEventWireup="true" CodeFile="Workdesk.aspx.cs"
    Inherits="Admin_Workdesk" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* Dashboard Grid */
        .dashboard-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 25px;
            padding: 30px;
        }

        /* Each card / tile */
        .dash-card {
            background: #ffffff;
            border-radius: 15px;
            padding: 30px 20px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            text-align: center;
            transition: 0.3s;
            cursor: pointer;
            border-top: 4px solid #4a90e2;
        }

        .dash-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.15);
        }

        .dash-card i {
            font-size: 45px;
            color: #4a90e2;
            margin-bottom: 15px;
        }

        .dash-card h3 {
            font-size: 20px;
            margin: 10px 0;
            font-weight: bold;
        }

        .dash-card p {
            color: #555;
            font-size: 14px;
        }
    </style>

    <!-- FontAwesome Icons -->
    <link rel="stylesheet" 
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="dashboard-container">

        <!-- View Orders -->
        <a href="View Order.aspx" style="text-decoration:none;">
            <div class="dash-card">
                <i class="fa-solid fa-eye"></i>
                <h3>View Orders</h3>
                <p>Check and monitor all customer orders</p>
            </div>
        </a>

        <!-- Manage Orders -->
        <a href="Manage Order.aspx" style="text-decoration:none;">
            <div class="dash-card">
                <i class="fa-solid fa-list-check"></i>
                <h3>Manage Orders</h3>
                <p>Edit or update order information</p>
            </div>
        </a>

        <!-- Manage_Order -->
        <a href="Manage_Order.aspx" style="text-decoration:none;">
            <div class="dash-card">
                <i class="fa-solid fa-file-pen"></i>
                <h3>Manage Order Entry</h3>
                <p>Perform detailed order management</p>
            </div>
        </a>

        <!-- Manage Process -->
        <a href="Category.aspx" style="text-decoration:none;">
            <div class="dash-card">
                <i class="fa-solid fa-gears"></i>
                <h3>Manage Process</h3>
                <p>Track and operate order processing workflow</p>
            </div>
        </a>

    </div>

</asp:Content>
