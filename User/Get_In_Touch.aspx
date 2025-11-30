<%@ Page Title="Get In Touch" Language="C#" MasterPageFile="~/User/Bachatgat.master" AutoEventWireup="true" CodeFile="Get_In_Touch.aspx.cs" Inherits="User_Get_In_Touch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <style>
        /* FORM CONTAINER */
        .contact-container {
            width: 70%;
            max-width: 700px;
            margin: 60px auto;
            background: rgba(255, 255, 255, 0.95);
            padding: 40px 30px;
            border-radius: 25px;
            box-shadow: 0 15px 35px rgba(0,0,0,0.3);
            position: relative;
            overflow: hidden;
            animation: fadeInUp 1.2s ease forwards;
        }

        /* DECORATIVE ANIMATED CIRCLES */
        .contact-container::before, .contact-container::after {
            content: '';
            position: absolute;
            border-radius: 50%;
            z-index: 0;
            opacity: 0.3;
            animation: floatCircles 10s linear infinite alternate;
        }

        .contact-container::before {
            width: 250px;
            height: 250px;
            background: #ff7e5f; /* Orange */
            top: -80px;
            right: -80px;
        }

        .contact-container::after {
            width: 150px;
            height: 150px;
            background: #0072ff; /* Blue */
            bottom: -50px;
            left: -50px;
        }

        @keyframes floatCircles {
            0% { transform: translateY(0px) rotate(0deg);}
            50% { transform: translateY(-20px) rotate(180deg);}
            100% { transform: translateY(0px) rotate(360deg);}
        }

        /* FORM TITLE */
        .contact-container h2 {
            text-align: center;
            color: #ff5722; /* Orange */
            margin-bottom: 30px;
            font-size: 32px;
            position: relative;
            z-index: 1;
            animation: fadeInUp 1s ease forwards;
        }

        /* FORM GROUPS */
        .form-group {
            margin-bottom: 20px;
            position: relative;
            z-index: 1;
            animation: fadeInUp 1s ease forwards;
        }

        .form-group label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
            color: #0072ff; /* Blue */
        }

        .form-control {
            width: 100%;
            padding: 12px 15px;
            border-radius: 12px;
            border: 2px solid #ccc;
            font-size: 14px;
            transition: all 0.3s;
            background: #fff;
            box-shadow: 0 5px 10px rgba(0,0,0,0.1);
        }

        .form-control:focus {
            border-color: #ff7e5f;
            outline: none;
            box-shadow: 0 0 12px rgba(255,126,95,0.5);
        }

        /* SUBMIT BUTTON */
        .btn-submit {
            background: linear-gradient(135deg, #ff7e5f, #0072ff);
            color: white;
            padding: 14px 25px;
            border: none;
            border-radius: 12px;
            cursor: pointer;
            font-size: 16px;
            font-weight: bold;
            transition: all 0.3s;
            width: 100%;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            position: relative;
            z-index: 1;
            animation: fadeInUp 1.2s ease forwards;
        }

        .btn-submit:hover {
            transform: translateY(-3px) scale(1.05);
            box-shadow: 0 10px 25px rgba(0,0,0,0.3);
        }

        /* MESSAGES */
        .success-message {
            color: #28a745;
            font-weight: bold;
            text-align: center;
            margin-top: 15px;
            position: relative;
            z-index: 1;
        }

        .error-message {
            color: #dc3545;
            font-weight: bold;
            text-align: center;
            margin-top: 15px;
            position: relative;
            z-index: 1;
        }

        .validator {
            color: #ff4c4c;
            font-size: 13px;
            display: block;
            margin-top: 3px;
            position: relative;
            z-index: 1;
        }

        /* ANIMATIONS */
        @keyframes fadeInUp {
            0% {opacity: 0; transform: translateY(20px);}
            100% {opacity: 1; transform: translateY(0);}
        }

        /* RESPONSIVE */
        @media(max-width: 768px) {
            .contact-container {
                width: 90%;
                padding: 30px 20px;
            }
        }
    </style>

    <div class="contact-container">
        <h2>Get In Touch</h2>

        <div class="form-group">
            <label for="txtName">Name</label>
            <asp:TextBox ID="txtName" runat="server" CssClass="form-control" placeholder="Enter your full name"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName"
                ErrorMessage="Name is required" CssClass="validator" Display="Dynamic" />
        </div>

        <div class="form-group">
            <label for="txtEmail">Email</label>
            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" placeholder="Enter your email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail"
                ErrorMessage="Email is required" CssClass="validator" Display="Dynamic" />
            <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail"
                ValidationExpression="^[\w\.-]+@[\w\.-]+\.\w{2,4}$"
                ErrorMessage="Invalid email format" CssClass="validator" Display="Dynamic" />
        </div>

        <div class="form-group">
            <label for="txtMob">Mobile No.</label>
            <asp:TextBox ID="txtMob" runat="server" CssClass="form-control" TextMode="Number" placeholder="Enter your mobile number"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvMob" runat="server" ControlToValidate="txtMob"
                ErrorMessage="Mobile number is required" CssClass="validator" Display="Dynamic" />
            <asp:RegularExpressionValidator ID="revMob" runat="server" ControlToValidate="txtMob"
                ValidationExpression="^[6-9]\d{9}$"
                ErrorMessage="Enter a valid 10-digit Indian mobile number" CssClass="validator" Display="Dynamic" />
        </div>

        <div class="form-group">
            <label for="txtSubject">Subject</label>
            <asp:TextBox ID="txtSubject" runat="server" CssClass="form-control" placeholder="Enter subject"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ControlToValidate="txtSubject"
                ErrorMessage="Subject is required" CssClass="validator" Display="Dynamic" />
        </div>

        <div class="form-group">
            <label for="txtMessage">Message</label>
            <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" placeholder="Write your message"></asp:TextBox>
            <asp:RequiredFieldValidator ID="rfvMessage" runat="server" ControlToValidate="txtMessage"
                ErrorMessage="Message cannot be empty" CssClass="validator" Display="Dynamic" />
        </div>

        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn-submit" OnClick="btnSubmit_Click" />
        <br />

        <asp:Label ID="lblMessage" runat="server"></asp:Label>
    </div>

</asp:Content>
