<%@ Page Title="Oops! Error" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ErrorPage.aspx.cs" Inherits="Placement_Portal.ErrorPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="admin-container" style="text-align: center; padding: 50px;">
        <h1 style="font-size: 80px; color: #004080;">⚠️</h1>
        <h2>Oops! Something went wrong.</h2>
        <p>We are sorry, but an unexpected error occurred while processing your request.</p>
        <p>Our team has been notified, or you can try navigating back to the homepage.</p>
        
        <div style="margin-top: 30px;">
            <asp:Button ID="btnBack" runat="server" Text="Return to Home" 
                OnClick="btnBack_Click" CssClass="btn-link" style="width: auto; padding: 10px 25px;" />
        </div>
    </div>
</asp:Content>
