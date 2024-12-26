using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sport_management
{
    public partial class User : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] != null)
            {
                btnout.Visible = true;
                btn_login.Visible = false;
                btn_lbl.Text = Session["username"].ToString();
            }
            else
            {
                btn_login.Visible = true;
                btnout.Visible = false;
            }
        }

        protected void btnout_Click(object sender, EventArgs e)
        {

            Session.RemoveAll();
            Response.Redirect("Home.aspx");
        }
    }
}