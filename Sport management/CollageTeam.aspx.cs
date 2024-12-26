using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing.Printing;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace Sport_management
{
    public partial class CollageTeam : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT srno, Sport FROM Events where Event = 'Group'", con))
                    {
                        cmd.CommandType = CommandType.Text;
                        con.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            ddlSport.DataSource = reader;
                            ddlSport.DataTextField = "Sport";
                            ddlSport.DataValueField = "Sport";
                            ddlSport.DataBind();
                        }
                    }
                }
                ddlSport.Items.Insert(0, new ListItem("--Select Sport--", ""));
            }

            if (!this.IsPostBack)
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT srno, Sport FROM Events where Event = 'Individual'", con))
                    {
                        cmd.CommandType = CommandType.Text;
                        con.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            ddlindi.DataSource = reader;
                            ddlindi.DataTextField = "Sport";
                            ddlindi.DataValueField = "Sport";
                            ddlindi.DataBind();
                        }
                    }
                }
                ddlindi.Items.Insert(0, new ListItem("--Select Sport--", ""));
            }

        }

        protected void btn_ddlV_Click(object sender, EventArgs e)
        {
            try
            {
                string selectedSport = ddlSport.SelectedItem.Text;

                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString))
                {
                    string sqlQuery = "SELECT * FROM RegAdmin WHERE Sport = @Sport and Event ='Group'";

                    using (SqlCommand cmd = new SqlCommand(sqlQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@Sport", selectedSport);

                        con.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            Sevent.Text = string.Empty;

                            while (reader.Read())
                            {
                                Sevent.Text += "<div class='col-lg-3'><div class='card'><div class='card-body'><h5 class='card-header' style='text-align: center'>" + reader.GetValue(3) + "</h5><h6 class='card-title'>Cource:</h6><p style='text-align: center'>" + reader.GetValue(7) + " - " + reader.GetValue(8) + "</p><h6 class='card-title'>Sport:</h6><p style='text-align: center'>" + reader.GetValue(2) + "</p><h6 class='card-title'>Players:</h6><div style='text-align: center' class='quill-editor-bubble'>" + reader.GetValue(6) + "</div></div></div></div>";
                            }
                        }
                    }
                }

                using (SqlConnection con2 = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr2"].ConnectionString))
                {
                    string sqlQuery2 = "SELECT * FROM Events WHERE Sport = @Sport";

                    using (SqlCommand cmd2 = new SqlCommand(sqlQuery2, con2))
                    {
                        cmd2.Parameters.AddWithValue("@Sport", selectedSport);

                        con2.Open();
                        using (SqlDataReader reader2 = cmd2.ExecuteReader())
                        {
                            showfees.Text = string.Empty;
                            while (reader2.Read())
                            {
                                showfees.Text += "<h2 style='text-align:center; color: orange;margin-top:50px;'>Entry Fees for " + reader2.GetValue(2) + " :" + reader2.GetValue(3) + "/-</h2>";
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }
        protected void btnGroup_Click(object sender, EventArgs e)
        {
            try
            {
                string selectedSport = ddlindi.SelectedItem.Text;
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString))
                {
                    string sqlQuery = "SELECT * FROM RegAdmin WHERE Sport = @Sport and Event ='Individual'";
                    using (SqlCommand cmd = new SqlCommand(sqlQuery, con))
                    {
                        cmd.Parameters.AddWithValue("@Sport", selectedSport);
                        con.Open();
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            Sevent.Text = string.Empty;
                            while (reader.Read())
                            {
                                Sevent.Text += "<div class='col-lg-3'><div class='card'><div class='card-body'><h6 class='card-title'>Name:</h6><p style='text-align:center'>" + reader.GetValue(3) + "</p><h6 class='card-title'>Cource:</h6><p style='text-align:center'>" + reader.GetValue(7) + " - " + reader.GetValue(8) + "</p><h6 class='card-title'>Sport:</h6><p style='text-align:center'>" + reader.GetValue(2) + " </p></div></div></div>";
                            }
                        }
                    }
                }

                using (SqlConnection con2 = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr2"].ConnectionString))
                {
                    string sqlQuery2 = "SELECT * FROM Events WHERE Sport = @Sport";

                    using (SqlCommand cmd2 = new SqlCommand(sqlQuery2, con2))
                    {
                        cmd2.Parameters.AddWithValue("@Sport", selectedSport);

                        con2.Open();
                        using (SqlDataReader reader2 = cmd2.ExecuteReader())
                        {
                            showfees.Text = string.Empty;
                            while (reader2.Read())
                            {
                                showfees.Text += "<h2 style='text-align:center; color: orange;margin-top:50px;'>Entry Fees for " + reader2.GetValue(2) + " :" + reader2.GetValue(3) + "/-</h2>";
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
            }

        }
                           }
}
