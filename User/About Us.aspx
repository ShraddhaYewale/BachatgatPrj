<%@ Page Title="About Us" Language="C#" MasterPageFile="~/User/Bachatgat.master" AutoEventWireup="true" CodeFile="About Us.aspx.cs" Inherits="User_About_Us" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <style>
        /* General Page Styling */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: #f4f6f9;
            color: #333;
        }

        h1, h2, h3 {
            font-weight: bold;
        }

        p {
            line-height: 1.6;
        }

        /* Hero Section */
        .hero {
            background: linear-gradient(to right, #ff6600, #ff9900);
            color: white;
            text-align: center;
            padding: 60px 20px;
            border-radius: 12px;
            margin-bottom: 40px;
        }

        .hero h1 {
            font-size: 42px;
            margin-bottom: 15px;
        }

        .hero span {
            color: #003366;
        }

        /* Mission & Vision */
        .mission-vision {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            margin: 40px 0;
            gap: 25px;
        }

        .mission-vision div {
            flex: 1;
            min-width: 250px;
            max-width: 350px;
            background: #fff;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 6px 14px rgba(0, 0, 0, 0.1);
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .mission-vision div:hover {
            transform: translateY(-8px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
        }

        .mission-vision i {
            font-size: 40px;
            color: #ff6600;
            margin-bottom: 10px;
        }

        /* Story Section */
        .story {
            padding: 50px 25px;
            background: #ffffff;
            border-radius: 12px;
            margin: 30px auto;
            max-width: 950px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.05);
        }

        .story h2 {
            text-align: center;
            color: #003366;
            margin-bottom: 20px;
        }

        /* Team Section */
        .team {
            text-align: center;
            padding: 50px 20px;
        }

        .team h2 {
            color: #003366;
            margin-bottom: 30px;
        }

        .team-members {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 30px;
        }

        .member {
            width: 220px;
            background: #fff;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 6px 14px rgba(0, 0, 0, 0.1);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .member:hover {
            transform: translateY(-6px);
            box-shadow: 0 12px 24px rgba(0, 0, 0, 0.2);
        }

        .member img {
            width: 100%;
            border-radius: 50%;
            margin-bottom: 10px;
        }

        .member h3 {
            margin: 5px 0;
        }

        .member p {
            font-size: 14px;
            color: gray;
        }

        /* CTA Section */
        .cta {
            text-align: center;
            padding: 60px 20px;
            background: linear-gradient(to right, #003366, #006699);
            color: white;
            border-radius: 12px;
            margin: 40px 0;
        }

        .cta h2 {
            font-size: 30px;
            margin-bottom: 15px;
        }

        .cta p {
            font-size: 16px;
            margin-bottom: 25px;
        }

        .cta .btn-getintouch {
            display: inline-block;
            background: #ff6600;
            color: white;
            padding: 14px 35px;
            font-size: 18px;
            border-radius: 30px;
            text-decoration: none;
            transition: 0.3s ease-in-out;
            box-shadow: 0 6px 15px rgba(255, 102, 0, 0.4);
        }

        .cta .btn-getintouch:hover {
            background: #ff8533;
            box-shadow: 0 8px 20px rgba(255, 102, 0, 0.6);
        }

        .cta i {
            margin-right: 8px;
        }
    </style>

    <!-- Hero Section -->
    <div class="hero">
        <h1>About <span>Sahayog Bachatgat</span></h1>
        <p>Empowering women through financial independence, savings, and community support.</p>
    </div>

    <!-- Mission & Vision -->
    <div class="mission-vision">
        <div>
            <i class="fa-solid fa-bullseye"></i>
            <h2>Our Mission</h2>
            <p>To encourage savings and provide a platform for women to grow financially and socially through collective efforts.</p>
        </div>
        <div>
            <i class="fa-solid fa-lightbulb"></i>
            <h2>Our Vision</h2>
            <p>To create a self-reliant and financially strong community of women contributing to social and economic development.</p>
        </div>
    </div>

    <!-- Our Story -->
    <div class="story">
        <h2>Our Story</h2>
        <p>
            Sahayog Bachatgat was formed with the vision of bringing women together to save money, support each other, and build sustainable businesses. 
            Over the years, our group has grown into a community-driven platform that not only promotes financial stability 
            but also encourages entrepreneurship, education, and empowerment. We believe that when women rise, the whole society rises with them.
        </p>
    </div>

    <!-- Team Section -->
    <div class="team">
        <h2>Meet Our Team</h2>
        <div class="team-members">
            <div class="member">
                <img src="~/Images/team1.jpg" alt="Team Member 1" />
                <h3>Anjali Patil</h3>
                <p>President</p>
            </div>
            <div class="member">
                <img src="~/Images/team2.jpg" alt="Team Member 2" />
                <h3>Meena Joshi</h3>
                <p>Treasurer</p>
            </div>
            <div class="member">
                <img src="~/Images/team3.jpg" alt="Team Member 3" />
                <h3>Sunita Pawar</h3>
                <p>Secretary</p>
            </div>
        </div>
    </div>

    <!-- CTA Section -->
    <div class="cta">
        <h2>Want to Connect With Us?</h2>
        <p>We’d love to hear from you and work together for a better tomorrow.</p>

        <asp:LinkButton ID="btnGetInTouch" 
            runat="server" 
            CssClass="btn-getintouch"
            PostBackUrl="~/User/Get_In_Touch.aspx">
            <i class="fa-solid fa-envelope"></i> Get In Touch
        </asp:LinkButton>
    </div>

</asp:Content>
