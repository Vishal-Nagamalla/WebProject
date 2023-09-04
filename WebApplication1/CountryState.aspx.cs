using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class CountryState : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["UserId"] != null)
                {
                    int userId = Convert.ToInt32(Request.QueryString["UserId"]);
                    FillFormData(userId);
                }

                //Call countries DropDownList on page load event
                BindContriesDropDownList();

                BindBannerImages();
            }
        }
        private void BindBannerImages()
        {
            try
            {
                string connectionString = WebConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    using (SqlCommand cmd = new SqlCommand("SELECT ImgName, ImgPath FROM bannerimageupload WHERE Imgstatus = '1'", connection))
                    {
                        using (SqlDataAdapter adapter = new SqlDataAdapter(cmd))
                        {
                            DataTable dt = new DataTable();
                            adapter.Fill(dt);

                            rptBannerImages.DataSource = dt;
                            rptBannerImages.DataBind();
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions
                // ...
            }
        }

        protected string GetActiveClass(int ItemIndex)
        {
            if (ItemIndex == 0)
            {
                return "active";
            }
            else
            {
                return "";
            }
        }
        private void FillFormData(int userId)
        {
            try
            {
                con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString);
                con.Open();

                SqlCommand cmd = new SqlCommand("SELECT * FROM UserRegistration WHERE UserId = @UserId", con);
                cmd.Parameters.AddWithValue("@UserId", userId);

                DataTable dt = new DataTable();
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                txtFullName.Text = dt.Rows[0][1].ToString();
                txtBirthday.Text = dt.Rows[0][2].ToString();
                rbtGender.SelectedValue = dt.Rows[0][3].ToString();
                txtAddress.Text = dt.Rows[0][4].ToString();
                ddlCountry.SelectedValue = dt.Rows[0][5].ToString();
                ddlState.SelectedValue = dt.Rows[0][6].ToString();
                txtUsername.Text = dt.Rows[0][7].ToString();
                txtPassword.Text = dt.Rows[0][8].ToString();
            }
            catch (Exception ex)
            {
                // Handle any exceptions here
            }
            finally
            {
                con.Close();
            }
        }

        protected void ddlCountry_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                if (ddlCountry.SelectedIndex > 0) // Check if a valid item is selected
                {
                    int CountryId = Convert.ToInt32(ddlCountry.SelectedValue);
                    //Select all States corresponding to the selected Country
                    SqlDataAdapter adp = new SqlDataAdapter("GetStatesByCountryId", con);
                    adp.SelectCommand.CommandType = CommandType.StoredProcedure;
                    adp.SelectCommand.Parameters.AddWithValue("@CountryId", CountryId);
                    DataSet ds = new DataSet();
                    adp.Fill(ds);
                    ddlState.DataSource = ds;
                    ddlState.DataTextField = "State_Name";
                    ddlState.DataValueField = "State_Id_Pk";
                    ddlState.DataBind();
                    ddlState.Items.Insert(0, new ListItem("--Select--", "0"));
                }
            }
            catch (Exception ex)
            {
                //Printing any exception if occurred.
                Response.Write("Error occurred: " + ex.Message.ToString());
            }
            finally
            {
                //Close the connection
                con.Close();
            }
        }


        protected void BindContriesDropDownList()
        {
            try
            {
                SqlDataAdapter adp = new SqlDataAdapter("GetCountries", con);
                adp.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataSet ds = new DataSet();
                adp.Fill(ds);
                ddlCountry.DataSource = ds;
                ddlCountry.DataTextField = "Country_Name";
                ddlCountry.DataValueField = "Country_Id_Pk";
                ddlCountry.DataBind();
                ddlCountry.Items.Insert(0, new ListItem("--Select--", "0"));

                // Check if the ViewState contains the selected CountryId
                if (ViewState["SelectedCountryId"] != null)
                {
                    int selectedCountryId = Convert.ToInt32(ViewState["SelectedCountryId"]);
                    // Find the item with the matching value and set it as selected
                    ListItem selectedItem = ddlCountry.Items.FindByValue(selectedCountryId.ToString());
                    if (selectedItem != null)
                    {
                        selectedItem.Selected = true;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write("Error occurred: " + ex.Message.ToString());
            }
            finally
            {
                con.Close();
            }
        }



        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                // Create and open the SQL connection
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString))
                {
                    con.Open();

                    // Create the SQL command and set the parameters
                    using (SqlCommand cmd = new SqlCommand("insertRegistration", con))
                    {
                        cmd.CommandType = CommandType.StoredProcedure;

                        cmd.Parameters.AddWithValue("@FullName", txtFullName.Text);
                        cmd.Parameters.AddWithValue("@Birthday", txtBirthday.Text);
                        cmd.Parameters.AddWithValue("@Gender", rbtGender.SelectedValue);
                        cmd.Parameters.AddWithValue("@Address", txtAddress.Text);
                        cmd.Parameters.AddWithValue("@Country", ddlCountry.SelectedValue);
                        cmd.Parameters.AddWithValue("@State", ddlState.SelectedValue);
                        cmd.Parameters.AddWithValue("@Username", txtUsername.Text);
                        cmd.Parameters.AddWithValue("@Password", txtPassword.Text);

                        // Execute the query
                        cmd.ExecuteNonQuery();
                    }
                }

                // Display success message
                lblResult.Text = "Registration successful!";
                lblResult.ForeColor = System.Drawing.Color.Green;

                // Reset the form
                ClearForm();
            }
            catch (Exception ex)
            {
                lblResult.Text = "Error occurred: " + ex.Message;
                lblResult.ForeColor = System.Drawing.Color.Red;
            }
        }

        private void ClearForm()
        {
            txtFullName.Text = string.Empty;
            txtBirthday.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtUsername.Text = string.Empty;
            txtPassword.Text = string.Empty;
            ddlCountry.SelectedIndex = 0;
            ddlState.SelectedIndex = 0;
        }
    }
}
