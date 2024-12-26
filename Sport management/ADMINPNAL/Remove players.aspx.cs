using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sport_management.ADMINPNAL
{
    public partial class Remove_players : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDropDownLists();
                BindGridView();
                BindGridViewGroup();
            }
        }

        private void BindDropDownLists()
        {
            // Bind ddlSport
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT srno, Sport FROM Events WHERE Event = 'Group'", conn))
                {
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        ddlSport.DataSource = reader;
                        ddlSport.DataTextField = "Sport";
                        ddlSport.DataValueField = "srno";
                        ddlSport.DataBind();
                    }
                }
            }

            ddlSport.Items.Insert(0, new ListItem("--Select Sport--", ""));


            // Bind ddlindi
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT srno, Sport FROM Events WHERE Event = 'Individual'", conn))
                {
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        ddlindi.DataSource = reader;
                        ddlindi.DataTextField = "Sport";
                        ddlindi.DataValueField = "srno"; // Use the correct value field
                        ddlindi.DataBind();
                    }
                }
            }

            ddlindi.Items.Insert(0, new ListItem("--Select Sport--", ""));
        }

        private void BindGridView()
        {
            string selectedSport = ddlindi.SelectedItem.Text; // Use SelectedValue to get the value, not SelectedItem.Text

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM RegAdmin WHERE Sport = @Sport", conn);
                cmd.Parameters.AddWithValue("@Sport", selectedSport);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                gridv.DataSource = dt;
                gridv.DataBind();
            }
        }

        private void BindGridViewGroup()
        {
            string selectedSport = ddlSport.SelectedItem.Text; // Use SelectedValue to get the value, not SelectedItem.Text

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM RegAdmin WHERE Sport = @Sport", conn);
                cmd.Parameters.AddWithValue("@Sport", selectedSport);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GridGroup.DataSource = dt;
                GridGroup.DataBind();
            }
        }
        protected void btn_ddlV_Click(object sender, EventArgs e)
        {
            BindGridView();
        }

        protected void gridv_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gridv.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        protected void gridv_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gridv.EditIndex = -1;
            BindGridView();
        }

        protected void gridv_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gridv.Rows[e.RowIndex];
            TextBox txtName = (TextBox)row.FindControl("txtname");
            TextBox txtSport = (TextBox)row.FindControl("txtsport");
            TextBox txtCont = (TextBox)row.FindControl("txtcont");
            TextBox txtCourse = (TextBox)row.FindControl("txtcourse");
            TextBox txtYear = (TextBox)row.FindControl("txtyear");

            // Assuming you have a primary key column named "srno"
            int srno = Convert.ToInt32(gridv.DataKeys[e.RowIndex].Value);

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("UPDATE RegAdmin SET name = @Name, Sport = @Sport, contact = @Contact, course = @Course, year = @Year WHERE srno = @Srno", conn);
                cmd.Parameters.AddWithValue("@Name", txtName.Text);
                cmd.Parameters.AddWithValue("@Sport", txtSport.Text);
                cmd.Parameters.AddWithValue("@Contact", txtCont.Text);
                cmd.Parameters.AddWithValue("@Course", txtCourse.Text);
                cmd.Parameters.AddWithValue("@Year", txtYear.Text);
                cmd.Parameters.AddWithValue("@Srno", srno);
                cmd.ExecuteNonQuery();
            }

            gridv.EditIndex = -1;
            BindGridView();
        }

        protected void gridv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string srno = gridv.DataKeys[e.RowIndex].Value.ToString();

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM RegAdmin WHERE srno = @Srno", con);
                cmd.Parameters.AddWithValue("@Srno", srno);
                cmd.ExecuteNonQuery();
            }

            BindGridView();
        }

        protected void btnGroup_Click(object sender, EventArgs e)
        {

            BindGridViewGroup();
        }

        protected void GridGroup_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridGroup.EditIndex = e.NewEditIndex;
            BindGridViewGroup();
        }

        protected void GridGroup_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridGroup.EditIndex = -1;
            BindGridViewGroup();
        }

        protected void GridGroup_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = GridGroup.Rows[e.RowIndex];
            TextBox txtName = (TextBox)row.FindControl("txtname");
            TextBox txtSport = (TextBox)row.FindControl("txtsport");
            TextBox txtCont = (TextBox)row.FindControl("txtcont");
            TextBox txtmsg = (TextBox)row.FindControl("txtmsg");
            TextBox txtCourse = (TextBox)row.FindControl("txtcourse");
            TextBox txtYear = (TextBox)row.FindControl("txtyear");

            // Assuming you have a primary key column named "srno"
            int srno = Convert.ToInt32(GridGroup.DataKeys[e.RowIndex].Value);

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString))
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("UPDATE RegAdmin SET name = @Name, Sport = @Sport, contact = @Contact, message=@message, course = @Course, year = @Year WHERE srno = @Srno", conn);
                cmd.Parameters.AddWithValue("@Name", txtName.Text);
                cmd.Parameters.AddWithValue("@Sport", txtSport.Text);
                cmd.Parameters.AddWithValue("@Contact", txtCont.Text);
                cmd.Parameters.AddWithValue("@message", txtmsg.Text);
                cmd.Parameters.AddWithValue("@Course", txtCourse.Text);
                cmd.Parameters.AddWithValue("@Year", txtYear.Text);
                cmd.Parameters.AddWithValue("@Srno", srno);
                cmd.ExecuteNonQuery();
            }

            GridGroup.EditIndex = -1;
            BindGridViewGroup();
        }

        protected void GridGroup_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string srno = GridGroup.DataKeys[e.RowIndex].Value.ToString();

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("DELETE FROM RegAdmin WHERE srno = @Srno", con);
                cmd.Parameters.AddWithValue("@Srno", srno);
                cmd.ExecuteNonQuery();
            }

            BindGridViewGroup();
        }
    }
}