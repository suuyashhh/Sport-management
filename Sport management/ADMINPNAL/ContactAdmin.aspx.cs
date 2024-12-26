using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Sport_management.ADMINPNAL
{
    public partial class ContactAdmin : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                gridv.DataSource = gvuser();
                gridv.DataBind();
            }
        }
        protected DataSet gvuser()
        {
            conn.Close();
            SqlCommand sql = new SqlCommand("select * from contact", conn);
            conn.Open();
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(sql);
            adapter.Fill(ds);
            return ds;
        }

        protected void gridv_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gridv.EditIndex = e.NewEditIndex;
            gridv.DataSource = gvuser();
            gridv.DataBind();
        }

        protected void gridv_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gridv.EditIndex = -1;
            gridv.DataSource = gvuser();
            gridv.DataBind();
        }

        protected void gridv_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridViewRow row = gridv.Rows[e.RowIndex];
            string name = (row.FindControl("txtname") as TextBox).Text;
            string email = (row.FindControl("txtemail") as TextBox).Text;
            string subject = (row.FindControl("txtsubject") as TextBox).Text;
            string message = (row.FindControl("txtmessage") as TextBox).Text;

            conn.Close();
            SqlCommand cmd = new SqlCommand("update contact set name=@name,email=@email,subject=@subject,message=@message where srno=@srno", conn);
            cmd.Parameters.AddWithValue("@name", name);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@subject", subject);
            cmd.Parameters.AddWithValue("@message", message);
            cmd.Parameters.AddWithValue("@srno", gridv.DataKeys[e.RowIndex].Value);
            conn.Open();
            cmd.ExecuteNonQuery();
            gridv.EditIndex = -1;
            gridv.DataSource = gvuser();
            gridv.DataBind();
        }

        protected void gridv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            conn.Close();
            SqlCommand sql = new SqlCommand("delete from contact where srno='" + gridv.DataKeys[e.RowIndex].Value + "' ", conn);
            conn.Open();
            sql.ExecuteNonQuery();
            gridv.EditIndex = -1;
            gridv.DataSource = gvuser();
            gridv.DataBind();
        }
    }
}