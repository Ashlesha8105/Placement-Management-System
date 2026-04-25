using System;
using System.Data.SqlClient;  // ✅ CHANGED: MySql.Data.MySqlClient → System.Data.SqlClient

namespace Placement_Portal.Admin
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Protect the page - must be logged in as Admin
            if (Session["AdminID"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
            }

            if (!IsPostBack)
            {
                LoadStats();
            }
        }

        private void LoadStats()
        {
            // ✅ CHANGED: Direct SQL Server connection string
            // Update Server name/port/credentials as needed
            using (SqlConnection conn = DatabaseConnection.GetConnection())

            {
                conn.Open();

                // ✅ Queries work IDENTICAL (table names match our SQL Server schema)
                // Total Students count
                SqlCommand cmdStudents = new SqlCommand("SELECT COUNT(*) FROM students", conn);  // ✅ CHANGED: MySqlCommand → SqlCommand
                lblTotalStudents.Text = cmdStudents.ExecuteScalar().ToString();

                // Total Companies (Job Drives) count  
                SqlCommand cmdCompanies = new SqlCommand("SELECT COUNT(*) FROM company", conn);
                lblTotalCompanies.Text = cmdCompanies.ExecuteScalar().ToString();
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("AdminID");
            Response.Redirect("AdminLogin.aspx");
        }
    }
}