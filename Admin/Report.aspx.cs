using System;
using System.Data;
using System.Data.SqlClient;

namespace Placement_Portal.Admin
{
    public partial class Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminID"] == null) Response.Redirect("AdminLogin.aspx");
            if (!IsPostBack) LoadReport();
        }

        private void LoadReport()
        {
            // 2. Switched to SqlConnection
            using (SqlConnection conn = DatabaseConnection.GetConnection())
            {
                string query = "SELECT Name, Email, Branch, CGPA, ContactNo, ResumePath FROM Students ORDER BY CGPA DESC";

                // 3. Switched to SqlDataAdapter
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gvReport.DataSource = dt;
                gvReport.DataBind();
            }
        }
    }
}