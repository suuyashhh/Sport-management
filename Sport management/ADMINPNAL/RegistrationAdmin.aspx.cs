using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sport_management.ADMINPNAL
{
    public partial class Registration : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gridv.DataSource = gvuser();
                gridv.DataBind();
            }
            if (!IsPostBack)
            {

                GridView1.DataSource = gvusergroup();
                GridView1.DataBind();
            }
        }

        protected DataSet gvuser()
        {
            con.Close();
            SqlCommand sql = new SqlCommand("select * from registration where Event='Individual'", con);
            con.Open();
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(sql);
            adapter.Fill(ds);
            return ds;
        }

        protected DataSet gvusergroup()
        {
            con.Close();
            SqlCommand sql = new SqlCommand("select * from registration where Event='Group'", con);
            con.Open();
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(sql);
            adapter.Fill(ds);
            return ds;
        }
       

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "InsertData")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = GridView1.Rows[rowIndex];

                string eventName = ((Label)row.FindControl("lblevent")).Text;
                string sport = ((Label)row.FindControl("lblsport")).Text;
                string name = ((Label)row.FindControl("lblname")).Text;
                string email = ((Label)row.FindControl("lblemail")).Text;
                string contact = ((Label)row.FindControl("lblcont")).Text;
                string msg = ((Label)row.FindControl("lblmsg")).Text;
                string course = ((Label)row.FindControl("lblcourse")).Text;
                string year = ((Label)row.FindControl("lblyear")).Text;

                string connectionString = "Data Source=Lenovo\\SQLEXPRESS;Initial Catalog=Sport_management;Integrated Security=True;";
                try
                {
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        string insertQuery = "INSERT INTO RegAdmin (Event, Sport, name, email, contact, message, course, year) " +
                                                "VALUES (@Event, @Sport, @name, @email, @contact, @message, @course, @year)";
                        using (SqlCommand cmd = new SqlCommand(insertQuery, connection))
                        {
                            cmd.Parameters.AddWithValue("@Event", eventName);
                            cmd.Parameters.AddWithValue("@Sport", sport);
                            cmd.Parameters.AddWithValue("@name", name);
                            cmd.Parameters.AddWithValue("@email", email);
                            cmd.Parameters.AddWithValue("@contact", contact);
                            cmd.Parameters.AddWithValue("@message", msg);
                            cmd.Parameters.AddWithValue("@course", course);
                            cmd.Parameters.AddWithValue("@year", year);

                            connection.Open();
                            cmd.ExecuteNonQuery();
                        }
                    }

                    // Delete the row from the registration table
                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        con.Open();
                        SqlCommand sql = new SqlCommand("DELETE FROM registration WHERE srno=@srno", con);
                        sql.Parameters.AddWithValue("@srno", GridView1.DataKeys[rowIndex].Value);
                        sql.ExecuteNonQuery();
                    }

                    GridView1.DataSource = gvusergroup();
                    GridView1.DataBind();

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "SweetAlert", "swal('ADDED PLAYER SUCCESSFULLY..!','','success');", true);
                }
                catch (Exception ex)
                {
                }
            }

        }

        protected void gridv_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "InsertData")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gridv.Rows[rowIndex];

                string eventName = ((Label)row.FindControl("lblevent")).Text;
                string sport = ((Label)row.FindControl("lblsport")).Text;
                string name = ((Label)row.FindControl("lblname")).Text;
                string email = ((Label)row.FindControl("lblemail")).Text;
                string contact = ((Label)row.FindControl("lblcont")).Text;
                string course = ((Label)row.FindControl("lblcourse")).Text;
                string year = ((Label)row.FindControl("lblyear")).Text;

                string connectionString = "Data Source=Lenovo\\SQLEXPRESS;Initial Catalog=Sport_management;Integrated Security=True;";
                try
                {
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        string insertQuery = "INSERT INTO RegAdmin (Event, Sport, name, email, contact, course, year) " +
                                                "VALUES (@Event, @Sport, @name, @email, @contact, @course, @year)";
                        using (SqlCommand cmd = new SqlCommand(insertQuery, connection))
                        {
                            cmd.Parameters.AddWithValue("@Event", eventName);
                            cmd.Parameters.AddWithValue("@Sport", sport);
                            cmd.Parameters.AddWithValue("@name", name);
                            cmd.Parameters.AddWithValue("@email", email);
                            cmd.Parameters.AddWithValue("@contact", contact);
                            cmd.Parameters.AddWithValue("@course", course);
                            cmd.Parameters.AddWithValue("@year", year);


                            connection.Open();
                            cmd.ExecuteNonQuery();
                        }
                    }

                    // Delete the row from the registration table
                    using (SqlConnection con = new SqlConnection(connectionString))
                    {
                        con.Open();
                        SqlCommand sql = new SqlCommand("DELETE FROM registration WHERE srno=@srno", con);
                        sql.Parameters.AddWithValue("@srno", gridv.DataKeys[rowIndex].Value);
                        sql.ExecuteNonQuery();
                    }

                    // Rebind GridView after deletion
                    gridv.DataSource = gvuser(); // Update this line with the correct data source method
                    gridv.DataBind();

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "SweetAlert", "swal('ADDED PLAYER SUCCESSFULLY..!','','success');", true);
                }
                catch (Exception ex)
                {
                    // Handle the exception, log it, or display an error message
                }
            }
        }

        protected void gridv_RowDeleting1(object sender, GridViewDeleteEventArgs e)
        {
            con.Close();
            SqlCommand sql = new SqlCommand("delete from registration where srno='" + gridv.DataKeys[e.RowIndex].Value + "' ", con);
            con.Open();
            sql.ExecuteNonQuery();
            gridv.EditIndex = -1;
            gridv.DataSource = gvuser();
            gridv.DataBind();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            con.Close();
            SqlCommand sql = new SqlCommand("delete from registration where srno='" + GridView1.DataKeys[e.RowIndex].Value + "' ", con);
            con.Open();
            sql.ExecuteNonQuery();
            GridView1.EditIndex = -1;
            GridView1.DataSource = gvusergroup();
            GridView1.DataBind();
        }
    }
}