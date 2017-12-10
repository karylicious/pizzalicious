using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class gestao : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Context.User.Identity.IsAuthenticated && this.Context.User.Identity.Name == "Admin")
        
        Session["subTitle"] = "Administração";
         else
             Response.Redirect("~/login.aspx");
    }
}