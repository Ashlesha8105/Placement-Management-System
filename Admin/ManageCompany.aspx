<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageCompany.aspx.cs" Inherits="Placement_Portal.Admin.ManageCompany" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="admin-container">
        <h2>Post New Job Drive</h2>
        <asp:Label ID="lblMsg" runat="server" ForeColor="Green" Font-Bold="true"></asp:Label>
        <asp:Label ID="lblDeleteMsg" runat="server" ForeColor="Red" Font-Bold="true" style="display:block;"></asp:Label>
        
        <div class="registration-container" style="margin-left:0; max-width:100%;">
            <table>
                <tr>
                    <td>Company Name:</td>
                    <td><asp:TextBox ID="txtCompName" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Job Role:</td>
                    <td><asp:TextBox ID="txtRole" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Package (LPA):</td>
                    <td><asp:TextBox ID="txtPackage" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Eligibility (Min CGPA):</td>
                    <td><asp:TextBox ID="txtCriteria" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Drive Date:</td>
                    <td><asp:TextBox ID="txtDate" runat="server" TextMode="Date"></asp:TextBox></td>
                </tr>
                <tr>
                    <td>Location:</td>
                    <td><asp:TextBox ID="txtLoc" runat="server"></asp:TextBox></td>
                </tr>
                <tr>
                    <td></td>
                    <td>
                        <asp:Button ID="btnAddJob" runat="server" Text="Post Job Drive" OnClick="btnAddJob_Click" CssClass="btn-link" style="border:none; cursor:pointer;" />
                    </td>
                </tr>
            </table>
        </div>

        <hr style="margin: 40px 0;" />

        <h3>Current Job Drives</h3>
        <asp:GridView ID="gvCompanies" runat="server" AutoGenerateColumns="False" 
            CssClass="admin-table" DataKeyNames="CompanyID"
            OnRowDeleting="gvCompanies_RowDeleting" 
            EmptyDataText="No job drives posted yet."
            AllowPaging="false">
            <Columns>
                <asp:BoundField DataField="CompanyName" HeaderText="Company" />
                <asp:BoundField DataField="JobRole" HeaderText="Role" />
                <asp:BoundField DataField="Package" HeaderText="Package (LPA)" />
                <asp:BoundField DataField="EligibilityCriteria" HeaderText="Min CGPA" />
                <asp:BoundField DataField="DriveDate" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}" />
                <asp:BoundField DataField="Location" HeaderText="Location" />
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:LinkButton ID="lnkDelete" runat="server" 
                            CommandName="Delete" 
                            Text="🗑️ Remove" 
                            ForeColor="Red" 
                            OnClientClick="return confirm('Remove this job drive?');"
                            CssClass="delete-link" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>