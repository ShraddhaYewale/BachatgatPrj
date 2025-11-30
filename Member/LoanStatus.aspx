<%@ Page Title="Loan Status" Language="C#" MasterPageFile="~/Member/Member.master" AutoEventWireup="true" CodeFile="LoanStatus.aspx.cs" Inherits="Member_LoanStatus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        h2 { color:#007bff; margin-bottom:15px; }
        table { border-collapse: collapse; width: 100%; }
        th, td { border: 1px solid #007bff; padding: 8px; text-align: left; }
        th { background-color:#007bff; color:white; }
        .approved { background-color:#d4edda; }
        .rejected { background-color:#f8d7da; }
        .scrutiny { background-color:#fff3cd; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Loan Status</h2>
    <asp:GridView ID="gvLoanStatus" runat="server" AutoGenerateColumns="true" OnRowDataBound="gvLoanStatus_RowDataBound"></asp:GridView>
</asp:Content>
