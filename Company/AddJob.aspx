<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AddJob.aspx.cs" Inherits="Placement_Portal.Company.AddJob" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="registration-container" style="max-width: 600px;">
    <h2>Post New Job Drive</h2>
    <asp:Label ID="lblMsg" runat="server"></asp:Label>
    <table>
        <tr>
            <td>Job Role:</td>
            <td><asp:TextBox ID="txtRole" runat="server" placeholder="e.g. Software Engineer"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Package (LPA):</td>
            <td><asp:TextBox ID="txtPackage" runat="server" placeholder="e.g. 6.5 LPA"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Min CGPA:</td>
            <td><asp:TextBox ID="txtCriteria" runat="server" placeholder="e.g. 7.5"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Drive Date:</td>
            <td><asp:TextBox ID="txtDate" runat="server" TextMode="Date"></asp:TextBox></td>
        </tr>
        <tr>
            <td>Location:</td>
            <td><asp:TextBox ID="txtLoc" runat="server" placeholder="e.g. Pune / Remote"></asp:TextBox></td>
        </tr>
        <tr>
            <td></td>
            <td><asp:Button ID="btnPost" runat="server" Text="Post Drive" OnClick="btnPost_Click" CssClass="btn-link" style="border:none; cursor:pointer;" /></td>
        </tr>
    </table>
</div>
</asp:Content>
