<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Customer.master" AutoEventWireup="true" CodeFile="productDetails.aspx.cs" Inherits="Customer_productDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        /* MAIN PRODUCT CARD */
        .product-detail-card {
            background-color: #fff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0px 8px 20px rgba(0,0,0,0.1);
            margin: 30px auto;
            max-width: 800px;
            display: flex;
            gap: 40px;
            flex-wrap: wrap;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .product-detail-card:hover {
            transform: translateY(-5px);
            box-shadow: 0px 12px 30px rgba(0,0,0,0.15);
        }

        /* PRODUCT IMAGE */
        .product-detail-card img {
            border-radius: 12px;
            max-width: 100%;
            object-fit: cover;
            flex: 1 1 300px;
            transition: transform 0.3s ease;
        }

        .product-detail-card img:hover {
            transform: scale(1.05);
        }

        /* PRODUCT INFO SECTION */
        .product-info {
            flex: 1 1 350px;
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .product-info h2 {
            font-size: 28px;
            font-weight: 700;
            color: #222;
            margin: 0;
        }

        .product-info p {
            font-size: 16px;
            color: #555;
            margin: 3px 0;
        }

        .product-info b {
            color: #222;
        }

        .price-label {
            font-size: 22px;
            font-weight: 700;
            color: #e63946;
        }

        /* STOCK */
        .stock-label {
            font-weight: 700;
            font-size: 14px;
            color: #28a745;
        }

        .out-of-stock {
            color: red;
            font-weight: 700;
        }

        /* DROP DOWN */
        .quantity-dropdown {
            width: 120px;
            padding: 6px 10px;
            border-radius: 6px;
            border: 1px solid #ccc;
            font-size: 15px;
        }

        /* ADD TO CART BUTTON */
        .add-to-cart-btn {
            background: linear-gradient(135deg, #ff416c, #ff4b2b);
            color: #fff;
            font-weight: 700;
            padding: 12px 25px;
            border-radius: 8px;
            border: none;
            cursor: pointer;
            font-size: 16px;
            transition: all 0.3s ease;
            width: fit-content;
        }

        .add-to-cart-btn:hover {
            background: linear-gradient(135deg, #ff758c, #ff7eb3);
            transform: scale(1.05);
        }

        /* INGREDIENTS & DETAILS */
        .section-title {
            font-weight: 700;
            font-size: 18px;
            margin-top: 15px;
            color: #333;
        }

        .section-content {
            font-size: 15px;
            color: #555;
            line-height: 1.5;
        }

        /* RESPONSIVE */
        @media(max-width: 1024px){
            .product-detail-card {
                flex-direction: column;
                align-items: center;
            }
            .product-info { align-items: center; text-align: center; }
        }
        @media(max-width: 480px){
            .product-detail-card {
                padding: 20px;
            }
            .product-info h2 { font-size: 24px; }
            .price-label { font-size: 20px; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" Width="100%" OnItemDataBound="DataList1_ItemDataBound">
        <ItemTemplate>
            <div class="product-detail-card">
                <!-- PRODUCT IMAGE -->
                <asp:Image ID="Image2" runat="server" ImageUrl='<%# Eval("P_img") %>' />

                <!-- PRODUCT INFORMATION -->
                <div class="product-info">
                    <h2><asp:Label ID="lblpname" runat="server" Text='<%# Eval("P_name") %>'></asp:Label></h2>
                    <asp:Label ID="lblid" runat="server" Text='<%# Eval("P_id") %>' Visible="False"></asp:Label>

                    <p><b>Category:</b> <asp:Label ID="lblcat" runat="server" Text='<%# Eval("P_category") %>'></asp:Label></p>
                    <p><b>Bachatgat:</b> <asp:Label ID="lblb_name" runat="server" Text='<%# Eval("b_name") %>'></asp:Label></p>
                    <p><b>Sell Unit:</b> <asp:Label ID="lblsell" runat="server" Text='<%# Eval("Sell_unit") %>'></asp:Label></p>

                    <p>
                        <b>Stock:</b> 
                        <asp:Label ID="lblstock" runat="server" CssClass="stock-label" Text='<%# Eval("Available_Quantity") %>'></asp:Label>
                        <asp:Label ID="lblOutOfStock" runat="server" Text="Out of Stock" CssClass="out-of-stock" Visible="False"></asp:Label>
                    </p>

                    <p><b>Price: </b> <span class="price-label">Rs.<asp:Label ID="lblprice" runat="server" Text='<%# Eval("Price") %>'></asp:Label></span></p>

                    <p>
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" CssClass="quantity-dropdown" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            <asp:ListItem>Select Quantity</asp:ListItem>
                        </asp:DropDownList>
                    </p>

                    <p><b>Total: </b><asp:Label ID="lbltot" runat="server"></asp:Label></p>

                    <p>
                        <asp:Button ID="btnaddcart" runat="server" Text="Add To Cart" CssClass="add-to-cart-btn" OnClick="btnaddcart_Click" />
                    </p>

                    <p class="section-title">Ingredients:</p>
                    <p class="section-content"><asp:Label ID="lblingredients" runat="server" Text='<%# Eval("ingredients") %>'></asp:Label></p>

                    <p class="section-title">Details:</p>
                    <p class="section-content"><asp:Label ID="lbldetails" runat="server" Text='<%# Eval("P_details") %>'></asp:Label></p>
                </div>
            </div>
        </ItemTemplate>
    </asp:DataList>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server"
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
        SelectCommand="SELECT DISTINCT * FROM [Product] WHERE ([P_id] = @P_id)">
        <SelectParameters>
            <asp:SessionParameter Name="P_id" SessionField="pid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

