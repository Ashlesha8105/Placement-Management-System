<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="StudentRegister.aspx.cs" Inherits="Placement_Portal.Student.StudentRegister" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <h2>Student Registration</h2>
    <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
    <asp:Panel ID="pnlRegister" runat="server">
        <table>
                <tr>
                    <td>Full Name:</td>
                    <td>
                        <asp:TextBox ID="txtName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvName" runat="server" ControlToValidate="txtName" 
                            ErrorMessage="Name is required" ForeColor="Red" Display="Dynamic" ValidationGroup="vgReg" />
                    </td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td>
                        <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvEmail" runat="server" ControlToValidate="txtEmail" 
                            ErrorMessage="Email is required" ForeColor="Red" Display="Dynamic" ValidationGroup="vgReg" />
                        <asp:RegularExpressionValidator ID="revEmail" runat="server" ControlToValidate="txtEmail" 
                            ErrorMessage="Invalid email format" ForeColor="Red" Display="Dynamic" ValidationGroup="vgReg"
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" />
                    </td>
                </tr>
                <tr>
                    <td>Branch:</td>
                    <td>
                        <asp:TextBox ID="txtBranch" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvBranch" runat="server" ControlToValidate="txtBranch" 
                            ErrorMessage="Branch is required" ForeColor="Red" Display="Dynamic" ValidationGroup="vgReg" />
                    </td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td>
                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvPass" runat="server" ControlToValidate="txtPassword" 
                            ErrorMessage="Password required" ForeColor="Red" Display="Dynamic" ValidationGroup="vgReg" />
                    </td>
                </tr>
                <tr>
                    <td>Confirm Password:</td>
                    <td>
                        <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
                        <asp:CompareValidator ID="cvPass" runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" 
                            ErrorMessage="Passwords must match" ForeColor="Red" Display="Dynamic" ValidationGroup="vgReg" />
                    </td>
                </tr>
                <tr>
                    <td>CGPA:</td>
                    <td>
                        <asp:TextBox ID="txtCGPA" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvCGPA" runat="server" ControlToValidate="txtCGPA" 
                            ErrorMessage="CGPA is required" ForeColor="Red" Display="Dynamic" ValidationGroup="vgReg" />
                    </td>
                </tr>
                <tr>
                    <td>Skills:</td>
                    <td><asp:TextBox ID="txtSkills" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Contact No:</td>
                    <td>
                        <asp:TextBox ID="txtContactNo" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="rfvContact" runat="server" ControlToValidate="txtContactNo" 
                            ErrorMessage="Contact required" ForeColor="Red" Display="Dynamic" ValidationGroup="vgReg" />
                    </td>
                </tr>
                <tr>
                    <td>Upload Resume:</td>
    <td>
        <asp:FileUpload ID="fileResume" runat="server" />
        
        <asp:RequiredFieldValidator ID="rfvResume" runat="server" 
            ControlToValidate="fileResume" ErrorMessage="Please upload your resume" 
            ForeColor="Red" Display="Dynamic" ValidationGroup="vgReg" />

        <asp:RegularExpressionValidator ID="revResume" runat="server" 
            ControlToValidate="fileResume" ErrorMessage="Only PDF or DOCX files allowed" 
            ForeColor="Red" Display="Dynamic" ValidationGroup="vgReg"
            ValidationExpression="^.*\.(pdf|PDF|docx|DOCX)$" />
    </td>
                </tr>
                <tr>
                  
                    <td colspan="2" style="text-align:center;">
                        <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" Text="Register" ValidationGroup="vgReg" />
                    </td>
                    </tr>
        </table>
    </asp:Panel>
</asp:Content>
