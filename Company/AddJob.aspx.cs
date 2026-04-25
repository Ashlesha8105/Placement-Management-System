using System;
using System.Data.SqlClient;

namespace Placement_Portal.Company
{
    public partial class AddJob : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Optional: Add session check to ensure company is logged in
            if (Session["CompanyID"] == null) Response.Redirect("CompanyLogin.aspx");
        }

        protected void btnPost_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection conn = DatabaseConnection.GetConnection())
                {
                    // 1. REMOVED CompanyID and @cid from this query
                    string query = @"INSERT INTO Company (CompanyName, JobRole, Package, EligibilityCriteria, DriveDate, Location) 
                             VALUES (@cname, @role, @pack, @elig, @date, @loc)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        // 2. REMOVED cmd.Parameters.AddWithValue("@cid", Session["CompanyID"]);

                        cmd.Parameters.AddWithValue("@cname", Session["CompanyName"]);
                        cmd.Parameters.AddWithValue("@role", txtRole.Text.Trim());
                        cmd.Parameters.AddWithValue("@pack", txtPackage.Text.Trim());
                        cmd.Parameters.AddWithValue("@elig", txtCriteria.Text.Trim());
                        cmd.Parameters.AddWithValue("@date", txtDate.Text.Trim());
                        cmd.Parameters.AddWithValue("@loc", txtLoc.Text.Trim());

                        conn.Open();
                        cmd.ExecuteNonQuery();

                        lblMsg.Text = "Job Drive Posted Successfully!";
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