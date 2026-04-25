<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CompanyRegister.aspx.cs" Inherits="Placement_Portal.Company.CompanyRegister" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="registration-container">
    <p class="registration-header-text">Register your company to start recruiting students.</p>
        <asp:Label ID="lblMsg" runat="server"></asp:Label>
        
        <table>
            <tr>
                <td>Company Name:</td>
                <td>
                    <asp:TextBox ID="txtCompName" runat="server" placeholder="e.g. Tech Solutions"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvCompName" runat="server" ControlToValidate="txtCompName" 
                        ErrorMessage="Company name is required" ForeColor="Red" Display="Dynamic" />
                </td>
            </tr>

            <tr>
                <td>Official Email:</td>
                <td>
                   <%-- "Start with letters/numbers, maybe include a dot or hyphen, then an '@' sign, then more letters, a literal dot, and finally a domain extension of at least one letter." --%>
                    <asp:TextBox ID="txtEmail" runat="server" placeholder="hr@company.com"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" 
                        ErrorMessage="Email is required" ForeColor="Red" Display="Dynamic" />
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" 
                        ErrorMessage="Invalid email format" ForeColor="Red" Display="Dynamic"
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                </td>
            </tr>

            <tr>
                <td>Password:</td>
                <td>
                    <asp:TextBox ID="txtPass" runat="server" TextMode="Password" placeholder="Create a password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvPass" runat="server" ControlToValidate="txtPass" 
                        ErrorMessage="Password is required" ForeColor="Red" Display="Dynamic" />
                </td>
            </tr>

            <tr>
                <td>Confirm Password:</td>
                <td>
                    <asp:TextBox ID="txtConfirm" runat="server" TextMode="Password" placeholder="Repeat password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvConfirm" runat="server" ControlToValidate="txtConfirm" 
                        ErrorMessage="Please confirm password" ForeColor="Red" Display="Dynamic" />
                    <asp:CompareValidator ID="cvPass" runat="server" ControlToValidate="txtConfirm" 
                        ControlToCompare="txtPass" ErrorMessage="Passwords do not match" 
                        ForeColor="Red" Display="Dynamic" />
                </td>
            </tr>

            <tr>
                <td></td>
            <td><asp:Button ID="btnRegister" runat="server" Text="Register Company" OnClick="btnRegister_Click" /></td>
        </tr>
    </table>
        <div style="margin-top: 15px; text-align: center;" class="registration-footer-links">
            <p>Already registered? <a href="CompanyLogin.aspx">Login here</a></p>
        </div>
</div>
</asp:Content>
