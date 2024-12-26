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

namespace Sport_management.ADMINPNAL
{
    public partial class IndividualAdmin : System.Web.UI.Page
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
            SqlCommand sql = new SqlCommand("select * from Events where Event='Individual'", conn);
            conn.Open();
            DataSet ds = new DataSet();
            SqlDataAdapter adapter = new SqlDataAdapter(sql);
            adapter.Fill(ds);
            return ds;
        }
        protected void btnnonveg_Click(object sender, EventArgs e)
        {
            string Event = "Individual";
            conn.Close();
            SqlCommand cmd = new SqlCommand("insert into Events values (@Event,@Sport,@Fees)", conn);
            cmd.Parameters.AddWithValue("@Event", Event);
            cmd.Parameters.AddWithValue("@Sport", txtsport.Text);
            cmd.Parameters.AddWithValue("@Fees", txtfees.Text);
            conn.Open();
            cmd.ExecuteNonQuery();
            gridv.DataSource = gvuser();
            gridv.DataBind();
            txtsport.Text = "";
            txtfees.Text = "";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "SweetAlert", "swal('ADDED EVENT SUCCESSFULLY..!','','success');", true);
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
            string sport = (row.FindControl("txtsport") as TextBox).Text;
            string fees = (row.FindControl("txtfees") as TextBox).Text;
            conn.Close();
            SqlCommand cmd = new SqlCommand("update Events set sport=@Sport,fees=@Fees where srno=@srno", conn);
            cmd.Parameters.AddWithValue("@Sport", sport);
            cmd.Parameters.AddWithValue("@Fees", fees);
            cmd.Parameters.AddWithValue("@srno", gridv.DataKeys[e.RowIndex].Value);
            conn.Open();
            cmd.ExecuteNonQuery();
            gridv.EditIndex = -1;
            gridv.DataSource = gvuser();
            gridv.DataBind();
        }
        protected void gridv_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                string sportValue = string.Empty;
                using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString))
                {
                    conn.Open();
                    GridViewRow row = gridv.Rows[e.RowIndex];
                    if (row != null)
                    {
                    sportValue = ((Label)row.FindControl("lblSport")).Text;
                    }
                    SqlCommand sql = new SqlCommand("DELETE FROM Events WHERE srno = @Srno", conn);
                    sql.Parameters.AddWithValue("@Srno", gridv.DataKeys[e.RowIndex].Value);
                    sql.ExecuteNonQuery();
                    SqlCommand sql2 = new SqlCommand("DELETE FROM RegAdmin WHERE Sport = @SportValue", conn);
                    sql2.Parameters.AddWithValue("@SportValue", sportValue);
                    sql2.ExecuteNonQuery();
                    gridv.EditIndex = -1;
                    gridv.DataSource = gvuser();
                    gridv.DataBind();
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
}