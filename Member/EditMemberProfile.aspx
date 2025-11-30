<%@ Page Title="Edit Member Profile" Language="C#" MasterPageFile="~/Member/Member.master" AutoEventWireup="true" CodeFile="EditMemberProfile.aspx.cs" Inherits="Member_EditMemberProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="server">
    <style>
        body {
            background-color: #f8f9fc;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        .profile-container {
            width: 95%;
            max-width: 1000px;
            background: #fff;
            margin: 40px auto;
            padding: 30px 40px;
            border-radius: 15px;
            box-shadow: 0 6px 25px rgba(0,0,0,0.1);
        }

        .profile-container h2 {
            text-align: center;
            color: #4b0082;
            margin-bottom: 25px;
            font-weight: 700;
        }

        .form-group {
            display: flex;
            flex-wrap: wrap;
            margin-bottom: 20px;
            align-items: center;
        }

        .form-group label {
            flex: 1 0 220px;
            color: #333;
            font-weight: 600;
            font-size: 15px;
        }

        .form-group input[type="text"],
        .form-group input[type="email"],
        .form-group input[type="date"],
        .form-group input[type="number"],
        .form-group input[type="password"],
        .form-group textarea {
            flex: 1 0 60%;
            padding: 10px 15px;
            border-radius: 8px;
            border: 1px solid #ccc;
            font-size: 15px;
            outline: none;
            transition: border 0.3s ease, box-shadow 0.3s ease;
        }

        .form-group input:focus, 
        .form-group textarea:focus,
        .form-group input[type="password"]:focus {
            border-color: #9933ff;
            box-shadow: 0 0 6px rgba(153, 51, 255, 0.4);
        }

        .profile-photo {
            text-align: center;
            margin-bottom: 25px;
        }

        .profile-photo img {
            width: 130px;
            height: 130px;
            border-radius: 50%;
            object-fit: cover;
            border: 3px solid #9933ff;
            margin-bottom: 10px;
        }

        .profile-photo input[type="file"] {
            margin-top: 5px;
        }

        /* Buttons Styling */
        .profile-container .btn-container input[type="submit"],
        .profile-container .btn-container input[type="button"],
        .profile-photo #btnUpload {
            background: linear-gradient(135deg, #4b0082, #9933ff);
            color: #fff;
            border: none;
            border-radius: 25px;
            padding: 12px 35px;
            font-size: 16px;
            font-weight: 600;
            margin: 10px 5px 0 5px;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }

        .profile-container .btn-container input[type="submit"]:hover,
        .profile-container .btn-container input[type="button"]:hover,
        .profile-photo #btnUpload:hover {
            background: linear-gradient(135deg, #9933ff, #4b0082);
            transform: scale(1.05);
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.25);
        }

        .profile-container .btn-container input:focus,
        .profile-photo #btnUpload:focus {
            outline: none;
            box-shadow: 0 0 8px rgba(153, 51, 255, 0.6);
        }

        .profile-photo #btnUpload {
            margin-top: 10px;
            padding: 10px 25px;
            font-size: 14px;
        }

        @media (max-width: 768px) {
            .form-group {
                flex-direction: column;
                align-items: flex-start;
            }

            .form-group label {
                margin-bottom: 5px;
            }

            .form-group input,
            .form-group textarea {
                width: 100%;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="profile-container">
        <h2>Edit Member Profile</h2>

        <div class="profile-photo">
            <asp:Image ID="imgMember" runat="server" ImageUrl="~/Images/default-user.png" AlternateText="Member Photo" />
            <br />
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Button ID="btnUpload" runat="server" Text="Upload" CssClass="upload-btn" OnClick="btnUpload_Click" />
        </div>

        <div class="form-group">
            <label>Member ID:</label>
            <asp:TextBox ID="txtMid" runat="server" ReadOnly="True"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Member Name:</label>
            <asp:TextBox ID="txtMname" runat="server"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Bachatgat Name:</label>
            <asp:TextBox ID="txtBachatgatName" runat="server"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Contact Number:</label>
            <asp:TextBox ID="txtContact" runat="server" TextMode="Number"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>City:</label>
            <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Address:</label>
            <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="2"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Occupation:</label>
            <asp:TextBox ID="txtOccupation" runat="server"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Email:</label>
            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email"></asp:TextBox>
        </div>

        <div class="form-group">
            <label>Password:</label>
            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
        </div>

        <div class="btn-container">
            <asp:Button ID="btnUpdate" runat="server" Text="Update Profile" OnClick="btnUpdate_Click" />
            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
        </div>

    </div>

</asp:Content>
