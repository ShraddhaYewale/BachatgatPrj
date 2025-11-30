<%@ Page Title="" Language="C#" MasterPageFile="~/Bachatgat/BachatGat.master" AutoEventWireup="true" CodeFile="Post Product.aspx.cs" Inherits="Bachatgat_Post_Product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f6fa;
            color: #333;
        }

        .main-table {
            width: 95%;
            margin: 50px auto;
            background: #fff;
            border-radius: 16px;
            box-shadow: 0 6px 25px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .header-row {
            background-color: #003366;
            color: white;
            font-weight: 700;
            text-align: center;
            font-size: 22px;
            border-radius: 10px 10px 0 0;
            letter-spacing: 0.5px;
        }

        table.style1 td {
            padding: 10px 15px;
            vertical-align: middle;
        }

        input[type="text"], textarea, select {
            width: 100%;
            padding: 10px;
            border-radius: 8px;
            border: 1px solid #ccc;
            transition: all 0.3s ease;
            font-size: 15px;
        }

        input[type="text"]:focus, textarea:focus, select:focus {
            border-color: #005599;
            box-shadow: 0 0 6px rgba(0, 85, 153, 0.3);
            outline: none;
        }

        /* Buttons */
        .btn {
            height: 38px;
            width: 150px;
            border: none;
            border-radius: 8px;
            font-weight: 600;
            color: white;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
        }

        .btn:hover {
            transform: translateY(-2px);
        }

        .btn-blue {
            background-color: #003366;
        }

        .btn-blue:hover {
            background-color: #002244;
        }

        /* Upload Button */
        #btnupload {
            background-color: #007acc;
        }

        #btnupload:hover {
            background-color: #005f99;
        }

        /* GridView Styling */
        .gridview {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .gridview th {
            background-color: #003366;
            color: white;
            text-align: center;
            padding: 10px;
            font-weight: 600;
        }

        .gridview td {
            text-align: center;
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        .gridview tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .gridview tr:hover {
            background-color: #eef4ff;
        }

        /* Image Styling */
        #Image2, #Image3 {
            border-radius: 12px;
            object-fit: cover;
            box-shadow: 0 3px 10px rgba(0,0,0,0.15);
        }

        .promo-text {
            font-size: 26px;
            color: #003366;
            font-weight: 700;
            line-height: 1.4;
            text-align: center;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" cellpadding="4" class="main-table style1">
        <tr class="header-row">
            <td colspan="4">Product Details</td>
        </tr>

        <tr>
            <td>Product ID</td>
            <td><asp:TextBox ID="txtid" runat="server" Enabled="False"></asp:TextBox></td>
            <td>Ingredients</td>
            <td><asp:TextBox ID="txtingredients" runat="server" TextMode="MultiLine"></asp:TextBox></td>
        </tr>

        <tr>
            <td>Category</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server"
                    DataSourceID="SqlDataSource2" DataTextField="c_name" DataValueField="c_name"></asp:DropDownList>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
            </td>
            <td>Expiry Date</td>
            <td><asp:TextBox ID="txtexpdate" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td>Product Name</td>
            <td><asp:TextBox ID="txtpname" runat="server"></asp:TextBox></td>
            <td>Specification</td>
            <td><asp:TextBox ID="txtspecify" runat="server" TextMode="MultiLine"></asp:TextBox></td>
        </tr>

        <tr>
            <td>Price</td>
            <td><asp:TextBox ID="txtprice" runat="server"></asp:TextBox></td>
            <td>Bachatgat Name</td>
            <td><asp:TextBox ID="txtb_name" runat="server" Enabled="False"></asp:TextBox></td>
        </tr>

        <tr>
            <td>Selling Unit</td>
            <td><asp:TextBox ID="txtunit" runat="server"></asp:TextBox></td>
        </tr>

        <tr>
            <td>Available Quantity</td>
            <td><asp:TextBox ID="txtquantity" runat="server"></asp:TextBox></td>
            <td colspan="2" rowspan="2">
                <asp:Image ID="Image2" runat="server" Height="300px" Width="250px" />
            </td>
        </tr>

        <tr>
            <td rowspan="2">
                <asp:Image ID="Image3" runat="server" Height="300px" ImageUrl="~/Images/commerce_header.png" Width="350px" />
            </td>
            <td class="promo-text" colspan="2">
                Sell<br />Your<br />Products<br />On Our<br />Platform.
            </td>
        </tr>

        <tr>
            <td></td>
            <td colspan="2">
                <asp:FileUpload ID="FileUpload1" runat="server" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnupload" runat="server" CssClass="btn" Text="Upload" 
                    OnClick="btnupload_Click" BackColor="#003399" ForeColor="White" />
            </td>
        </tr>

        <tr><td colspan="4">&nbsp;</td></tr>

        <tr>
            <td colspan="4" style="text-align:center;">
                <asp:Button ID="btnnew" runat="server" Text="Add New" CssClass="btn btn-blue" OnClick="btnnew_Click" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnsave" runat="server" Text="Save" CssClass="btn btn-blue" OnClick="btnsave_Click" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnclear" runat="server" Text="Clear" CssClass="btn btn-blue" OnClick="btnclear_Click" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btnupdate" runat="server" Text="Update" CssClass="btn btn-blue" OnClick="btnupdate_Click" />
            </td>
        </tr>

        <tr>
            <td colspan="4">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                    CssClass="gridview"
                    DataKeyNames="P_id" DataSourceID="SqlDataSource1"
                    OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True">
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:BoundField DataField="P_id" HeaderText="P_id" ReadOnly="True" />
                        <asp:BoundField DataField="P_name" HeaderText="Product Name" />
                        <asp:BoundField DataField="P_img" HeaderText="Image" />
                        <asp:BoundField DataField="P_category" HeaderText="Category" />
                        <asp:BoundField DataField="Sell_unit" HeaderText="Sell Unit" />
                        <asp:BoundField DataField="Available_Quantity" HeaderText="Available Quantity" />
                        <asp:BoundField DataField="Price" HeaderText="Price" />
                        <asp:BoundField DataField="exp_date" HeaderText="Expiry Date" />
                        <asp:BoundField DataField="P_details" HeaderText="Specification" />
                        <asp:BoundField DataField="ingredients" HeaderText="Ingredients" />
                        <asp:BoundField DataField="b_name" HeaderText="Bachatgat Name" />
                    </Columns>
                </asp:GridView>

                <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT * FROM [Product] WHERE ([b_name] = @b_name)"
                    OnSelecting="SqlDataSource1_Selecting">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="txtb_name" Name="b_name" PropertyName="Text" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>
</asp:Content>  