using System;
using System.Data;
using System.Data.SqlClient;

namespace Placement_Portal.Company
{
    public partial class ViewStudents : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["CompanyID"] == null) Response.Redirect("CompanyLogin.aspx");
            if (!IsPostBack) LoadApplicants();
        }

        private void LoadApplicants()
        {
            // 2. Switched to SqlConnection
            using (SqlConnection conn = DatabaseConnection.GetConnection())
            {
                // Join Applications with Students filtering by current CompanyID
                string query = @"SELECT s.Name, s.Branch, s.CGPA, s.ResumePath, a.Status 
                                 FROM Applications a 
                                 JOIN Students s ON a.StudentID = s.StudentID 
                                 WHERE a.CompanyID = @cid";

                // 3. Switched to SqlCommand
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@cid", Session["CompanyID"]);

                // 4. Switched to SqlDataAdapter
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvApplicants.DataSource = dt;
                gvApplicants.DataBind();
            }
        }
    }
}