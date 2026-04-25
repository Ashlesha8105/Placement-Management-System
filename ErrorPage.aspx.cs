using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Placement_Portal
{
    public partial class ErrorPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            // Redirect based on who is logged in, or default to login/home
            if (Session["StudentID"] != null)
                Response.Redirect("~/Student/StudentDashboard.aspx");
            else
                Response.Redirect("~/Default.aspx");
        }
    }
}