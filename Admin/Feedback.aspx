<%@ Page Title="View Feedbacks" Language="C#" MasterPageFile="~/Admin/Admin.master" 
    AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="Admin_Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .feedback-container {
            width: 95%;
            max-width: 1200px;
            margin: 30px auto;
            background: #fff;
            border-radius: 15px;
            padding: 25px 30px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #2e3192;
            margin-bottom: 25px;
            font-weight: 600;
        }

        .gridview {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        .gridview th {
            background-color: #2e3192;
            color: #fff;
            text-align: center;
            padding: 10px;
        }

        .gridview td {
            background-color: #fafafa;
            text-align: center;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        .gridview tr:hover td {
            background-color: #eef2ff;
        }

        .btn-delete {
            background-color: #dc3545;
            color: white;
            border: none;
            border-radius: 6px;
            padding: 6px 12px;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn-delete:hover {
            background-color: #c82333;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="feedback-container">
        <h2>📢 Bachatgat Feedbacks</h2>

        <asp:GridView ID="GridView1" runat="server" CssClass="gridview" AutoGenerateColumns="False" 
            DataKeyNames="Feedback_id" OnRowDeleting="GridView1_RowDeleting" AllowPaging="True" PageSize="8">
            
            <Columns>
                <asp:BoundField DataField="Feedback_id" HeaderText="ID" ReadOnly="True" />
                <asp:BoundField DataField="Bachatgat_name" HeaderText="Bachatgat Name" />
                <asp:BoundField DataField="Contact_no" HeaderText="Contact No." />
                <asp:BoundField DataField="Feedback_date" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}" />
                <asp:BoundField DataField="Feedback_message" HeaderText="Message" />
                <asp:CommandField ShowDeleteButton="True" DeleteText="Delete" ControlStyle-CssClass="btn-delete" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
