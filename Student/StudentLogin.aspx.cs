using System;
using System.Web.UI;
using System.Data.SqlClient;

namespace Placement_Portal.Student
{
    public partial class StudentLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["StudentID"] != null)
            {
                Response.Redirect("StudentDashboard.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string email = txtEmail.Text.Trim();
                string rawPassword = txtPassword.Text.Trim();
                string hashedInput = DatabaseConnection.GetHash(rawPassword);

                try
                {
                    // 2. Switched to SqlConnection
                    using (SqlConnection conn = DatabaseConnection.GetConnection())
                    {
                        string query = "SELECT StudentID, Name FROM Students WHERE Email=@Email AND Password=@Password";

                        // 3. Switched to SqlCommand
                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@Email", email);
                            cmd.Parameters.AddWithValue("@Password", hashedInput);

                            conn.Open();

                            // 4. Switched to SqlDataReader
                            using (SqlDataReader dr = cmd.ExecuteReader())
                            {
                                if (dr.Read())
                                {
                                    Session["StudentID"] = dr["StudentID"].ToString();
                                    Session["StudentName"] = dr["Name"].ToString();

                                    Response.Redirect("StudentDashboard.aspx");
                                }
                                else
                                {
                                    lblMessage.Text = "Invalid Email or Password!";
                                    lblMessage.ForeColor = System.Drawing.Color.Red;
                                }
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}