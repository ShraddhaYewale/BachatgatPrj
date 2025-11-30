<%@ Page Title="" Language="C#" MasterPageFile="~/Bachatgat/BachatGat.master"
    AutoEventWireup="true" CodeFile="Edit Bachat Profile.aspx.cs"
    Inherits="Bachatgat_Edit_Bachat_Profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<style>
    body {
        background: #eef3f8;
        font-family: 'Segoe UI', sans-serif;
    }

    .edit-wrapper {
        max-width: 950px;
        margin: 40px auto;
        padding: 0 20px;
    }

    .edit-box {
        background: #ffffff;
        border-radius: 18px;
        padding: 35px;
        box-shadow: 0 6px 20px rgba(0,0,0,0.12);
        transition: 0.3s ease;
    }

    .edit-box:hover {
        box-shadow: 0 8px 28px rgba(0,0,0,0.18);
    }

    .title-bar {
        background: linear-gradient(135deg, #0d6aa3, #0a4368);
        padding: 18px;
        color: #ffffff;
        border-radius: 12px;
        text-align: center;
        margin-bottom: 25px;
        font-size: 24px;
        font-weight: 700;
        text-transform: uppercase;
        letter-spacing: 1px;
    }

    .dv-style {
        width: 100%;
        border-radius: 14px;
        border: 1px solid #d5dbe3;
        overflow: hidden;
    }

    .dv-style th {
        background: #0d6aa3;
        color: #ffffff;
        padding: 12px 14px;
        font-size: 15px;
        font-weight: 600;
        width: 35%;
        border-right: 1px solid #c6d4df;
    }

    .dv-style td {
        background: #f8fafc;
        padding: 10px 14px;
        font-size: 15px;
        border-bottom: 1px solid #e4e8ed;
        transition: 0.2s ease;
    }

    .dv-style tr:hover td {
        background: #eef4f9;
    }

    .dv-style input[type="text"],
    .dv-style input[type="email"],
    .dv-style input[type="number"] {
        width: 97%;
        padding: 7px 10px;
        border: 1px solid #bfc9d4;
        border-radius: 6px;
        outline: none;
        font-size: 14px;
        transition: 0.3s ease;
    }

    .dv-style input[type="text"]:focus,
    .dv-style input[type="email"]:focus,
    .dv-style input[type="number"]:focus {
        border-color: #0d6aa3;
        box-shadow: 0 0 3px rgba(13, 106, 163, 0.4);
    }

    .dv-style input[type="submit"],
    .dv-style button {
        background: #0d6aa3;
        color: white;
        padding: 9px 25px;
        border-radius: 8px;
        border: none;
        font-size: 15px;
        cursor: pointer;
        margin-top: 10px;
        transition: 0.3s ease;
    }

    .dv-style input[type="submit"]:hover {
        background: #0a4e71;
    }

    /* SUCCESS POPUP TOAST */
    #successToast {
        position: fixed;
        top: 30px;
        right: 30px;
        background: #0d6aa3;
        color: white;
        padding: 14px 20px;
        border-radius: 10px;
        font-size: 16px;
        font-weight: 600;
        box-shadow: 0 6px 20px rgba(0,0,0,0.2);
        opacity: 0;
        visibility: hidden;
        transform: translateX(50px);
        transition: all 0.4s ease;
        z-index: 999999;
    }

    #successToast.show {
        opacity: 1;
        visibility: visible;
        transform: translateX(0);
    }
</style>

<div id="successToast">Profile updated successfully! ✔</div>

<script>
    function showSuccess() {
        var x = document.getElementById("successToast");
        x.classList.add("show");

        setTimeout(function () {
            x.classList.remove("show");
        }, 3000);
    }
</script>

</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

<div class="edit-wrapper">
    <div class="edit-box">

        <div class="title-bar">Edit Bachatgat Profile</div>

        <asp:DetailsView
            ID="DetailsView1"
            runat="server"
            CssClass="dv-style"
            AutoGenerateRows="False"
            DataSourceID="SqlDataSource1"
            DefaultMode="Edit"
            Width="100%">
            
            <Fields>

                <asp:BoundField DataField="B_id" HeaderText="Bachatgat ID" ReadOnly="True" />
                <asp:BoundField DataField="B_Name" HeaderText="Bachatgat Name" />
                <asp:BoundField DataField="B_Address" HeaderText="Address" />
                <asp:BoundField DataField="B_village" HeaderText="Village" />
                <asp:BoundField DataField="District" HeaderText="District" />
                <asp:BoundField DataField="State" HeaderText="State" />
                <asp:BoundField DataField="Pincode" HeaderText="Pincode" />
                <asp:BoundField DataField="Contact_name" HeaderText="Contact Person Name" />
                <asp:BoundField DataField="contact_no" HeaderText="Contact Number" />
                <asp:BoundField DataField="No_Of_Members" HeaderText="Number of Members" />
                <asp:BoundField DataField="Products" HeaderText="Products" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="B_img" HeaderText="Bachatgat Image" />
                <asp:BoundField DataField="QRcode" HeaderText="QR Code" />
                <asp:BoundField DataField="Username" HeaderText="Username" ReadOnly="True" />
                <asp:BoundField DataField="Password" HeaderText="Password" />
                <asp:CheckBoxField DataField="Verified" HeaderText="Verified" />

                <asp:CommandField ShowEditButton="True" ButtonType="Button" />

            </Fields>

        </asp:DetailsView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server"
            ConnectionString="<%$ ConnectionStrings:ConnectionString %>"

            SelectCommand="
                SELECT B_id, B_Name, B_Address, B_village, District, State, Pincode,
                       Contact_name, contact_no, No_Of_Members, Products, Email,
                       B_img, QRcode, Username, Password, Verified
                FROM Bachatgat_Reg
                WHERE Username = @Username
            "

            UpdateCommand="
                UPDATE Bachatgat_Reg SET
                    B_Name=@B_Name,
                    B_Address=@B_Address,
                    B_village=@B_village,
                    District=@District,
                    State=@State,
                    Pincode=@Pincode,
                    Contact_name=@Contact_name,
                    contact_no=@contact_no,
                    No_Of_Members=@No_Of_Members,
                    Products=@Products,
                    Email=@Email,
                    B_img=@B_img,
                    QRcode=@QRcode,
                    Password=@Password,
                    Verified=@Verified
                WHERE Username=@Username
            ">

            <SelectParameters>
                <asp:SessionParameter Name="Username" SessionField="BachatGat" Type="String" />
            </SelectParameters>

            <UpdateParameters>
                <asp:SessionParameter Name="Username" SessionField="BachatGat" Type="String" />
                <asp:Parameter Name="B_Name" Type="String" />
                <asp:Parameter Name="B_Address" Type="String" />
                <asp:Parameter Name="B_village" Type="String" />
                <asp:Parameter Name="District" Type="String" />
                <asp:Parameter Name="State" Type="String" />
                <asp:Parameter Name="Pincode" Type="String" />
                <asp:Parameter Name="Contact_name" Type="String" />
                <asp:Parameter Name="contact_no" Type="String" />
                <asp:Parameter Name="No_Of_Members" Type="Int32" />
                <asp:Parameter Name="Products" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="B_img" Type="String" />
                <asp:Parameter Name="QRcode" Type="String" />
                <asp:Parameter Name="Password" Type="String" />
                <asp:Parameter Name="Verified" Type="Boolean" />
            </UpdateParameters>

        </asp:SqlDataSource>

    </div>
</div>

</asp:Content>
