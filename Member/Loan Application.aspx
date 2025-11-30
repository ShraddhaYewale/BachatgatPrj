<%@ Page Title="Loan Application" Language="C#" MasterPageFile="~/Member/Member.master" AutoEventWireup="true"
    CodeFile="Loan Application.aspx.cs" Inherits="Member_Loan_Application" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Loan Application</title>
    <style>
        body { font-family: Arial, sans-serif; background-color: #e7f0fd; }
        .loan-form-container {
            max-width: 650px;
            margin: 40px auto;
            padding: 30px 40px;
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 8px 20px rgba(0, 123, 255, 0.2);
            border-top: 5px solid #007bff;
        }

        .loan-form-container h2 {
            color: #007bff;
            text-align: center;
            margin-bottom: 25px;
            font-size: 28px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 10px;
        }

        label {
            font-weight: bold;
            color: #007bff;
        }

        input[type=text], select, .form-control {
            width: 100%;
            padding: 8px 10px;
            border: 1px solid #007bff;
            border-radius: 6px;
            box-sizing: border-box;
            margin-top: 5px;
            font-size: 14px;
        }

        input[readonly] {
            background-color: #f0f8ff;
        }

        .btn-submit {
            background-color: #007bff;
            color: #ffffff;
            padding: 10px 18px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 15px;
            transition: all 0.3s ease;
        }

        .btn-submit:hover {
            background-color: #0056b3;
        }

        #litEMI {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            color: #0056b3;
            font-size: 16px;
        }

        #lblMsg {
            display: block;
            margin-top: 15px;
            font-weight: bold;
            font-size: 16px;
            text-align: center;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="loan-form-container">
        <h2>Loan Application Form</h2>
        <table>
            <tr>
                <td><asp:Label ID="lblLoanId" runat="server" Text="Loan ID:"></asp:Label></td>
                <td><asp:TextBox ID="txtLoanId" runat="server" ReadOnly="true"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblBachatgatName" runat="server" Text="Bachatgat Name:"></asp:Label></td>
                <td>
                    <asp:DropDownList ID="ddlBachatgat" runat="server" CssClass="form-control"></asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td><asp:Label ID="lblMemberName" runat="server" Text="Member Name:"></asp:Label></td>
                <td><asp:TextBox ID="txtMemberName" runat="server" ReadOnly="true"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblSavingAmt" runat="server" Text="Total Savings (INR):"></asp:Label></td>
                <td><asp:TextBox ID="txtSavingAmt" runat="server" ReadOnly="true"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblLoanRequire" runat="server" Text="Loan Required (INR):"></asp:Label></td>
                <td><asp:TextBox ID="txtLoanRequire" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblRate" runat="server" Text="Interest Rate (% p.a.):"></asp:Label></td>
                <td><asp:TextBox ID="txtInterestRate" runat="server" Text="12"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblTerm" runat="server" Text="Term (months):"></asp:Label></td>
                <td><asp:TextBox ID="txtTermMonths" runat="server" Text="12"></asp:TextBox></td>
            </tr>
            <tr>
                <td><asp:Label ID="lblLoanApplDate" runat="server" Text="Application Date:"></asp:Label></td>
                <td><asp:TextBox ID="txtLoanApplDate" runat="server" Text='<%# DateTime.Now.ToString("yyyy-MM-dd") %>'></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnCalc" runat="server" Text="Calculate EMI" CssClass="btn-submit" OnClick="btnCalc_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Literal ID="litEMI" runat="server"></asp:Literal>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit Application" CssClass="btn-submit" OnClick="btnSubmit_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblMsg" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
