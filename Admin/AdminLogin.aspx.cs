using System;
using System.Web.UI;
using System.Data.SqlClient;

namespace Placement_Portal.Admin
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminID"] != null)
            {
                Response.Redirect("AdminDashboard.aspx");
            }
        }

        protected void btnAdminLogin_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    using (SqlConnection conn = DatabaseConnection.GetConnection())
                    {
                        // Check against the Admin table
                        string query = "SELECT AdminID FROM Admin WHERE Username=@user AND Password=@pass";

                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@user", txtAdminUser.Text.Trim());
                            cmd.Parameters.AddWithValue("@pass", txtAdminPass.Text.Trim()); // Note: Hash this here too if your DB stores hashed passwords!

                            conn.Open();

                            // 2. Fix: ExecuteScalar must be inside the using block
                            object result = cmd.ExecuteScalar();

                            if (result != null)
                            {
                                // Create Admin Session
                                Session["AdminID"] = result.ToString();
                                lblAdminMsg.Text = "";
                                Response.Redirect("AdminDashboard.aspx");
                            }
                            else
                            {
                                lblAdminMsg.Text = "Invalid Admin Credentials!";
                            }
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblAdminMsg.Text = "Error: " + ex.Message;
                }
            }
        }
    }
}