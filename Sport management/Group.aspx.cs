using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sport_management
{
    public partial class Group : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString))
                {
                    using (SqlCommand cmd = new SqlCommand("SELECT srno, Sport FROM Events where Event='Group'", con))
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
        }

        protected void btnbutton_Click(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {

                foreach (var files in file.PostedFiles)
            {
                string ex = System.IO.Path.GetFileName(files.FileName);
                Guid g = Guid.NewGuid();
                string imgName = g + ex;
                string pathimg = "Payment/" + imgName;
                //saving original img
                files.SaveAs(Server.MapPath(pathimg));
                string Event = "Group";

                con.Close();

                SqlCommand cmd = new SqlCommand("insert into registration values (@Event,@Sport,@name,@email,@contact,@massege,@photos,@course,@year)", con);
                cmd.Parameters.AddWithValue("@Event", Event);
                cmd.Parameters.AddWithValue("@Sport", ddlSport.Text);
                cmd.Parameters.AddWithValue("@name", txtname.Text);
                cmd.Parameters.AddWithValue("@email", txtemail.Text);
                cmd.Parameters.AddWithValue("@contact", txtcontact.Text);
                cmd.Parameters.AddWithValue("@massege", txtmsg.Text);
                cmd.Parameters.AddWithValue("@photos", "../" + pathimg);
                cmd.Parameters.AddWithValue("@course", ddlcourse.Text);
                cmd.Parameters.AddWithValue("@year", ddlyear.Text);

                con.Open();
                cmd.ExecuteNonQuery();

                txtname.Text = "";
                txtemail.Text = "";
                txtcontact.Text = "";
                Response.Write("<script>alert('You are registered successfully..!')</script>");
                //Response.Redirect("Login.aspx");
            }
            }
            else
            {
                Response.Redirect("Login.aspx?type=Group");
            }
        }
    }
}