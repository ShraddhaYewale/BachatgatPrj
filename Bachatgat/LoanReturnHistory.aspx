<%@ Page Title="Loan Return Entry" Language="C#" MasterPageFile="~/Bachatgat/BachatGat.master"
    AutoEventWireup="true" CodeFile="LoanReturnHistory.aspx.cs" Inherits="Bachatgat_LoanReturnHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-container {
            width: 600px;
            margin: 40px auto;
            padding: 25px;
            background: #fff;
            border-radius: 12px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.1);
        }

        .form-container h2 {
            text-align: center;
            color: #4b0082;
            margin-bottom: 25px;
        }

        .form-group {
            margin-bottom: 18px;
        }

        .form-group label {
            display: block;
            font-weight: 600;
            margin-bottom: 6px;
        }

        .form-group input {
            width: 100%;
            padding: 8px 12px;
            font-size: 15px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        .btn-submit {
            background: #2ecc71;
            color: #fff;
            padding: 10px 18px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-weight: 600;
        }

        .btn-submit:hover {
            background: #27ae60;
        }

        .msg {
            margin-top: 15px;
            font-weight: 600;
            color: #4b0082;
            text-align: center;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-container">
        <h2>Loan Return Entry</h2>

        <asp:Label ID="lblMsg" runat="server" CssClass="msg"></asp:Label>
        <asp:TextBox ID="txtid" runat="server" Visible="false"></asp:TextBox>


        <div class="form-group">
            <label>Member Name</label>
            <asp:DropDownList ID="ddlMember" runat="server"></asp:DropDownList>
        </div>

        <div class="form-group">
            <label>Loan Date</label>
            <asp:TextBox ID="txtLoanDate" runat="server" TextMode="Date"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Loan Available Amount</label>
            <asp:TextBox ID="txtLoanAvl" runat="server" TextMode="Number"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Loan Amount</label>
            <asp:TextBox ID="txtLoanAmt" runat="server" TextMode="Number"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Loan Paid Amount</label>
            <asp:TextBox ID="txtLoanPaid" runat="server" TextMode="Number"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Interest</label>
            <asp:TextBox ID="txtInterest" runat="server" TextMode="Number"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Total Paid</label>
            <asp:TextBox ID="txtTotalPaid" runat="server" TextMode="Number"></asp:TextBox>
        </div>

        <asp:Button ID="btnSave" runat="server" CssClass="btn-submit" Text="Save Loan Return" OnClick="btnSave_Click" />
    </div>
</asp:Content>
