<%@ Page Title="Customer Feedback" Language="C#" MasterPageFile="~/Customer/Customer.master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="Customer_Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 20px;
        }

        .feedback-card {
            max-width: 700px;
            margin: auto;
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            padding: 30px;
        }

        .feedback-card h2 {
            color: #003366;
            text-align: center;
            margin-bottom: 25px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 10px 5px;
            vertical-align: middle;
        }

        .form-input {
            width: 100%;
            padding: 8px 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 14px;
            box-sizing: border-box;
        }

        .star-button img {
            width: 30px;
            cursor: pointer;
            transition: transform 0.2s;
        }

        .star-button img:hover {
            transform: scale(1.2);
        }

        .submit-btn {
            background-color: #003366;
            color: #fff;
            border: none;
            padding: 12px 25px;
            border-radius: 6px;
            cursor: pointer;
            font-size: 16px;
            display: block;
            margin: 20px auto 0;
            transition: background-color 0.3s;
        }

        .submit-btn:hover {
            background-color: #0055a5;
        }

        @media screen and (max-width: 600px) {
            .star-button img {
                width: 24px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="feedback-card">
        <h2>Customer Feedback</h2>

        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>

        <table>
            <!-- Name -->
            <tr>
                <td>Your Name:</td>
                <td><asp:TextBox ID="txtname" runat="server" CssClass="form-input"></asp:TextBox></td>
            </tr>

            <!-- Branch Name -->
            <tr>
                <td>Bachatgat Name:</td>
                <td><asp:TextBox ID="txtb_name" runat="server" CssClass="form-input"></asp:TextBox></td>
            </tr>

            <!-- Email -->
            <tr>
                <td>Email:</td>
                <td><asp:TextBox ID="txtemail" runat="server" CssClass="form-input"></asp:TextBox></td>
            </tr>
            <tr>
    <td>Phone Number:</td>
    <td><asp:TextBox ID="txtnumber" runat="server" CssClass="form-input"></asp:TextBox></td>
</tr>
<tr>
    <td>Message:</td>
    <td><asp:TextBox ID="txtmsg" runat="server" CssClass="form-input" TextMode="MultiLine" Rows="4"></asp:TextBox></td>
</tr>


            <!-- Product Quality -->
            <tr>
                <td>Product Quality:</td>
                <td class="star-button">
                    <asp:ImageButton ID="imgbtnpq1" runat="server" ImageUrl="~/Images/Star.gif" OnClick="imgbtnpq1_Click" />
                    <asp:ImageButton ID="imgbtnpq2" runat="server" ImageUrl="~/Images/Star.gif" OnClick="imgbtnpq2_Click" />
                    <asp:ImageButton ID="imgbtnpq3" runat="server" ImageUrl="~/Images/Star.gif" OnClick="imgbtnpq3_Click" />
                    <asp:ImageButton ID="imgbtnpq4" runat="server" ImageUrl="~/Images/Star.gif" OnClick="imgbtnpq4_Click" />
                    <asp:ImageButton ID="imgbtnpq5" runat="server" ImageUrl="~/Images/Star.gif" OnClick="imgbtnpq5_Click" />
                    <asp:Label ID="lblpq" runat="server" Text="" Visible="false"></asp:Label>
                </td>
            </tr>

            <!-- Product Price -->
            <tr>
                <td>Product Price:</td>
                <td class="star-button">
                    <asp:ImageButton ID="imgbtnpp1" runat="server" ImageUrl="~/Images/Star.gif" OnClick="imgbtnpp1_Click" />
                    <asp:ImageButton ID="imgbtnpp2" runat="server" ImageUrl="~/Images/Star.gif" OnClick="imgbtnpp2_Click" />
                    <asp:ImageButton ID="imgbtnpp3" runat="server" ImageUrl="~/Images/Star.gif" OnClick="imgbtnpp3_Click" />
                    <asp:ImageButton ID="imgbtnpp4" runat="server" ImageUrl="~/Images/Star.gif" OnClick="imgbtnpp4_Click" />
                    <asp:ImageButton ID="imgbtnpp5" runat="server" ImageUrl="~/Images/Star.gif" OnClick="imgbtnpp5_Click" />
                    <asp:Label ID="lblpp" runat="server" Text="" Visible="false"></asp:Label>
                </td>
            </tr>

            <!-- Order Process -->
            <tr>
                <td>Order Process:</td>
                <td class="star-button">
                    <asp:ImageButton ID="imgbtnop1" runat="server" ImageUrl="~/Images/Star.gif" OnClick="imgbtnop1_Click" />
                    <asp:ImageButton ID="imgbtnop2" runat="server" ImageUrl="~/Images/Star.gif" OnClick="imgbtnop2_Click" />
                    <asp:ImageButton ID="imgbtnop3" runat="server" ImageUrl="~/Images/Star.gif" OnClick="imgbtnop3_Click" />
                    <asp:ImageButton ID="imgbtnop4" runat="server" ImageUrl="~/Images/Star.gif" OnClick="imgbtnop4_Click" />
                    <asp:ImageButton ID="imgbtnop5" runat="server" ImageUrl="~/Images/Star.gif" OnClick="imgbtnop5_Click" />
                    <asp:Label ID="lblop" runat="server" Text="" Visible="false"></asp:Label>
                </td>
            </tr>

            <!-- Delivery Service -->
            <tr>
                <td>Delivery Service:</td>
                <td class="star-button">
                    <asp:ImageButton ID="imgbtnds1" runat="server" ImageUrl="~/Images/Star.gif" OnClick="imgbtnds1_Click" />
                    <asp:ImageButton ID="imgbtnds2" runat="server" ImageUrl="~/Images/Star.gif" OnClick="imgbtnds2_Click" />
                    <asp:ImageButton ID="imgbtnds3" runat="server" ImageUrl="~/Images/Star.gif" OnClick="imgbtnds3_Click" />
                    <asp:ImageButton ID="imgbtnds4" runat="server" ImageUrl="~/Images/Star.gif" OnClick="imgbtnds4_Click" />
                    <asp:ImageButton ID="imgbtnds5" runat="server" ImageUrl="~/Images/Star.gif" OnClick="imgbtnds5_Click" />
                    <asp:Label ID="lblds" runat="server" Text="" Visible="false"></asp:Label>
                </td>
            </tr>
        </table>

        <asp:Button ID="btnSubmit" runat="server" Text="Submit Feedback" CssClass="submit-btn" OnClick="btnSubmit_Click" />
    </div>
</asp:Content>
