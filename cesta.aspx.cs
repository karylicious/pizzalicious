using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
public partial class cesta : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["subTitle"] = "Detalhes pedido";

        Session["carrinho"] = true;       

        if(Profile.PizzaIngrd.Items.Count>0)

             HyperLink7.Visible = true;

            else
                HyperLink7.Visible = false;

            if (Profile.MenuItens.Items.Count > 0)
            HyperLinkVerMenuDet.Visible = true;
                                          
            else
            HyperLinkVerMenuDet.Visible = false;
           
        


        if (Convert.ToBoolean(Session["terminarcompras"]) == true)
        {         
                        
                if (this.Context.User.Identity.IsAuthenticated != true)

                    LabelErroSess.Visible = true;                      
               
            
            Session["terminarcompras"] = false;
        }

        if (Profile.SCart.Items.Count == 0)
            Tdcoisas.Visible = false;
        else
           Tdcoisas.Visible = true;
       
        
        if (Convert.ToBoolean(Session["aplicadaPromo"]) == false)

            TdAddPromo.Visible = false;
        else
            TdAddPromo.Visible = true;

        if (Convert.ToBoolean(Session["AplicadoPontos"]) == true)
        {
            
            TdAddPontos.Visible = true;
            LabelPontosAplicados.Text = Convert.ToString(BLL.Pontos.MostrarnPontos(Convert.ToInt32(Session["idPontosSelected"])));
            LabelPontosRestados.Text = Convert.ToString(BLL.Utilizador.MostrarnPontos(BLL.Utilizador.MostrarId(Convert.ToString(Session["UserMail"]))) - BLL.Pontos.MostrarnPontos(Convert.ToInt32(Session["idPontosSelected"])));
            LabelDescontoAplicado.Text = (Convert.ToString(BLL.Pontos.MostrarnDescontos(Convert.ToInt32(Session["idPontosSelected"])))) + "%";

        }
        else
            TdAddPontos.Visible = false;
        

        ImagePromocaoAplicada.ImageUrl = "~/Imagem_Artigo/" + BLL.Promocao.MostrarImagem(Convert.ToInt32(Session["idPromocaoSelected"]));
        LabelNomePromo.Text = BLL.Promocao.MostrarNome(Convert.ToInt32(Session["idPromocaoSelected"]));
    }

    public void AfectarClassesAux()
    {


        //limpa a classe PizzaMenuAux
        for (int h = 0; h < Profile.PizzaMenuAux.Items.Count; h++)
        {
            Profile.PizzaMenuAux.DeleteItem(h);
            h--;
        }

        //afecta a classe PizzaMenuAux
        for (int h = 0; h < Profile.PizzaMenu.Items.Count; h++)
            Profile.PizzaMenuAux.Insert(Profile.PizzaMenu.Items[h]._id_ingred, Profile.PizzaMenu.Items[h].id_pizza, Profile.PizzaMenu.Items[h].massa, Profile.PizzaMenu.Items[h].nomePizza, Profile.PizzaMenu.Items[h].tamanho, Profile.PizzaMenu.Items[h].nome_ingred, Profile.PizzaMenu.Items[h]._extra);
        //-----------





        //limpa a classe PizzaIngrdAux
        for (int h = 0; h < Profile.PizzaIngrdAux.Items.Count; h++)
        {
            Profile.PizzaIngrdAux.DeleteItem(h);
            h--;
        }


        //afecta a classe PizzaIngrdAux
        for (int h = 0; h < Profile.PizzaIngrd.Items.Count; h++)
            Profile.PizzaIngrdAux.Insert(Profile.PizzaIngrd.Items[h].nomePizza, Profile.PizzaIngrd.Items[h].id_pizza, Profile.PizzaIngrd.Items[h].id_ingred, Profile.PizzaIngrd.Items[h].idPzzExistente, Profile.PizzaIngrd.Items[h].massa, Profile.PizzaIngrd.Items[h].tamanho, Profile.PizzaIngrd.Items[h].nome_ingred, Profile.PizzaIngrd.Items[h]._extra, Profile.PizzaIngrd.Items[h].precoPorTam, Profile.PizzaIngrd.Items[h].precoIngred, Profile.PizzaIngrd.Items[h].precoTotal, Profile.PizzaIngrd.Items[h].Origem);

        //---------------


        //limpa a classe MenuItensAux
        for (int q = 0; q < Profile.MenuItensAux.Items.Count; q++)
        {
            Profile.MenuItensAux.DeleteItem(q);
            q--;
        }

        //afecta a classe MenuItensAux
        for (int q = 0; q < Profile.MenuItens.Items.Count; q++)
            Profile.MenuItensAux.Insert(Profile.MenuItens.Items[q].MenuName, Profile.MenuItens.Items[q].MenuID, Profile.MenuItens.Items[q].ProductID, Profile.MenuItens.Items[q].ProductName, Profile.MenuItens.Items[q].Price, Profile.MenuItens.Items[q].Image);

        //---------------


        //limpa a classe SCartAux
        for (int q = 0; q < Profile.SCartAux.Items.Count; q++)
        {
            Profile.SCartAux.DeleteItem(q);
            q--;
        }

        //afecta a classe SCartAux
        for (int c = 0; c < Profile.SCart.Items.Count; c++)
            Profile.SCartAux.Insert(Profile.SCart.Items[c].ProductID, Profile.SCart.Items[c].Price, Profile.SCart.Items[c].Quantity, Profile.SCart.Items[c].ProductName, Profile.SCart.Items[c].ImageUrl);


    }

    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {

        if (Convert.ToBoolean(Session["aplicadaPromo"]) == false)
           AfectarClassesAux();


        Session["idPromocaoSelected"] = Convert.ToInt32(e.CommandArgument);

        //tamanho, npizzas, ningred, dia
        //-----------------
        DataTable dt = BLL.Promocao.MostrarTudo(Convert.ToInt32(e.CommandArgument));

        ArrayList PizzasPedido = new ArrayList();
        int CountListaPizzasValidas = 0;
        ArrayList idListaPizzasValidas = new ArrayList();
        int countPizzas = 0; 

        //vai buscar os id das pizzas e o count no pedido

        for (int p = 0; p < Profile.SCart.Items.Count; p++)
        {

            if (BLL.Artigo.MostrarIdCategoria(Profile.SCart.Items[p].ProductID) == -1)
            {
                PizzasPedido.Add(Profile.SCart.Items[p].ProductID);
                countPizzas++;
            }

            else if (BLL.Artigo.MostrarIdCategoria(Profile.SCart.Items[p].ProductID) == 2)
            {
                PizzasPedido.Add(Profile.SCart.Items[p].ProductID);
                countPizzas++;
            }

        }






        //tamanho
        DataTable TamanhoList = BLL.TamanhoPromocao.idsTamanho(Convert.ToInt32(e.CommandArgument));
        int countIngredPizzaValida = 0;



        for (int Countpizza = 0; Countpizza < PizzasPedido.Count; Countpizza++)
        {

            Boolean PizzaValida = false;
               

                 for (int j = 0; j < TamanhoList.Rows.Count; j++)
            {
                if (PizzaValida == true)
                    break;
                for (int l = 0; l < Profile.PizzaIngrd.Items.Count; l++)
                {
                   
                            //vai buscar o tamanho da pizza
                            if (Profile.PizzaIngrd.Items[l].id_pizza == Convert.ToInt32(PizzasPedido[Countpizza]))
                            {
                                //verifica se o tamanho da pizza é igual ao(s) da promocao em causa
                                if (BLL.Tamanho.MostrarNome(Convert.ToInt32(TamanhoList.Rows[j].ItemArray[0].ToString())) == Profile.PizzaIngrd.Items[l].tamanho && Profile.PizzaIngrd.Items[l].id_pizza == Convert.ToInt32(PizzasPedido[Countpizza]))
                                {
                                    PizzaValida = true;
                                    break;
                                }
                                else
                                {
                                    PizzaValida = false;
                                    break;
                                }
                            }
                    }


                }

            
            //-----------------
            //ningred




            if (PizzaValida == true)
            {


                for (int k = 0; k < Profile.PizzaIngrd.Items.Count; k++)
                {
                    //obtem o numero de ingred da pizza
                    if (Profile.PizzaIngrd.Items[k].id_pizza == Convert.ToInt32(PizzasPedido[Countpizza]))
                        countIngredPizzaValida++;

                }

               

                //nIngredFixo
                //------------
                if (Convert.ToInt32(dt.Rows[0].ItemArray[10].ToString())!=0)
                {
                        if (countIngredPizzaValida == Convert.ToInt32(dt.Rows[0].ItemArray[10].ToString()))
                        {
                            PizzaValida = true;
                        }
               }

                
                 if (Convert.ToInt32(dt.Rows[0].ItemArray[11].ToString()) != 0)
                {
                    //MaiorIgualNIngred
                    if (countIngredPizzaValida >= Convert.ToInt32(dt.Rows[0].ItemArray[11].ToString()))
                    {
                        PizzaValida = true;
                    }
                }
                else
                    PizzaValida = false;


                if (PizzaValida == true)
                {
                    CountListaPizzasValidas++;
                    idListaPizzasValidas.Add(Convert.ToInt32(PizzasPedido[Countpizza]));

                }

            }


            
        }  

        
            if(CountListaPizzasValidas>0)
            {
                Boolean PromocaoValida = false;

                //-----------------
                //nPizzas



                //MaiorIgualnPizzas


                //-------------
                if (dt.Rows[0].ItemArray[12].ToString() != "")
                {
                    if (countPizzas >= Convert.ToInt32(dt.Rows[0].ItemArray[12].ToString()))
                        PromocaoValida = true;
                }

                    //nPizzasFixo
                else if (dt.Rows[0].ItemArray[9].ToString() != "")
                {
                    if (countPizzas == Convert.ToInt32(dt.Rows[0].ItemArray[9].ToString()))
                        PromocaoValida = true;
                }


                //--------------

                if (PromocaoValida == true)
                {


                    // dia

                    //dia da semana

                    if (dt.Rows[0].ItemArray[5].ToString() != "")
                    {
                        DateTime DateT = DateTime.Now;
                        //------------
                        switch (DateT.DayOfWeek)
                        {
                            case DayOfWeek.Monday:
                                {
                                    if (dt.Rows[0].ItemArray[5].ToString() == "Segunda-feira")
                                    {
                                        PromocaoValida = true;
                                    }

                                    break;
                                }

                            case DayOfWeek.Tuesday:
                                {
                                    if (dt.Rows[0].ItemArray[5].ToString() == "Terça-feira")
                                    {
                                        PromocaoValida = true;
                                    }
                                    break;
                                }

                            case DayOfWeek.Wednesday:
                                {
                                    if (dt.Rows[0].ItemArray[5].ToString() == "Quarta-feira")
                                    {
                                        PromocaoValida = true;
                                    }
                                    break;
                                }

                            case DayOfWeek.Thursday:
                                {
                                    if (dt.Rows[0].ItemArray[5].ToString() == "Quinta-feira")
                                    {
                                        PromocaoValida = true;
                                    }
                                    break;
                                }

                            case DayOfWeek.Friday:
                                {
                                    if (dt.Rows[0].ItemArray[5].ToString() == "Sexta-feira")
                                    {
                                        PromocaoValida = true;
                                    }
                                    break;
                                }

                            case DayOfWeek.Saturday:
                                {
                                    if (dt.Rows[0].ItemArray[5].ToString() == "Sabado")
                                    {
                                        PromocaoValida = true;
                                    }
                                    break;
                                }

                            case DayOfWeek.Sunday:
                                {
                                    if (dt.Rows[0].ItemArray[5].ToString() == "Domingo")
                                    {
                                        PromocaoValida = true;
                                    }
                                    break;
                                }
                            default: { PromocaoValida = false; break; }



                        }

                    }

                


                    // período -PeriodoInicial or PeriodoFinal
                    //------------------
                    DateTime datainicial = DateTime.MinValue;
                    DateTime datafinal = DateTime.MinValue;
                    if (dt.Rows[0].ItemArray[6].ToString() != "" && dt.Rows[0].ItemArray[6].ToString() !="1/1/1753 12:00:00")
                        datainicial = Convert.ToDateTime(dt.Rows[0].ItemArray[6].ToString());

                    if (dt.Rows[0].ItemArray[7].ToString() != "" && dt.Rows[0].ItemArray[7].ToString() != "1/1/1753 12:00:00")
                        datafinal = Convert.ToDateTime(dt.Rows[0].ItemArray[7].ToString());


                    if (dt.Rows[0].ItemArray[6].ToString() != "" && dt.Rows[0].ItemArray[7].ToString() != "" && dt.Rows[0].ItemArray[7].ToString() != "1/1/1753 12:00:00" && dt.Rows[0].ItemArray[6].ToString() != "1/1/1753 12:00:00")
                    {
                        int resultdatainicial = DateTime.Compare(DateTime.Now.Date, datainicial.Date);
                        int resultdatafinal = DateTime.Compare(DateTime.Now.Date, datafinal.Date);


                        if (resultdatainicial > 0 || resultdatainicial == 0 && resultdatafinal < 0 || resultdatainicial == 0)
                        {
                            PromocaoValida = true;
                        }
                        else
                            PromocaoValida = false;
                    }

                    //-----------------------------------------
                    //se PromocaoValida = true chegamos a conclusao que em termos de (tamanho, ningred, npizzas, validade) ta tudo ok

                    //verificar as caracteristicas da promoção para identificar o tipo [ preco, desconto, npedido,npizzasfixo, maiorigualnpizzas, nenhum dos tres]


                    //se tiver preco


                    if (Convert.ToDouble(dt.Rows[0].ItemArray[2].ToString()) != 0 && Convert.ToInt32(dt.Rows[0].ItemArray[8].ToString()) == 0 && Convert.ToInt32(dt.Rows[0].ItemArray[13].ToString()) == 0 && Convert.ToInt32(dt.Rows[0].ItemArray[9].ToString()) == 0 && Convert.ToInt32(dt.Rows[0].ItemArray[12].ToString()) == 0)
                    {
                        Boolean promovalida = false;
                        for (int i = 0; i < idListaPizzasValidas.Count; i++)
                        {
                            for (int p = 0; p < Profile.SCart.Items.Count; p++)
                            {
                                if (Convert.ToInt32(idListaPizzasValidas[i].ToString()) == Profile.SCart.Items[p].ProductID)
                                {
                                    Profile.SCart.Items[p].Price = Convert.ToDouble(dt.Rows[0].ItemArray[2].ToString());
                                    for (int r = 0; r < Profile.PizzaIngrd.Items.Count; r++)
                                    {                                        

                                        if (Profile.PizzaIngrd.Items[r].id_pizza == Profile.SCart.Items[p].ProductID)
                                        {

                                            Profile.PizzaIngrd.Items[r].precoTotal = Convert.ToDouble(dt.Rows[0].ItemArray[2].ToString());
                                            
                                        }
                                    }


                                    promovalida = true;
                                }
                            }
                        }

                        if (promovalida == true)
                            Session["aplicadaPromo"] = true;
                        else
                            Session["aplicadaPromo"] = false;
                    }



                    //se tiver preco e npizzasfixo
                    else if (Convert.ToDouble(dt.Rows[0].ItemArray[2].ToString()) != 0 && Convert.ToInt32(dt.Rows[0].ItemArray[8].ToString()) == 0 && Convert.ToInt32(dt.Rows[0].ItemArray[13].ToString()) == 0 && Convert.ToInt32(dt.Rows[0].ItemArray[9].ToString()) != 0 && Convert.ToInt32(dt.Rows[0].ItemArray[12].ToString()) == 0)
                    {
                        Boolean promovalida = false;

                        
                            if (CountListaPizzasValidas == Convert.ToInt32(dt.Rows[0].ItemArray[9].ToString()))
                                promovalida = true;
                        


                        int count = 0;

                        if (promovalida == true)
                        {
                           
                            for (int i = 0; i < idListaPizzasValidas.Count; i++)
                            {
                                for (int p = 0; p < Profile.SCart.Items.Count; p++)
                                {
                                    if (Convert.ToInt32(idListaPizzasValidas[i].ToString()) == Profile.SCart.Items[p].ProductID)
                                    {
                                        Profile.SCart.Items[p].Price = Convert.ToDouble(dt.Rows[0].ItemArray[2].ToString());
                                        count++;

                                        for (int r = 0; r < Profile.PizzaIngrd.Items.Count; r++)
                                        {

                                            if (Profile.PizzaIngrd.Items[r].id_pizza == Profile.SCart.Items[p].ProductID)
                                            {

                                                Profile.PizzaIngrd.Items[r].precoTotal = Convert.ToDouble(dt.Rows[0].ItemArray[2].ToString());

                                            }
                                        }

                                    }
                                    
                                }
                            }
                        }


                        if (count!=0)
                            Session["aplicadaPromo"] = true;
                        else
                            Session["aplicadaPromo"] = false;
                    }



                    //se tiver preco e maiorigualnpizzas
                    else if (Convert.ToDouble(dt.Rows[0].ItemArray[2].ToString()) != 0 && Convert.ToInt32(dt.Rows[0].ItemArray[8].ToString()) == 0 && Convert.ToInt32(dt.Rows[0].ItemArray[13].ToString()) == 0 && Convert.ToInt32(dt.Rows[0].ItemArray[9].ToString()) == 0 && Convert.ToInt32(dt.Rows[0].ItemArray[12].ToString()) != 0)
                    {
                        Boolean promovalida = false;


                        if (CountListaPizzasValidas >= Convert.ToInt32(dt.Rows[0].ItemArray[12].ToString()))
                            promovalida = true;



                        int count = 0;

                        if (promovalida == true)
                        {

                            for (int i = 0; i < idListaPizzasValidas.Count; i++)
                            {
                                for (int p = 0; p < Profile.SCart.Items.Count; p++)
                                {
                                    if (Convert.ToInt32(idListaPizzasValidas[i].ToString()) == Profile.SCart.Items[p].ProductID)
                                    {
                                        Profile.SCart.Items[p].Price = Convert.ToDouble(dt.Rows[0].ItemArray[2].ToString());
                                        count++;


                                        for (int r = 0; r < Profile.PizzaIngrd.Items.Count; r++)
                                        {

                                            if (Profile.PizzaIngrd.Items[r].id_pizza == Profile.SCart.Items[p].ProductID)
                                            {

                                                Profile.PizzaIngrd.Items[r].precoTotal = Convert.ToDouble(dt.Rows[0].ItemArray[2].ToString());

                                            }
                                        }

                                    }

                                }
                            }
                        }


                        if (count != 0)
                            Session["aplicadaPromo"] = true;
                        else
                            Session["aplicadaPromo"] = false;
                    }



                    //se tiver preco e npedido
                    else if (Convert.ToDouble(dt.Rows[0].ItemArray[2].ToString()) != 0 && Convert.ToInt32(dt.Rows[0].ItemArray[8].ToString()) == 0 && Convert.ToInt32(dt.Rows[0].ItemArray[13].ToString()) != 0 && Convert.ToInt32(dt.Rows[0].ItemArray[9].ToString()) == 0 && Convert.ToInt32(dt.Rows[0].ItemArray[12].ToString()) == 0)
                    {
                        int npedido=0;
                        Boolean promovalida = false;

                        if (this.Context.User.Identity.IsAuthenticated != true)
                            this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('Para aplicar a promoção escolhida, tem de fazer login antecipadamente!');</script>");
                        else
                            npedido = BLL.Pedido.nPedidoByUser(Convert.ToString(Session["UserMail"]));

                        if (npedido == Convert.ToInt32(dt.Rows[0].ItemArray[13].ToString()))
                        {
                            for (int i = 0; i < idListaPizzasValidas.Count; i++)
                            {
                                for (int p = 0; p < Profile.SCart.Items.Count; p++)
                                {
                                    if (Convert.ToInt32(idListaPizzasValidas[i].ToString()) == Profile.SCart.Items[p].ProductID)
                                    {
                                        Profile.SCart.Items[p].Price = Convert.ToDouble(dt.Rows[0].ItemArray[2].ToString());
                                        promovalida = true;


                                        for (int r = 0; r < Profile.PizzaIngrd.Items.Count; r++)
                                        {

                                            if (Profile.PizzaIngrd.Items[r].id_pizza == Profile.SCart.Items[p].ProductID)
                                            {

                                                Profile.PizzaIngrd.Items[r].precoTotal = Convert.ToDouble(dt.Rows[0].ItemArray[2].ToString());

                                            }
                                        }


                                    }
                                }
                            }
                        }
                        else
                            promovalida = false;


                        if (promovalida ==true)
                            Session["aplicadaPromo"] = true;
                        else
                            Session["aplicadaPromo"] = false;

                        
                    }

                   // se tiver desconto

                    else if (Convert.ToDouble(dt.Rows[0].ItemArray[2].ToString()) == 0 && Convert.ToInt32(dt.Rows[0].ItemArray[8].ToString()) != 0 && Convert.ToInt32(dt.Rows[0].ItemArray[13].ToString()) == 0 && Convert.ToInt32(dt.Rows[0].ItemArray[9].ToString()) == 0 && Convert.ToInt32(dt.Rows[0].ItemArray[12].ToString()) == 0)
                    {
                        Boolean promovalida = false;
                        int count=0;
                        
                        double desconto = (Convert.ToDouble(dt.Rows[0].ItemArray[8].ToString())) / (double)100;

                            for (int i = 0; i < idListaPizzasValidas.Count; i++)
                            {
                                for (int p = 0; p < Profile.SCart.Items.Count; p++)
                                {
                                    if (Convert.ToInt32(idListaPizzasValidas[i].ToString()) == Profile.SCart.Items[p].ProductID)
                                    {
                                        Profile.SCart.Items[p].Price = Profile.SCart.Items[p].Price - (Profile.SCart.Items[p].Price * desconto);
                                        count++;

                                        for (int r = 0; r < Profile.PizzaIngrd.Items.Count; r++)
                                        {

                                            if (Profile.PizzaIngrd.Items[r].id_pizza == Profile.SCart.Items[p].ProductID)
                                            {

                                                Profile.PizzaIngrd.Items[r].precoTotal = Profile.SCart.Items[p].Price - (Profile.SCart.Items[p].Price * desconto);

                                            }
                                        }


                                    }
                                }
                            }


                             if(count!=0)
                                 promovalida=true;
                              else 
                                 promovalida=false;


                            if (promovalida == true)
                                Session["aplicadaPromo"] = true;
                            else
                                Session["aplicadaPromo"] = false;

                    }

                   //se tiver desconto e npedido
                    else if (Convert.ToDouble(dt.Rows[0].ItemArray[2].ToString()) == 0 && Convert.ToInt32(dt.Rows[0].ItemArray[8].ToString()) != 0 && Convert.ToInt32(dt.Rows[0].ItemArray[13].ToString()) != 0 && Convert.ToInt32(dt.Rows[0].ItemArray[9].ToString()) == 0 && Convert.ToInt32(dt.Rows[0].ItemArray[12].ToString()) == 0)
                    {
                        int npedido=0;
                         int count=0;
                        Boolean promovalida = false;

                        if (this.Context.User.Identity.IsAuthenticated != true)
                            this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('Para aplicar a promoção escolhida, tem de fazer login antecipadamente!');</script>");
                        else
                            npedido = BLL.Pedido.nPedidoByUser(Convert.ToString(Session["UserMail"]));

                        if (npedido == Convert.ToInt32(dt.Rows[0].ItemArray[13].ToString()))
                        {

                            double desconto = (Convert.ToDouble(dt.Rows[0].ItemArray[8].ToString())) / (double)100;


                            for (int i = 0; i < idListaPizzasValidas.Count; i++)
                            {
                                for (int p = 0; p < Profile.SCart.Items.Count; p++)
                                {
                                    if (Convert.ToInt32(idListaPizzasValidas[i].ToString()) == Profile.SCart.Items[p].ProductID)
                                    {
                                        Profile.SCart.Items[p].Price = Profile.SCart.Items[p].Price - (Profile.SCart.Items[p].Price * desconto);
                                       count++;

                                       for (int r = 0; r < Profile.PizzaIngrd.Items.Count; r++)
                                       {

                                           if (Profile.PizzaIngrd.Items[r].id_pizza == Profile.SCart.Items[p].ProductID)
                                           {

                                               Profile.PizzaIngrd.Items[r].precoTotal = Convert.ToDouble(dt.Rows[0].ItemArray[2].ToString());

                                           }
                                       }


                                    }
                                }
                            }
                        }
                            

                           if(count!=0)
                                 promovalida=true;
                              else 
                                 promovalida=false;


                            if (promovalida == true)
                                Session["aplicadaPromo"] = true;
                            else
                                Session["aplicadaPromo"] = false;

                    }



                    //se tiver desconto e npizzasfixo
                    else if (Convert.ToDouble(dt.Rows[0].ItemArray[2].ToString()) == 0 && Convert.ToInt32(dt.Rows[0].ItemArray[8].ToString()) != 0 && Convert.ToInt32(dt.Rows[0].ItemArray[13].ToString()) == 0 && Convert.ToInt32(dt.Rows[0].ItemArray[9].ToString()) != 0 && Convert.ToInt32(dt.Rows[0].ItemArray[12].ToString()) == 0)
                    {
                        Boolean promovalida = false;
                         int count=0;

                        if (CountListaPizzasValidas == Convert.ToInt32(dt.Rows[0].ItemArray[9].ToString()))
                          
                        {

                            double desconto = (Convert.ToDouble(dt.Rows[0].ItemArray[8].ToString())) / (double)100;


                            for (int i = 0; i < idListaPizzasValidas.Count; i++)
                            {
                                for (int p = 0; p < Profile.SCart.Items.Count; p++)
                                {
                                    if (Convert.ToInt32(idListaPizzasValidas[i].ToString()) == Profile.SCart.Items[p].ProductID)
                                    {
                                        Profile.SCart.Items[p].Price = Profile.SCart.Items[p].Price - (Profile.SCart.Items[p].Price * desconto);
                                        count++;

                                        for (int r = 0; r < Profile.PizzaIngrd.Items.Count; r++)
                                        {

                                            if (Profile.PizzaIngrd.Items[r].id_pizza == Profile.SCart.Items[p].ProductID)
                                            {

                                                Profile.PizzaIngrd.Items[r].precoTotal = Convert.ToDouble(dt.Rows[0].ItemArray[2].ToString());

                                            }
                                        }

                                    }
                                }
                            }
                        }

                        if(count!=0)
                                 promovalida=true;
                              else 
                                 promovalida=false;


                            if (promovalida == true)
                                Session["aplicadaPromo"] = true;
                            else
                                Session["aplicadaPromo"] = false;



                    }


                    
                    //se tiver maiornpizzas e npedidos significa que é ex. leve 2 e pague 1 e tiver x numeros de pedidos
                    else if (Convert.ToDouble(dt.Rows[0].ItemArray[2].ToString()) == 0 && Convert.ToInt32(dt.Rows[0].ItemArray[8].ToString()) == 0 && Convert.ToInt32(dt.Rows[0].ItemArray[13].ToString()) != 0 && Convert.ToInt32(dt.Rows[0].ItemArray[9].ToString()) == 0 && Convert.ToInt32(dt.Rows[0].ItemArray[12].ToString()) != 0)
                    {
                        int npedido = 0;
                        Boolean promovalida = false;

                        if (this.Context.User.Identity.IsAuthenticated != true)
                            this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('Para aplicar a promoção escolhida, tem de fazer login antecipadamente!');</script>");
                        else
                            npedido = BLL.Pedido.nPedidoByUser(Convert.ToString(Session["UserMail"]));
                        if (npedido== Convert.ToInt32(dt.Rows[0].ItemArray[13].ToString()))
                        {
                            int nPizzaOferta = 0;

                            ArrayList PizzaListPriceSorted = new ArrayList();
                            ArrayList PizzaListID = new ArrayList();

                            for (int j = 0; j < Profile.SCart.Items.Count; j++)
                            {

                                if (BLL.Artigo.MostrarIdCategoria(Profile.SCart.Items[j].ProductID) == -1)
                                {
                                    PizzaListPriceSorted.Add(Profile.SCart.Items[j].Price);
                                    PizzaListID.Add(Profile.SCart.Items[j].ProductID);
                                }

                                else if (BLL.Artigo.MostrarIdCategoria(Profile.SCart.Items[j].ProductID) == 2)
                                {
                                    PizzaListPriceSorted.Add(Profile.SCart.Items[j].Price);
                                    PizzaListID.Add(Profile.SCart.Items[j].ProductID);
                                }

                            }


                            ArrayList PizzaListPrice = new ArrayList();
                            for (int j = 0; j < PizzaListPriceSorted.Count; j++)
                            {
                                PizzaListPrice.Add(PizzaListPriceSorted[j].ToString());
                            }

                            ArrayList PizzaListIDSorted = new ArrayList();

                            PizzaListPriceSorted.Sort();

                            for (int s = 0; s < PizzaListPriceSorted.Count; s++)
                            {
                                if (PizzaListIDSorted.Count == PizzaListPriceSorted.Count)
                                    break;
                                for (int p = 0; p < PizzaListPrice.Count; p++)
                                {
                                    if (PizzaListPrice[p].ToString() == PizzaListPriceSorted[s].ToString())
                                        PizzaListIDSorted.Add(PizzaListID[p].ToString());

                                }


                            }

                            PizzaListIDSorted.Sort();

                            if (countPizzas % 2 == 0)
                            {
                                //se npizza bd é par

                                double n = (countPizzas / Convert.ToInt32(dt.Rows[0].ItemArray[12].ToString()));
                                nPizzaOferta = Convert.ToInt32(Math.Round(n, 0, MidpointRounding.ToEven));
                            }
                            else
                            {
                                //se npizza bd é impar

                                double t = (countPizzas / Convert.ToInt32(dt.Rows[0].ItemArray[12].ToString()));
                                nPizzaOferta = countPizzas - Convert.ToInt32(Math.Round(t, 0, MidpointRounding.ToEven));

                            }

                            int CountPizzaOfertaValida = 0;
                            int idPizzaOferta = 0;

                            ArrayList PizzaListOfertaId = new ArrayList();
                            for (int i = 0; i < nPizzaOferta; i++)
                            {


                                for (int t = 0; t < PizzaListPriceSorted.Count; t++)
                                {
                                    Boolean PizzaOfertaValida = false;
                                    for (int p = 0; p < Profile.SCart.Items.Count; p++)
                                    {
                                        int countIngredPizzaOferta = 0;
                                        if (Convert.ToBoolean(dt.Rows[0].ItemArray[15].ToString()) == true)//PrecoPizzaOfertaMaiorIgual 
                                        {
                                            for (int k = 0; k < idListaPizzasValidas.Count; k++)
                                            {

                                                if (countPizzas != nPizzaOferta)
                                                {
                                                    if (Profile.SCart.Items[p].Price >= Convert.ToDouble(PizzaListPriceSorted[t].ToString()) && PizzaListIDSorted[t].ToString() != idListaPizzasValidas[k].ToString())
                                                    {

                                                        PizzaOfertaValida = true;
                                                        idPizzaOferta = p;
                                                        countPizzas--;


                                                        for (int g = 0; g < Profile.PizzaIngrd.Items.Count; g++)
                                                        {
                                                            //obtem o numero de ingred da pizza
                                                            if (Profile.PizzaIngrd.Items[g].id_pizza == Profile.SCart.Items[p].ProductID)
                                                                countIngredPizzaOferta++;
                                                        }
                                                        break;

                                                    }

                                                    else

                                                        PizzaOfertaValida = false;
                                                }
                                                else
                                                    break;
                                            }

                                        }

                                        else if (Convert.ToBoolean(dt.Rows[0].ItemArray[16].ToString()) == true)//PrecoPizzaOfertaMenorIgual                                         
                                        {
                                            for (int k = 0; k < idListaPizzasValidas.Count; k++)
                                            {

                                                if (countPizzas != nPizzaOferta)
                                                {

                                                    if (Profile.SCart.Items[p].Price <= Convert.ToDouble(PizzaListPriceSorted[t].ToString()) && PizzaListIDSorted[t].ToString() != idListaPizzasValidas[k].ToString())
                                                    {

                                                        PizzaOfertaValida = true;
                                                        idPizzaOferta = p;
                                                        countPizzas--;

                                                        for (int g = 0; g < Profile.PizzaIngrd.Items.Count; g++)
                                                        {
                                                            //obtem o numero de ingred da pizza
                                                            if (Profile.PizzaIngrd.Items[g].id_pizza == Profile.SCart.Items[p].ProductID)
                                                                countIngredPizzaOferta++;
                                                        }

                                                        break;

                                                    }

                                                    else

                                                        PizzaOfertaValida = false;
                                                }
                                                else
                                                    break;
                                            }
                                        }


                                        if (PizzaOfertaValida == true)
                                        {
                                            int count = 0;
                                            Profile.SCart.Items[idPizzaOferta].Price = 0;
                                            for (int r = 0; r < Profile.PizzaIngrd.Items.Count; r++)
                                            {
                                                if (count == countIngredPizzaOferta)
                                                    break;

                                                if (Profile.PizzaIngrd.Items[r].id_pizza == Profile.SCart.Items[idPizzaOferta].ProductID)
                                                {
                                                    Profile.PizzaIngrd.Items[r].precoIngred = 0;
                                                    count++;
                                                }
                                            }
                                            PizzaListOfertaId.Add(Profile.SCart.Items[idPizzaOferta].ProductID);
                                            CountPizzaOfertaValida++;
                                        }

                                        if (CountPizzaOfertaValida == nPizzaOferta)
                                            break;

                                    }

                                }

                            }


                            if (CountPizzaOfertaValida != 0)
                                promovalida = true;

                        }
                        


                        if (promovalida == true)
                            Session["aplicadaPromo"] = true;
                        else
                            Session["aplicadaPromo"] = false;

                    }



                  //se tiver maiornpizzas significa que é ex. leve 2 e pague 1
                    else if (Convert.ToDouble(dt.Rows[0].ItemArray[2].ToString()) == 0 && Convert.ToInt32(dt.Rows[0].ItemArray[8].ToString()) == 0 && Convert.ToInt32(dt.Rows[0].ItemArray[13].ToString()) == 0 && Convert.ToInt32(dt.Rows[0].ItemArray[9].ToString()) == 0 && Convert.ToInt32(dt.Rows[0].ItemArray[12].ToString()) != 0)
                    {

                        int nPizzaOferta = 0;
                       
                        ArrayList PizzaListPriceSorted = new ArrayList();
                        ArrayList PizzaListID = new ArrayList();

                        for (int j = 0; j < Profile.SCart.Items.Count; j++)
                        {

                            if (BLL.Artigo.MostrarIdCategoria(Profile.SCart.Items[j].ProductID) == -1)
                            {
                                PizzaListPriceSorted.Add(Profile.SCart.Items[j].Price);
                                PizzaListID.Add(Profile.SCart.Items[j].ProductID);
                            }

                            else if (BLL.Artigo.MostrarIdCategoria(Profile.SCart.Items[j].ProductID) == 2)
                            {
                                PizzaListPriceSorted.Add(Profile.SCart.Items[j].Price);
                                PizzaListID.Add(Profile.SCart.Items[j].ProductID);
                            }

                        }
                       

                        ArrayList PizzaListPrice = new ArrayList();
                        for (int j = 0; j < PizzaListPriceSorted.Count; j++)
                        {
                            PizzaListPrice.Add(PizzaListPriceSorted[j].ToString());
                        }

                        ArrayList PizzaListIDSorted = new ArrayList();

                        PizzaListPriceSorted.Sort();
                     
                        for (int s = 0; s < PizzaListPriceSorted.Count; s++)
                        {
                            if (PizzaListIDSorted.Count == PizzaListPriceSorted.Count)
                                break;
                            for (int p = 0; p < PizzaListPrice.Count; p++)
                            {
                                if (PizzaListPrice[p].ToString() == PizzaListPriceSorted[s].ToString())
                                    PizzaListIDSorted.Add(PizzaListID[p].ToString());
                                
                            }


                        }

                        PizzaListIDSorted.Sort();

                        if (countPizzas % 2 == 0)
                        {
                            //se npizza bd é par

                            double n = (countPizzas / Convert.ToInt32(dt.Rows[0].ItemArray[12].ToString()));
                            nPizzaOferta = Convert.ToInt32(Math.Round(n, 0, MidpointRounding.ToEven));
                        }
                        else
                        {
                            //se npizza bd é impar

                            double t = (countPizzas / Convert.ToInt32(dt.Rows[0].ItemArray[12].ToString()));
                            nPizzaOferta = countPizzas - Convert.ToInt32(Math.Round(t, 0, MidpointRounding.ToEven));

                        }
                      
                        int CountPizzaOfertaValida = 0;
                        int idPizzaOferta = 0;

                        ArrayList PizzaListOfertaId = new ArrayList();
                        for (int i = 0; i < nPizzaOferta; i++)
                        {
                           

                            for (int t = 0; t < PizzaListPriceSorted.Count; t++)
                            { 
                            Boolean PizzaOfertaValida = false;
                            for (int p = 0; p < Profile.SCart.Items.Count; p++)
                            {
                                int countIngredPizzaOferta = 0;                                           
                                    if (Convert.ToBoolean(dt.Rows[0].ItemArray[15].ToString())==true)//PrecoPizzaOfertaMaiorIgual 

                                    {
                                        for (int k = 0; k < idListaPizzasValidas.Count; k++)
                                        {
                                                             
                                            if (countPizzas != nPizzaOferta)
                                            {
                                                if (Profile.SCart.Items[p].Price >= Convert.ToDouble(PizzaListPriceSorted[t].ToString()) && PizzaListIDSorted[t].ToString() != idListaPizzasValidas[k].ToString())
                                                    {

                                                        PizzaOfertaValida = true;
                                                        idPizzaOferta = p;
                                                        countPizzas--;

                                                        
                                                        for (int g = 0; g < Profile.PizzaIngrd.Items.Count; g++)
                                                        {
                                                            //obtem o numero de ingred da pizza
                                                            if (Profile.PizzaIngrd.Items[g].id_pizza == Profile.SCart.Items[p].ProductID)
                                                                countIngredPizzaOferta++;
                                                        }
                                                        break;

                                                    }

                                                    else
                                                                        
                                                        PizzaOfertaValida = false;
                                            }
                                            else
                                                break;
                                        }

                                    }

                                    else  if (Convert.ToBoolean(dt.Rows[0].ItemArray[16].ToString()) == true)//PrecoPizzaOfertaMenorIgual                                         
                                               
                                    {
                                        for (int k = 0; k < idListaPizzasValidas.Count; k++)
                                        {
                                                                
                                            if (countPizzas != nPizzaOferta)
                                            {
                                              
                                                    if (Profile.SCart.Items[p].Price <= Convert.ToDouble(PizzaListPriceSorted[t].ToString()) && PizzaListIDSorted[t].ToString() != idListaPizzasValidas[k].ToString())
                                                    {

                                                        PizzaOfertaValida = true;
                                                        idPizzaOferta = p;
                                                        countPizzas--;

                                                        for (int g = 0; g < Profile.PizzaIngrd.Items.Count; g++)
                                                        {
                                                            //obtem o numero de ingred da pizza
                                                            if (Profile.PizzaIngrd.Items[g].id_pizza == Profile.SCart.Items[p].ProductID)
                                                                countIngredPizzaOferta++;
                                                        }

                                                        break;

                                                    }

                                                    else
                                                                        
                                                        PizzaOfertaValida = false;
                                            }
                                            else
                                                break;
                                        }
                                    }


                                    if (PizzaOfertaValida == true)
                                    {
                                        int count = 0;
                                        Profile.SCart.Items[idPizzaOferta].Price = 0;
                                        for (int r = 0; r < Profile.PizzaIngrd.Items.Count; r++)
                                        {
                                            if (count == countIngredPizzaOferta)
                                                break;

                                            if (Profile.PizzaIngrd.Items[r].id_pizza == Profile.SCart.Items[idPizzaOferta].ProductID)
                                            {
                                                Profile.PizzaIngrd.Items[r].precoIngred = 0;
                                                Profile.PizzaIngrd.Items[r].precoTotal = 0;
                                                count++;
                                            }
                                        }
                                            PizzaListOfertaId.Add(Profile.SCart.Items[idPizzaOferta].ProductID);
                                        CountPizzaOfertaValida++;
                                    }

                                    if (CountPizzaOfertaValida == nPizzaOferta)
                                        break;

                            }

                         }

                       }                                                                     
                        

                        if (CountPizzaOfertaValida != 0)
                            Session["aplicadaPromo"] = true;
                        else                        
                            this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('Lamentámos mas o conteúdo do seu pedido não se encontra de acordo com as condições da promoção escolhida!');</script>");
                        
                        
                    }


                    //se npizzasfixo significa ex leve 3 pague 1 (só pode ter mesmo 3)
                    else if (Convert.ToDouble(dt.Rows[0].ItemArray[2].ToString()) == 0 && Convert.ToInt32(dt.Rows[0].ItemArray[8].ToString()) == 0 && Convert.ToInt32(dt.Rows[0].ItemArray[13].ToString()) == 0 && Convert.ToInt32(dt.Rows[0].ItemArray[9].ToString()) != 0 && Convert.ToInt32(dt.Rows[0].ItemArray[12].ToString()) != 0)
                    {

                        if (countPizzas == Convert.ToInt32(dt.Rows[0].ItemArray[9].ToString()))
                        {

                            int nPizzaPagar = 0;

                            ArrayList PizzaListPriceSorted = new ArrayList();
                            ArrayList PizzaListID = new ArrayList();

                            for (int j = 0; j < Profile.SCart.Items.Count; j++)
                            {

                                if (BLL.Artigo.MostrarIdCategoria(Profile.SCart.Items[j].ProductID) == -1)
                                {
                                    PizzaListPriceSorted.Add(Profile.SCart.Items[j].Price);
                                    PizzaListID.Add(Profile.SCart.Items[j].ProductID);
                                }

                                else if (BLL.Artigo.MostrarIdCategoria(Profile.SCart.Items[j].ProductID) == 2)
                                {
                                    PizzaListPriceSorted.Add(Profile.SCart.Items[j].Price);
                                    PizzaListID.Add(Profile.SCart.Items[j].ProductID);
                                }

                            }


                            ArrayList PizzaListPrice = new ArrayList();
                            for (int j = 0; j < PizzaListPriceSorted.Count; j++)
                            {
                                PizzaListPrice.Add(PizzaListPriceSorted[j].ToString());
                            }

                            ArrayList PizzaListIDSorted = new ArrayList();

                            PizzaListPriceSorted.Sort();

                            for (int s = 0; s < PizzaListPriceSorted.Count; s++)
                            {
                                if (PizzaListIDSorted.Count == PizzaListPriceSorted.Count)
                                    break;
                                for (int p = 0; p < PizzaListPrice.Count; p++)
                                {
                                    if (PizzaListPrice[p].ToString() == PizzaListPriceSorted[s].ToString())
                                        PizzaListIDSorted.Add(PizzaListID[p].ToString());

                                }


                            }

                            PizzaListIDSorted.Sort();

                            //if (countPizzas % 2 == 0)
                            //{
                            //    //se npizza bd é par

                            //    double n = (countPizzas / Convert.ToInt32(dt.Rows[0].ItemArray[9].ToString()));
                            //    nPizzaOferta = Convert.ToInt32(Math.Round(n, 0, MidpointRounding.ToEven));
                            //}
                            //else
                            //{
                            //    //se npizza bd é impar

                            //    double t = (countPizzas / Convert.ToInt32(dt.Rows[0].ItemArray[9].ToString()));
                            //    nPizzaOferta = countPizzas - Convert.ToInt32(Math.Round(t, 0, MidpointRounding.ToEven));

                            //}

                            nPizzaPagar = Convert.ToInt32(dt.Rows[0].ItemArray[20].ToString());

                            int CountPizzaOfertaValida = 0;
                            int idPizzaOferta = 0;

                            ArrayList PizzaListOfertaId = new ArrayList();
                            for (int i = 0; i < nPizzaPagar; i++)
                            {


                                for (int t = 0; t < PizzaListPriceSorted.Count; t++)
                                {
                                    Boolean PizzaOfertaValida = false;
                                    for (int p = 0; p < Profile.SCart.Items.Count; p++)
                                    {
                                        int countIngredPizzaOferta = 0;

                                        if (Convert.ToBoolean(dt.Rows[0].ItemArray[16].ToString()) == true)//PrecoPizzaOfertaMenorIgual                                         
                                        {
                                            for (int k = 0; k < idListaPizzasValidas.Count; k++)
                                            {

                                                if (countPizzas != nPizzaPagar)
                                                {

                                                    if (Profile.SCart.Items[p].Price <= Convert.ToDouble(PizzaListPriceSorted[t].ToString()) && PizzaListIDSorted[t].ToString() != idListaPizzasValidas[k].ToString())
                                                    {

                                                        PizzaOfertaValida = true;
                                                        idPizzaOferta = p;
                                                        countPizzas--;

                                                        for (int g = 0; g < Profile.PizzaIngrd.Items.Count; g++)
                                                        {
                                                            //obtem o numero de ingred da pizza
                                                            if (Profile.PizzaIngrd.Items[g].id_pizza == Profile.SCart.Items[p].ProductID)
                                                                countIngredPizzaOferta++;
                                                        }

                                                        break;

                                                    }

                                                    else

                                                        PizzaOfertaValida = false;
                                                }
                                                else
                                                    break;
                                            }
                                        }


                                        if (PizzaOfertaValida == true)
                                        {
                                            int count = 0;
                                            Profile.SCart.Items[idPizzaOferta].Price = 0;
                                            for (int r = 0; r < Profile.PizzaIngrd.Items.Count; r++)
                                            {
                                                if (count == countIngredPizzaOferta)
                                                    break;

                                                if (Profile.PizzaIngrd.Items[r].id_pizza == Profile.SCart.Items[idPizzaOferta].ProductID)
                                                {
                                                    Profile.PizzaIngrd.Items[r].precoIngred = 0;
                                                    Profile.PizzaIngrd.Items[r].precoTotal = 0;
                                                    count++;
                                                }
                                            }
                                            PizzaListOfertaId.Add(Profile.SCart.Items[idPizzaOferta].ProductID);
                                            CountPizzaOfertaValida++;
                                        }

                                        if (CountPizzaOfertaValida == nPizzaPagar)
                                            break;

                                    }

                                }

                            }



                            if (CountPizzaOfertaValida != 0)
                                Session["aplicadaPromo"] = true;
                            else
                                this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('Lamentámos mas o conteúdo do seu pedido não se encontra de acordo com as condições da promoção escolhida!');</script>");


                        }
                        
                        else
                            this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('Lamentámos mas o conteúdo do seu pedido não se encontra de acordo com as condições da promoção escolhida!');</script>");













                        //Boolean promovalida = false;
                        //int count=0;
                        //int nPizzaPagar = 0;

                        //double k = (countPizzas / Convert.ToInt32(dt.Rows[0].ItemArray[13].ToString()));
                        //nPizzaPagar = Convert.ToInt32(Math.Round(k, 0, MidpointRounding.ToEven));

                        //if(countPizzas ==Convert.ToInt32(dt.Rows[0].ItemArray[9].ToString()))
                        //{

                        //    for (int i=0;i<Profile.SCart.Items.Count;i++)
                        //    {
                        //        for (int n=0;n<idListaPizzasValidas.Count;n++)
                        //        {
                        //            if (countPizzas != nPizzaPagar)
                        //            {
                        //                if (Profile.SCart.Items[i].ProductID == Convert.ToInt32(idListaPizzasValidas[n].ToString()))
                        //                {
                        //                    count++;
                        //                    countPizzas--;
                        //                    Profile.SCart.Items[i].Price = 0;

                        //                    for (int d = 0; d < Profile.PizzaIngrd.Items.Count; d++)
                        //                    {
                        //                        if (Profile.PizzaIngrd.Items[d].id_pizza == Profile.SCart.Items[i].ProductID)
                        //                            Profile.PizzaIngrd.Items[d].precoIngred = 0;
                        //                    }

                        //                }
                        //            }

                        //        }
                        //    }
                        //}

                        //if(count!=0)
                        //    promovalida=true;
                        //else
                        //    promovalida=false;


                        //if(promovalida==true)
                        //    Session["aplicadaPromo"]=true;
                        //else
                        //    Session["aplicadaPromo"]=false;
                
                
                    }



                     ////se npizzasfixo e npedidos significa ex leve 3 pague 1 (só pode ter mesmo 3) e tiver x numeros de pedidos
                    else if (Convert.ToDouble(dt.Rows[0].ItemArray[2].ToString()) == 0 && Convert.ToInt32(dt.Rows[0].ItemArray[8].ToString()) == 0 && Convert.ToInt32(dt.Rows[0].ItemArray[14].ToString()) != 0 && Convert.ToInt32(dt.Rows[0].ItemArray[9].ToString()) != 0 && Convert.ToInt32(dt.Rows[0].ItemArray[12].ToString()) != 0)
                    {
                        int npedido = 0;
                        Boolean promovalida = false;
                        int count=0;
                        int nPizzaPagar = 0;

                        double k = (countPizzas / Convert.ToInt32(dt.Rows[0].ItemArray[13].ToString()));
                        nPizzaPagar = Convert.ToInt32(Math.Round(k, 0, MidpointRounding.ToEven));

                        if (this.Context.User.Identity.IsAuthenticated != true)
                            this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('Para aplicar a promoção escolhida, tem de fazer login antecipadamente!');</script>");
                        else
                            npedido = BLL.Pedido.nPedidoByUser(Convert.ToString(Session["UserMail"]));
                        if (npedido ==Convert.ToInt32(dt.Rows[0].ItemArray[14].ToString()))
                        {

                            if (countPizzas == Convert.ToInt32(dt.Rows[0].ItemArray[9].ToString()))
                            {

                                for (int i = 0; i < Profile.SCart.Items.Count; i++)
                                {
                                    for (int n = 0; n < idListaPizzasValidas.Count; n++)
                                    {
                                        if (countPizzas != nPizzaPagar)
                                        {
                                            if (Profile.SCart.Items[i].ProductID == Convert.ToInt32(idListaPizzasValidas[n].ToString()))
                                            {
                                                count++;
                                                countPizzas--;
                                                Profile.SCart.Items[i].Price = 0;

                                                for (int d = 0; d < Profile.PizzaIngrd.Items.Count; d++)
                                                {
                                                    if (Profile.PizzaIngrd.Items[d].id_pizza == Profile.SCart.Items[i].ProductID)
                                                    {
                                                        Profile.PizzaIngrd.Items[d].precoIngred = 0;
                                                        Profile.PizzaIngrd.Items[d].precoTotal = 0;
                                                    }
                                                }

                                            }
                                        }

                                    }
                                }
                            }

                        }
                 

                        if(count!=0)
                            promovalida=true;
                        else
                            promovalida=false;


                        if(promovalida==true)
                            Session["aplicadaPromo"]=true;
                        else
                            Session["aplicadaPromo"]=false;


                    }

                    

                }

                if (Convert.ToBoolean(Session["aplicadaPromo"]) == true)
                {                                      
                    //divPromocaoAplicada.Visible = true;            
                    ImagePromocaoAplicada.ImageUrl = "~/Imagem_Artigo/" + BLL.Promocao.MostrarImagem(Convert.ToInt32(Session["idPromocaoSelected"]));
                    Response.Redirect("~/cesta.aspx");

                }


                else
                {
                    Session["aplicadaPromo"] = false;
                    //divPromocaoAplicada.Visible = false;
                    this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('Lamentámos mas o conteúdo do seu pedido não se encontra de acordo com as condições da promoção escolhida!');</script>");

                }
            }
            else
            {
                Session["aplicadaPromo"] = false;
                //divPromocaoAplicada.Visible = false;
                this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('Lamentámos mas o conteúdo do seu pedido não se encontra de acordo com as condições da promoção escolhida!');</script>");

            }
                    
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

    protected void ImageButtonRemoverPromo_Click(object sender, ImageClickEventArgs e)
    {
        Session["aplicadaPromo"] = false;
        RestaurarClasses();
        Response.Redirect("~/cesta.aspx");
    }

    protected void ListView2_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (Convert.ToBoolean(Session["AplicadoPontos"]) != true)
        {
            if (this.Context.User.Identity.IsAuthenticated != true)

                LabelErroSess.Visible = true;
            else
            {
                if (BLL.Utilizador.MostrarnPontos(BLL.Utilizador.MostrarId(Convert.ToString(Session["UserMail"]))) >= BLL.Pontos.MostrarnDescontos(Convert.ToInt32(e.CommandArgument)))
                {

                    AfectarClassesAux();
                   
                    Session["AplicadoPontos"] = true;

                    int count = 0;

                    double desconto = (Convert.ToDouble(BLL.Pontos.MostrarnDescontos(Convert.ToInt32(e.CommandArgument)))) / (double)100;


                    for (int p = 0; p < Profile.SCart.Items.Count; p++)
                    {

                        Profile.SCart.Items[p].Price = Profile.SCart.Items[p].Price - (Profile.SCart.Items[p].Price * desconto);
                        count++;


                        for (int r = 0; r < Profile.PizzaIngrd.Items.Count; r++)
                        {

                            if (Profile.PizzaIngrd.Items[r].id_pizza == Profile.SCart.Items[p].ProductID)
                            {

                                Profile.PizzaIngrd.Items[r].precoTotal = Profile.SCart.Items[p].Price - (Profile.SCart.Items[p].Price * desconto);

                            }
                        }


                    }
                    Session["idPontosSelected"] =Convert.ToInt32(e.CommandArgument);
                    Response.Redirect("~/cesta.aspx");
                   
                }
                else
                    this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('Lamentámos mas o seu número de pontos não o permite efectuar a troca de pontos!');</script>");




            }

        
        }
    }

    protected void ImageButtonRemovePontos_Click(object sender, ImageClickEventArgs e)
    {
        Session["AplicadoPontos"] = false;
        RestaurarClasses();
        Response.Redirect("~/cesta.aspx");

    }
}