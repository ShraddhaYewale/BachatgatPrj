<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Customer.master" AutoEventWireup="true" CodeFile="My Order.aspx.cs" Inherits="Customer_My_Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        .style1 {
            border-collapse: collapse;
            width: 100%;
            margin: 10px 0;
        }

        .style8 {
            height: 28px;
        }

        .style9 {
            width: 60%;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            border-radius: 10px;
        }

        .order-card {
            width: 100%;
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 15px;
            background-color: #fefefe;
            box-shadow: 0 2px 5px rgba(0,0,0,0.05);
            margin-bottom: 20px;
        }

        .order-card td {
            padding: 5px 10px;
            vertical-align: top;
        }

        .order-card strong {
            color: #333;
        }

        .lblstatus {
            color: #28a745; /* green for in-process */
            font-weight: 600;
        }

        .product-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        .product-table td {
            padding: 8px;
            vertical-align: top;
        }

        .product-table img {
            border-radius: 8px;
            border: 1px solid #ccc;
        }

        .lblprice, .lbltotal {
            font-weight: 700;
            color: #FF3300;
        }

        .lblname {
            font-size: 16px;
            font-weight: 700;
            color: #222;
        }

        .lblcat, .lblquantity {
            color: #555;
        }
        
        .cancel-btn {
    background-color: #dc3545; /* Red color */
    color: #fff;
    border: none;
    padding: 8px 16px;
    border-radius: 5px;
    cursor: pointer;
    font-weight: 600;
    transition: background-color 0.3s;
}

.cancel-btn:hover {
    background-color: #c82333;
}


        @media (max-width: 768px) {
            .style9 {
                width: 95%;
                padding: 15px;
            }
            .product-table img {
                width: 100%;
                height: auto;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" cellpadding="2" class="style1" >
    <tr>
        <td align="center" class="style9" valign="middle" width="60%">
            <asp:DataList ID="DataList1" runat="server" DataKeyField="OD_id" 
    DataSourceID="SqlDataSource1" Width="40%">
    <EditItemStyle BorderColor="Black" BorderStyle="Solid" VerticalAlign="Top" />
    <ItemTemplate>
        <table align="center" cellpadding="2" class="style1" border="black" rules="groups">
            <tr>
                <td>
                    <strong>Address</strong>:<asp:Label ID="lbladdr" runat="server" 
                        Text='<%# Eval("Delivery_Address") %>'></asp:Label>
                    <asp:Label ID="lbloid" runat="server" Text='<%# Eval("OD_id") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style8">
                    <strong>Status</strong>:
                    <asp:Label ID="lblstatus" runat="server" CssClass="lblstatus" 
                        Text='<%# Eval("Order_status") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;&nbsp;<asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                            <table align="center" cellpadding="2" class="product-table" width="60%">
                                <tr>
                                    <td rowspan="5">
                                        <asp:DataList ID="DataList3" runat="server" DataKeyField="P_id" 
                                            DataSourceID="SqlDataSource1">
                                            <ItemTemplate>
                                                <asp:Image ID="Image2" runat="server" Height="250px" 
                                                    ImageUrl='<%# Eval("P_img") %>' Width="250px" />
                                                <br />
                                            </ItemTemplate>
                                        </asp:DataList>
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                            SelectCommand="SELECT Distinct * FROM [Product] WHERE ([P_id] = @P_id)">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="lblpid" Name="P_id" PropertyName="Text" 
                                                    Type="Int32" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </td>
                                    <td>
                                        <asp:Label ID="lblname" runat="server" CssClass="lblname" 
                                            Text='<%# Eval("P_name") %>'></asp:Label>
                                        <asp:Label ID="lblpid" runat="server" Text='<%# Eval("P_id") %>' 
                                            Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Category:<asp:Label ID="lblcat" runat="server" Text='<%# Eval("Cat_name") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Quantity:<asp:Label ID="lblquantity" runat="server" 
                                            Text='<%# Eval("Quantity") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Price:<asp:Label ID="lblprice" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <strong>Total</strong>:<asp:Label ID="lbltotal" runat="server" 
                                            Text='<%# Eval("Total_amount") %>' 
                                            CssClass="lblprice"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT * FROM [Order_details] WHERE ([OD_id] = @OD_id)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="lbloid" Name="OD_id" PropertyName="Text" 
                                Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
            </tr>
            <!-- Cancel Order Button -->
            <tr>
                <td style="padding-top: 10px;">
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel Order" 
                        CssClass="cancel-btn" CommandArgument='<%# Eval("OD_id") %>' 
                        OnClick="btnCancel_Click" />
                </td>
            </tr>
        </table>
        <br />
        <br />
    </ItemTemplate>
    <SelectedItemStyle VerticalAlign="Top" />
</asp:DataList>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                SelectCommand="SELECT DISTINCT * FROM [Order] WHERE ([Order_status] = @Order_status)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="in Process" Name="Order_status" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
</table>
</asp:Content>
  