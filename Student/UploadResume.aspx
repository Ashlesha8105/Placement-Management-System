<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UploadResume.aspx.cs" Inherits="Placement_Portal.Student.UploadResume" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="registration-container">
    <h2>Update Your Resume</h2>
    <p>Upload your latest Resume in PDF or DOCX format.</p>
    <asp:Label ID="lblMsg" runat="server"></asp:Label>
    <br /><br />
    <asp:FileUpload ID="fileResume" runat="server" />
    <br /><br />
    <asp:Button ID="btnUpload" runat="server" Text="Upload & Save" OnClick="btnUpload_Click" />
</div>
</asp:Content>
