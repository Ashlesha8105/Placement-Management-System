<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentLogin.aspx.cs" Inherits="Placement_Portal.Student.StudentLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div class="login-container">
        <h2>Student Login</h2>
        <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
        
        <table>
            <tr>
                <td>Email:</td>
                <td>
                    <asp:TextBox ID="txtEmail" runat="server" placeholder="e.g. xyz@example.com"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                        ControlToValidate="txtEmail" ErrorMessage="Email is required" 
                        ForeColor="Red" Display="Dynamic" ValidationGroup="vgLogin" />
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                        ControlToValidate="txtEmail" ErrorMessage="Invalid email format" 
                        ForeColor="Red" Display="Dynamic" ValidationGroup="vgLogin"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                </td>
            </tr>
            <tr>
                <td>Password:</td>
                <td>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" placeholder="••••••••"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPass" runat="server" 
                        ControlToValidate="txtPassword" ErrorMessage="Password is required" 
                        ForeColor="Red" Display="Dynamic" ValidationGroup="vgLogin" />
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
                </td>
            </tr>
        </table>
        
        <div class="dashboard-links">
            <p>Don't have an account? <a href="StudentRegister.aspx">Register Here</a></p>
        </div>
    </div>
</asp:Content>
