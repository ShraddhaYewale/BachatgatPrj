<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Customer.master" AutoEventWireup="true" CodeFile="Payment.aspx.cs" Inherits="Customer_Payment" %>

<%@ Register assembly="CrystalDecisions.Web, Version=13.0.4000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" namespace="CrystalDecisions.Web" tagprefix="CR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style7
        {
        text-align: left;
        width: 408px;
    }
        .style8
        {
            height: 30px;
            font-weight: bold;
            font-family: "Times New Roman", Times, serif;
        }
        .style9
        {
            font-family: "Times New Roman", Times, serif;
            font-weight: bold;
        }
        .style11
        {
            font-family: "Times New Roman", Times, serif;
            font-weight: bold;
            height: 32px;
        background-color: #FFFFFF;
    }
        .style12
        {
            height: 32px;
        width: 408px;
    }
        .style13
        {
            font-family: "Times New Roman", Times, serif;
        }
        .style14
        {
            font-family: Arial, Helvetica, sans-serif;
            font-size: large;
        background-color: #003366;
    }
        .style15
        {
            height: 48px;
            text-align: left;
        }
        .style16
        {
            font-family: "Times New Roman", Times, serif;
            height: 31px;
        }
    .style17
    {
        width: 408px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" cellpadding="3" class="style1">
        <tr>
            <td colspan="2" style="text-align: center" class="style14">
                <strong style="color: #FFFFFF">Payment Details</strong></td>
        </tr>
        <tr>
            <td class="style11">
                Payment Id</td>
            <td class="style12">
                <asp:Label ID="lblpayid" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style9">
                Order Id</td>
            <td class="style17">
                <asp:Label ID="lbloid" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style9">
                Payment Date</td>
            <td class="style17">
                <asp:Label ID="lblpdat" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style8">
                Customer Name</td>
            <td class="style7">
                <asp:Label ID="lblcname" runat="server" Text="Label" style="text-align: left"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style9">
                Discount</td>
            <td class="style17">
                <asp:Label ID="lbldis" runat="server" Text="10"></asp:Label>
                %</td>
        </tr>
        <tr>
            <td class="style9">
                Total Amount</td>
            <td class="style17">
                <asp:Label ID="lbltamt" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style8">
                Net Amount</td>
            <td class="style7">
                <asp:Label ID="lblnet" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="2" class="style16">
                <span class="style13"><strong>Payment Mathod </strong>&nbsp; :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </span>
                <asp:RadioButton ID="rbncod" runat="server" CssClass="style13" 
                    Text="Cash On Delivery" GroupName="a" 
                    oncheckedchanged="rbncod_CheckedChanged" />
                <span class="style13">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </span>
                <asp:RadioButton ID="rbnupi" runat="server" CssClass="style13" Text="UPI" 
                    GroupName="a" oncheckedchanged="rbnupi_CheckedChanged" 
                    AutoPostBack="True" />
            </td>
        </tr>
        <tr>
            <td class="style15" colspan="2">
                <asp:Image ID="Image2" runat="server" Height="250px" 
                    ImageUrl="~/Images/Qrcode.jpeg" Width="250px" Visible="False" />
                <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" 
                    AutoDataBind="True" Visible="False" GroupTreeImagesFolderUrl="" 
                    Height="50px" ReportSourceID="CrystalReportSource1" ToolbarImagesFolderUrl="" 
                    ToolPanelWidth="200px" Width="350px" />
                <CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
                    <Report FileName="Report\Bill.rpt">
                    </Report>
                </CR:CrystalReportSource>
                <br />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnplaceord" runat="server" BackColor="#003366" Height="35px" 
                    style="font-weight: 700; color: #FFFFFF; font-size: small" Text="Place Order" 
                    Width="150px" onclick="btnplaceord_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label 
                    ID="Label2" runat="server" Text="Label"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnbill" runat="server" Height="35px" 
                    style="color: #FFFFFF; font-weight: 700; background-color: #003366" 
                    Text="Place Bill" Width="150px" onclick="btnbill_Click" />
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td class="style17">
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

