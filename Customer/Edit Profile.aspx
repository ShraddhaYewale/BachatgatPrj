<%@ Page Title="" Language="C#" MasterPageFile="~/Customer/Customer.master" AutoEventWireup="true" CodeFile="Edit Profile.aspx.cs" Inherits="Customer_Edit_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        /* Container */
        #DetailsView1 {
            width: 95%;
            max-width: 800px;
            margin: 40px auto;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* Card style for each field */
        .dvCard {
            display: flex;
            align-items: center;
            background: #ffffff;
            border-radius: 12px;
            padding: 15px 20px;
            margin-bottom: 15px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.08);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .dvCard:hover {
            transform: translateY(-3px);
            box-shadow: 0 12px 25px rgba(0,0,0,0.15);
        }

        /* Icon next to field */
        .dvIcon {
            font-size: 24px;
            width: 40px;
            color: #0055aa;
            margin-right: 15px;
        }

        /* Field label */
        .dvLabel {
            font-weight: bold;
            font-size: 16px;
            color: #003366;
            min-width: 130px;
        }

        /* Field value */
        .dvValue {
            font-size: 16px;
            color: #333333;
        }

        /* Edit row input fields */
        .dvEditInput {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 2px solid #cce0ff;
            transition: all 0.3s ease;
        }

        .dvEditInput:focus {
            border-color: #0055aa;
            box-shadow: 0 0 10px rgba(0,85,170,0.2);
            outline: none;
        }

        /* Edit button styling */
        .dvEditButton {
            background: linear-gradient(135deg, #0055aa, #003366);
            color: white;
            font-weight: bold;
            padding: 10px 25px;
            border-radius: 8px;
            border: 2px solid #003366;
            cursor: pointer;
            transition: all 0.3s ease, transform 0.3s ease;
            margin-top: 10px;
        }

        .dvEditButton:hover {
            background: linear-gradient(135deg, #ff6600, #ff9933);
            border-color: #ff6600;
            transform: scale(1.05);
            box-shadow: 0 6px 15px rgba(255,102,0,0.3);
        }

        /* Responsive */
        @media(max-width:768px){
            .dvCard {
                flex-direction: column;
                align-items: flex-start;
            }
            .dvIcon {
                margin-bottom: 5px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
        DataSourceID="SqlDataSource1" DataKeyNames="Username" CellPadding="6" 
        GridLines="None" Width="100%">
        <Fields>
            <asp:TemplateField HeaderText="Customer Name">
                <ItemTemplate>
                    <div class="dvCard">
                        <div class="dvIcon">&#128100;</div>
                        <div class="dvLabel">Name:</div>
                        <div class="dvValue"><%# Eval("cm_name") %></div>
                    </div>
                </ItemTemplate>
                <EditItemTemplate>
                    <div class="dvCard">
                        <div class="dvIcon">&#128100;</div>
                        <div class="dvLabel">Name:</div>
                        <asp:TextBox ID="txtName" runat="server" Text='<%# Bind("cm_name") %>' CssClass="dvEditInput" />
                    </div>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Address">
                <ItemTemplate>
                    <div class="dvCard">
                        <div class="dvIcon">&#127968;</div>
                        <div class="dvLabel">Address:</div>
                        <div class="dvValue"><%# Eval("cm_addr") %></div>
                    </div>
                </ItemTemplate>
                <EditItemTemplate>
                    <div class="dvCard">
                        <div class="dvIcon">&#127968;</div>
                        <div class="dvLabel">Address:</div>
                        <asp:TextBox ID="txtAddr" runat="server" Text='<%# Bind("cm_addr") %>' CssClass="dvEditInput" />
                    </div>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Contact">
                <ItemTemplate>
                    <div class="dvCard">
                        <div class="dvIcon">&#128222;</div>
                        <div class="dvLabel">Contact:</div>
                        <div class="dvValue"><%# Eval("contact") %></div>
                    </div>
                </ItemTemplate>
                <EditItemTemplate>
                    <div class="dvCard">
                        <div class="dvIcon">&#128222;</div>
                        <div class="dvLabel">Contact:</div>
                        <asp:TextBox ID="txtContact" runat="server" Text='<%# Bind("contact") %>' CssClass="dvEditInput" />
                    </div>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Email">
                <ItemTemplate>
                    <div class="dvCard">
                        <div class="dvIcon">&#9993;</div>
                        <div class="dvLabel">Email:</div>
                        <div class="dvValue"><%# Eval("email") %></div>
                    </div>
                </ItemTemplate>
                <EditItemTemplate>
                    <div class="dvCard">
                        <div class="dvIcon">&#9993;</div>
                        <div class="dvLabel">Email:</div>
                        <asp:TextBox ID="txtEmail" runat="server" Text='<%# Bind("email") %>' CssClass="dvEditInput" />
                    </div>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Username">
                <ItemTemplate>
                    <div class="dvCard">
                        <div class="dvIcon">&#128273;</div>
                        <div class="dvLabel">Username:</div>
                        <div class="dvValue"><%# Eval("Username") %></div>
                    </div>
                </ItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Password">
                <ItemTemplate>
                    <div class="dvCard">
                        <div class="dvIcon">&#128274;</div>
                        <div class="dvLabel">Password:</div>
                        <div class="dvValue">******</div>
                    </div>
                </ItemTemplate>
                <EditItemTemplate>
                    <div class="dvCard">
                        <div class="dvIcon">&#128274;</div>
                        <div class="dvLabel">Password:</div>
                        <asp:TextBox ID="txtPassword" runat="server" Text='<%# Bind("Password") %>' CssClass="dvEditInput" TextMode="Password" />
                    </div>
                </EditItemTemplate>
            </asp:TemplateField>

            <asp:CommandField ShowEditButton="True" ButtonType="Button" EditText="Edit" UpdateText="Save" CancelText="Cancel" />
        </Fields>
    </asp:DetailsView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [cm_name], [cm_addr], [contact], [email], [Username], [Password] FROM [Customer_Reg] WHERE ([Username] = @Username)" 
        UpdateCommand="UPDATE Customer_Reg SET [cm_name]=@cm_name, [cm_addr]=@cm_addr, [contact]=@contact, [email]=@email, [Password]=@Password WHERE ([Username] = @Username)">
        <SelectParameters>
            <asp:SessionParameter Name="Username" SessionField="Customer" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
