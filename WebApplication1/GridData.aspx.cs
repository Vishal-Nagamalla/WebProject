using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class GridData : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        SqlConnection con;
        SqlDataAdapter adapt;
        DataTable dt;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ShowData();
            }
        }

        protected void ShowData()
        {
            dt = new DataTable();
            con = new SqlConnection(cs);
            con.Open();
            adapt = new SqlDataAdapter("SELECT UserId, FullName, Birthday, Gender, Address, Country, State, Username, Password FROM UserRegistration", con);
            adapt.Fill(dt);
            if (dt.Rows.Count > 0)
            {
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
            con.Close();
        }

        protected void GridView1_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            ShowData();

            // Get the UserId for the row being edited
            int userId = Convert.ToInt32(GridView1.DataKeys[e.NewEditIndex].Value);

            // Get the CountryId for the user from the database
            int countryId = GetCountryIdFromDatabase(userId);

            // Store the CountryId in the ViewState
            ViewState["SelectedCountryId"] = countryId;
        }

        // This method retrieves the CountryId for the given UserId from the database
        private int GetCountryIdFromDatabase(int userId)
        {
            int countryId = 0;
            try
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT CountryId FROM UserRegistration WHERE UserId = @UserId", con);
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    object result = cmd.ExecuteScalar();
                    if (result != null && int.TryParse(result.ToString(), out int parsedCountryId))
                    {
                        countryId = parsedCountryId;
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle the exception (you can log it, show an error message, etc.)
                Response.Write("Error occurred: " + ex.Message);
            }
            return countryId;
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[index];
                Response.Redirect("~/CountryState.aspx?UserId=" + row.Cells[1].Text);
            }
        }
    }
}