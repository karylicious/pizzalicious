using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class WebUserControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            ReBindGrid();
        }

        if (grdPizza.SelectedIndex == -1)
        {

            divIngrd.Visible = false;
            divMassa.Visible = false;
            divTam.Visible = false;
        }
       
    }

    private void ReBindGrid()
    {
        grdPizza.DataSource = Profile.PizzaIngrd.Items;
        DataBind();

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
            Profile.PizzaIngrd.Insert(Profile.PizzaIngrdAux.Items[h].nomePizza, Profile.PizzaIngrdAux.Items[h].id_pizza, Profile.PizzaIngrdAux.Items[h].id_ingred, Profile.PizzaIngrdAux.Items[h].idPzzExistente, Profile.PizzaIngrdAux.Items[h].massa, Profile.PizzaIngrdAux.Items[h].tamanho, Profile.PizzaIngrdAux.Items[h].nome_ingred, Profile.PizzaIngrdAux.Items[h]._extra, Profile.PizzaIngrdAux.Items[h].precoPorTam, Profile.PizzaIngrdAux.Items[h].precoIngred, Profile.PizzaIngrdAux.Items[h].precoTotal, Profile.PizzaIngrdAux.Items[h].Origem);

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
    
    protected void grdPizza_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
       
         DataTable ingrds = BLL.Ingrediente.MostrarTudoIngredientes(Profile.PizzaIngrd.Items[e.RowIndex].id_pizza);
        Boolean encontrou=false;;
        
            for (int i = 0; i < ingrds.Rows.Count; i++)
            {

                
                    DataRow row = ingrds.Rows[i];
                    if (Profile.PizzaIngrd.Items[e.RowIndex].id_ingred == Convert.ToInt32(row.ItemArray[0].ToString()))
                    {
                    encontrou = true;
                    break;
                    }
                
               
            }
       
        if (encontrou == true)
        {
            Session["Impedir"] = true;
        Server.Transfer("~/editarpizza.aspx");
        }
        else
        {

            int count = 0;
            for (int i = 0; i < Profile.PizzaIngrd.Items.Count; i++)
            {
                if(Profile.PizzaIngrd.Items[i].id_pizza==Profile.PizzaIngrd.Items[e.RowIndex].id_pizza)
                count++;            
            }

            if (count >1)
            {

                if (Convert.ToBoolean(Session["aplicadaPromo"]) == true)
                {
                    Session["aplicadaPromo"] = false;
                    RestaurarClasses();
                } 


                int id = Profile.PizzaIngrd.Items[e.RowIndex].id_ingred;
                double preco = BLL.Artigo.MostrarPreco(Profile.PizzaIngrd.Items[e.RowIndex].id_ingred);
               
                for (int i = 0; i < Profile.SCart.Items.Count; i++)
                {
                    if (Profile.SCart.Items[i].ProductName == Profile.PizzaIngrd.Items[e.RowIndex].nomePizza)
                    {
                        Profile.SCart.Items[i].Price = Profile.PizzaIngrd.Items[e.RowIndex].precoTotal - preco;
                        break;
                    }
                }

                for (int i = 0; i < Profile.PizzaIngrd.Items.Count; i++)
                {
                    if (Profile.PizzaIngrd.Items[i].id_pizza == Profile.PizzaIngrd.Items[e.RowIndex].id_pizza)
                        Profile.PizzaIngrd.Items[i].precoTotal = Profile.PizzaIngrd.Items[e.RowIndex].precoTotal - preco;
                }

                Profile.PizzaIngrd.Items.RemoveAt(e.RowIndex);

                             


                ReBindGrid();
                Server.Transfer("~/editarpizza.aspx");
            }
            else
            {
                Session["Alerta"] = true;
                Server.Transfer("~/editarpizza.aspx");
            }
        }
                   
    }

    protected void grdPizza_SelectedIndexChanged(object sender, EventArgs e)
    {
        divIngrd.Visible = true;
        divMassa.Visible = true;
        divTam.Visible = true;
       
        LabelNomePizza.Text = Profile.PizzaIngrd.Items[grdPizza.SelectedIndex].nomePizza;  
        if (LabelNomePizza.Text.Contains("Pizza criada por") == true)
        {
            if (Profile.PizzaIngrd.Items[grdPizza.SelectedIndex].idPzzExistente == -1)
            {
                //se a pizza tiver sido criada sem usar uma pizza ja existente, mostra todos os ingredientes
                divextra.Visible = true;
                DropDownListIngrd.DataSource = SqlDataSourcePizzCriad;
                ReBindGrid();
            }
            else
            {
                 //trata-se de uma pizza da lista
            DataTable ingrds = BLL.Ingrediente.MostrarTudoIngredientes(Profile.PizzaIngrd.Items[grdPizza.SelectedIndex].id_pizza);
            Boolean encontrouQ = false;
            Boolean encontrouM = false;
            divextra.Visible = false;
            int idExtraQ = BLL.Artigo.Mostrarid("Extra Queijo");
            int idExtraM = BLL.Artigo.Mostrarid("Extra Molho");
            for (int i = 0; i < ingrds.Rows.Count; i++)
            {
                DataRow row = ingrds.Rows[i];
                if (idExtraQ == Convert.ToInt32(row.ItemArray[0].ToString()))
                {
                    encontrouQ = true;
                }

                if (idExtraM == Convert.ToInt32(row.ItemArray[0].ToString()))
                {
                    encontrouM = true;
                }
            }


            if (encontrouQ == true)
            {
                
               // se a pizza ja contem extra queijo, mostra apenas extra molho
                DropDownListIngrd.DataSource = SqlDataSourceApenasM;
                ReBindGrid();
                if (encontrouM == true)
                {
                    //se a pizza ja contem extra molho e extra queijo, nao mostra nada
                    divIngrd.Visible = false;
                }
            }
            else if (encontrouM == true)
            {
                // se a pizza ja contem extra molho, mostra apenas extra queijo
                DropDownListIngrd.DataSource = SqlDataSourceApenasQ;
                divextra.Visible = true;
                ReBindGrid();
            }
                

        

            }


        }

        else
        {
            //trata-se de uma pizza da lista
            DataTable ingrds = BLL.Ingrediente.MostrarTudoIngredientes(Profile.PizzaIngrd.Items[grdPizza.SelectedIndex].id_pizza);
            Boolean encontrouQ = false;
            Boolean encontrouM = false;
            divextra.Visible = false;
            int idExtraQ = BLL.Artigo.Mostrarid("Extra Queijo");
            int idExtraM = BLL.Artigo.Mostrarid("Extra Molho");
            for (int i = 0; i < ingrds.Rows.Count; i++)
            {
                DataRow row = ingrds.Rows[i];
                if (idExtraQ == Convert.ToInt32(row.ItemArray[0].ToString()))
                {
                    encontrouQ = true;
                }

                if (idExtraM == Convert.ToInt32(row.ItemArray[0].ToString()))
                {
                    encontrouM = true;
                }
            }


            if (encontrouQ == true)
            {
                
               // se a pizza ja contem extra queijo, mostra apenas extra molho
                DropDownListIngrd.DataSource = SqlDataSourceApenasM;
                ReBindGrid();
                if (encontrouM == true)
                {
                    //se a pizza ja contem extra molho e extra queijo, nao mostra nada
                    divIngrd.Visible = false;
                }
            }
            else if (encontrouM == true)
            {
                // se a pizza ja contem extra molho, mostra apenass extra queijo
                DropDownListIngrd.DataSource = SqlDataSourceApenasQ;
                ReBindGrid();

            }
            else
            {
                DropDownListIngrd.DataSource = SqlDataSourceTodosExtras;
                ReBindGrid();
            }
            
           

        }
            
             
        
    }

    protected void ImageButtonTam_Click(object sender, ImageClickEventArgs e)
    {
        
        if (DropDownListTam.SelectedValue != Profile.PizzaIngrd.Items[grdPizza.SelectedIndex].tamanho)
        {
            if (Convert.ToBoolean(Session["aplicadaPromo"]) == true)
            {
                Session["aplicadaPromo"] = false;
                RestaurarClasses();
            }
            
            double precoTotal = Profile.PizzaIngrd.Items[grdPizza.SelectedIndex].precoTotal;
            double precoTamActual = Profile.PizzaIngrd.Items[grdPizza.SelectedIndex].precoPorTam;
            precoTotal -= precoTamActual;
            precoTotal += BLL.Tamanho.MostrarPreco(Convert.ToInt32(DropDownListTam.SelectedValue));

            for (int i = 0; i < Profile.PizzaIngrd.Items.Count; i++)
            {
                if (Profile.PizzaIngrd.Items[i].id_pizza == Profile.PizzaIngrd.Items[grdPizza.SelectedIndex].id_pizza)
                {
                     Profile.PizzaIngrd.Items[i].tamanho = DropDownListTam.SelectedValue;
                    Profile.PizzaIngrd.Items[i].precoTotal = precoTotal;
                }
            }
                                
            

            for (int i = 0; i < Profile.SCart.Items.Count; i++)
            {
                if (Profile.SCart.Items[i].ProductName == Profile.PizzaIngrd.Items[grdPizza.SelectedIndex].nomePizza)
                {
                    Profile.SCart.Items[i].Price = precoTotal;
                    break;
                }

            }

            
            ReBindGrid();
            Server.Transfer("~/editarpizza.aspx");
        }        

    }
     
    protected void ImageButtonMassa_Click(object sender, ImageClickEventArgs e)
    {

        if (DropDownListMassa.SelectedItem.Text != Profile.PizzaIngrd.Items[grdPizza.SelectedIndex].massa)
        {
            if (Convert.ToBoolean(Session["aplicadaPromo"]) == true)
            {
                Session["aplicadaPromo"] = false;
                RestaurarClasses();
            }

            for (int i = 0; i < Profile.PizzaIngrd.Items.Count; i++)
            {
                if (Profile.PizzaIngrd.Items[i].id_pizza == Profile.PizzaIngrd.Items[grdPizza.SelectedIndex].id_pizza )
                Profile.PizzaIngrd.Items[i].massa = DropDownListMassa.SelectedItem.Text;
            }

            Profile.PizzaIngrd.Items[grdPizza.SelectedIndex].massa = DropDownListMassa.SelectedItem.Text;

            if (Profile.PizzaIngrd.Items[grdPizza.SelectedIndex].nomePizza.Contains("Pizza criada por") == true)
            {

                for (int i = 0; i < Profile.SCart.Items.Count; i++)
                {
                    if (Profile.SCart.Items[i].ProductName == Profile.PizzaIngrd.Items[grdPizza.SelectedIndex].nomePizza)
                    {
                        Profile.SCart.Items[i].ImageUrl = BLL.Massa.MostrarImagem(Convert.ToInt32(DropDownListMassa.SelectedValue));
                        break;
                    }

                }
            }
            
            ReBindGrid();
            Server.Transfer("~/editarpizza.aspx");
        }

       
    }

    protected void ImageButtonAddIngrd_Click(object sender, ImageClickEventArgs e)
    {
        //Boolean valido = true;
        LabelNomePizza.Text = Profile.PizzaIngrd.Items[grdPizza.SelectedIndex].nomePizza;
       

            //antes de adicionar verifica se a pizza ja contem o ingrediente que esta a ser adicionado
            Boolean contem = false;
            for (int i = 0; i < Profile.PizzaIngrd.Items.Count; i++)
            {
                if (DropDownListIngrd.SelectedValue == Profile.PizzaIngrd.Items[i].nome_ingred)
                {
                    if (Profile.PizzaIngrd.Items[i].id_pizza == Profile.PizzaIngrd.Items[grdPizza.SelectedIndex].id_pizza)
                    {
                        contem = true;
                        break;
                    }
                }
            }

            if (contem == false)
            {
                if (Convert.ToBoolean(Session["aplicadaPromo"]) == true)
                {
                    Session["aplicadaPromo"] = false;
                    RestaurarClasses();
                }

                int id = BLL.Artigo.Mostrarid(DropDownListIngrd.SelectedValue);
                double preco = BLL.Artigo.MostrarPreco(id);
                if (LabelNomePizza.Text.Contains("Pizza criada por") == true)
                {
                    int idPizzaExistente = Profile.PizzaIngrd.Items[grdPizza.SelectedIndex].idPzzExistente;

                    Profile.PizzaIngrd.Insert(Profile.PizzaIngrd.Items[grdPizza.SelectedIndex].nomePizza, Profile.PizzaIngrd.Items[grdPizza.SelectedIndex].id_pizza, id, idPizzaExistente, Profile.PizzaIngrd.Items[grdPizza.SelectedIndex].massa, Profile.PizzaIngrd.Items[grdPizza.SelectedIndex].tamanho, DropDownListIngrd.SelectedValue, Convert.ToString(Session["Extraa"]), Profile.PizzaIngrd.Items[grdPizza.SelectedIndex].precoPorTam, preco, Profile.PizzaIngrd.Items[grdPizza.SelectedIndex].precoTotal + preco, Profile.PizzaIngrd.Items[grdPizza.SelectedIndex].Origem);
                }
                else
                {
                    Profile.PizzaIngrd.Insert(Profile.PizzaIngrd.Items[grdPizza.SelectedIndex].nomePizza, Profile.PizzaIngrd.Items[grdPizza.SelectedIndex].id_pizza, id, -1, Profile.PizzaIngrd.Items[grdPizza.SelectedIndex].massa, Profile.PizzaIngrd.Items[grdPizza.SelectedIndex].tamanho, DropDownListIngrd.SelectedValue, "Não", Profile.PizzaIngrd.Items[grdPizza.SelectedIndex].precoPorTam, preco, Profile.PizzaIngrd.Items[grdPizza.SelectedIndex].precoTotal + preco, Profile.PizzaIngrd.Items[grdPizza.SelectedIndex].Origem);
                }
                 

                for (int i = 0; i < Profile.SCart.Items.Count; i++)
                {
                    if (Profile.SCart.Items[i].ProductName == Profile.PizzaIngrd.Items[grdPizza.SelectedIndex].nomePizza)
                    {
                        Profile.SCart.Items[i].Price = Profile.PizzaIngrd.Items[grdPizza.SelectedIndex].precoTotal + preco;
                        break;
                    }
                }

                for (int i = 0; i < Profile.PizzaIngrd.Items.Count; i++)
                {
                    if (Profile.PizzaIngrd.Items[i].id_ingred != id)
                    {
                        if (Profile.PizzaIngrd.Items[i].id_pizza == Profile.PizzaIngrd.Items[grdPizza.SelectedIndex].id_pizza)
                            Profile.PizzaIngrd.Items[i].precoTotal = Profile.PizzaIngrd.Items[grdPizza.SelectedIndex].precoTotal + preco;
                    }
                }

             

                ReBindGrid();
                Session["addNovoIngred"] = true;
                Server.Transfer("~/editarpizza.aspx");
            }

            else
            {

                Session["contem"] = true;
                Server.Transfer("~/editarpizza.aspx");
            }
                
       
    }

    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox1.Checked==true)
            Session["Extraa"]="Sim";
        else
            Session["Extraa"] = "Não";
    }
}