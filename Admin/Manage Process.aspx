<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Manage Process.aspx.cs" Inherits="Admin_Manage_Process" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        /* Header Style */
        .style5 {
            color: #ffffff;
            height: 40px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            font-size: 20px;
            text-align: center;
            font-weight: bold;
            background: linear-gradient(135deg, #003366, #0055aa);
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s ease, background 0.3s ease;
        }

        .style5:hover {
            background: linear-gradient(135deg, #0055aa, #0077cc);
            transform: translateY(-2px);
        }

        /* Table Layout */
        table.style1 {
            width: 80%;
            margin: 30px auto;
            border-collapse: separate;
            border-spacing: 0 15px;
        }

        td {
            padding: 10px;
        }

        /* Buttons Styling */
        .btn-modern {
            padding: 12px 25px;
            font-size: 16px;
            font-weight: 600;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            background: linear-gradient(135deg, #003366, #0055aa);
            color: #fff;
            transition: all 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
        }

        .btn-modern:hover {
            background: linear-gradient(135deg, #ff6600, #ff9933);
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 10px 25px rgba(255,102,0,0.3);
        }

        /* Responsive */
        @media(max-width:768px) {
            table.style1 {
                width: 95%;
            }

            .btn-modern {
                width: 100%;
                margin: 5px 0;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" cellpadding="2" class="style1">
        <tr>
            <td class="style5">
                Manage Process
            </td>
        </tr>
        <tr>
            <td style="text-align: center;">
                <asp:Button ID="btnorder" runat="server" PostBackUrl="~/Admin/Manage_Order.aspx" 
                    Text="Manage Order" CssClass="btn-modern" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnview" runat="server" PostBackUrl="~/Admin/View Order.aspx" 
                    Text="View Order" CssClass="btn-modern" />
            </td>
        </tr>
    </table>
</asp:Content>
