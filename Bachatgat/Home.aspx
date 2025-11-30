<%@ Page Title="Home" Language="C#" MasterPageFile="~/Bachatgat/BachatGat.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Bachatgat_Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
        }

        /* HERO SECTION */
        .hero-section {
            background: linear-gradient(90deg, #ff6b6b, #ffb347);
            color: white;
            text-align: center;
            padding: 80px 20px;
            border-radius: 0 0 40px 40px;
            box-shadow: 0 4px 20px rgba(0,0,0,0.1);
        }

        .hero-section h1 {
            font-size: 48px;
            font-weight: 700;
            margin-bottom: 15px;
            letter-spacing: 1px;
        }

        .hero-section p {
            font-size: 18px;
            margin-bottom: 30px;
        }

        .hero-section a {
            background-color: white;
            color: #ff6b6b;
            font-weight: 600;
            padding: 12px 30px;
            border-radius: 25px;
            text-decoration: none;
            transition: all 0.3s ease;
        }

        .hero-section a:hover {
            background-color: #fff5f5;
            transform: scale(1.05);
        }

        /* CATEGORY SECTION */
        .categories {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 25px;
            padding: 60px 80px;
        }

        .category-card {
            background-color: #fff;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.08);
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            text-align: center;
        }

        .category-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.15);
        }

        .category-card img {
            width: 100%;
            height: 180px;
            object-fit: cover;
        }

        .category-card h3 {
            font-size: 20px;
            font-weight: 600;
            color: #333;
            margin: 15px 0 10px;
        }

        .category-card p {
            font-size: 14px;
            color: #777;
            padding: 0 15px 20px;
        }

        /* FEATURE SECTION */
        .features {
            background-color: #fff5f5;
            padding: 60px 40px;
            text-align: center;
            border-radius: 30px;
            margin: 50px auto;
            width: 90%;
        }

        .features h2 {
            font-size: 28px;
            margin-bottom: 20px;
            color: #ff6b6b;
        }

        .features p {
            font-size: 16px;
            color: #555;
            width: 70%;
            margin: auto;
        }

        /* PROFILE AVATAR */
        .profile-avatar {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            border: 3px solid #ff6b6b;
            object-fit: cover;
            margin: 20px auto;
            display: block;
        }

        /* RESPONSIVE */
        @media (max-width: 768px) {
            .hero-section h1 { font-size: 32px; }
            .hero-section p { font-size: 16px; }
            .categories { padding: 40px 20px; }
            .features p { width: 90%; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- HERO SECTION -->
    <div class="hero-section">
        <h1>Welcome, <asp:Label ID="lblBachatGatName" runat="server" Text="BachatGat"></asp:Label></h1>
        <p>Empowering communities with savings, trust, and growth.</p>
      </div>

    <!-- CATEGORY SECTION -->
    <div class="categories">
        <div class="category-card">
            <img src="../Images/women-fashion.jpg" alt="Women Fashion" />
            <h3>Women’s Fashion</h3>
            <p>Elegant sarees, suits, and traditional wear from trusted Bachatgats.</p>
        </div>

        <div class="category-card">
            <img src="../Images/handicrafts.jpg" alt="Handicrafts" />
            <h3>Handicrafts</h3>
            <p>Authentic handmade crafts that showcase rural creativity.</p>
        </div>

        <div class="category-card">
            <img src="../Images/food-products.jpg" alt="Food Products" />
            <h3>Food Products</h3>
            <p>Homemade pickles, papads, and snacks prepared with care.</p>
        </div>

        <div class="category-card">
            <img src="../Images/home-essentials.jpg" alt="Home Essentials" />
            <h3>Home Essentials</h3>
            <p>Daily-use products crafted by local Bachatgat women entrepreneurs.</p>
        </div>
    </div>

    <!-- FEATURE SECTION -->
    <div class="features">
        <h2>Why Choose Bachatgat?</h2>
        <p>
            Discover quality products made by self-help groups and women entrepreneurs. 
            Support local communities and empower change while shopping smartly and sustainably.
        </p>
    </div>

</asp:Content>
