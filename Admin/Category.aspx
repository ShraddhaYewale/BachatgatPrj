<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Category.aspx.cs" Inherits="Admin_Category" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        body {
            background: #0055aa;
            font-family: 'Segoe UI', sans-serif;
        }

        .category-container {
            width: 600px;
            margin: 40px auto;
            background: #ffffff;
            border-radius: 12px;
            padding: 30px 40px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
            border-top: 5px solid #1976d2;
        }

        .category-container h2 {
            text-align: center;
            color: #0055aa;
            font-weight: 600;
            margin-bottom: 30px;
        }
        table td {
            padding: 12px 10px;
            font-size: 16px;
            color: #333;
        }

        .input-box {
            width: 300px;
            height: 38px;
            padding: 8px;
            border: 1px solid #bcd0f7;
            border-radius: 6px;
            font-size: 15px;
        }

        .input-box:focus {
            outline: none;
            border-color: #1976d2;
            box-shadow: 0 0 5px rgba(25,118,210,0.3);
        }

        .btn {
            padding: 10px 25px;
            background: #0055aa;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            cursor: pointer;
            transition: 0.3s;
        }

        .btn:hover {
            background: #0d47a1;
        }

        .img-preview {
            border: 1px solid #e0e0e0;
            padding: 8px;
            border-radius: 8px;
            background: #fafafa;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="category-container">
        <h2 >Product Category</h2>

        <table align="center" cellpadding="4">
            <tr>
                <td>Category ID</td>
                <td>
                    <asp:TextBox ID="txtcid" runat="server" CssClass="input-box" Enabled="False"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>Category Name</td>
                <td>
                    <asp:TextBox ID="txtcname" runat="server" CssClass="input-box"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td>Category Image</td>
                <td>
                    <asp:Image ID="Image1" runat="server" Height="200px" Width="280px" CssClass="img-preview" />
                    <br /><br />
                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="input-box" />
                    <br /><br />
                    <asp:Button ID="btnupload" runat="server" CssClass="btn" Text="Upload" onclick="btnupload_Click" />
                    </td>
            </tr>

            <tr>
                <td colspan="2" style="text-align:center;">
                    <asp:Button ID="btnsubmit" runat="server" CssClass="btn" Text="Submit" onclick="btnsubmit_Click" />
                    &nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btncancle" runat="server" CssClass="btn" Text="Cancel" onclick="btncancle_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
