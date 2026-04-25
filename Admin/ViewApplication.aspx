<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewApplication.aspx.cs" Inherits="Placement_Portal.Admin.ViewApplication" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="admin-container">
    <h2>Manage Student Applications</h2>
    <asp:Label ID="lblMsg" runat="server"></asp:Label>
    
    <asp:GridView ID="gvAdminApplications" runat="server" AutoGenerateColumns="False" 
        CssClass="admin-table" OnRowCommand="gvAdminApplications_RowCommand">
        <Columns>
            <asp:BoundField DataField="ApplicationID" HeaderText="ID" />
            <asp:BoundField DataField="StudentName" HeaderText="Student" />
            <asp:BoundField DataField="CompanyName" HeaderText="Company" />
            <asp:BoundField DataField="JobRole" HeaderText="Role" />
            <asp:BoundField DataField="Status" HeaderText="Current Status" />
            
            <asp:TemplateField HeaderText="Update Status">
                <ItemTemplate>
                    <asp:DropDownList ID="ddlStatus" runat="server">
                        <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                        <asp:ListItem Text="Shortlisted" Value="Shortlisted"></asp:ListItem>
                        <asp:ListItem Text="Rejected" Value="Rejected"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" 
                        CommandName="UpdateStatus" 
                        CommandArgument='<%# Container.DataItemIndex %>' 
                        CssClass="btn-link" style="color:white; border:none; padding:5px 10px;"/>
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:TemplateField HeaderText="Resume">
    <ItemTemplate>
        <asp:HyperLink ID="lnkResume" runat="server" 
            NavigateUrl='<%# ResolveUrl(Eval("ResumePath").ToString()) %>' 
            Target="_blank" 
            Text="View Resume">
        </asp:HyperLink>
    </ItemTemplate>
</asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>
</asp:Content>
