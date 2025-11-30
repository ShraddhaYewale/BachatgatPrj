<%@ Page Title="Post Event" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Post Event.aspx.cs" Inherits="Admin_Post_Event" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: Segoe UI, sans-serif;
            background-color: #f5f5f5;
        }
        .container {
            width: 90%;
            margin: 30px auto;
            background: #fff;
            border-radius: 10px;
            padding: 25px 40px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.15);
        }
        h2 {
            text-align: center;
            /*background: #0055aa;*/
             color: #0055aa;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
        }
        td {
            padding: 10px;
            vertical-align: top;
        }
        input, textarea, select {
            width: 100%;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }
        .btn {
            background-color: #0055aa;
            color: white;
            padding: 8px 20px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            margin: 5px;
        }
        .btn:hover {
            background-color: #0056b3;
        }
        .grid {
            margin-top: 30px;
        }
        @media (max-width: 768px) {
            .container { padding: 15px; }
            td { display: block; width: 100%; }
            .btn { width: 100%; margin: 10px 0; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <h2>Post Event</h2>
        <table>
            <tr>
                <td>Event ID</td>
                <td>
                    <asp:TextBox ID="txtid" runat="server" ReadOnly="true"></asp:TextBox>
                    <asp:Button ID="btnadd" runat="server" Text="New ID" CssClass="btn" OnClick="btnadd_Click" />
                </td>
            </tr>
            <tr>
                <td>Event Name</td>
                <td><asp:TextBox ID="txtename" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Date</td>
                <td><asp:TextBox ID="txtdate" runat="server" TextMode="Date"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Time</td>
                <td><asp:TextBox ID="txttime" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Venue</td>
                <td><asp:TextBox ID="txtvenue" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Contact Person</td>
                <td><asp:TextBox ID="txtperson" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Contact No</td>
                <td><asp:TextBox ID="txtnumber" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Registration Fees</td>
                <td><asp:TextBox ID="txtfees" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td>Status</td>
                <td>
                    <asp:DropDownList ID="ddlStatus" runat="server">
                        <asp:ListItem Text="--Select--" Value=""></asp:ListItem>
                        <asp:ListItem Text="Upcoming" Value="Upcoming"></asp:ListItem>
                        <asp:ListItem Text="Past" Value="Past"></asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>Advertisement Image</td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                    <asp:Button ID="btnupload" runat="server" Text="Upload" CssClass="btn" OnClick="btnupload_Click" />
                    <br />
                    <asp:Image ID="Image2" runat="server" Height="100px" Width="120px" />
                </td>
            </tr>
            <tr>
                <td>Description</td>
                <td><asp:TextBox ID="txtdesc" runat="server" TextMode="MultiLine" Rows="4"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="btnsave" runat="server" Text="Save Event" CssClass="btn" OnClick="btnsave_Click" />
                    <asp:Button ID="btnupdate" runat="server" Text="Update" CssClass="btn" OnClick="btnupdate_Click" />
                    <asp:Button ID="btnclear" runat="server" Text="Clear" CssClass="btn" OnClick="btnclear_Click" />
                </td>
            </tr>
        </table>

        <div class="grid">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table"
                OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="Event_id">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="Event_id" HeaderText="ID" />
                    <asp:BoundField DataField="Event_name" HeaderText="Event Name" />
                    <asp:BoundField DataField="Event_date" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="Event_time" HeaderText="Time" />
                    <asp:BoundField DataField="Venue" HeaderText="Venue" />
                    <asp:BoundField DataField="Contact_name" HeaderText="Contact" />
                    <asp:BoundField DataField="Contact_no" HeaderText="Phone" />
                    <asp:BoundField DataField="Reg_fees" HeaderText="Fees" />
                    <asp:BoundField DataField="Status" HeaderText="Status" />
                    <asp:TemplateField HeaderText="Image">
                        <ItemTemplate>
                            <asp:Image ID="imgField" runat="server" ImageUrl='<%# Eval("Advert_img") %>' Height="100px" Width="120px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Event_description" HeaderText="Description" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
