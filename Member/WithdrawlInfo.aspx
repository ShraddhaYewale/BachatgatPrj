<%@ Page Title="Withdrawl Info" Language="C#" MasterPageFile="~/Member/Member.master" AutoEventWireup="true" CodeFile="WithdrawlInfo.aspx.cs" Inherits="Member_WithdrawlInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
h2 { color:#007bff; margin-bottom:15px; }
table { border-collapse: collapse; width: 100%; }
th, td { border:1px solid #007bff; padding:8px; text-align:left; }
th { background-color:#007bff; color:white; }
</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<h2>Withdrawl Info</h2>
<asp:GridView ID="gvWithdrawl" runat="server" AutoGenerateColumns="true"></asp:GridView>
</asp:Content>
