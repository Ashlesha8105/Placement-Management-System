<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentDashboard.aspx.cs" Inherits="Placement_Portal.Student.StudentDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Welcome, <asp:Label ID="lblStudentName" runat="server" Text=""></asp:Label></h2>
    <hr />
    <div class="dashboard-grid">
            <div class="card">
                <h3>My Profile</h3>
                <p><strong>Email:</strong> <asp:Label ID="lblEmail" runat="server"></asp:Label></p>
                <p><strong>Branch:</strong> <asp:Label ID="lblBranch" runat="server"></asp:Label></p>
                <p><strong>CGPA:</strong> <asp:Label ID="lblCGPA" runat="server"></asp:Label></p>
                <!--<a href="UpdateProfile.aspx" class="btn-link">Edit Profile</a>-->
            </div>

            <div class="card">
                <h3>Quick Actions</h3>
                <ul class="action-list">
                    <li><a href="UploadResume.aspx">📄 Update Resume</a></li>
                    <li><a href="ApplyJob.aspx">💼 View & Apply Jobs</a></li>
                    <li><a href="TrackStatus.aspx">📊 Track Application Status</a></li>
                </ul>
            </div>
        </div>
   <div class="logout-wrapper">
    <asp:Button ID="btnLogout" runat="server" Text="Logout" 
        CssClass="btn-logout" OnClick="btnLogout_Click" />
</div>
</asp:Content>
