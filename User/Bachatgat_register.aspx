<%@ Page Title="Bachatgat Register" Language="C#" MasterPageFile="~/User/Bachatgat.master" AutoEventWireup="true" CodeFile="Bachatgat_register.aspx.cs" Inherits="User_Customer_register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <style>
        body {
            background: linear-gradient(135deg, #f0f4f7, #d9e2ec);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .register-container {
            max-width: 900px;
            margin: 40px auto;
            background: white;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            transition: all 0.3s;
        }

        .register-container:hover {
            box-shadow: 0 15px 35px rgba(0,0,0,0.2);
        }

        .register-header {
            text-align: center;
            color: #003366;
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 25px;
            letter-spacing: 1px;
        }

        .form-row {
            display: flex;
            flex-wrap: wrap;
            margin-bottom: 20px;
        }

        .form-group {
            flex: 1 1 45%;
            display: flex;
            flex-direction: column;
            margin: 0 10px 20px 0;
        }

        .form-group.full-width {
            flex: 1 1 100%;
        }

        .form-group label {
            font-weight: bold;
            margin-bottom: 6px;
            color: #333;
        }

        .form-group input[type="text"],
        .form-group input[type="number"],
        .form-group input[type="password"],
        .form-group input[type="email"],
        .form-group textarea {
            padding: 10px 12px;
            border-radius: 8px;
            border: 1.8px solid #ccc;
            font-size: 14px;
            transition: all 0.3s;
        }

        .form-group input:focus,
        .form-group textarea:focus {
            border-color: #0072ff;
            box-shadow: 0 0 8px rgba(0,114,255,0.4);
            outline: none;
        }

        .validator {
            color: red;
            font-size: 12px;
            margin-top: 3px;
        }

        .image-group {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            margin-bottom: 25px;
        }

        .image-box {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin: 10px;
        }

        .image-box img {
            border-radius: 12px;
            width: 280px;
            height: 280px;
            object-fit: cover;
            border: 2px solid #003366;
            margin-bottom: 10px;
        }

        .btn-custom {
            background: linear-gradient(135deg, #ff7e5f, #0072ff);
            color: white !important;
            padding: 12px 25px;
            border: none;
            border-radius: 12px;
            font-weight: bold;
            cursor: pointer;
            font-size: 15px;
            margin-right: 15px;
            transition: all 0.3s;
        }

        .btn-custom:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 15px rgba(0,0,0,0.25);
        }

        @media(max-width: 768px) {
            .form-group {
                flex: 1 1 100%;
            }

            .image-box img {
                width: 220px;
                height: 220px;
            }

            .btn-custom {
                width: 100%;
                margin-bottom: 10px;
            }
        }
    </style>

    <div class="register-container">
        <div class="register-header">Bachatgat Registration</div>

        <!-- Personal & Contact Info -->
        <div class="form-row">
            <div class="form-group">
                <label>Bachatgat ID</label>
                <asp:TextBox ID="txtid" runat="server" Enabled="False" TextMode="Number"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Contact Person Name</label>
                <asp:TextBox ID="txtcontactname" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                    ControlToValidate="txtcontactname" ErrorMessage="Name is required" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label>Bachatgat Name</label>
                <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                    ControlToValidate="txtname" ErrorMessage="Must be filled" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label>Contact Person No.</label>
                <asp:TextBox ID="txtcontactno" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server"
                    ControlToValidate="txtcontactno" ErrorMessage="Enter valid 10-digit mobile" 
                    ValidationExpression="[6-9][0-9]{9}" CssClass="validator"></asp:RegularExpressionValidator>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group full-width">
                <label>Address</label>
                <asp:TextBox ID="txtaddress" runat="server" TextMode="MultiLine" Rows="3"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                    ControlToValidate="txtaddress" ErrorMessage="Address must be filled" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label>Village</label>
                <asp:TextBox ID="txtvillage" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server"
                    ControlToValidate="txtvillage" ErrorMessage="Village must be filled" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label>District</label>
                <asp:TextBox ID="txtDist" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                    ControlToValidate="txtDist" ErrorMessage="District must be filled" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label>State</label>
                <asp:TextBox ID="txtstate" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                    ControlToValidate="txtstate" ErrorMessage="State is required" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label>Pincode</label>
                <asp:TextBox ID="txtpincode" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server"
                    ControlToValidate="txtpincode" ErrorMessage="Pincode is required" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label>No. of Members</label>
                <asp:TextBox ID="txtnoofmembers" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                    ControlToValidate="txtnoofmembers" ErrorMessage="It is required" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label>Products Name</label>
                <asp:TextBox ID="txtproducts" runat="server" TextMode="MultiLine" Rows="2"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                    ControlToValidate="txtproducts" ErrorMessage="Must be filled" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label>Email</label>
                <asp:TextBox ID="txtemail" runat="server" TextMode="Email"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server"
                    ControlToValidate="txtemail" ErrorMessage="Enter valid email"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="validator"></asp:RegularExpressionValidator>
            </div>
            <div class="form-group">
                <label>Username</label>
                <asp:TextBox ID="txtusername" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                    ControlToValidate="txtusername" ErrorMessage="Username is required" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-row">
            <div class="form-group">
                <label>Password</label>
                <asp:TextBox ID="txtpassword" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"
                    ControlToValidate="txtpassword" ErrorMessage="Password is required" CssClass="validator"></asp:RequiredFieldValidator>
            </div>
            <div class="form-group">
                <label>Confirm Password</label>
                <asp:TextBox ID="txtcpass" runat="server" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server"
                    ControlToCompare="txtpassword" ControlToValidate="txtcpass"
                    ErrorMessage="Password should match" CssClass="validator"></asp:CompareValidator>
            </div>
        </div>

        <!-- Images -->
        <div class="image-group">
            <div class="image-box">
                <asp:Image ID="Image1" runat="server" />
                <asp:FileUpload ID="FileUpload2" runat="server" />
                <asp:Button ID="ScnUpload" runat="server" Text="Upload QR Code" CssClass="btn-custom" OnClick="Button1_Click" />
            </div>

            <div class="image-box">
                <asp:Image ID="Image2" runat="server" />
                <asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:Button ID="btnupload" runat="server" Text="Upload Bachatgat Image" CssClass="btn-custom" OnClick="btnupload_Click" />
            </div>
        </div>

        <!-- Submit -->
        <div style="text-align:center; margin-top:20px;">
            <asp:Button ID="btnsignup" runat="server" Text="Sign Up" CssClass="btn-custom" OnClick="btnsignup_Click" />
            <asp:Button ID="btncancle" runat="server" Text="Cancel" CssClass="btn-custom" OnClick="btncancle_Click" />
        </div>
    </div>

</asp:Content>
