using System;
using System.Web.UI;
using System.IO;
using System.Data.SqlClient;

namespace Placement_Portal.Student
{
    public partial class StudentRegister : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return;
            }

            decimal cgpa;
            if (!decimal.TryParse(txtCGPA.Text.Trim(), out cgpa))
            {
                lblMessage.Text = "Please enter a valid numeric CGPA!";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string rawPassword = txtPassword.Text.Trim();
            string hashedPassword = DatabaseConnection.GetHash(rawPassword);

            string branch = txtBranch.Text.Trim();
            string skills = txtSkills.Text.Trim();
            string contact = txtContactNo.Text.Trim();
            string resumePath = "";

            // File Upload Logic
            if (fileResume.HasFile)
            {
                try
                {
                    string folderPath = Server.MapPath("~/Uploads/");
                    if (!Directory.Exists(folderPath)) Directory.CreateDirectory(folderPath);

                    string fileName = DateTime.Now.Ticks + "_" + Path.GetFileName(fileResume.FileName);
                    string fullPath = Path.Combine(folderPath, fileName);
                    fileResume.SaveAs(fullPath);
                    resumePath = "~/Uploads/" + fileName;
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "File upload failed: " + ex.Message;
                    return;
                }
            }

            // Database Insertion
            try
            {
                // 2. Changed to SqlConnection
                using (SqlConnection conn = DatabaseConnection.GetConnection())
                {
                    string query = "INSERT INTO students (Name, Email, Password, Branch, CGPA, Skills, ContactNo, ResumePath) " +
                                   "VALUES (@Name, @Email, @Password, @Branch, @CGPA, @Skills, @ContactNo, @ResumePath)";

                    // 3. Changed to SqlCommand
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Name", name);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Password", hashedPassword);
                        cmd.Parameters.AddWithValue("@Branch", branch);
                        cmd.Parameters.AddWithValue("@CGPA", cgpa);
                        cmd.Parameters.AddWithValue("@Skills", skills);
                        cmd.Parameters.AddWithValue("@ContactNo", contact);
                        cmd.Parameters.AddWithValue("@ResumePath", resumePath);

                        conn.Open();
                        cmd.ExecuteNonQuery();
                    }
                }

                lblMessage.ForeColor = System.Drawing.Color.Green;
                lblMessage.Text = "Registration successful! <a href='StudentLogin.aspx'>Login here</a>.";
                pnlRegister.Visible = false;
            }
            catch (Exception ex)
            {
                // SQL Server exception messages are slightly different, but this will still catch errors
                lblMessage.Text = "Database Error: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}