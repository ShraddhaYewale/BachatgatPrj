<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Customer.master" AutoEventWireup="true" CodeFile="Cart.aspx.cs" Inherits="Customer_Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }

        table {
            border-collapse: collapse;
        }

        /* Card container */
        .card {
            background-color: #fff;
            padding: 20px;
            margin: 20px auto;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        /* Section titles */
        .section-title {
            font-weight: 700;
            color: #003366;
            font-size: 18px;
            margin-bottom: 15px;
            border-bottom: 2px solid #003366;
            padding-bottom: 5px;
        }

        /* GridView styling */
        .gridview-style th {
            background-color: #003366;
            color: #fff;
            font-weight: 700;
            padding: 10px;
            text-align: center;
        }

        .gridview-style td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #eee;
        }

        .gridview-style tr:hover {
            background-color: #f0f8ff;
        }

        /* Stock label */
        .out-of-stock {
            color: red;
            font-weight: bold;
        }

        /* Shipping & Order table styling */
        .info-table td {
            padding: 10px;
        }

        .info-table input[type="text"] {
            width: 95%;
            padding: 8px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        /* Buttons */
        .btn-confirm {
            color: #fff;
            background-color: #003366;
            font-weight: 700;
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-confirm:hover {
            background-color: #0055aa;
        }

        /* Responsive layout */
        @media (max-width: 768px) {
            .flex-container {
                display: block;
            }

            .flex-container > div {
                width: 100% !important;
                margin-bottom: 20px;
            }
        }

        /* Flex layout for shipping & order */
        .flex-container {
            display: flex;
            justify-content: space-between;
            gap: 20px;
        }

        .flex-container > div {
            flex: 1;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="card">
        <div class="section-title">Cart Details</div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="gridview-style">
            <Columns>
                <asp:BoundField DataField="pid" HeaderText="Product ID" SortExpression="pid" />
                <asp:BoundField DataField="category" HeaderText="Category" SortExpression="category" />
                <asp:BoundField DataField="pname" HeaderText="Product Name" SortExpression="pname" />
                <asp:BoundField DataField="username" HeaderText="Username" SortExpression="username" />
                <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" DataFormatString="{0:C}" />
                <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity" />
                <asp:BoundField DataField="total" HeaderText="Total" SortExpression="total" DataFormatString="{0:C}" />
                <asp:BoundField DataField="bname" HeaderText="Brand" SortExpression="bname" />
                <asp:TemplateField HeaderText="Stock">
                    <ItemTemplate>
                        <asp:Label ID="lblStock" runat="server" Text='<%# Eval("Available_Quantity") %>'></asp:Label>
                        <asp:Label ID="lblOutOfStock" runat="server" Text="Out of Stock" CssClass="out-of-stock" Visible="False"></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT cd.*, p.Available_Quantity FROM Cart_Details cd INNER JOIN Product p ON cd.pid = p.P_id WHERE cd.Username = @Username">
            <SelectParameters>
                <asp:SessionParameter Name="Username" SessionField="Customer" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <div class="flex-container">
            <div class="card">
                <div class="section-title">Shipping Details</div>
                <table class="info-table">
                    <tr><td>Name</td><td><asp:TextBox ID="txtname" runat="server"></asp:TextBox></td></tr>
                    <tr><td>Address</td><td><asp:TextBox ID="txtaddr" runat="server"></asp:TextBox></td></tr>
                    <tr><td>City</td><td><asp:TextBox ID="txtcity" runat="server"></asp:TextBox></td></tr>
                    <tr><td>Pincode</td><td><asp:TextBox ID="txtpin" runat="server"></asp:TextBox></td></tr>
                    <tr><td>Contact</td><td><asp:TextBox ID="txtcontact" runat="server"></asp:TextBox></td></tr>
                </table>
            </div>

            <div class="card">
                <div class="section-title">Order Details</div>
                <table class="info-table">
                    <tr><td>Order ID</td><td><asp:Label ID="lblid" runat="server" Text="Label"></asp:Label></td></tr>
                    <tr><td>Customer Name</td><td><asp:Label ID="lblname" runat="server" Text="Label"></asp:Label></td></tr>
                    <tr><td>Order Date</td><td><asp:Label ID="lblodate" runat="server" Text="Label"></asp:Label></td></tr>
                    <tr><td>Total Amount</td><td><asp:Label ID="lbltot" runat="server" Text="Label"></asp:Label></td></tr>
                    <tr><td>Order Time</td><td><asp:Label ID="lblo_time" runat="server" Text="Label"></asp:Label></td></tr>
                </table>
            </div>
        </div>

        <div style="text-align:center; margin-top: 25px;">
            <asp:Button ID="btnconf" runat="server" Text="Confirm Order" 
                onclick="Button1_Click" CssClass="btn-confirm" />
        </div>
    </div>
</asp:Content>
