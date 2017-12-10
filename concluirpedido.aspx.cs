using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;

public partial class finishcompras : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Context.User.Identity.IsAuthenticated)
        {
            if (Convert.ToBoolean(Session["Concluiu"]) == true)
            {
                Session["Concluiu"] = false;
                Session["Entrou"] = false;
                Response.Redirect("~/estadopedido.aspx");
            }


            Session["subTitle"] = "Concluir pedido";
            coisas.Visible = false;
            DataTable dt = BLL.Utilizador.MostrarTudo(Convert.ToString(Session["UserMail"]));

            LabelMorada.Text = dt.Rows[0].ItemArray[3].ToString();
            LabelLocal.Text = dt.Rows[0].ItemArray[4].ToString();
            LabelCodP.Text = dt.Rows[0].ItemArray[7].ToString();
            if (RadioButtonListModPag.SelectedIndex == 1)
                DivTroco.Visible = true;
            else
                DivTroco.Visible = false;

        }
        else
            Response.Redirect("~/login.aspx");
           
    }

    protected void RadioButtonListAltMor_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonListAltMor.SelectedValue == "Sim")
            coisas.Visible = true;
      
        else
            coisas.Visible = false;
    }

    protected void ImageButtonConcluir_Click(object sender, ImageClickEventArgs e)
    {
        Boolean valido=true;
        if (RadioButtonListAltMor.SelectedValue == "Sim")
        {
            if (TextBoxCodP.Text != "" && TextBoxLocal.Text != "" && TextBoxMorada.Text != "")
                valido = true;
            else
                valido = false;                
        }

        if (valido == true)
        {
            int idPromocao = 0;
            if (Convert.ToBoolean(Session["aplicadaPromo"]) == true)
                idPromocao = Convert.ToInt32(Session["idPromocaoSelected"]);

            int idPontos = 0;
            if (Convert.ToBoolean(Session["AplicadoPontos"]) == true)
            {
                idPontos = Convert.ToInt32(Session["idPontosSelected"]);

                int nPontosRestados = 0;

                nPontosRestados = BLL.Utilizador.MostrarnPontos(BLL.Utilizador.MostrarId(Convert.ToString(Session["UserMail"]))) - BLL.Pontos.MostrarnPontos(idPontos);

                BLL.Utilizador.AlterarPontos(Convert.ToString(Session["UserMail"]), nPontosRestados);
                BLL.PontosUser.CriarRela(BLL.Utilizador.MostrarId(Convert.ToString(Session["UserMail"])), idPontos);
            }


            DataTable dt = BLL.Utilizador.MostrarTudo(Convert.ToString(Session["UserMail"]));

            if (RadioButtonListAltMor.SelectedValue == "Sim")
                BLL.Pedido.Inserir(idPromocao, Convert.ToInt32(dt.Rows[0].ItemArray[0].ToString()), DateTime.Now, LabelMorada.Text, LabelLocal.Text, LabelCodP.Text, RadioButtonListModPag.SelectedValue, RadioButtonListTroco.SelectedValue, idPontos);

            else
                BLL.Pedido.Inserir(idPromocao, Convert.ToInt32(dt.Rows[0].ItemArray[0].ToString()), DateTime.Now, dt.Rows[0].ItemArray[3].ToString(), dt.Rows[0].ItemArray[4].ToString(), dt.Rows[0].ItemArray[7].ToString(), RadioButtonListModPag.SelectedValue, RadioButtonListTroco.SelectedValue, idPontos);



            int idPedido = BLL.Pedido.MostrarUltimodPedido();
            Session["idPedido"] = idPedido;

            for (int i = 0; i < Profile.SCart.Items.Count; i++)
            {
                //se for pizza
                if (BLL.Artigo.MostrarIdCategoria(Profile.SCart.Items[i].ProductID) == -1 || BLL.Artigo.MostrarIdCategoria(Profile.SCart.Items[i].ProductID) == 2)
                {
                    string nomeTamanho = "";
                    string nomeMassa = "";
                    for (int j = 0; j < Profile.PizzaIngrd.Items.Count; j++)
                    {
                        if (Profile.PizzaIngrd.Items[j].id_pizza == Profile.SCart.Items[i].ProductID)
                        {

                            BLL.Ingrediente.CriarRlArt(Profile.PizzaIngrd.Items[j].id_ingred, Profile.PizzaIngrd.Items[j].id_pizza, Profile.PizzaIngrd.Items[j]._extra);

                            nomeTamanho = Profile.PizzaIngrd.Items[j].tamanho;
                            nomeMassa = Profile.PizzaIngrd.Items[j].massa;

                        }

                    }

                    if (BLL.Artigo.MostrarIdCategoria(Profile.SCart.Items[i].ProductID) == -1)
                        BLL.Artigo.AlterarNome(Profile.SCart.Items[i].ProductID);


                    BLL.TamanhoArtigo.Inserir(BLL.Tamanho.Mostrarid(nomeTamanho), Profile.SCart.Items[i].ProductID);

                    BLL.MassaArtigo.Inserir(BLL.Massa.MostraridMassa(nomeMassa), Profile.SCart.Items[i].ProductID);

                    BLL.MassaArtigoPedido.Inserir(BLL.MassaArtigo.MostrarUltimoIdMassaArtigo(), idPedido);

                    BLL.TamanhoArtigoPedido.Inserir(BLL.TamanhoArtigo.MostrarUltimoIdTamArtigo(), idPedido, Profile.SCart.Items[i].Quantity, Profile.SCart.Items[i].Price);

                }

                else
                    if (BLL.Artigo.MostrarIdCategoria(Profile.SCart.Items[i].ProductID) == 0)
                    {

                        BLL.TamanhoArtigo.Inserir(BLL.Tamanho.Mostrarid("Nenhum"), Profile.SCart.Items[i].ProductID);

                        BLL.TamanhoArtigoPedido.Inserir(BLL.TamanhoArtigo.MostrarUltimoIdTamArtigo(), idPedido, Profile.SCart.Items[i].Quantity, Profile.SCart.Items[i].Price);


                        // se for menu
                        string nomeTamanho = "";
                        string nomeMassa = "";
                        BLL.MenuPedido.Inserir(Profile.SCart.Items[i].ProductID, idPedido, Profile.SCart.Items[i].Quantity, Profile.SCart.Items[i].Price);
                        int idMenuPedido = BLL.MenuPedido.MostrarultimoidMenuPedido();
                        for (int k = 0; k < Profile.MenuItens.Items.Count; k++)
                        {
                            //se conter pizza

                            if (BLL.Artigo.MostrarIdCategoria(Profile.MenuItens.Items[k].ProductID) == 2)
                            {

                                for (int n = 0; n < Profile.PizzaMenu.Items.Count; n++)
                                {

                                    if (Profile.PizzaMenu.Items[n].id_pizza == Profile.MenuItens.Items[k].ProductID)
                                    {
                                        BLL.Ingrediente.CriarRlArt(Profile.PizzaMenu.Items[n]._id_ingred, Profile.PizzaMenu.Items[n].id_pizza, Profile.PizzaMenu.Items[n]._extra);

                                        nomeTamanho = Profile.PizzaMenu.Items[n].tamanho;
                                        nomeMassa = Profile.PizzaMenu.Items[n].massa;
                                    }
                                }


                                BLL.TamanhoArtigo.Inserir(BLL.Tamanho.Mostrarid(nomeTamanho), Profile.MenuItens.Items[k].ProductID);
                                BLL.MassaArtigo.Inserir(BLL.Massa.MostraridMassa(nomeMassa), Profile.MenuItens.Items[k].ProductID);
                                BLL.MassaArtigoPedido.Inserir(BLL.MassaArtigo.MostrarUltimoIdMassaArtigo(), idPedido);

                                BLL.MenuPedidoTamanhoArtigo.Inserir(idMenuPedido, BLL.TamanhoArtigo.MostrarUltimoIdTamArtigo());

                            }
                            else
                            {
                                // se conter bebida
                                BLL.TamanhoArtigo.Inserir(BLL.Tamanho.Mostrarid("Nenhum"), Profile.MenuItens.Items[k].ProductID);

                                BLL.MenuPedidoTamanhoArtigo.Inserir(idMenuPedido, BLL.TamanhoArtigo.MostrarUltimoIdTamArtigo());
                            }

                        }





                    }
                    else
                    {
                        //se for exemplo bebida

                        BLL.TamanhoArtigo.Inserir(BLL.Tamanho.Mostrarid("Nenhum"), Profile.SCart.Items[i].ProductID);

                        BLL.TamanhoArtigoPedido.Inserir(BLL.TamanhoArtigo.MostrarUltimoIdTamArtigo(), idPedido, Profile.SCart.Items[i].Quantity, Profile.SCart.Items[i].Price);


                    }



            }



            Profile.SCart = new ShoppingCartExample.Cart();
            Profile.SCartAux = new ShoppingCartExampleAux.CartAux();
            Profile.PizzaIngrd = new PizzaExample.Pizza();
            Profile.PizzaIngrdAux = new PizzaExampleAux.PizzaAux();
            Profile.MenuItens = new MenuExample.Menu();
            Profile.MenuItensAux = new MenuExampleAux.MenuAux();
            Profile.PizzaMenu = new PizzaMenuExample.PizzaMenus();
            Profile.PizzaMenuAux = new PizzaMenuExampleAux.PizzaMenusAux();

            Session["Concluiu"] = true;
            Response.Redirect("~/concluirpedido.aspx");

        }
    }     

    protected void RadioButtonListModPag_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonListModPag.SelectedValue == "A dinheiro")
            DivTroco.Visible = true;
             
        else          
            DivTroco.Visible = false;
             
    }
      
}