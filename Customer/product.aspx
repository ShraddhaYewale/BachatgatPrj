<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Customer.master" AutoEventWireup="true" CodeFile="product.aspx.cs" Inherits="Customer_product" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body, table {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
        }

        /* MAIN CONTAINER */
        .main-container {
            display: flex;
            gap: 20px;
            padding: 20px;
        }

        /* CATEGORY SIDEBAR */
        .category-column {
            background: #003366;
            padding: 15px;
            border-radius: 12px;
            min-width: 180px;
        }

        .category-button {
            font-weight: bold;
            color: white;
            background: linear-gradient(135deg, #ff7e5f, #feb47b);
            border: none;
            border-radius: 12px;
            height: 40px;
            width: 150px;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-bottom: 15px;
        }

        .category-button:hover {
            background: linear-gradient(135deg, #36d1dc, #5b86e5);
            transform: scale(1.05);
        }

        /* PRODUCT GRID */
        .product-grid {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            width: 100%;
        }

        /* PRODUCT CARD */
        .product-card {
            background: linear-gradient(145deg, #fceabb, #f8b500);
            border-radius: 15px;
            padding: 15px;
            text-align: center;
            width: 260px;
            height: 420px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            box-shadow: 0 6px 15px rgba(0,0,0,0.2);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .product-card:hover {
            transform: translateY(-5px) scale(1.03);
            box-shadow: 0 12px 25px rgba(0,0,0,0.3);
        }

        .product-card img {
            width: 100%;
            height: 250px;
            object-fit: cover;
            border-radius: 12px;
            transition: transform 0.3s ease;
        }

        .product-card:hover img {
            transform: scale(1.05);
        }

        .product-card label[id$="lblname"] {
            font-weight: 700;
            font-size: 18px;
            color: #333;
            margin-top: 10px;
            display: block;
        }

        .product-card label[id$="lblprice"] {
            font-weight: bold;
            color: #e63946;
            margin-bottom: 10px;
            display: block;
        }

        /* VIEW MORE BUTTON */
        .view-btn {
            background: linear-gradient(135deg, #11998e, #38ef7d);
            color: white;
            font-weight: bold;
            border: none;
            border-radius: 12px;
            height: 35px;
            width: 100%;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .view-btn:hover {
            background: linear-gradient(135deg, #36d1dc, #5b86e5);
            transform: scale(1.05);
        }

        /* RESPONSIVE */
        @media(max-width: 1024px){
            .product-card { width: 45%; }
        }
        @media(max-width: 768px){
            .main-container { flex-direction: column; }
            .product-card { width: 100%; }
            .category-column { width: 100%; }
        }
        @media(max-width: 480px){
            .product-card { width: 100%; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-container">
        <!-- CATEGORY COLUMN -->
        <div class="category-column">
            <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" RepeatDirection="Vertical">
                <ItemTemplate>
                    <asp:Button ID="btnCategory" runat="server" CssClass="category-button"
                        Text='<%# Eval("c_name") %>' CommandArgument='<%# Eval("c_name") %>'
                        OnClick="Category_Click" />
                </ItemTemplate>
            </asp:DataList>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT DISTINCT [c_name] FROM [Category]">
            </asp:SqlDataSource>
        </div>

        <!-- PRODUCT GRID -->
        <div class="product-grid">
            <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource2"
                RepeatDirection="Horizontal" RepeatColumns="3">
                <ItemTemplate>
                    <div class="product-card">
                        <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("P_img") %>' />
                        <div class="product-title"><%# Eval("P_name") %></div>
                        <div class="product-price">Rs.<%# Eval("Price") %></div>
                        <asp:Button ID="btnViewMore" runat="server" CommandArgument='<%# Eval("P_id") %>'
                            Text="View More" CssClass="view-btn" OnClick="btn_Click" />
                    </div>
                </ItemTemplate>
            </asp:DataList>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server"
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT * FROM [Product] WHERE (@P_category IS NULL OR P_category = @P_category)">
                <SelectParameters>
                    <asp:SessionParameter Name="P_category" SessionField="Category" Type="String" ConvertEmptyStringToNull="true" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
