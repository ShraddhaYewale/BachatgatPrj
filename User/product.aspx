<%@ Page Title="" Language="C#" MasterPageFile="~/User/Bachatgat.master" AutoEventWireup="true" CodeFile="product.aspx.cs" Inherits="User_product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <style>
        body, table {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* CATEGORY BUTTONS */
        .category-btn {
            font-weight: bold;
            color: white;
            background: linear-gradient(135deg, #ff7e5f, #feb47b);
            border: none;
            border-radius: 12px;
            height: 40px;
            width: 150px;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .category-btn:hover {
            background: linear-gradient(135deg, #36d1dc, #5b86e5);
            transform: scale(1.05);
        }

        /* PRODUCT CARDS */
        .products-container {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
        }

        .product-card {
            background: linear-gradient(145deg, #fceabb, #f8b500);
            border-radius: 15px;
            padding: 15px;
            text-align: center;
            width: 260px;            /* Fixed width */
            height: 420px;           /* Fixed height for all cards */
            display: flex;
            flex-direction: column;
            justify-content: space-between; /* keeps buttons at bottom */
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .product-card:hover {
            transform: translateY(-5px) scale(1.03);
            box-shadow: 0 12px 25px rgba(0,0,0,0.3);
        }

        .product-card img {
            width: 100%;
            height: 250px;      /* Fixed height for all images */
            object-fit: cover;  /* Makes all images fill the area uniformly */
            border-radius: 12px;
            transition: transform 0.3s ease;
        }
        .product-card:hover img {
            transform: scale(1.05);
        }

        .product-title {
            font-weight: 700;
            font-size: 18px;
            margin: 10px 0 5px 0;
            color: #333;
        }

        .product-price {
            font-weight: bold;
            color: #e63946;
            margin-bottom: 10px;
        }

        .view-btn {
            background: linear-gradient(135deg, #11998e, #38ef7d);
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 10px;
            height: 35px;
            width: 100%;
            cursor: pointer;
            transition: all 0.3s ease;
        }
        .view-btn:hover {
            background: linear-gradient(135deg, #36d1dc, #5b86e5);
            transform: scale(1.05);
        }

        /* Responsive adjustments */
        @media(max-width: 768px){
            .product-card { width: 45%; }
        }
        @media(max-width: 480px){
            .product-card { width: 100%; }
        }

        /* CATEGORY COLUMN */
        .category-column {
            background: #003366;
            padding: 15px;
            border-radius: 12px;
            min-width: 180px;
        }

    </style>

    <table align="center" cellpadding="3" style="width:100%">
        <tr>
            <!-- CATEGORY COLUMN -->
            <td valign="top" class="category-column">
                <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
                    onselectedindexchanged="DataList1_SelectedIndexChanged" Width="100%">
                    <ItemTemplate>
                        <div style="margin-bottom:15px; text-align:center;">
                            <asp:Button ID="Button1" runat="server" CommandArgument='<%# Eval("c_name") %>' 
                                Text='<%# Eval("c_name") %>' onclick="Button1_Click" CssClass="category-btn" />
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT DISTINCT [c_name] FROM [Category]">
                </asp:SqlDataSource>
            </td>

            <!-- PRODUCTS COLUMN -->
            <td valign="top">
                <div class="products-container">
                    <asp:DataList ID="DataList2" runat="server"  
                        DataSourceID="SqlDataSource2" RepeatDirection="Horizontal">
                        <ItemTemplate>
                            <div class="product-card">
                                <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("P_img") %>' />
                                <div class="product-title"><%# Eval("P_name") %></div>
                                <div class="product-price">Rs.<%# Eval("Price") %></div>
                                <asp:Button ID="btn" runat="server" CommandArgument='<%# Eval("P_id") %>' 
                                    Text="View More" CssClass="view-btn" onclick="btn_Click" />
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>

                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT DISTINCT * FROM [Product] WHERE ([P_category] = @P_category)">
                    <SelectParameters>
                        <asp:SessionParameter Name="P_category" SessionField="Category" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
    </table>

</asp:Content>
