<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewStudents.aspx.cs" Inherits="Placement_Portal.Company.ViewStudents" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="admin-container report-container">
    <h2>Applicants for your Drives</h2>
    <asp:GridView ID="gvApplicants" runat="server" AutoGenerateColumns="False" CssClass="admin-table report-table">
        <Columns>
            <asp:BoundField DataField="Name" HeaderText="Student Name" />
            <asp:BoundField DataField="Branch" HeaderText="Branch" />
            <asp:BoundField DataField="CGPA" HeaderText="CGPA" />
            <asp:BoundField DataField="Status" HeaderText="Status" />
            <asp:TemplateField HeaderText="Resume">
                <ItemTemplate>
                    <a href='<%# ResolveUrl(Eval("ResumePath").ToString()) %>' target="_blank">📄 View Resume</a>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
</div>
</asp:Content>
