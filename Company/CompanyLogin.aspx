<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CompanyLogin.aspx.cs" Inherits="Placement_Portal.Company.CompanyLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="login-container">
        <h2>Company Partner Login</h2>
        <p>Login to post job drives and manage applicants.</p>
        
        <asp:Label ID="lblMessage" runat="server" CssClass="error-msg"></asp:Label>
        
        <table>
            <tr>
                <td>Official Email:</td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" placeholder="email@company.com"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                        ControlToValidate="txtEmail" ErrorMessage="Email is required" 
                        ForeColor="Red" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                        ControlToValidate="txtEmail" ErrorMessage="Invalid email format" 
                        ForeColor="Red" Display="Dynamic"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                </td>
            </tr>
            <tr>
                <td>Password:</td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="••••••••"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                        ControlToValidate="txtPassword" ErrorMessage="Password is required" 
                        ForeColor="Red" Display="Dynamic" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnLogin" runat="server" Text="Login" CssClass="btn-link" style="border:none; cursor:pointer; width:100%;" OnClick="btnLogin_Click" />
                </td>
            </tr>
        </table>
        
        <div style="margin-top: 20px; text-align: center;">
            <p>New partner? <a href="CompanyRegister.aspx">Register your Company</a></p>
        </div>
    </div>
</asp:Content>
