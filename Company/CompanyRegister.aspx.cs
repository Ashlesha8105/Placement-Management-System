using System;
using System.Web.UI;
using System.Data.SqlClient;

namespace Placement_Portal.Company
{
    public partial class CompanyRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                lblMsg.Text = "";
            }
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // Page.IsValid ensures all Validators on the .aspx page passed
            if (Page.IsValid)
            {
                try
                {
                    // 2. Switched to SqlConnection
                    using (SqlConnection conn = DatabaseConnection.GetConnection())
                    {
                        // Insert query for your Company table
                        string query = "INSERT INTO Company_Login (CompanyName, Email, Password) VALUES (@name, @email, @pass)";

                        // 3. Switched to SqlCommand
                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@name", txtCompName.Text.Trim());
                            cmd.Parameters.AddWithValue("@email", txtEmail.Text.Trim());

                            // Password remains hashed
                            string hashedPassword = DatabaseConnection.GetHash(txtPass.Text.Trim());
                            cmd.Parameters.AddWithValue("@pass", hashedPassword);

                            conn.Open();
                            cmd.ExecuteNonQuery();

                            // Show Success Message and Redirect
                            string script = "alert('Registration Successful! Please Login.'); window.location='CompanyLogin.aspx';";
                            ClientScript.RegisterStartupScript(this.GetType(), "Success", script, true);
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                    // SQL Server uses different exception messages, but this logic still holds
                    if (ex.Message.ToLower().Contains("duplicate"))
                    {
                        lblMsg.Text = "This email is already registered!";
                    }
                    else
                    {
                        lblMsg.Text = "Error: " + ex.Message;
                    }
                }
            }
        }
    }
}