using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Sport_management
{
    public partial class Registration1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

       
        protected void induEvent_Click1(object sender, EventArgs e)
        {
            Response.Redirect("Individual.aspx");
        }

        protected void GroupEvent_Click(object sender, EventArgs e)
        {
            Response.Redirect("Group.aspx");
        }
    }
}