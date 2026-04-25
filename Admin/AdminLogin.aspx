<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="Placement_Portal.Admin.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="login-container">
        <h2>Admin Portal Login</h2>
        <asp:Label ID="lblAdminMsg" runat="server" ForeColor="Red"></asp:Label>
        
        <table>
            <tr>
                <td>Username:</td>
                <td>
                    <asp:TextBox ID="txtAdminUser" runat="server"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="rfvUser" runat="server" 
                        ControlToValidate="txtAdminUser" 
                        ErrorMessage="Username is required" 
                        ForeColor="Red" Display="Dynamic">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Password:</td>
                <td>
                    <asp:TextBox ID="txtAdminPass" runat="server" TextMode="Password"></asp:TextBox>
                    <br />
                    <asp:RequiredFieldValidator ID="rfvPass" runat="server" 
                        ControlToValidate="txtAdminPass" 
                        ErrorMessage="Password is required" 
                        ForeColor="Red" Display="Dynamic">
                    </asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnAdminLogin" runat="server" Text="Login as Admin" OnClick="btnAdminLogin_Click" />
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
