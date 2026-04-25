using System;
using System.Data;
using System.Data.SqlClient;

namespace Placement_Portal.Student
{
    public partial class TrackStatus : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack && Session["StudentID"] != null)
            {
                LoadStatus();
            }
        }

        private void LoadStatus()
        {
            // 2. Switched to SqlConnection
            using (SqlConnection conn = DatabaseConnection.GetConnection())
            {
                string query = "SELECT c.CompanyName, c.JobRole, a.ApplicationDate, a.Status " +
                               "FROM Applications a JOIN Company c ON a.CompanyID = c.CompanyID " +
                               "WHERE a.StudentID = @sid";

                // 3. Switched to SqlCommand
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@sid", Session["StudentID"]);

                // 4. Switched to SqlDataAdapter
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvStatus.DataSource = dt;
                gvStatus.DataBind();
            }
        }
    }
}