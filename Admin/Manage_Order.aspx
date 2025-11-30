<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="Manage_Order.aspx.cs" Inherits="Admin_Manage_Order" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        /* Header */
        .style5 {
            font-size: 20px;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color: #ffffff;
            height: 45px;
            text-align: center;
            background: linear-gradient(135deg, #003366, #0055aa);
            font-weight: bold;
            border-radius: 8px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: transform 0.3s ease, background 0.3s ease;
        }

        .style5:hover {
            background: linear-gradient(135deg, #0055aa, #0077cc);
            transform: translateY(-2px);
        }

        /* GridView Styling */
        .style1 {
            width: 90%;
            margin: 20px auto;
            border-collapse: separate;
            border-spacing: 0 12px;
        }

        .style1 td {
            padding: 8px;
        }

        /* GridView Modern Look */
        #GridView1 {
            border: none;
            width: 100%;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            border-radius: 10px;
            overflow: hidden;
        }

        #GridView1 th {
            background: linear-gradient(135deg, #003366, #0055aa);
            color: #fff;
            font-weight: bold;
            padding: 10px;
            text-align: center;
        }

        #GridView1 td {
            background: #ffffff;
            text-align: center;
            padding: 10px;
            transition: background 0.3s ease, transform 0.5s ease, opacity 0.5s ease;
            opacity: 0;
            transform: translateY(20px);
        }

        #GridView1 tr:nth-child(even) td {
            background: #f0f4f8;
        }

        #GridView1 tr:hover td {
            background: #cce0ff;
        }

        /* Animated Select Buttons */
        .btn-select {
            font-weight: 600;
            color: #fff;
            background: linear-gradient(135deg, #ff6600, #ff9933);
            border: 2px solid #ff6600;
            border-radius: 8px;
            cursor: pointer;
            padding: 5px 15px;
            transition: all 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
        }

        .btn-select:hover {
            background: linear-gradient(135deg, #ff9933, #ff6600);
            transform: scale(1.1) translateY(-2px);
            box-shadow: 0 8px 20px rgba(255,102,0,0.4);
        }

        /* DropDown styling */
        .status-dropdown {
            padding: 8px 12px;
            font-size: 15px;
            border-radius: 8px;
            border: 1px solid #cce0ff;
            transition: all 0.3s ease;
            min-width: 150px;
        }

        .status-dropdown:hover, .status-dropdown:focus {
            border-color: #0055aa;
            box-shadow: 0 0 8px rgba(0,85,170,0.2);
            outline: none;
        }

        /* Status badge to visually show current status */
        .status-badge {
            display:inline-block;
            font-weight:600;
            font-size:14px;
            padding:5px 10px;
            border-radius:12px;
            margin-left:10px;
            color:#fff;
        }

        .status-inprocess { background: #ff9933; }   /* Orange */
        .status-delivered { background: #28a745; }   /* Green */
        .status-rejected { background: #dc3545; }    /* Red */
        .status-dispatched { background: #007bff; }  /* Blue */

        /* Update Button */
        .btn-update {
            font-weight: 700;
            color: #FFFFFF;
            background: linear-gradient(135deg, #003366, #0055aa);
            border-radius: 10px;
            border:none;
            cursor: pointer;
            padding: 10px 20px;
            transition: all 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
        }

        .btn-update:hover {
            background: linear-gradient(135deg, #ff6600, #ff9933);
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 10px 25px rgba(255,102,0,0.3);
        }

        /* Hidden labels for internal processing */
        .hidden-label { display:none; }

        /* Responsive */
        @media(max-width: 768px) {
            .style1 { width: 95%; }
            .status-dropdown, .btn-update, .btn-select { width: 100%; margin: 5px 0; }
        }
    </style>

    <script type="text/javascript">
        // Animate GridView rows individually on page load
        window.onload = function () {
            var rows = document.querySelectorAll("#GridView1 tr td");
            rows.forEach(function (td, index) {
                setTimeout(function () {
                    td.style.opacity = "1";
                    td.style.transform = "translateY(0)";
                }, index * 50);
            });

            // Status badge update
            var ddl = document.getElementById('<%= DropDownList1.ClientID %>');
            var badge = document.getElementById('<%= lblStatusBadge.ClientID %>');

            function updateBadge() {
                var val = ddl.value;
                badge.innerText = val;
                badge.className = 'status-badge';
                if (val === 'In Process') badge.classList.add('status-inprocess');
                else if (val === 'Delivered') badge.classList.add('status-delivered');
                else if (val === 'Rejected') badge.classList.add('status-rejected');
                else if (val === 'Dispatched') badge.classList.add('status-dispatched');
            }

            ddl.onchange = updateBadge;
            updateBadge();
        }
    </script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table align="center" cellpadding="2" class="style1">
        <tr>
            <td class="style5" colspan="3">
                <strong>Process Order</strong>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" 
                    CellPadding="3" DataKeyNames="OD_id" DataSourceID="SqlDataSource1" 
                    GridLines="Vertical" 
                    onselectedindexchanged="GridView1_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="#f0f4f8" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="btnSelect" runat="server" Text="Select" 
                                    CommandName="Select" CssClass="btn-select" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="OD_id" HeaderText="ID" ReadOnly="True" SortExpression="OD_id" />
                        <asp:BoundField DataField="Delivery_Address" HeaderText="Delivery Address" SortExpression="Delivery_Address" />
                        <asp:BoundField DataField="contact" HeaderText="Contact" SortExpression="contact" />
                        <asp:BoundField DataField="Ord_date" HeaderText="Date" SortExpression="Ord_date" />
                        <asp:BoundField DataField="cm_name" HeaderText="Customer" SortExpression="cm_name" />
                        <asp:BoundField DataField="total_amount" HeaderText="Total" SortExpression="total_amount" />
                        <asp:BoundField DataField="Order_status" HeaderText="Order Status" SortExpression="Order_status" />
                        <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                    SelectCommand="SELECT * FROM [Order] WHERE ([Order_status] != @Order_status)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="Delivered" Name="Order_status" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td colspan="3" style="padding:10px; text-align:center;">
                <asp:Label ID="lbloid" runat="server" CssClass="hidden-label"></asp:Label>
                <asp:Label ID="lblstatus" runat="server" CssClass="hidden-label"></asp:Label>
                <asp:Label ID="lblcname" runat="server" CssClass="hidden-label"></asp:Label>
                <asp:Label ID="lblamount" runat="server" CssClass="hidden-label"></asp:Label>
                <asp:Label ID="Label2" runat="server" CssClass="hidden-label"></asp:Label>
            </td>
        </tr>
        <tr style="vertical-align:middle;">
            <td style="text-align:center; font-weight:bold; font-size:16px;">
                Order ID: <asp:Label ID="lblid" runat="server" CssClass="order-id-label"></asp:Label>
            </td>
            <td style="text-align:center;">
                Status: 
                <asp:DropDownList ID="DropDownList1" runat="server" CssClass="status-dropdown" Height="40px" Width="250px">
                    <asp:ListItem Text="In Process" Value="In Process" />
                    <asp:ListItem Text="Delivered" Value="Delivered" />
                    <asp:ListItem Text="Rejected" Value="Rejected" />
                    <asp:ListItem Text="Dispatched" Value="Dispatched" />
                </asp:DropDownList>
                <asp:Label ID="lblStatusBadge" runat="server" CssClass="status-badge"></asp:Label>
            </td>
            <td style="text-align:center;">
                <asp:Button ID="btnupdate" runat="server" Text="Update Status" CssClass="btn-update" OnClick="btnupdate_Click" Height="40px" Width="150px" />
            </td>
        </tr>
    </table>
</asp:Content>
