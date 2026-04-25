<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="TrackStatus.aspx.cs" Inherits="Placement_Portal.Student.TrackStatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="admin-container">
    <h2>My Applications</h2>
    <asp:GridView ID="gvStatus" runat="server" AutoGenerateColumns="False" CssClass="admin-table">
        <Columns>
            <asp:BoundField DataField="CompanyName" HeaderText="Company" />
            <asp:BoundField DataField="JobRole" HeaderText="Role" />
            <asp:BoundField DataField="ApplicationDate" HeaderText="Date Applied" DataFormatString="{0:dd-MMM-yyyy}" />
            <asp:TemplateField HeaderText="Status">
                <ItemTemplate>
                    <span class='status-<%# Eval("Status").ToString().ToLower() %>'>
                        <%# Eval("Status") %>
                    </span>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>
</asp:Content>
