using System;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Placement_Portal.Admin
{
    public partial class ViewApplication : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminID"] == null) Response.Redirect("AdminLogin.aspx");
            if (!IsPostBack) LoadApplications();
        }

        private void LoadApplications()
        {
            // 2. Switched to SqlConnection
            using (SqlConnection conn = DatabaseConnection.GetConnection())
            {
                // Joins 3 tables to get full info
                string query = @"SELECT a.ApplicationID, s.Name as StudentName, c.CompanyName, 
                                 c.JobRole, a.Status, s.ResumePath 
                                 FROM Applications a 
                                 JOIN Students s ON a.StudentID = s.StudentID 
                                 JOIN Company c ON a.CompanyID = c.CompanyID";

                // 3. Switched to SqlDataAdapter
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvAdminApplications.DataSource = dt;
                gvAdminApplications.DataBind();
            }
        }

        protected void gvAdminApplications_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "UpdateStatus")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvAdminApplications.Rows[rowIndex];

                // Get ApplicationID from the first cell
                string appId = row.Cells[0].Text;

                // Find the DropDownList in the row
                DropDownList ddl = (DropDownList)row.FindControl("ddlStatus");
                string newStatus = ddl.SelectedValue;

                // 4. Switched to SqlConnection
                using (SqlConnection conn = DatabaseConnection.GetConnection())
                {
                    string query = "UPDATE Applications SET Status=@status WHERE ApplicationID=@id";

                    // 5. Switched to SqlCommand
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@status", newStatus);
                        cmd.Parameters.AddWithValue("@id", appId);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                lblMsg.Text = "Status updated to " + newStatus;
                lblMsg.ForeColor = System.Drawing.Color.Green;
                LoadApplications(); // Refresh table
            }
        }
    }
}