<%@ Page Title="Loan Return History" Language="C#" MasterPageFile="~/Member/Member.master" AutoEventWireup="true" CodeFile="LoanReturnHistory.aspx.cs" Inherits="Member_LoanReturnHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Loan Return History</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #e7f0fd; }
        .history-container {
            max-width: 950px;
            margin: 40px auto;
            padding: 25px 35px;
            background-color: #ffffff;
            border-radius: 12px;
            border-top: 5px solid #007bff;
            box-shadow: 0 6px 20px rgba(0,123,255,0.2);
        }
        h2 {
            text-align: center;
            color: #007bff;
            margin-bottom: 25px;
        }
        .gvLoanReturn {
            width: 100%;
            border-collapse: collapse;
        }
        .gvLoanReturn th, .gvLoanReturn td {
            border: 1px solid #007bff;
            padding: 8px 12px;
            text-align: center;
        }
        .gvLoanReturn th {
            background-color: #007bff;
            color: #fff;
        }
        .gvLoanReturn tr:nth-child(even) {
            background-color: #f0f8ff;
        }
        .gvLoanReturn tr:hover {
            background-color: #d0e4ff;
        }
        #lblMsg {
            text-align: center;
            margin-top: 15px;
            font-weight: bold;
            color: green;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="history-container">
        <h2>Loan Return History</h2>
        <asp:GridView ID="gvLoanReturn" runat="server" CssClass="gvLoanReturn" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField HeaderText="ID" DataField="LReturn_id" />
                <asp:BoundField HeaderText="Date" DataField="loan_date" />
                <asp:BoundField HeaderText="Bachatgat Name" DataField="Bachatgat_name" />
                <asp:BoundField HeaderText="Available Loan (₹)" DataField="Loan_avl_amt" />
                <asp:BoundField HeaderText="Loan Amount (₹)" DataField="Loan_amt" />
                <asp:BoundField HeaderText="Paid Amount (₹)" DataField="Loan_paid_amt" />
                <asp:BoundField HeaderText="Interest (₹)" DataField="interest" />
                <asp:BoundField HeaderText="Total Paid (₹)" DataField="Total_paid" />
            </Columns>
        </asp:GridView>
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
    </div>
</asp:Content>
