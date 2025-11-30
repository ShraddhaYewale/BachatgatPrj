<%@ Page Title="Add Withdrawl" Language="C#" MasterPageFile="~/Bachatgat/BachatGat.master"
    AutoEventWireup="true" CodeFile="Withdrawl_info.aspx.cs" Inherits="Bachatgat_Withdrawl_info" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-box {
            width: 650px;
            margin: 30px auto;
            background: #f1f7ff;
            padding: 22px;
            border-radius: 10px;
            border-left: 6px solid #007bff;
            box-shadow: 0 6px 20px rgba(0,0,0,0.08);
            font-family: Arial, sans-serif;
        }
        .form-box h2 { color:#007bff; text-align:center; margin-bottom:18px; }
        .tbl { width:100%; }
        .tbl td { padding:8px; vertical-align:middle; }
        .form-control { width:100%; padding:8px 10px; border-radius:6px; border:1px solid #cfe2ff; }
        .btn-primary { background:#007bff; color:#fff; border:none; padding:10px 18px; border-radius:6px; cursor:pointer; }
        .btn-primary:hover { background:#0056b3; }
        .msg { text-align:center; font-weight:600; margin-top:12px; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-box">
        <h2>Add Withdrawl Entry</h2>

        <table class="tbl">
            <tr>
                <td style="width:160px;">Withdrawl ID</td>
                <td>
                    <asp:TextBox ID="txtWId" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>Withdrawl Date</td>
                <td>
                    <asp:TextBox ID="txtDate" runat="server" CssClass="form-control" TextMode="Date" />
                </td>
            </tr>

            <tr>
                <td>Bachatgat</td>
                <td>
                    <asp:DropDownList ID="ddlBachatgat" runat="server" CssClass="form-control"
                        AutoPostBack="true" OnSelectedIndexChanged="ddlBachatgat_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td>Member Name</td>
                <td>
                    <asp:DropDownList ID="ddlMember" runat="server" CssClass="form-control"></asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td>Withdrawl Amount (₹)</td>
                <td>
                    <asp:TextBox ID="txtAmt" runat="server" CssClass="form-control" TextMode="Number" />
                </td>
            </tr>

            <tr>
                <td colspan="2" style="text-align:center;">
                    <asp:Button ID="btnSave" runat="server" Text="Save Withdrawl" CssClass="btn-primary" OnClick="btnSave_Click" />
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <asp:Label ID="lblMsg" runat="server" CssClass="msg"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
