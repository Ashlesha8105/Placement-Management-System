<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Report.aspx.cs" Inherits="Placement_Portal.Admin.Report" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="admin-container report-container">
        <h2>Student Master Report</h2>
        <p>Full list of registered students sorted by CGPA.</p>
        
        <div class="print-container">
            <button onclick="window.print();" class="btn-link">🖨️ Print Report</button>
        </div>

        <asp:GridView ID="gvReport" runat="server" AutoGenerateColumns="False" 
            CssClass="admin-table report-table">
            <Columns>
                <asp:BoundField DataField="Name" HeaderText="Student Name" />
                <asp:BoundField DataField="Email" HeaderText="Email" />
                <asp:BoundField DataField="Branch" HeaderText="Branch" />
                <asp:BoundField DataField="CGPA" HeaderText="CGPA" />
                <asp:BoundField DataField="ContactNo" HeaderText="Contact" />
                <asp:TemplateField HeaderText="Resume">
                    <ItemTemplate>
                        <a href='<%# ResolveUrl(Eval("ResumePath").ToString()) %>' target="_blank">View Resume</a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
