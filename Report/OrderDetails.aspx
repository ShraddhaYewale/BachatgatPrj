<%@ Page Title="" Language="C#" MasterPageFile="~/Bachatgat/BachatGat.master" AutoEventWireup="true" CodeFile="OrderDetails.aspx.cs" Inherits="Report_OrderDetails" %>
<%@ Register assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f6fa;
        }

        .report-container {
            max-width: 1000px;
            margin: 40px auto;
            background-color: #fff;
            border-radius: 12px;
            padding: 40px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #003366;
            margin-bottom: 30px;
            font-weight: 700;
        }

        .search-section {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 25px;
            margin-bottom: 25px;
        }

        label {
            font-weight: 600;
            color: #444;
        }

        input[type="date"],
        select {
            width: 100%;
            height: 40px;
            padding: 8px 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            outline: none;
            transition: 0.3s;
        }

        input[type="date"]:focus,
        select:focus {
            border-color: #003366;
        }

        .btn {
            background-color: #003366;
            color: #fff;
            border: none;
            border-radius: 8px;
            padding: 10px 18px;
            cursor: pointer;
            transition: 0.3s;
            font-weight: 600;
        }

        .btn:hover {
            background-color: #0055a5;
        }

        .crystal-container {
            text-align: center;
            margin-top: 40px;
        }

        .CRViewer {
            width: 100%;
            height: 800px;
            border: none;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="report-container">
        <h2>📊 My Order Details</h2>

        <asp:HiddenField ID="HiddenBachatgatID" runat="server" />

        <div class="search-section">
            <div>
                <label for="txtfromdate">From Date:</label>
                <asp:TextBox ID="txtfromdate" runat="server" TextMode="Date"></asp:TextBox>
            </div>

            <div>
                <label for="txttodate">To Date:</label>
                <asp:TextBox ID="txttodate" runat="server" TextMode="Date"></asp:TextBox>
            </div>

            <div>
                <label for="DropDownList1">Select City:</label>
                <asp:DropDownList ID="DropDownList1" runat="server"
                    DataSourceID="SqlDataSource1" DataTextField="city" DataValueField="city">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT DISTINCT [city] FROM [Order]"></asp:SqlDataSource>
            </div>

            <div>
                <label for="DropDownList2">Select Category:</label>
                <asp:DropDownList ID="DropDownList2" runat="server"
                    DataSourceID="SqlDataSource2" DataTextField="Cat_name" DataValueField="Cat_name">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT DISTINCT [Cat_name] FROM [OrderDetails]"></asp:SqlDataSource>
            </div>

            <div>
                <label for="DropDownList3">Select Product:</label>
                <asp:DropDownList ID="DropDownList3" runat="server"
                    DataSourceID="SqlDataSource3" DataTextField="P_name" DataValueField="P_name">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT DISTINCT [P_name] FROM [OrderDetails]"></asp:SqlDataSource>
            </div>
        </div>

        <div style="text-align:center; margin-top:10px;">
            <asp:Button ID="btncsearch" runat="server" CssClass="btn" Text="Search by City" OnClick="btncsearch_Click" />
            &nbsp;
            <asp:Button ID="btndsearch" runat="server" CssClass="btn" Text="Search by Date" OnClick="btndsearch_Click" />
            &nbsp;
            <asp:Button ID="btncatsearch" runat="server" CssClass="btn" Text="Search by Category" OnClick="btncatsearch_Click" />
            &nbsp;
            <asp:Button ID="btnpsearch" runat="server" CssClass="btn" Text="Search by Product" OnClick="btnpsearch_Click" />
        </div>

        <div class="crystal-container">
            <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server"
                AutoDataBind="True"
                Height="800px"
                ReportSourceID="CrystalReportSource1"
                CssClass="CRViewer"
                Visible="False" />
            <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
                <Report FileName="Report\OrderDetailsReport.rpt"></Report>
            </CR:CrystalReportSource>
        </div>
    </div>
</asp:Content>
