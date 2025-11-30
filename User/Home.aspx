<%@ Page Title="Bachatgat Home" Language="C#" MasterPageFile="~/User/Bachatgat.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="User_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana;
            margin: 0;
            background: #f5f7fa;
        }

        .hero-section {
            height: 100vh;
            background: url("../Images/HomePage.png") no-repeat center center/cover;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            color: white;
            position: relative;
        }

        .overlay {
            position: absolute;
            top: 0; left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
        }

        .hero-content {
            position: relative;
            z-index: 2;
            max-width: 900px;
            animation: fadeIn 1.5s ease-out;
        }

        .hero-content h1 {
            font-size: 50px;
            margin-bottom: 20px;
            text-shadow: 2px 2px 10px rgba(0,0,0,0.7);
        }

        .hero-content p {
            font-size: 20px;
            margin-bottom: 40px;
            text-shadow: 1px 1px 8px rgba(0,0,0,0.7);
        }

        @keyframes fadeIn {
            from {opacity:0; transform: translateY(-20px);}
            to {opacity:1; transform: translateY(0);}
        }

        /* BUTTON GRID CONTAINER WITH BACKGROUND */
        .btn-grid-container {
            background: rgba(224,224,224,0.9) url('https://images.unsplash.com/photo-1612831455546-5bfa96c3de13?auto=format&fit=crop&w=1350&q=80') no-repeat center center/cover;
            padding: 40px 20px;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            margin-top: 30px;
        }

        .btn-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 15px;
            justify-items: center;
        }

        .btn-home {
            padding: 15px 25px;
            border-radius: 10px;
            border: none;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            color: white;
            transition: 0.3s;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        .btn-customer {
            background: linear-gradient(135deg, #ff7e5f, #feb47b);
        }
        .btn-customer:hover {
            background: linear-gradient(135deg, #feb47b, #ff7e5f);
            transform: translateY(-3px);
        }

        .btn-user {
            background: linear-gradient(135deg, #6a11cb, #2575fc);
        }
        .btn-user:hover {
            background: linear-gradient(135deg, #2575fc, #6a11cb);
            transform: translateY(-3px);
        }

        .btn-bachatgat {
            background: linear-gradient(135deg, #43cea2, #185a9d);
        }
        .btn-bachatgat:hover {
            background: linear-gradient(135deg, #185a9d, #43cea2);
            transform: translateY(-3px);
        }

        .btn-member {
            background: linear-gradient(135deg, #ff512f, #dd2476);
        }
        .btn-member:hover {
            background: linear-gradient(135deg, #dd2476, #ff512f);
            transform: translateY(-3px);
        }

        /* FEATURES SECTION */
        .features {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            padding: 50px 20px;
            background: #fff;
        }

        .feature-card {
            background: #f5f7fa;
            border-radius: 20px;
            padding: 30px;
            margin: 20px;
            width: 250px;
            text-align: center;
            box-shadow: 0 10px 20px rgba(0,0,0,0.1);
            transition: 0.3s;
        }

        .feature-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.2);
        }

        .feature-card img {
            width: 100px;
            margin-bottom: 20px;
        }

        .feature-card h3 {
            margin-bottom: 10px;
            color: #003366;
        }

        .feature-card p {
            color: #555;
        }

        @media(max-width: 768px) {
            .features {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>

    <!-- HERO SECTION -->
    <div class="hero-section">
        <div class="overlay"></div>
        <div class="hero-content">
            <h1>Welcome to Bachatgat</h1>
            <p>Save, Shop, and Grow Together with Our Community</p>

            <!-- BUTTON GRID WITH BACKGROUND -->
            <div class="btn-grid-container">
                <div class="btn-grid">
                    <!-- Customer -->
                    <asp:Button ID="btnCustomerSignUp" runat="server" CssClass="btn-home btn-customer" Text="Customer Sign Up" PostBackUrl="~/User/Customer_Reg.aspx" />
                    <asp:Button ID="btnCustomerLogin" runat="server" CssClass="btn-home btn-customer" Text="Customer Login" PostBackUrl="~/User/User_login.aspx" />

                    <!-- Bachatgat -->
                    <asp:Button ID="btnBachatgatSignUp" runat="server" CssClass="btn-home btn-bachatgat" Text="Bachatgat Sign Up" PostBackUrl="~/User/Bachatgat_Register.aspx" />
                    <asp:Button ID="btnBachatgatLogin" runat="server" CssClass="btn-home btn-bachatgat" Text="Bachatgat Login" PostBackUrl="~/User/Bachatgat login.aspx" />

                    <!-- Bachatgat Member -->
                    <asp:Button ID="btnMemberSignUp" runat="server" CssClass="btn-home btn-member" Text="Bachatgat Member Sign Up" PostBackUrl="~/User/MemberRegister.aspx"/>
                    <asp:Button ID="btnMemberLogin" runat="server" CssClass="btn-home btn-member" Text="Bachatgat Member Login" PostBackUrl="~/User/Memberlogin.aspx" />
                </div>
            </div>
        </div>
    </div>

    <!-- FEATURES SECTION -->
    <div class="features">
        <div class="feature-card">
            <img src="../Images/money.png" alt="Save Money"/>
            <h3>Save Money</h3>
            <p>Manage your savings efficiently with our Bachatgat system.</p>
        </div>
        <div class="feature-card">
            <img src="../Images/ShopCart.png" alt="Shop"/>
            <h3>Shop Smart</h3>
            <p>Purchase essential products at best prices within the community.</p>
        </div>
        <div class="feature-card">
            <img src="../Images/Community.png" alt="Community"/>
            <h3>Community</h3>
            <p>Connect with members and grow together as a trusted network.</p>
        </div>
        <div class="feature-card">
            <img src="../Images/Security.png" alt="Secure"/>
            <h3>Secure</h3>
            <p>Safe and secure platform for your transactions and data.</p>
        </div>
    </div>
</asp:Content>
