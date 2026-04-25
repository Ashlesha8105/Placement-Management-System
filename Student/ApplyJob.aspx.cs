using System;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Placement_Portal.Student
{
    public partial class ApplyJob : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["StudentID"] == null) Response.Redirect("StudentLogin.aspx");
            if (!IsPostBack) LoadEligibleJobs();
        }

        private void LoadEligibleJobs()
        {
            // 2. Switched to SqlConnection
            using (SqlConnection conn = DatabaseConnection.GetConnection())
            {
                // We only show jobs where the student's CGPA is >= EligibilityCriteria
                string query = @"SELECT * FROM Company WHERE EligibilityCriteria <= 
                                 (SELECT CGPA FROM Students WHERE StudentID = @sid)";

                // 3. Switched to SqlCommand and SqlDataAdapter
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@sid", Session["StudentID"]);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvJobs.DataSource = dt;
                gvJobs.DataBind();
            }
        }

        protected void gvJobs_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Apply")
            {
                int companyId = Convert.ToInt32(e.CommandArgument);
                int studentId = Convert.ToInt32(Session["StudentID"]);

                try
                {
                    using (SqlConnection conn = DatabaseConnection.GetConnection())
                    {
                        // Check if already applied
                        string checkQuery = "SELECT COUNT(*) FROM Applications WHERE StudentID=@sid AND CompanyID=@cid";
                        SqlCommand checkCmd = new SqlCommand(checkQuery, conn);
                        checkCmd.Parameters.AddWithValue("@sid", studentId);
                        checkCmd.Parameters.AddWithValue("@cid", companyId);

                        conn.Open();
                        int exists = Convert.ToInt32(checkCmd.ExecuteScalar());

                        if (exists > 0)
                        {
                            lblMsg.Text = "You have already applied for this company!";
                            lblMsg.ForeColor = System.Drawing.Color.Orange;
                        }
                        else
                        {
                            // Insert into Applications table
                            string insertQuery = "INSERT INTO Applications (StudentID, CompanyID, ApplicationDate, Status) VALUES (@sid, @cid, @date, 'Pending')";
                            SqlCommand insertCmd = new SqlCommand(insertQuery, conn);
                            insertCmd.Parameters.AddWithValue("@sid", studentId);
                            insertCmd.Parameters.AddWithValue("@cid", companyId);
                            insertCmd.Parameters.AddWithValue("@date", DateTime.Now.ToString("yyyy-MM-dd"));

                            insertCmd.ExecuteNonQuery();
                            lblMsg.Text = "Application submitted successfully!";
                            lblMsg.ForeColor = System.Drawing.Color.Green;
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblMsg.Text = "Error: " + ex.Message;
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}