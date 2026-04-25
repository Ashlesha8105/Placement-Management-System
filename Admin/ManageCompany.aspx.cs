using System;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

namespace Placement_Portal.Admin
{
    public partial class ManageCompany : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminID"] == null) Response.Redirect("AdminLogin.aspx");
            if (!IsPostBack) LoadCompanies();
        }

        // --- 1. Load the Jobs List ---
        private void LoadCompanies()
        {
            // 2. Switched to SqlConnection
            using (SqlConnection conn = DatabaseConnection.GetConnection())
            {
                // 3. Switched to SqlDataAdapter
                SqlDataAdapter da = new SqlDataAdapter("SELECT * FROM Company", conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                gvCompanies.DataSource = dt;
                gvCompanies.DataBind();
            }
        }

        protected void btnAddJob_Click(object sender, EventArgs e)
        {
            try
            {
                // 4. Switched to SqlConnection
                using (SqlConnection conn = DatabaseConnection.GetConnection())
                {
                    string query = "INSERT INTO Company (CompanyName, JobRole, Package, EligibilityCriteria, DriveDate, Location) " +
                                   "VALUES (@name, @role, @pack, @elig, @date, @loc)";

                    // 5. Switched to SqlCommand
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@name", txtCompName.Text.Trim());
                        cmd.Parameters.AddWithValue("@role", txtRole.Text.Trim());
                        cmd.Parameters.AddWithValue("@pack", txtPackage.Text.Trim());
                        cmd.Parameters.AddWithValue("@elig", txtCriteria.Text.Trim());
                        cmd.Parameters.AddWithValue("@date", txtDate.Text.Trim());
                        cmd.Parameters.AddWithValue("@loc", txtLoc.Text.Trim());

                        conn.Open();
                        cmd.ExecuteNonQuery();

                        lblMsg.ForeColor = System.Drawing.Color.Green;
                        lblMsg.Text = "Job Drive Posted Successfully!";

                        // Clear fields and Refresh Grid
                        txtCompName.Text = txtRole.Text = txtPackage.Text = "";
                        LoadCompanies();
                    }
                }
            }
            catch (Exception ex)
            {
                lblMsg.ForeColor = System.Drawing.Color.Red;
                lblMsg.Text = "Error: " + ex.Message;
            }
        }

        // --- 3. DELETE JOB Logic ---
        protected void gvCompanies_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int companyId = Convert.ToInt32(gvCompanies.DataKeys[e.RowIndex].Value);

            using (SqlConnection conn = DatabaseConnection.GetConnection())
            {
                conn.Open();

                // 🔹 Step 1: Check if applications exist
                SqlCommand checkCmd = new SqlCommand(
                    "SELECT COUNT(*) FROM applications WHERE CompanyID=@id", conn);
                checkCmd.Parameters.AddWithValue("@id", companyId);

                int count = (int)checkCmd.ExecuteScalar();

                if (count > 0)
                {
                    // ❌ Prevent delete if dependent data exists
                    lblMsg.ForeColor = System.Drawing.Color.Red;
                    lblMsg.Text = "Cannot delete company. Applications exist for this company.";
                    return;
                }

                // 🔹 Step 2: Delete company safely
                SqlCommand deleteCmd = new SqlCommand(
                    "DELETE FROM Company WHERE CompanyID=@id", conn);
                deleteCmd.Parameters.AddWithValue("@id", companyId);

                deleteCmd.ExecuteNonQuery();

                lblMsg.ForeColor = System.Drawing.Color.Green;
                lblMsg.Text = "Company deleted successfully!";
            }

            LoadCompanies(); // Refresh grid
        }
    }
}