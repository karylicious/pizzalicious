using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class gerirvendas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Context.User.Identity.IsAuthenticated  && this.Context.User.Identity.Name=="Admin" )
        {
            Session["subTitle"] = "Gestão de Vendas";
            divRankingClientes.Visible = false;
            divRankingPromo.Visible = false;
            divRankingMenu.Visible = false;
            divRankingProd.Visible = false;
        }
        else
        Response.Redirect("~/login.aspx");
    }
   
    protected void GridViewUser_SelectedIndexChanged(object sender, EventArgs e)
    {
        divRankingClientes.Visible = true;
        
    }
    protected void GridViewProm_SelectedIndexChanged(object sender, EventArgs e)
    {
        divRankingPromo.Visible = true;
    }
    protected void GridViewProd_SelectedIndexChanged(object sender, EventArgs e)
    {
        divRankingProd.Visible = true;
    }
    protected void GridViewMenu_SelectedIndexChanged(object sender, EventArgs e)
    {
        divRankingMenu.Visible = true;
    }
}