using System;
using System.Data.SqlClient;

namespace Placement_Portal.Student
{
    public partial class StudentDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if student is logged in
            if (Session["StudentID"] == null)
            {
                Response.Redirect("StudentLogin.aspx");
            }
            if (!IsPostBack)
            {
                LoadStudentData();
            }
        }

        private void LoadStudentData()
        {
            string studentId = Session["StudentID"].ToString();

            try
            {
                // 2. Switched to SqlConnection
                using (SqlConnection conn = DatabaseConnection.GetConnection())
                {
                    string query = "SELECT Name, Email, Branch, CGPA FROM Students WHERE StudentID = @ID";

                    // 3. Switched to SqlCommand
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@ID", studentId);

                        conn.Open();

                        // 4. Switched to SqlDataReader
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.Read())
                            {
                                lblStudentName.Text = dr["Name"].ToString();
                                lblEmail.Text = dr["Email"].ToString();
                                lblBranch.Text = dr["Branch"].ToString();
                                lblCGPA.Text = dr["CGPA"].ToString();
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Professional tip: It's good to display the error during testing
                // so you know exactly why the dashboard might fail to load.
                Response.Write("Error loading data: " + ex.Message);
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("StudentLogin.aspx");
        }
    }
}