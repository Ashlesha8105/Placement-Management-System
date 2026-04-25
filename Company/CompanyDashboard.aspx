<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CompanyDashboard.aspx.cs" Inherits="Placement_Portal.Company.CompanyDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="admin-container">
        <h2>Welcome, <asp:Label ID="lblCompanyName" runat="server" Text="Company"></asp:Label>!</h2>
        <p class="dashboard-subtext">Manage your recruitment drives and view applicant profiles below.</p>
        <hr />

        <div class="dashboard-grid">
            <div class="card">
                <h3>Post Job Drive</h3>
                <p>Create a new recruitment drive with specific eligibility criteria.</p>
                <a href="AddJob.aspx" class="btn-link">➕ New Job Post</a>
            </div>

            <div class="card">
                <h3>View Applicants</h3>
                <p>See students who applied to your company and download resumes.</p>
                <a href="ViewStudents.aspx" class="btn-link">👥 View Students</a>
            </div>
        </div>

        <div class="logout-wrapper">
    <asp:Button ID="btnLogout" runat="server" Text="Logout" 
        CssClass="btn-logout" OnClick="btnLogout_Click" />
</div>
    </div>
</asp:Content>
