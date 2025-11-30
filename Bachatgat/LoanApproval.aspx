<%@ Page Title="Loan Approval" Language="C#" MasterPageFile="~/Bachatgat/BachatGat.master"
    AutoEventWireup="true" CodeFile="LoanApproval.aspx.cs" Inherits="Bachatgat_LoanApproval" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .box { width: 95%; margin: 18px auto; padding: 18px; background:#f4faff; border-radius:10px; box-shadow:0 0 8px rgba(0,0,0,0.08);}
        h2 { text-align:center; color:#004a7c; }
        .btn { padding:5px 8px; border-radius:5px; border:none; cursor:pointer; margin-right:4px; }
        .btn-update { background:#2ecc71; color:white; }
        .btn-cancel { background:#e74c3c; color:white; }
        .msg { margin-top:10px; font-weight:bold; color:#004a7c; }
        select, input[type=text] { width: 100%; padding:4px; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="box">
        <h2>Loan Approval — Inline Edit</h2>

        <asp:Label ID="lblMsg" runat="server" CssClass="msg"></asp:Label>

        <asp:GridView ID="gvLoans" runat="server" AutoGenerateColumns="False" DataKeyNames="loan_id"
            CssClass="table" OnRowEditing="gvLoans_RowEditing" OnRowCancelingEdit="gvLoans_RowCancelingEdit"
            OnRowUpdating="gvLoans_RowUpdating" EmptyDataText="No loan applications found.">
            <Columns>
                <asp:BoundField DataField="loan_id" HeaderText="Loan ID" ReadOnly="true" />
                <asp:BoundField DataField="member_name" HeaderText="Member" ReadOnly="true" />
                <asp:BoundField DataField="SavingAmt" HeaderText="Saving Amt" ReadOnly="true" />
                <asp:BoundField DataField="Loan_Require" HeaderText="Loan Required" ReadOnly="true" />
                <asp:BoundField DataField="Loan_appl_date" HeaderText="Applied On" ReadOnly="true" />
                
                <asp:TemplateField HeaderText="Approval Status">
                    <ItemTemplate>
                        <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Appl_status") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:DropDownList ID="ddlStatus" runat="server">
                            <asp:ListItem>Under Scrutiny</asp:ListItem>
                            <asp:ListItem>Approved</asp:ListItem>
                            <asp:ListItem>Rejected</asp:ListItem>
                        </asp:DropDownList>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Decline Reason">
                    <ItemTemplate>
                        <asp:Label ID="lblReason" runat="server" Text='<%# Eval("DeclineReason") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtReason" runat="server" Text='<%# Bind("DeclineReason") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:CommandField ShowEditButton="True" EditText="Edit" UpdateText="Update" CancelText="Cancel" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
