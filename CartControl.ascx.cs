using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using ShoppingCartExample;
public partial class CartControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)

    {      
        
        if (!Page.IsPostBack)
        {
            ReBindGrid();
        }
        if (Profile.SCart.Items.Count == 0)
        {

            cesta.Visible = false;
            Profile.SCart = new ShoppingCartExample.Cart();

        }
        else
        {
            if(Convert.ToBoolean(Session["carrinho"])==true)
                cesta.Visible = true;
        }

        if (Profile.SCart.Total >= Convert.ToDouble("5,00"))
            ImageButtonFinishShop.Visible = true;
        else
            ImageButtonFinishShop.Visible = false;

       
    }

    protected void grdCart_RowEditing(object sender, GridViewEditEventArgs e)
    {
        if (Convert.ToBoolean(Session["aplicadaPromo"]) == true)
        {
            Session["aplicadaPromo"] = false;

            RestaurarClasses();

        }


        if (Convert.ToBoolean(Session["AplicadoPontos"]) == true)
        {
            Session["AplicadoPontos"] = false;

            RestaurarClasses();

        }
           
        grdCart.EditIndex = e.NewEditIndex;
        ReBindGrid();
       
    }

    public void RestaurarClasses()
    {

        //limpa a classe PizzaMenu
        for (int h = 0; h < Profile.PizzaMenu.Items.Count; h++)
        {
            Profile.PizzaMenu.DeleteItem(h);
            h--;
        }

        //afecta a classe PizzaMenu
        for (int h = 0; h < Profile.PizzaMenuAux.Items.Count; h++)
            Profile.PizzaMenu.Insert(Profile.PizzaMenuAux.Items[h]._id_ingred, Profile.PizzaMenuAux.Items[h].id_pizza, Profile.PizzaMenuAux.Items[h].massa, Profile.PizzaMenuAux.Items[h].nomePizza, Profile.PizzaMenuAux.Items[h].tamanho, Profile.PizzaMenuAux.Items[h].nome_ingred, Profile.PizzaMenuAux.Items[h]._extra);
        //-----------



        //limpa a classe PizzaIngrd
        for (int h = 0; h < Profile.PizzaIngrd.Items.Count; h++)
        {
            Profile.PizzaIngrd.DeleteItem(h);
            h--;
        }

        //afecta a classe PizzaIngrd
        for (int h = 0; h < Profile.PizzaIngrdAux.Items.Count; h++)
            Profile.PizzaIngrd.Insert(Profile.PizzaIngrdAux.Items[h].nomePizza, Profile.PizzaIngrdAux.Items[h].id_pizza, Profile.PizzaIngrdAux.Items[h].id_ingred, Profile.PizzaIngrdAux.Items[h].idPzzExistente, Profile.PizzaIngrdAux.Items[h].massa, Profile.PizzaIngrdAux.Items[h].tamanho, Profile.PizzaIngrdAux.Items[h].nome_ingred, Profile.PizzaIngrdAux.Items[h]._extra, Profile.PizzaIngrdAux.Items[h].precoPorTam, Profile.PizzaIngrdAux.Items[h].precoIngred, Profile.PizzaIngrdAux.Items[h].precoTotal,"Carrinho");

        //-----------

        //limpa a classe MenuItens
        for (int h = 0; h < Profile.MenuItens.Items.Count; h++)
        {
            Profile.MenuItens.DeleteItem(h);
            h--;
        }

        //afecta a classe MenuItens
        for (int q = 0; q < Profile.MenuItensAux.Items.Count; q++)
            Profile.MenuItens.Insert(Profile.MenuItensAux.Items[q].MenuName, Profile.MenuItensAux.Items[q].MenuID, Profile.MenuItensAux.Items[q].ProductID, Profile.MenuItensAux.Items[q].ProductName, Profile.MenuItensAux.Items[q].Price, BLL.Artigo.MostrarImagem(Profile.MenuItensAux.Items[q].ProductID));

        //-----------

        //limpa a classe SCart
        for (int h = 0; h < Profile.SCart.Items.Count; h++)
        {
            Profile.SCart.DeleteItem(h);
            h--;
        }

        //afecta a classe SCart
        for (int c = 0; c < Profile.SCartAux.Items.Count; c++)
            Profile.SCart.Insert(Profile.SCartAux.Items[c].ProductID, Profile.SCartAux.Items[c].Price, Profile.SCartAux.Items[c].Quantity, Profile.SCartAux.Items[c].ProductName, Profile.SCartAux.Items[c].ImageUrl);


    }

    protected void grdCart_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        
        if (Convert.ToBoolean(Session["aplicadaPromo"]) == true)
        {
            Session["aplicadaPromo"] = false;

            RestaurarClasses();       
        
        }


        if (Convert.ToBoolean(Session["AplicadoPontos"]) == true)  
        {
            Session["AplicadoPontos"] = false;

            RestaurarClasses();

        }


        TextBox txtQuantity = (TextBox)grdCart.Rows[e.RowIndex].Cells[3].FindControl("TextBox1");
        int Quantity = Convert.ToInt32(txtQuantity.Text);
        if (Quantity == 0)
        {
            Profile.SCart.Items.RemoveAt(e.RowIndex);
        }
        else
        {
            Profile.SCart.Items[e.RowIndex].Quantity = Quantity;          
        }

        grdCart.EditIndex = -1;
        ReBindGrid();
        Server.Transfer("~/cesta.aspx");

    }

    protected void grdCart_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grdCart.EditIndex = -1;
        ReBindGrid();
    }

    protected void grdCart_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (Convert.ToBoolean(Session["aplicadaPromo"]) == true)
        {
            Session["aplicadaPromo"] = false;
            RestaurarClasses();
        }

           for (int i = 0; i < Profile.PizzaIngrd.Items.Count; i++)
           {
              if (Profile.PizzaIngrd.Items[i].id_pizza == Profile.SCart.Items[e.RowIndex].ProductID)
            {
                Profile.PizzaIngrd.Items.RemoveAt(i);
                i--;
            }
              
        }          

        Profile.SCart.Items.RemoveAt(e.RowIndex);
        
        ReBindGrid();
        if (Profile.SCart.Items.Count == 0)
            cesta.Visible = false;           
        
        Server.Transfer("~/cesta.aspx");
        
    }

    private void ReBindGrid()
    {
        grdCart.DataSource = Profile.SCart.Items;
        DataBind();
        TotalLabel.Text = string.Format("Total:{0,19:C}", Profile.SCart.Total);
     
    }   

    protected void ImageButtonFinishShop_Click(object sender, ImageClickEventArgs e)
    {

        if (Profile.SCart.Total >= Convert.ToDouble("5,00"))
        {
            Session["terminarcompras"] = true;

            Response.Redirect("~/verifica.aspx");
        }
     

       
    } 
   
}
