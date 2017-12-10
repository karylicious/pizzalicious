using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MenuControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {


        if (!Page.IsPostBack)
        {
            ReBindGrid();
        }
        if (Profile.MenuItens.Items.Count == 0)
          Profile.MenuItens = new MenuExample.Menu();      


    }
    
   
    private void ReBindGrid()
    {
        grdMenu.DataSource = Profile.MenuItens.Items;
        DataBind();        

    }

    protected void grdMenu_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["idItemMenuEditar"] = Profile.MenuItens.Items[grdMenu.SelectedIndex].ProductID;
        Session["CatProd"] = BLL.Artigo.MostrarIdCategoria(Profile.MenuItens.Items[grdMenu.SelectedIndex].ProductID);
        Session["idMenuEditar"] = Profile.MenuItens.Items[grdMenu.SelectedIndex].MenuID;
        Session["idItemMenuEditarRow"] = grdMenu.SelectedIndex;     

        Response.Redirect("~/editarmenu.aspx");

    }
}