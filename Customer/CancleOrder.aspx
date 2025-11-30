<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="CancleOrder.aspx.cs" Inherits="Customer_CancleOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style6
        {
            height: 41px;
            width: 389px;
        }
        .style7
        {
            height: 28px;
            width: 389px;
        }
        .style8
        {
            width: 389px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" cellpadding="2" class="style1">
        <tr>
            <td align="center" valign="middle" width="60%">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    
                    SelectCommand="SELECT * FROM [Order] WHERE (([cm_name] = @cm_name) AND ([Order_status] = @Order_status))">
                    <SelectParameters>
                        <asp:SessionParameter Name="cm_name" SessionField="Customer" Type="String" />
                        <asp:Parameter DefaultValue="in Process" Name="Order_status" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:DataList ID="DataList1" runat="server" DataKeyField="OD_id" 
                    DataSourceID="SqlDataSource1" BorderStyle="None" style="height: 761px" 
                    Width="40%">
                    <EditItemStyle BorderColor="Black" BorderStyle="Solid" VerticalAlign="Top" />
                    <ItemTemplate>
                        <table align="center" cellpadding="2" class="style1" border="black" 
                            rules="groups">
                            <tr>
                                <td class="style7">
                                    <strong>Address:</strong><asp:Label ID="lbaddr" runat="server" 
                                        Text='<%# Eval("Delivery_Address") %>'></asp:Label>
                                    <asp:Label ID="lbloid" runat="server" Text='<%# Eval("OD_id") %>' 
                                        Visible="False"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style7">
                                    <strong>Status:</strong><asp:Label ID="lblstatus" runat="server" ForeColor="Green" 
                                        Text='<%# Eval("Order_status") %>'></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td class="style8">
                                    <asp:DataList ID="DataList2" runat="server" DataSourceID="SqlDataSource1">
                                        <ItemTemplate>
                                            <table align="center" cellpadding="2" class="style1">
                                                <tr>
                                                    <td rowspan="5">
                                                        <asp:DataList ID="DataList3" runat="server" DataKeyField="P_id" 
                                                            DataSourceID="SqlDataSource1">
                                                            <ItemTemplate>
                                                                <asp:Image ID="Image2" runat="server" Height="250px" 
                                                                    ImageUrl='<%# Eval("P_img") %>' Width="250px" />
                                                                <br />
                                                                <br />
                                                            </ItemTemplate>
                                                        </asp:DataList>
                                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                                                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                                                            SelectCommand="SELECT * FROM [Product] WHERE ([P_id] = @P_id)">
                                                            <SelectParameters>
                                                                <asp:ControlParameter ControlID="blpid" Name="P_id" PropertyName="Text" 
                                                                    Type="Int32" />
                                                            </SelectParameters>
                                                        </asp:SqlDataSource>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="lblname" runat="server" style="font-weight: 700" 
                                                            Text='<%# Eval("P_name") %>'></asp:Label>
                                                        <asp:Label ID="blpid" runat="server" Text='<%# Eval("P_id") %>' Visible="False"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Category:<asp:Label ID="lblcat" runat="server" Text='<%# Eval("Cat_name") %>'></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        Quantity:<asp:Label ID="lblqnty" runat="server" Text='<%# Eval("Quantity") %>'></asp:Label>
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
                                                            Text='<%# Eval("Total_amount") %>' Font-Bold="True" ForeColor="#FF3300"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <SeparatorStyle BorderColor="Black" BorderStyle="Solid" />
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
                            <tr>
                                <td style="text-align: center" class="style6">
                                    <asp:Button ID="Cancle" runat="server" Text='Cancle' Height="35px" 
                                        onclick="Cancle_Click" Width="150px" 
                                        CommandArgument='<%# Eval("OD_id") %>' 
                                        style="color: #FFFFFF; font-weight: 700; font-size: medium; background-color: #003366" />
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                    </ItemTemplate>
                </asp:DataList>
            </td>
        </tr>
    </table>
</asp:Content>

