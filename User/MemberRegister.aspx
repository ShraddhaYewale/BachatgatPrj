<%@ Page Title="" Language="C#" MasterPageFile="~/User/Bachatgat.master"
    AutoEventWireup="true" CodeFile="MemberRegister.aspx.cs" Inherits="User_MemberRegister" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #003366, #005f99);
            margin: 0;
            padding: 0;
        }

        .register-container {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 50px 0;
        }

        .register-card {
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.2);
            padding: 40px 50px;
            width: 95%;
            max-width: 1100px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .register-card:hover {
            transform: translateY(-3px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.25);
        }

        .register-title {
            background-color: #003366;
            color: white;
            text-align: center;
            font-size: 1.8em;
            font-weight: bold;
            border-radius: 8px;
            padding: 15px 0;
            margin-bottom: 30px;
        }

        .form-grid {
            width: 100%;
            border-collapse: separate;
            border-spacing: 20px 15px;
        }

        .form-grid td {
            vertical-align: top;
            font-weight: 600;
            color: #003366;
            font-size: 15px;
            padding: 5px 10px;
            width: 25%;
        }

        .form-grid input[type="text"],
        .form-grid input[type="password"],
        .form-grid input[type="number"],
        .form-grid textarea,
        .form-grid select {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 15px;
            transition: border-color 0.3s ease;
        }

        .form-grid input:focus,
        .form-grid select:focus,
        .form-grid textarea:focus {
            border-color: #005f99;
            outline: none;
        }

        .form-grid textarea {
            resize: none;
        }

        .btn {
            background-color: #003366;
            color: #fff;
            border: none;
            border-radius: 6px;
            padding: 10px 25px;
            font-weight: bold;
            font-size: 15px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .btn:hover {
            background-color: #005f99;
            transform: translateY(-2px);
        }

        .btn-container {
            text-align: center;
            margin-top: 30px;
        }

        .validation-error {
            color: red;
            font-size: 13px;
        }

        .photo-section {
            text-align: center;
            margin-top: 20px;
        }

        .photo-section img {
            border-radius: 8px;
            border: 1px solid #ccc;
            margin-bottom: 10px;
        }
    </style>

    <div class="register-container">
        <div class="register-card">
            <div class="register-title">Member Registration</div>

            <table class="form-grid">
                <tr>
                    <td>Member ID</td>
                    <td>
                        <asp:TextBox ID="txtMid" runat="server" Enabled="False" TextMode="Number"></asp:TextBox>
                    </td>
                    <td>Nominee Name</td>
                    <td>
                        <asp:TextBox ID="txtnomineename" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                            ControlToValidate="txtnomineename" ErrorMessage="Name is required"
                            CssClass="validation-error" />
                    </td>
                </tr>

                <tr>
                    <td>Member Name</td>
                    <td>
                        <asp:TextBox ID="txtMname" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ControlToValidate="txtMname" ErrorMessage="Must be filled"
                            CssClass="validation-error" />
                    </td>
                    <td>Nominee Contact No.</td>
                    <td>
                        <asp:TextBox ID="txtcontactno" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                            ControlToValidate="txtcontactno" ErrorMessage="Enter valid 10-digit number"
                            ValidationExpression="[0-9]{10}" CssClass="validation-error" />
                    </td>
                </tr>

                <tr>
                    <td>Address</td>
                    <td>
                        <asp:TextBox ID="txtaddress" runat="server" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ControlToValidate="txtaddress" ErrorMessage="Address required"
                            CssClass="validation-error" />
                    </td>
                    <td>Bachatgat Name</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server"
                            DataSourceID="SqlDataSource1" DataTextField="B_Name"
                            DataValueField="B_Name">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            SelectCommand="SELECT [B_Name] FROM [Bachatgat_Reg]"></asp:SqlDataSource>
                    </td>
                </tr>

                <tr>
                    <td>City</td>
                    <td>
                        <asp:TextBox ID="txtcity" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                            ControlToValidate="txtcity" ErrorMessage="City required"
                            CssClass="validation-error" />
                    </td>
                    <td>Aadhar No.</td>
                    <td>
                        <asp:TextBox ID="txtaadharno" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                            ControlToValidate="txtaadharno" ErrorMessage="Required"
                            CssClass="validation-error" />
                    </td>
                </tr>

                <tr>
                    <td>Bachatgat Join Date</td>
                    <td>
                        <asp:TextBox ID="txtjoindate" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server"
                            ControlToValidate="txtjoindate" ErrorMessage="Required"
                            CssClass="validation-error" />
                    </td>
                    <td>Income</td>
                    <td>
                        <asp:TextBox ID="txtincome" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server"
                            ControlToValidate="txtincome" ErrorMessage="Required"
                            CssClass="validation-error" />
                    </td>
                </tr>

                <!-- ✅ REPLACED DROPDOWN WITH TEXTBOX HERE -->
                <tr>
                    <td>Bank Name</td>
                    <td>
                        <asp:TextBox ID="txtbankname" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server"
                            ControlToValidate="txtbankname" ErrorMessage="Bank name required"
                            CssClass="validation-error" />
                    </td>
                    <td>Branch Name</td>
                    <td>
                        <asp:TextBox ID="txtbranch" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server"
                            ControlToValidate="txtbranch" ErrorMessage="Required"
                            CssClass="validation-error" />
                    </td>
                </tr>

                <tr>
                    <td>IFSC Code</td>
                    <td>
                        <asp:TextBox ID="txtifsc" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server"
                            ControlToValidate="txtifsc" ErrorMessage="Required"
                            CssClass="validation-error" />
                    </td>
                    <td>Account No.</td>
                    <td>
                        <asp:TextBox ID="txtaccno" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server"
                            ControlToValidate="txtaccno" ErrorMessage="Required"
                            CssClass="validation-error" />
                    </td>
                </tr>

                <tr>
                    <td>Designation</td>
                    <td>
                        <asp:TextBox ID="txtDesignation" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                            ControlToValidate="txtDesignation" ErrorMessage="Required"
                            CssClass="validation-error" />
                    </td>
                    <td>Email</td>
                    <td>
                        <asp:TextBox ID="txtemail" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                            ControlToValidate="txtemail"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ErrorMessage="Invalid Email" CssClass="validation-error" />
                    </td>
                </tr>

                <tr>
                    <td>Occupation</td>
                    <td>
                        <asp:TextBox ID="txtoccupation" runat="server"></asp:TextBox>
                    </td>
                    <td>Username</td>
                    <td>
                        <asp:TextBox ID="txtusername" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>Status</td>
                    <td>
                        <asp:TextBox ID="txtstatus" runat="server" Enabled="False" Text="Active"></asp:TextBox>
                    </td>
                    <td>Password</td>
                    <td>
                        <asp:TextBox ID="txtpassword" runat="server"></asp:TextBox>
                    </td>
                </tr>

                <tr>
                    <td>Contact No.</td>
                    <td>
                        <asp:TextBox ID="txtconct" runat="server"></asp:TextBox>
                    </td>
                    <td>Confirm Password</td>
                    <td>
                        <asp:TextBox ID="txtcpass" runat="server"></asp:TextBox>
                    </td>
                </tr>
            </table>

            <div class="photo-section">
                <asp:Image ID="Image1" runat="server" Height="200px" Width="200px" />
                <br />
                <asp:FileUpload ID="FileUpload2" runat="server" />
                <asp:Button ID="ScnUpload" runat="server" CssClass="btn" Text="Upload" OnClick="Button1_Click" />
            </div>

            <div class="btn-container">
                <asp:Button ID="btnsignup" runat="server" CssClass="btn" Text="Sign Up" OnClick="btnsignup_Click" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="btncancle" runat="server" CssClass="btn" Text="Cancel" OnClick="btncancle_Click" />
            </div>
        </div>
    </div>
</asp:Content>
