using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sport_management
{
    public partial class Login : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnbutton_Click(object sender, EventArgs e)
        {
            con.Close();

            SqlCommand sqlCommand = new SqlCommand("select * from Login where abcid=@abcid and pass=@pass", con);
            sqlCommand.Parameters.AddWithValue("@abcid", txtcontact.Text);
            sqlCommand.Parameters.AddWithValue("@pass", txtpass.Text);
            con.Open();
            SqlDataReader reader = sqlCommand.ExecuteReader();
            if (reader.HasRows)
            {
                reader.Read();
                Session["username"] = reader.GetValue(3);
                txtcontact.Text = "";
                txtpass.Text = "";
                if (Request.QueryString["type"] != null)
                {
                    if (Request.QueryString["type"] == "Individual")
                    {
                        Response.Redirect("Individual.aspx");
                    }
                    else if (Request.QueryString["type"] == "Group")
                    {
                        Response.Redirect("Group.aspx");
                    }else if (Request.QueryString["type"] == "InduvidualGroupEvent")
                    {
                        Response.Redirect("IndividualAdmin.aspx");
                    }
                    
                }
                else
                {
                    Response.Redirect("Home.aspx");

                }

            }
            else
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Invalid Login..!','','error');", true);
            }
        }
    }
}