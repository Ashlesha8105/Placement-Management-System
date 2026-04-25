<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="Placement_Portal.Admin.AdminDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="admin-container">
        <h2>Admin Control Center</h2>
        <hr />
        
        <div class="dashboard-grid">
            <div class="card">
                <h3>Total Students</h3>
                <h1 style="color: #004080; text-align:center;">
                    <asp:Label ID="lblTotalStudents" runat="server" Text="0"></asp:Label>
                </h1>
                <p style="text-align:center;">Registered on portal</p>
            </div>

            <div class="card">
                <h3>Active Drives</h3>
                <h1 style="color: #004080; text-align:center;">
                    <asp:Label ID="lblTotalCompanies" runat="server" Text="0"></asp:Label>
                </h1>
                <p style="text-align:center;">Current job postings</p>
            </div>
        </div>

        <div class="admin-actions" style="text-align: center; margin-top: 40px;">
            <a href="ManageCompany.aspx" class="btn-link">➕ Post New Job Drive</a>
            <a href="ViewApplication.aspx" class="btn-link">📋 Manage Applications</a>
            <a href="Report.aspx" class="btn-link">📊 View Student Reports</a>
        </div>
        
        <div class="logout-wrapper">
    <asp:Button ID="btnLogout" runat="server" Text="Logout" 
        CssClass="btn-logout" OnClick="btnLogout_Click" />
</div>
    </div>
</asp:Content>
