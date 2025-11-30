<%@ Page Title="Bachatgat Search" Language="C#" MasterPageFile="~/User/Bachatgat.master" AutoEventWireup="true" CodeFile="Bachat_search.aspx.cs" Inherits="User_Bachat_search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <style>
        /* Container styling */
        .search-container {
            width: 95%;
            max-width: 1200px;
            margin: 30px auto;
            background: linear-gradient(to right, #ff9966, #ff5e62);
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0,0,0,0.2);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .search-container h2 {
            text-align: center;
            color: #fff;
            margin-bottom: 10px;
        }

        .search-container p {
            text-align: center;
            color: #fff;
            margin-bottom: 25px;
            font-weight: 500;
        }

        /* Search box styling */
        .search-box {
            text-align: center;
            margin-bottom: 20px;
        }

        .search-box input[type="text"] {
            width: 350px;
            height: 45px;
            border-radius: 25px;
            border: none;
            padding: 0 20px;
            font-size: 16px;
            outline: none;
            transition: 0.3s;
        }

        .search-box input[type="text"]:focus {
            box-shadow: 0 0 10px rgba(255,255,255,0.6);
        }

        .search-box input[type="submit"],
        #btnapply {
            background: linear-gradient(135deg, #ff33cc, #6600ff);
            color: #fff;
            border: none;
            border-radius: 30px;
            padding: 12px 30px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.4s ease-in-out;
            box-shadow: 0 5px 15px rgba(102,0,255,0.4);
        }

        .search-box input[type="submit"]:hover,
        #btnapply:hover {
            transform: scale(1.1) rotate(-1deg);
            box-shadow: 0 8px 20px rgba(102,0,255,0.6);
            background: linear-gradient(135deg, #6600ff, #ff33cc);
        }

        /* Message Label styling */
        #lblMessage {
            display: block;
            text-align: center;
            margin: 15px auto 30px;
            font-size: 16px;
            font-weight: 600;
            color: #B22222;
            background: #fff5f5;
            border-radius: 10px;
            padding: 12px 20px;
            width: 80%;
            max-width: 700px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
        }

        /* Cards */
        .bg-card {
            display: flex;
            align-items: center;
            background: #fff;
            padding: 20px;
            border-radius: 15px;
            margin-bottom: 25px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.15);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .bg-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.25);
        }

        .bg-card img {
            width: 150px;
            height: 150px;
            border-radius: 15px;
            object-fit: cover;
            margin-right: 25px;
            border: 3px solid #ff33cc;
        }

        .bg-details h3 {
            margin: 0;
            color: #ff3399;
            font-size: 22px;
            font-weight: bold;
        }

        .bg-details p {
            text-align: left;
            margin: 6px 0;
            font-size: 15px;
            color: #333;
        }

        .bg-details button {
            margin-top: 10px;
            background: #6600ff;
            color: #fff;
            border: none;
            padding: 8px 18px;
            border-radius: 10px;
            font-size: 14px;
            cursor: pointer;
            transition: 0.3s;
        }

        .bg-details button:hover {
            background: #ff33cc;
        }

        /* Responsive */
        @media(max-width: 768px) {
            .bg-card {
                flex-direction: column;
                text-align: center;
            }

            .bg-card img {
                margin-bottom: 15px;
            }

            .search-box input[type="text"] {
                width: 80%;
                margin-bottom: 10px;
            }

            .search-box input[type="submit"] {
                width: 60%;
            }

            #lblMessage {
                width: 90%;
                font-size: 14px;
            }
        }
    </style>

    <div class="search-container">
        <div class="search-box">
            <h2>Find Your Local Bachatgat</h2>
            <p>Search by City or Village to see available Bachatgat profiles.</p>

            <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter City/Village"></asp:TextBox>
            <asp:Button ID="btnapply" runat="server" Text="Search" OnClick="btnapply_Click" />
        </div>

        <!-- ✅ Professional message label -->
        <asp:Label 
            ID="lblMessage" 
            runat="server" 
            Text="" 
            Visible="False">
        </asp:Label>

        <!-- DataList styled as cards -->
        <asp:DataList ID="DataList1" runat="server" DataKeyField="B_id" DataSourceID="SqlDataSource1" RepeatDirection="Vertical" RepeatLayout="Flow">
            <ItemTemplate>
                <div class="bg-card">
                    <asp:Image ID="imgBachatgat" runat="server" ImageUrl='<%# Eval("B_img") %>' AlternateText="Bachatgat Image" />

                    <div class="bg-details">
                        <h3><%# Eval("B_Name") %></h3>
                        <p><strong>City/Village:</strong> <%# Eval("B_village") %></p>
                        <p><strong>Products:</strong> <%# Eval("Products") %></p>
                        <p><strong>Contact:</strong> <%# Eval("Contact_name") %> - <%# Eval("contact_no") %></p>
                    </div>
                </div>
            </ItemTemplate>
        </asp:DataList>

        <!-- SQL Data Source -->
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
            SelectCommand="SELECT DISTINCT * FROM [Bachatgat_Reg] 
                           WHERE ([B_village] LIKE '%' + @B_village + '%') 
                              OR ([District] LIKE '%' + @District + '%')">
            <SelectParameters>
                <asp:ControlParameter Name="B_village" ControlID="TextBox1" PropertyName="Text" Type="String" />
                <asp:ControlParameter Name="District" ControlID="TextBox1" PropertyName="Text" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </div>

</asp:Content>
