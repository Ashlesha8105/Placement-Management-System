<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Placement_Portal.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div style="text-align: center; padding: 50px 20px;">
        <!--<h1 style="color: #004080; font-size: 36px;">Placement Management System</h1>-->
        <p style="font-size: 20px; color: #2ca0a0;">Connecting Bright Talents with Global Companies</p>
        
        <div class="dashboard-grid" style="margin-top: 50px;">
            <div class="card">
                <img src="Images/student_icon.png" alt="Student" style="width:70px;"/>
                <h3>Student Portal</h3>
                <p>Register, upload your resume, and apply for your dream job.</p>
                <a href="Student/StudentLogin.aspx" class="btn-link">Student Login</a>
            </div>

            <div class="card">
                <img src="Images/company_icon.png" alt="Company" style="width:70px;"/>
                <h3>Company Portal</h3>
                <p>Post new job drives and find the best candidates for your team.</p>
                <a href="Company/CompanyLogin.aspx" class="btn-link">Company Login</a>
            </div>

            <div class="card">
                <img src="Images/admin_icon.png" alt="Admin" style="width:70px;"/>
                <h3>Admin Portal</h3>
                <p>Manage companies, students, and generate placement reports.</p>
                <a href="Admin/AdminLogin.aspx" class="btn-link">Admin Login</a>
            </div>
        </div>
    </div>
</asp:Content>
