using System;
using System.Web.UI;
using System.Data.SqlClient;

namespace Placement_Portal.Company
{
    public partial class CompanyLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // If already logged in, send to dashboard
            if (Session["CompanyID"] != null)
            {
                Response.Redirect("CompanyDashboard.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string email = txtEmail.Text.Trim();
                string rawPassword = txtPassword.Text.Trim();

                // Hashing logic remains the same
                string hashedInput = DatabaseConnection.GetHash(rawPassword);

                try
                {
                    // 2. Switched to SqlConnection
                    using (SqlConnection conn = DatabaseConnection.GetConnection())
                    {
                        string query = @"SELECT c.CompanyID, c.CompanyName 
                 FROM Company_Login cl 
                 JOIN Company c ON cl.CompanyName = c.CompanyName 
                 WHERE cl.Email=@email AND cl.Password=@pass";

                        // 3. Switched to SqlCommand
                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@email", email);
                            cmd.Parameters.AddWithValue("@pass", hashedInput);

                            conn.Open();

                            // 4. Switched to SqlDataReader
                            using (SqlDataReader dr = cmd.ExecuteReader())
                            {
                                if (dr.Read())
                                {
                                    Session["CompanyID"] = dr["CompanyID"].ToString();
                                    Session["CompanyName"] = dr["CompanyName"].ToString();

                                    Response.Redirect("CompanyDashboard.aspx");
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
                    lblMessage.Text = "Database Error: " + ex.Message;
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }
    }
}