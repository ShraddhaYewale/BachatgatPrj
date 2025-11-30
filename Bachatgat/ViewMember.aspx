<%@ Page Title="View Members" Language="C#" MasterPageFile="~/User/Bachatgat.master" 
    AutoEventWireup="true" CodeFile="ViewMember.aspx.cs" Inherits="Bachatgat_ViewMember" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        body { font-family: 'Segoe UI', sans-serif; background:#f8f9fc; }
        .member-container { width:95%; max-width:1300px; margin:40px auto; background:#fff; padding:30px; border-radius:15px; box-shadow:0 5px 25px rgba(0,0,0,0.1); }
        .member-container h2 { text-align:center; color:#4b0082; margin-bottom:30px; font-weight:700; }
        .search-box { text-align:center; margin-bottom:30px; }
        .search-box input[type="text"] { width:350px; padding:10px 20px; border:1px solid #ccc; border-radius:30px; font-size:16px; outline:none; transition:0.3s; }
        .search-box input[type="text"]:focus { border-color:#4b0082; box-shadow:0 0 8px rgba(75,0,130,0.4); }
        .search-box button { background:linear-gradient(135deg,#4b0082,#9933ff); color:#fff; border:none; border-radius:25px; padding:10px 25px; margin-left:10px; font-size:15px; font-weight:600; cursor:pointer; transition:0.3s; }
        .search-box button:hover { background:linear-gradient(135deg,#9933ff,#4b0082); transform:scale(1.05); }
        .member-card { display:flex; align-items:center; background:#fff; border-radius:12px; padding:20px; box-shadow:0 3px 15px rgba(0,0,0,0.1); margin-bottom:20px; transition:0.2s; }
        .member-card:hover { transform:translateY(-5px); box-shadow:0 6px 25px rgba(0,0,0,0.15); }
        .member-photo { width:120px; height:120px; border-radius:50%; object-fit:cover; border:3px solid #9933ff; margin-right:25px; }
        .member-details { flex:1; }
        .member-details h3 { margin:0; color:#4b0082; font-size:20px; font-weight:700; }
        .member-details p { margin:5px 0; color:#444; font-size:15px; }
        .no-data { text-align:center; color:#c00; font-weight:500; margin-top:15px; font-size:16px; }
        .details-panel { margin-top:15px; background:#f4f4f4; padding:15px; border-radius:8px; display:none; }
        .details-panel h4 { color:#4b0082; margin-top:10px; margin-bottom:5px; }
        .gv { width:100%; margin-bottom:15px; border-collapse:collapse; }
        .gv th, .gv td { border:1px solid #ccc; padding:8px; text-align:center; }
        .gv th { background:#ddd; }
        .btn-edit, .btn-update, .btn-cancel { padding:5px 10px; border:none; border-radius:5px; margin-right:5px; cursor:pointer; }
        .btn-edit { background:#3498db; color:white; }
        .btn-update { background:#2ecc71; color:white; }
        .btn-cancel { background:#e74c3c; color:white; }
    </style>

    <div class="member-container">
        <h2>Bachatgat Members</h2>

        <div class="search-box">
            <asp:TextBox ID="txtSearch" runat="server" placeholder="Search by Member Name, City, or Bachatgat Name"></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="btn-edit" OnClick="btnSearch_Click" />
        </div>

        <asp:DataList ID="DataList1" runat="server" RepeatLayout="Flow">
            <ItemTemplate>
                <div class="member-card">
                    <asp:Image ID="imgMember" runat="server" CssClass="member-photo" ImageUrl='<%# Eval("MemberPhoto") %>' AlternateText="Member Photo" />
                    <div class="member-details">
                        <h3><%# Eval("M_name") %></h3>
                        <p><strong>Bachatgat:</strong> <%# Eval("Bachatgat_name") %></p>
                        <p><strong>City:</strong> <%# Eval("City") %></p>
                        <p><strong>Contact:</strong> <%# Eval("Contact") %></p>
                        <p><strong>Occupation:</strong> <%# Eval("Occupation") %></p>
                        <p><strong>Join Date:</strong> <%# Eval("JoinDate") %></p>
                        <asp:Button ID="btnViewMore" runat="server" Text="View More" CommandArgument='<%# Eval("M_id") %>' CssClass="btn-edit" OnClick="btnViewMore_Click" UseSubmitBehavior="false" />
                    </div>
                </div>

                <!-- Details Panel -->
                <asp:Panel ID="pnlDetails" runat="server" CssClass="details-panel">
                    <h4>Saving History</h4>
                    <asp:GridView ID="gvSaving" runat="server" AutoGenerateColumns="False" DataKeyNames="Saving_id">
                        <Columns>
                            <asp:BoundField DataField="PaymentDate" HeaderText="Payment Date" ReadOnly="true" />
                            <asp:BoundField DataField="Year" HeaderText="Year" ReadOnly="true" />
                            <asp:BoundField DataField="Month" HeaderText="Month" ReadOnly="true" />
                            <asp:BoundField DataField="AmountPaid" HeaderText="Amount Paid" ReadOnly="true" />
                            <asp:BoundField DataField="SavingAmount" HeaderText="Saving Amount" ReadOnly="true" />
                        </Columns>
                    </asp:GridView>

                    <h4>Loan Application</h4>
                    <asp:GridView ID="gvLoanApplication" runat="server" AutoGenerateColumns="False" DataKeyNames="loan_id">
                        <Columns>
                            <asp:BoundField DataField="Loan_Require" HeaderText="Loan Required" ReadOnly="true" />
                            <asp:BoundField DataField="SavingAmt" HeaderText="Saving Amount" ReadOnly="true" />
                            <asp:BoundField DataField="Loan_appl_date" HeaderText="Applied Date" ReadOnly="true" />
                        </Columns>
                    </asp:GridView>

                    <h4>Loan Approval</h4>
                    <asp:GridView ID="gvLoanApproval" runat="server" AutoGenerateColumns="False" DataKeyNames="Approve_id">
                        <Columns>
                            <asp:BoundField DataField="Loan_req" HeaderText="Loan Requested" ReadOnly="true" />
                            <asp:BoundField DataField="Appl_status" HeaderText="Status" ReadOnly="true" />
                            <asp:BoundField DataField="DeclineReason" HeaderText="Decline Reason" ReadOnly="true" />
                        </Columns>
                    </asp:GridView>

                    <h4>Loan Return History</h4>
                    <asp:GridView ID="gvLoanReturn" runat="server" AutoGenerateColumns="False" DataKeyNames="LReturn_id">
                        <Columns>
                            <asp:BoundField DataField="loan_date" HeaderText="Loan Date" ReadOnly="true" />
                            <asp:BoundField DataField="Loan_avl_amt" HeaderText="Available" ReadOnly="true" />
                            <asp:BoundField DataField="Loan_amt" HeaderText="Loan Amount" ReadOnly="true" />
                            <asp:BoundField DataField="Loan_paid_amt" HeaderText="Paid Amount" ReadOnly="true" />
                            <asp:BoundField DataField="interest" HeaderText="Interest" ReadOnly="true" />
                            <asp:BoundField DataField="Total_paid" HeaderText="Total Paid" ReadOnly="true" />
                        </Columns>
                    </asp:GridView>

                    <h4>Withdrawal Info</h4>
                    <asp:GridView ID="gvWithdraw" runat="server" AutoGenerateColumns="False" DataKeyNames="Withdrawl_id">
                        <Columns>
                            <asp:BoundField DataField="Withdrawl_date" HeaderText="Withdrawal Date" ReadOnly="true" />
                            <asp:BoundField DataField="Total_saving" HeaderText="Total Saving" ReadOnly="true" />
                        </Columns>
                    </asp:GridView>
                </asp:Panel>
            </ItemTemplate>
        </asp:DataList>

        <asp:Label ID="lblNoData" runat="server" CssClass="no-data" Visible="False"></asp:Label>
    </div>
</asp:Content>
