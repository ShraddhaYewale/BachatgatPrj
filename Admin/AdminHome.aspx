<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="true" CodeFile="AdminHome.aspx.cs" Inherits="Admin_AdminHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body { font-family: 'Segoe UI', sans-serif; background: #f4f6f8; margin: 0; padding: 0; }

        /* Dashboard Cards */
        .dashboard-cards {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(220px, 1fr));
            gap: 25px;
            margin-bottom: 40px;
            padding: 20px;
        }

        .card {
            position: relative;
            padding: 25px;
            border-radius: 16px;
            color: #fff;
            text-align: center;
            font-weight: 600;
            cursor: default;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .card h3 { font-size: 32px; margin: 0; }
        .card p { margin: 8px 0 0; font-size: 16px; }

        .card:hover { transform: translateY(-10px); box-shadow: 0 15px 30px rgba(0,0,0,0.2); }

        .card1 { background: linear-gradient(135deg, #0055aa, #003366); }
        .card2 { background: linear-gradient(135deg, #ff6600, #ff9933); }
        .card3 { background: linear-gradient(135deg, #00cc99, #009966); }
        .card4 { background: linear-gradient(135deg, #cc3399, #993366); }

        .chart-container {
            max-width: 700px;
            margin: auto;
            background: #fff;
            padding: 30px;
            border-radius: 16px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            margin-bottom: 40px;
        }

        .chart-container h4 {
            text-align: center;
            margin-bottom: 20px;
            color: #003366;
            font-size: 22px;
            font-weight: 700;
        }

        canvas { width: 100% !important; height: 400px !important; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Dashboard Cards -->
    <div class="dashboard-cards">
        <div class="card card1">
            <h3 id="bachtgatCount"><%= BachatgatCount %></h3>
            <p>Total Bachatgats</p>
        </div>
        <div class="card card2">
            <h3 id="membersCount"><%= MembersCount %></h3>
            <p>Total Members</p>
        </div>
        <div class="card card3">
            <h3 id="usersCount"><%= UsersCount %></h3>
            <p>Total Users</p>
        </div>
        <div class="card card4">
            <h3 id="districtCount"><%= DistrictCount %></h3>
            <p>Total Districts</p>
        </div>
    </div>

    <!-- Stylish Pie Chart -->
    <div class="chart-container">
        <h4>Overall Distribution</h4>
        <canvas id="totalsPieChart"></canvas>
    </div>

    <!-- Bar Chart -->
    <div class="chart-container">
        <h4>Comparison Graph</h4>
        <canvas id="totalsBarChart"></canvas>
    </div>

    <script>
        // Pie Chart
        const pieCtx = document.getElementById('totalsPieChart').getContext('2d');
        const totalsData = [<%= BachatgatCount %>, <%= MembersCount %>, <%= UsersCount %>, <%= DistrictCount %>];
        const totalsLabels = ['Bachatgats', 'Members', 'Users', 'Districts'];
        const colors = ['#0055aa','#ff6600','#00cc99','#cc3399'];

        const totalsPieChart = new Chart(pieCtx, {
            type: 'pie',
            data: {
                labels: totalsLabels,
                datasets: [{
                    data: totalsData,
                    backgroundColor: colors,
                    borderColor: '#fff',
                    borderWidth: 2,
                    hoverOffset: 20
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: true,
                aspectRatio: 1, // make pie chart perfectly round
                plugins: {
                    legend: { position: 'bottom', labels: { font: { size: 14 } } },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                const total = context.dataset.data.reduce((a,b) => a + b, 0);
                                const percent = ((context.raw / total) * 100).toFixed(1);
                                return context.label + ': ' + context.raw + ' (' + percent + '%)';
                            }
                        }
                    }
                },
                animation: { animateScale: true, animateRotate: true, duration: 1500, easing: 'easeOutQuart' }
            }
        });

        // Bar Chart
        const barCtx = document.getElementById('totalsBarChart').getContext('2d');
        const totalsBarChart = new Chart(barCtx, {
            type: 'bar',
            data: {
                labels: totalsLabels,
                datasets: [{
                    label: 'Counts',
                    data: totalsData,
                    backgroundColor: colors,
                    borderRadius: 8
                }]
            },
            options: {
                responsive: true,
                plugins: { legend: { display: false } },
                animation: { duration: 1200, easing: 'easeOutQuart' },
                scales: {
                    y: { beginAtZero: true, ticks: { stepSize: 1 } }
                }
            }
        });

        // Animate Numbers
        function animateCount(id, target) {
            let count = 0;
            const steps = 60;
            const increment = target / steps;
            const el = document.getElementById(id);
            const interval = setInterval(() => {
                count += increment;
                if(count >= target){ count = target; clearInterval(interval); }
                el.textContent = Math.floor(count);
            },16);
        }

        animateCount('bachtgatCount', <%= BachatgatCount %>);
        animateCount('membersCount', <%= MembersCount %>);
        animateCount('usersCount', <%= UsersCount %>);
        animateCount('districtCount', <%= DistrictCount %>);
    </script>
</asp:Content>
