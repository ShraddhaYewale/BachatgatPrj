<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Manage Order.aspx.cs" Inherits="Admin_Manage_Order" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style8
        {
            text-align: center;
            color: #FFFFFF;
            font-family: Arial, Helvetica, sans-serif;
            font-size: large;
            background-color: #003366;
        }
        .style9
        {
            height: 28px;
            width: 343px;
        }
        .style7
        {
            height: 28px;
        }
        .style10
        {
            height: 69px;
        }
        .style11
        {
            background-color: white;
            height: 28px;
            font-weight: bold;
        }
        .style12
        {
            height: 28px;
            width: 343px;
            font-weight: bold;
        }
        .style13
        {
            background-color: white;
            font-weight: bold;
        }
        .style14
        {
            height: 28px;
            font-weight: bold;
        }
        .style15
        {
            height: 69px;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" cellpadding="2" class="style1">
        <tr>
            <td class="style8" colspan="4" height="40">
                <strong>Manage Order</strong></td>
            </tr>
        <tr>
            <td class="style11">
                Select Date To Fetch Reports:</td>
            <td class="style7">
                </td>
            <td class="style14">
                Select City:</td>
            <td class="style7">
                </td>
        </tr>
        <tr>
            <td class="style13">
                From Date:</td>
            <td>
                <asp:TextBox ID="txtfromdate" runat="server" Height="35px" TextMode="Date" 
                    Width="300px"></asp:TextBox>
            </td>
            <td>
                <b>City:</b></td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" 
                    DataSourceID="SqlDataSource1" DataTextField="city" DataValueField="city" 
                    Height="35px" Width="250px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [city] FROM [Order]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td class="style13">
                To Date:</td>
            <td>
                <asp:TextBox ID="txttodate" runat="server" Height="35px" TextMode="Date" 
                    Width="300px"></asp:TextBox>
            </td>
            <td>
                <b></b></td>
            <td>
                <asp:Button ID="btncsearch" runat="server" Height="35px" 
                    onclick="btncsearch_Click" Text="Search" Width="150px" 
                    style="color: #FFFFFF; font-weight: 700; background-color: #003366" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="text-align: center" class="style10">
                <b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </b>
                <asp:Button ID="btndsearch" runat="server" Height="35px" 
                    onclick="btndsearch_Click" Text="Search" Width="150px" 
                    CssClass="tabListMenuItem" style="color: #FFFFFF; background-color: #003366" />
            </td>
            <td class="style15">
                Select Category:</td>
            <td class="style10">
                <asp:DropDownList ID="DropDownList2" runat="server" 
                    DataSourceID="SqlDataSource2" DataTextField="Cat_name" 
                    DataValueField="Cat_name" Height="35px" Width="250px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT [Cat_name] FROM [OrderDetails]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td style="text-align: left" class="style12">
                Product:</td>
            <td style="text-align: left" class="style7">
                <asp:DropDownList ID="DropDownList3" runat="server" 
                    DataSourceID="SqlDataSource3" DataTextField="P_name" DataValueField="P_name" 
                    Height="35px" Width="300px">
                </asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT DISTINCT [P_name] FROM [OrderDetails]">
                </asp:SqlDataSource>
            </td>
            <td class="style14" rowspan="2">
                &nbsp;</td>
            <td class="style7" rowspan="2">
                <asp:Button ID="btncatsearch" runat="server" Height="35px" 
                    onclick="btncatsearch_Click" Text="Search" Width="150px" 
                    style="font-weight: 700; color: #FFFFFF; background-color: #003366" />
            </td>
        </tr>
        <tr>
            <td style="text-align: left" class="style9">
                </td>
            <td style="text-align: left" class="style7">
                <asp:Button ID="btnpsearch" runat="server" Height="35px" 
                    onclick="btnpsearch_Click" Text="Search" Width="150px" 
                    style="font-weight: 700; color: #FFFFFF; background-color: #003366" />
            </td>
            </tr>
        <tr>
            <td style="text-align: center" class="style7" colspan="4">
                <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" 
                    AutoDataBind="True" GroupTreeImagesFolderUrl="" Height="50px" 
                    ReportSourceID="CrystalReportSource1" ToolbarImagesFolderUrl="" 
                    ToolPanelWidth="200px" Visible="False" Width="350px" />
                <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
                    <Report FileName="Report\OrderDetailsReport.rpt">
                    </Report>
                </CR:CrystalReportSource>
            </td>
            </tr>
    </table>
</asp:Content>

