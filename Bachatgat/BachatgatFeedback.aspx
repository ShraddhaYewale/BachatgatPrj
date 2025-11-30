<%@ Page Title="Feedback" Language="C#" MasterPageFile="~/Bachatgat/BachatGat.master" 
    AutoEventWireup="true" CodeFile="BachatgatFeedback.aspx.cs" Inherits="Bachatgat_BachatgatFeedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .feedback-container {
            width: 80%;
            max-width: 700px;
            margin: 40px auto;
            background: #fff;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            color: #2e3192;
            margin-bottom: 25px;
            font-weight: 600;
        }
        label {
            font-weight: bold;
            margin-top: 10px;
            display: block;
        }
        .form-control {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 15px;
        }
        .btn-submit {
            background-color: #2e3192;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
            margin-top: 15px;
        }
        .btn-submit:hover {
            background-color: #4348b8;
        }
        .success-message {
            color: green;
            font-weight: bold;
            text-align: center;
            margin-top: 10px;
        }
        .error-message {
            color: red;
            font-weight: bold;
            text-align: center;
            margin-top: 10px;
        }
        @media (max-width: 600px) {
            .feedback-container { width: 95%; padding: 20px; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="feedback-container">
        <h2>Submit Your Feedback</h2>

        <label>Bachatgat Name:</label>
        <asp:TextBox ID="txtBachatgatName" runat="server" CssClass="form-control" placeholder="Enter Bachatgat Name"></asp:TextBox>

        <label>Contact Number:</label>
        <asp:TextBox ID="txtContact" runat="server" CssClass="form-control" placeholder="Enter Contact Number"></asp:TextBox>

        <label>Feedback Message:</label>
        <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5"
            placeholder="Write your feedback here..."></asp:TextBox>

        <div style="text-align:center;">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit Feedback" CssClass="btn-submit" OnClick="btnSubmit_Click" />
        </div>

        <asp:Label ID="lblMessage" runat="server"></asp:Label>
    </div>
</asp:Content>
