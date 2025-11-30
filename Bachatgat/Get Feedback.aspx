<%@ Page Title="" Language="C#" MasterPageFile="~/Bachatgat/BachatGat.master" AutoEventWireup="true" CodeFile="Get Feedback.aspx.cs" Inherits="Bachatgat_Get_Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .feedback-container {
            width: 85%;
            margin: 40px auto;
            background-color: #fff;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        .header-title {
            background-color: #003366;
            color: white;
            text-align: center;
            padding: 15px 0;
            font-size: 22px;
            font-weight: bold;
            letter-spacing: 1px;
        }

        .welcome-label {
            display: block;
            margin-top: 8px;
            font-size: 16px;
            font-weight: normal;
            color: #cce0ff;
        }

        .grid-container {
            padding: 20px;
        }

        .gridview {
            width: 100%;
            border-collapse: collapse;
        }

        .gridview th {
            background-color: #003366;
            color: white;
            text-align: center;
            padding: 10px;
        }

        .gridview td {
            background-color: #f9f9f9;
            padding: 10px;
            text-align: center;
        }

        .gridview tr:nth-child(even) td {
            background-color: #eef2f7;
        }

        .gridview tr:hover td {
            background-color: #dbe7ff;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="feedback-container">
        <div class="header-title">
            BachatGat Feedback Details
            <asp:Label ID="lblBachatName" runat="server" CssClass="welcome-label"></asp:Label>
        </div>

        <div class="grid-container">
            <asp:GridView ID="GridView1" runat="server"
                CssClass="gridview"
                AutoGenerateColumns="False"
                DataSourceID="SqlDataSource1"
                AllowSorting="True"
                GridLines="None">
                <Columns>
                    <asp:BoundField DataField="cm_name" HeaderText="Customer Name" />
                    <asp:BoundField DataField="B_name" HeaderText="Bachatgat Name" />
                    <asp:BoundField DataField="email" HeaderText="Email" />
                    <asp:BoundField DataField="Contact_no" HeaderText="Contact No" />
                    <asp:BoundField DataField="P_Quality" HeaderText="Product Quality" />
                    <asp:BoundField DataField="P_Price" HeaderText="Price" />
                    <asp:BoundField DataField="O_process" HeaderText="Order Process" />
                    <asp:BoundField DataField="Delivery" HeaderText="Delivery" />
                    <asp:BoundField DataField="Msg" HeaderText="Message" />
                </Columns>
            </asp:GridView>

            <!-- FIXED SQL DATA SOURCE -->
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="
                    SELECT cm_name, B_name, email, Contact_no, P_Quality, P_Price, O_process, Delivery, Msg 
                    FROM Feedback 
                    WHERE B_name = (SELECT B_Name FROM Bachatgat_Reg WHERE Username = @username)">
                <SelectParameters>
                    <asp:SessionParameter Name="username" SessionField="BachatGat" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
