using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Sport_management
{
    public partial class Contact : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connstr"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void BTN_SUBMIT_Click(object sender, EventArgs e)
        {
            con.Close();
            SqlCommand cmd = new SqlCommand("insert into contact values (@name,@email,@subject,@message)", con);
            cmd.Parameters.AddWithValue("@name", name.Text);
            cmd.Parameters.AddWithValue("@email", email.Text);
            cmd.Parameters.AddWithValue("@subject", subject.Text);
            cmd.Parameters.AddWithValue("@message", message.Text);
            con.Open();
            cmd.ExecuteNonQuery();

            name.Text = "";
            email.Text = "";
            subject.Text = "";
            message.Text = "";
            this.ClientScript.RegisterStartupScript(this.GetType(), "SweetAlert", "swal('Enquiry Sent Successfully,Thank You..! We will contact you very soon..!','','success');", true);

        }
    }
}