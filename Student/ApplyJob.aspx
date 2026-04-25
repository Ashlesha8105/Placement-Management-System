<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ApplyJob.aspx.cs" Inherits="Placement_Portal.Student.ApplyJob" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="admin-container">
    <h2>Available Job Drives</h2>
    <asp:Label ID="lblMsg" runat="server"></asp:Label>
        
        <asp:GridView ID="gvJobs" runat="server" AutoGenerateColumns="False" 
            CssClass="admin-table" OnRowCommand="gvJobs_RowCommand">
            <Columns>
                <asp:BoundField DataField="CompanyName" HeaderText="Company" />
                <asp:BoundField DataField="JobRole" HeaderText="Role" />
                <asp:BoundField DataField="Package" HeaderText="Package" />
                <asp:BoundField DataField="EligibilityCriteria" HeaderText="Min CGPA" />
                <asp:BoundField DataField="DriveDate" HeaderText="Date" DataFormatString="{0:yyyy-MM-dd}" />
                
                <asp:TemplateField HeaderText="Action">
                    <ItemTemplate>
                        <asp:Button ID="btnApply" runat="server" Text="Apply Now" 
                            CommandName="Apply" 
                            CommandArgument='<%# Eval("CompanyID") %>' 
                            CssClass="btn-link" style="border:none; cursor:pointer;" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                <div style="padding:20px; color:gray;">No job drives match your eligibility right now.</div>
            </EmptyDataTemplate>
        </asp:GridView>
</div>
</asp:Content>