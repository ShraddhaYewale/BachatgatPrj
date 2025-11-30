<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="View Order.aspx.cs" Inherits="Admin_View_Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style5
        {
            height: 26px;
            width: 1326px;
        }
        .style6
        {
            width: 1326px;
        }
        .style9
        {
            height: 1681px;
            width: 60%;
        }
        .style8
        {
            height: 28px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" cellpadding="2" class="style1">
        <tr>
            <td class="style5" 
                
                style="text-align: center; font-weight: 700; color: #000000; font-size: large; font-family: Arial, Helvetica, sans-serif; background-color: #FFFFFF">
                View Order</td>
        </tr>
        <tr>
            <td class="style6">
    <table align="center" cellpadding="2" class="style1" >
    <tr>
        <td align="center" class="style9" valign="middle" width="60%">
            <asp:DataList ID="DataList1" runat="server" DataKeyField="OD_id" 
                DataSourceID="SqlDataSource3" Width="40%">
                <EditItemStyle BorderColor="Black" BorderStyle="Solid" VerticalAlign="Top" />
                <ItemTemplate>
                    <table align="center" cellpadding="2" class="style1" border="black" 
                        rules="groups" >
                        <tr>
                            <td>
                                <strong>Address</strong>:<asp:Label ID="lbladdr" runat="server" 
                                    Text='<%# Eval("Delivery_Address") %>'></asp:Label>
                                <asp:Label ID="lbloid" runat="server" Text='<%# Eval("OD_id") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="style8">
                                <strong>Status</strong>:<asp:Label ID="lblstatus" runat="server" style="color: #66FF33" 
                                    Text='<%# Eval("Order_status") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;&nbsp;<asp:DataList ID="DataList2" runat="server" 
                                    DataSourceID="SqlDataSource2">
                                    <ItemTemplate>
                                        <table align="center" cellpadding="2" class="style1" width="60%">
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
                                                    <asp:Label ID="lblname" runat="server" style="font-weight: 700" 
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
                                                        style="color: #FF3300; font-weight: 700"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                </asp:DataList>
                                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                    SelectCommand="SELECT * FROM [Order_details] WHERE ([OD_id] = @OD_id)">
                                    <SelectParameters>
                                        <asp:ControlParameter ControlID="lbloid" Name="OD_id" PropertyName="Text" 
                                            Type="Int32" />
                                    </SelectParameters>
                                </asp:SqlDataSource>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                </ItemTemplate>
                <SelectedItemStyle VerticalAlign="Top" />
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                
                
                SelectCommand="SELECT DISTINCT * FROM [Order] WHERE ([Order_status] = @Order_status)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="in Process" Name="Order_status" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
</table>
            </td>
        </tr>
    </table>
</asp:Content>

