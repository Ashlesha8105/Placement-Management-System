using System;
using System.IO;
using System.Data.SqlClient;

namespace Placement_Portal.Student
{
    public partial class UploadResume : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Optional: Add session check here if you haven't already
            if (Session["StudentID"] == null) Response.Redirect("StudentLogin.aspx");
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (fileResume.HasFile)
            {
                try
                {
                    string studentId = Session["StudentID"].ToString();
                    string folderPath = Server.MapPath("~/Uploads/");

                    // Ensure folder exists
                    if (!Directory.Exists(folderPath)) Directory.CreateDirectory(folderPath);

                    string fileName = "Resume_" + studentId + "_" + Path.GetFileName(fileResume.FileName);
                    string fullPath = Path.Combine(folderPath, fileName);
                    fileResume.SaveAs(fullPath);
                    string dbPath = "~/Uploads/" + fileName;

                    // 2. Switched to SqlConnection
                    using (SqlConnection conn = DatabaseConnection.GetConnection())
                    {
                        string query = "UPDATE Students SET ResumePath=@path WHERE StudentID=@id";

                        // 3. Switched to SqlCommand
                        using (SqlCommand cmd = new SqlCommand(query, conn))
                        {
                            cmd.Parameters.AddWithValue("@path", dbPath);
                            cmd.Parameters.AddWithValue("@id", studentId);

                            conn.Open();
                            cmd.ExecuteNonQuery();
                        }
                    }
                    lblMsg.Text = "Resume updated successfully!";
                    lblMsg.ForeColor = System.Drawing.Color.Green;
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