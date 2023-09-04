using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class bannerimagemaster : System.Web.UI.Page
    {
        string conString = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (FileUpload1.PostedFile != null)
            {
                try
                {
                    string ImgName = Path.GetFileName(FileUpload1.PostedFile.FileName);

                    FileUpload1.SaveAs(Server.MapPath("~/SavedImages/" + ImgName));

                    SqlConnection con = new SqlConnection(conString);

                    SqlCommand cmd = new SqlCommand("sp_bannerimageupload", con);

                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@ImgName", SqlDbType.NVarChar).Value = TextBox1.Text.Trim();
                    cmd.Parameters.AddWithValue("@Imgstatus", ddlStatus.SelectedValue);
                    cmd.Parameters.AddWithValue("@ImgPath", ImgName);

                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                    con.Dispose();

                    TextBox1.Text = String.Empty;
                    ddlStatus.SelectedIndex = 0;
                }
                catch (Exception ex)
                {
                    Response.Write(ex.Message);
                }
            }
        }
    }
}