<%@ Page Title="" Language="C#" MasterPageFile="~/User/Bachatgat.master" AutoEventWireup="true" CodeFile="Bachatgat_profile.aspx.cs" Inherits="User_Bachatgat_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataKeyField="B_id" 
    DataSourceID="SqlDataSource1" HorizontalAlign="Center" Width="60%">
    <ItemTemplate>
        &nbsp;<table align="center" cellpadding="3" style="width: 100%" width="60%">
            <tr>
                <td>
                    <asp:Label ID="lblbname" runat="server" style="font-weight: 700; font-family: Arial, Helvetica, sans-serif; font-size: large; color: #003366;" 
                        Text='<%# Eval("B_Name") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Address</strong>:<asp:Label ID="lbladdress" runat="server" 
                        Text='<%# Eval("B_Address") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Village</strong>:<asp:Label ID="lblvillage" runat="server" 
                        Text='<%# Eval("B_village") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>District</strong>:<asp:Label ID="lbldist" runat="server" 
                        Text='<%# Eval("District") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>State</strong>:<asp:Label ID="lblstate" runat="server" 
                        Text='<%# Eval("State") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Pincode</strong>:<asp:Label ID="lblpin" runat="server" 
                        Text='<%# Eval("Pincode") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Contact Person</strong>:<asp:Label ID="blname" runat="server" 
                        Text='<%# Eval("Contact_name") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Contact No.</strong>:<asp:Label ID="Label1" runat="server" 
                        Text='<%# Eval("contact_no") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>No.Of Members</strong>:<asp:Label ID="lblmem" runat="server" 
                        Text='<%# Eval("No_Of_Members") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Products</strong>:<asp:Label ID="lblproduct" runat="server" 
                        Text='<%# Eval("Products") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <strong>Email</strong>:<asp:Label ID="email" runat="server" 
                        Text='<%# Eval("Email") %>'></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Image ID="Image2" runat="server" Height="250px" 
                        ImageUrl='<%# Eval("B_img") %>' Width="300px" />
                </td>
            </tr>
        </table>
    </ItemTemplate>
</asp:DataList>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    SelectCommand="SELECT DISTINCT * FROM [Bachatgat_Reg] WHERE ([B_village] = @B_village)">
    <SelectParameters>
        <asp:SessionParameter Name="B_village" SessionField="bsearch" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>

