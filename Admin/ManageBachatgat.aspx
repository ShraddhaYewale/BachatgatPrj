<%@ Page Title="Manage Bachatgat" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="ManageBachatgat.aspx.cs" Inherits="Admin_ManageBachatgat" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body { font-family: 'Segoe UI', sans-serif; background: #f4f6f8; }
        .container { padding: 20px; }
        h2 { color: #003366; margin-bottom: 20px; }

        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
            border-radius: 8px;
            overflow: hidden;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background: #0055aa;
            color: #fff;
        }

        tr:hover { background: #f1f9ff; }

        input[type="text"] {
            padding: 8px;
            margin-bottom: 10px;
            width: 250px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        .filter-box { margin-bottom: 15px; }

        img.qrcode {
            width: 50px;
            height: 50px;
            object-fit: contain;
        }

        .btn {
            padding: 6px 12px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            color: #fff;
            font-weight: bold;
        }

        .btn-refresh { background: #007bff; }
        .btn-search { background: #28a745; }
        .btn-verify { background: #00cc66; }
        .btn-unverify { background: #ff3300; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2>Manage Bachatgats</h2>

        <div class="filter-box">
            <asp:TextBox ID="txtSearch" runat="server" placeholder="Search by Name, District, State"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn btn-search" OnClick="btnSearch_Click" />
            <asp:Button ID="btnRefresh" runat="server" Text="Refresh" CssClass="btn btn-refresh" OnClick="btnRefresh_Click" />
        </div>

        <asp:GridView ID="gvBachatgat" runat="server" AutoGenerateColumns="False" CssClass="table" Width="100%" AllowPaging="True" PageSize="10" OnPageIndexChanging="gvBachatgat_PageIndexChanging">
            <Columns>
                <asp:BoundField DataField="B_id" HeaderText="ID" />
                <asp:BoundField DataField="B_Name" HeaderText="Bachatgat Name" />
                <asp:BoundField DataField="District" HeaderText="District" />
                <asp:BoundField DataField="State" HeaderText="State" />
                <asp:BoundField DataField="No_Of_Members" HeaderText="Members" />
                <asp:BoundField DataField="Products" HeaderText="Products" />
                <asp:BoundField DataField="Contact_name" HeaderText="Contact Name" />
                <asp:BoundField DataField="contact_no" HeaderText="Contact No" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:TemplateField HeaderText="QR Code">
                    <ItemTemplate>
                        <img src='<%# Eval("QRcode") %>' alt="QR Code" class="qrcode" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:Button ID="btnVerify" runat="server" Text="Verify" CssClass="btn btn-verify" CommandArgument='<%# Eval("B_id") %>' OnClick="btnVerify_Click" Visible='<%# !(bool)Eval("Verified") %>' />
                        <asp:Button ID="btnUnverify" runat="server" Text="Unverify" CssClass="btn btn-unverify" CommandArgument='<%# Eval("B_id") %>' OnClick="btnUnverify_Click" Visible='<%# (bool)Eval("Verified") %>' />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
