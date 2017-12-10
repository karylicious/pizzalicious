using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;
using AjaxControlToolkit;


public partial class Pedido : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        Session["subTitle"] = "O seu pedido ao seu gosto »";

        Session["carrinho"] = false;
               
        if (RadioButtonListCriarEscolher.SelectedValue == "")
        {
            TDcriarPzz.Visible = false;
            TDPizzas.Visible = false;
            TDPizzaBase.Visible = false;
            TDExtraM.Visible = false;
            TDExtraQ.Visible = false;
            TDIngrd.Visible = false;
           
            TDcriarPzz.Visible = false;
           
          

        }
        if (DropDownListMenu.SelectedItem.Text == "-")
        {
                   
            TDDefinicoesMenu.Visible = false;
            LabelDetalhesMenu.Visible = false;
            LabelDetalhesMenuList.Visible = false;
            LabelPrecoMenuList.Visible = false;
        }

        if (DropDownListArtigosMenu.SelectedValue == "-")
        {
            divitensAMostrarMenu.Visible = false;
            labelcatMenu.Visible = false;
            labelauxMenu.Visible = false;
             
            
        }

          
       
        if (ListBox1Menu.Items.Count != 0 && ListBox1Menu.Items[0].Value != "-")
            ImageButtonRemoverMenu.Visible = true;
        else
            ImageButtonRemoverMenu.Visible = false;

        if (ListBox1Menu.Items.Count == RepeaterMenu.Items.Count)
            ImageButtonTerminarMenu.Visible = true;
        else
            ImageButtonTerminarMenu.Visible = false;

        if (Convert.ToBoolean(Session["AdicionouMenu"]) == true)
        {
            Session["AdicionouMenu"] = true;
            this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('Menu adicionada ao seu Pedido com sucesso!');</script>");

            
        }



        if (Convert.ToBoolean(Session["AdicionouPizza"]) == true)
        {
            this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('Pizza adicionada ao seu Pedido com sucesso!');</script>");
            Session["AdicionouPizza"] =false;
        }
                  
   }   

    protected void DropDownListMenu_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownListMenu.SelectedIndex != 0)
        {
            TDDefinicoesMenu.Visible = true;
            DataTable menu = BLL.Menu.MostrarTudo(Convert.ToInt32(DropDownListMenu.SelectedValue));
            LabelDetalhesMenuList.Text = menu.Rows[0].ItemArray[3].ToString();
            LabelPrecoMenuList.Text = string.Format("{0,19:C}", Convert.ToDouble(menu.Rows[0].ItemArray[2].ToString()));

            TDcriarPzz.Visible = false;
            TDPizzaBase.Visible = false;

            //TDListTamanho.Visible = false;
            TDQuestMassa.Visible = false;
           
            LabelDetalhesMenu.Visible = true;
            LabelDetalhesMenuList.Visible = true;
            LabelPrecoMenuList.Visible = true;
        }
        else
        {

            TDDefinicoesMenu.Visible = false;
            LabelDetalhesMenu.Visible = false;
            LabelDetalhesMenuList.Visible = false;
            LabelPrecoMenuList.Visible = false;
        }

        if (ListBox1Menu.Items[0].Text != "(none)" && ListBox1Menu.Items.Count>=1)
        {
            for (int i = 0; i < ListBox1Menu.Items.Count; i++)
            {
                ListBox1Menu.Items.RemoveAt(i);
                ListBoxIdItens.Items.RemoveAt(i);
                i--;
            }
            ListBox1Menu.Items.Add("(none)");
            labelcatMenu.Visible = false;
            labelauxMenu.Visible = false;
            divitensAMostrarMenu.Visible=false;


            for (int i = 0; i < DropDownListArtigosMenu.Items.Count; i++)
            {
                DropDownListArtigosMenu.Items.RemoveAt(i);
                i--;
            }

            DropDownListArtigosMenu.Items.Add("-");



        }
        

    }

    protected void RadioButtonListCriarEscolher_SelectedIndexChanged(object sender, EventArgs e)
    {
        

        if (RadioButtonListCriarEscolher.SelectedValue == "Escolher da lista")
        {
  
            TDPizzas.Visible = true;
            TDcriarPzz.Visible = false;
           Session["dalista"] = true;
           
           ImagePizzaList.Visible = false;
           LabelDetPizzaList.Visible = false;
           LabeldtList.Visible = false;
                  
      
        }
        else
        {            
            TDPizzas.Visible = false;
            TDcriarPzz.Visible = true; 
            
            DropDownListPizzaList.SelectedIndex = -1;
        }

        RadioButtonListCriar.SelectedIndex = -1;
        TDExtraQ.Visible = false;
        TDExtraM.Visible = false;
        RadioButtonListQueijo.SelectedIndex = -1;
        RadioButtonListMolho.SelectedIndex = -1;  
        CheckBoxQ.Checked = false;
        CheckBoxM.Checked = false;
        TDPizzaBase.Visible = false;
        TDIngrd.Visible = false;


    }
 
    protected void RadioButtonListRadioButtonListCriar_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonListCriar.SelectedValue != "Escolher pizza base")
        {
            TDExtraQ.Visible = true;
            TDExtraM.Visible = true;
            RadioButtonListQueijo.SelectedIndex = -1;
            RadioButtonListMolho.SelectedIndex = -1;  
            TDPizzaBase.Visible = false;

            TDIngrd.Visible = true;

        }
        else
        {
            TDExtraQ.Visible = false;
            TDExtraM.Visible = false;
            RadioButtonListQueijo.SelectedIndex = -1;
            RadioButtonListMolho.SelectedIndex = -1;  
            ImagePizzaBase.Visible = false;
            LabelDetPizzaBase.Visible = false;
            LabeldtBase.Visible = false;
            TDPizzaBase.Visible = true;
            TDIngrd.Visible = false;
        }
        TDcriarPzz.Visible = true;
        LabelAtencao.Visible = false;
    }
       
    protected void ImageButtonAdicionarPizza_Click(object sender, ImageClickEventArgs e)
    {



        Session["count"] = 0;
        Session["PizzaValidada"] = false;





            if (RadioButtonListCriarEscolher.SelectedValue == "Criar pizza")
            {



               


                            if (RadioButtonListCriar.SelectedValue == "")
                            {
                                this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('Tem que indicar se pretende criar uma pizza nova ou escolher pizza base!');</script>");
                                  Session["PizzaValidada"] = false;
                            }
                            else
                            {

                            
                            if (RadioButtonListCriar.SelectedValue == "Escolher pizza base")
                            {
                                if (DropDownListPizzaBase.SelectedIndex == 0)
                                {

                                    this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('Tem que indicar a pizza que pretende!');</script>");
                                    Session["PizzaValidada"] = false;

                                }
                                else
                                {


                                CheckBox cbb;
                                int count = 0;

                                for (int i = 0; i < GridViewIngredientes.Rows.Count; i++)
                                {

                                    cbb = (CheckBox)GridViewIngredientes.Rows[i].Cells[0].FindControl("CheckBox1");

                                    if (cbb.Checked == true)
                                    {
                                        count++;
                                        Session["Checked"] = true;
                                    }

                                }

                                if (Convert.ToInt32(Session["count"]) >= 7)
                                {
                                    this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('Apenas pode escolher até 6 ingredientes!');</script>");
                                      Session["PizzaValidada"] = false;
                                }


                                else
                                {
                                    Session["HaIngre"] = false;
                                    CheckBox cb1;
                                    for (int i = 0; i < GridViewIngredientes.Rows.Count; i++)
                                    {

                                        cb1 = (CheckBox)GridViewIngredientes.Rows[i].Cells[0].FindControl("CheckBox1");

                                        if (cb1.Checked == true)
                                        {
                                            Label lbIngre = (Label)GridViewIngredientes.Rows[i].Cells[1].FindControl("Label1");



                                            if (Convert.ToBoolean(Session["HaIngre"]) == false)
                                                Session["HaIngre"] = BLL.Ingrediente.VerificaExisteIngre(Convert.ToInt32(DropDownListPizzaBase.SelectedValue), lbIngre.Text);
                                            else
                                                break;


                                        }


                                    }


                                    if (Convert.ToBoolean(Session["HaIngre"]) == true)
                                    {
                                        this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('Deve escolher ingredientes que não existam na pizza que escolheu!');</script>");
                                         Session["PizzaValidada"] = false;
                                    }

                                }

                                }


                            }
                            else//criar pizza nova
                            {
                                CheckBox cbb;
                                int count = 0;

                                for (int i = 0; i < GridViewIngredientes.Rows.Count; i++)
                                {

                                    cbb = (CheckBox)GridViewIngredientes.Rows[i].Cells[0].FindControl("CheckBox1");

                                    if (cbb.Checked == true)
                                    {
                                        count++;
                                        Session["Checked"] = true;
                                    }

                                }

                                if (count == 0)
                                {
                                    this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('Tem que indicar os ingredientes que pretende!');</script>");
                                     Session["PizzaValidada"] = false;
                                }
                                else if (Convert.ToInt32(Session["count"]) >= 7)
                                {
                                    this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('Apenas pode escolher até 6 ingredientes!');</script>");
                                      Session["PizzaValidada"] = false;

                                }
                            }




                            if (RadioButtonListQueijo.SelectedItem == null)
                            {
                                this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('Tem que indicar o queijo que pretende!');</script>");
                                 Session["PizzaValidada"] = false;
                            }

                            if (RadioButtonListMolho.SelectedItem == null)
                            {
                                this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('Tem que indicar o molho que pretende!');</script>");
                                 Session["PizzaValidada"] = false;
                            }

                            if (RadioButtonListTamanho.SelectedIndex == -1)
                            {

                                this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('Tem que indicar o tamanho que pretende!');</script>");
                                 Session["PizzaValidada"] = false;

                            }
                            else
                            {



                            if (RadioButtonListMassa.SelectedItem == null)
                            {
                                this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('Tem que indicar o tipo de massa que pretende!');</script>");
                                Session["PizzaValidada"] = false;
                            }
                            else
                                  Session["PizzaValidada"] = true;
                            }

                            }
               
               
            }






            else //Escolher da lista
            {



               

                            if (DropDownListPizzaList.SelectedIndex == 0)
                            {

                                this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('Tem que indicar a pizza que pretende!');</script>");
                               Session["PizzaValidada"] = false;

                            }
                            else{
                                                       

                            if (RadioButtonListTamanho.SelectedIndex == -1)
                            {

                                this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('Tem que indicar o tamanho que pretende!');</script>");
                                 Session["PizzaValidada"] = false;

                            }
                                else
                            {




                                            if (RadioButtonListMassa.SelectedItem == null)
                                            {

                                                this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('Tem que indicar o tipo de massa que pretende!');</script>");
                                                 Session["PizzaValidada"] = false;
                                            }
                                            else
                                                  Session["PizzaValidada"] = true;
                            }
                       }

                       

                

            }














       

        //-------------------

















            if (Convert.ToBoolean(Session["PizzaValidada"]) == true)
            {




                //-------------------------


                DataTable auxIngr = new DataTable();
                BLL.Artigo.CriarPizzaAux("Pizzacriadaff");
                int idArt = BLL.Artigo.MostrarUltId();
                BLL.Artigo.AlterarNome(idArt, "Pizzacriada" + idArt);
                Session["CountPizzasCriadas"] = Convert.ToUInt32(Session["CountPizzasCriadas"]) + 1;

                if (RadioButtonListCriarEscolher.SelectedValue == "Criar pizza")
                {
                    CheckBox cbk;
                    CheckBox cbl;
                    double priceTT = 0;

                    for (int i = 0; i < GridViewIngredientes.Rows.Count; i++)
                    {

                        cbk = (CheckBox)GridViewIngredientes.Rows[i].Cells[0].FindControl("CheckBox1");
                        cbl = (CheckBox)GridViewIngredientes.Rows[i].Cells[0].FindControl("CheckBox2");
                        if (cbk.Checked == true)
                        {
                            Label lb = (Label)GridViewIngredientes.Rows[i].Cells[1].FindControl("Label1");
                            if (cbl.Checked == true)
                                priceTT += BLL.Artigo.MostrarPreco(BLL.Artigo.Mostrarid(lb.Text)) * 2;
                            else
                                priceTT += BLL.Artigo.MostrarPreco(BLL.Artigo.Mostrarid(lb.Text));

                        }

                    }
                    int idPizzaBase = -1;
                    //pizza base
                    if (RadioButtonListCriar.SelectedValue == "Escolher pizza base")
                        idPizzaBase = Convert.ToInt32(DropDownListPizzaBase.SelectedValue);







                    priceTT += BLL.Tamanho.MostrarPreco(Convert.ToInt32(RadioButtonListTamanho.SelectedValue)) + BLL.Artigo.MostrarPreco(Convert.ToInt32(RadioButtonListQueijo.SelectedValue)) + BLL.Artigo.MostrarPreco(Convert.ToInt32(RadioButtonListMolho.SelectedValue));

                    //--------------
                    double PQ = 0;
                    double PM = 0;
                    if (CheckBoxQ.Checked == true)
                    {
                        int idQ = BLL.Artigo.Mostrarid("Extra Queijo");
                        Profile.PizzaIngrd.Insert("Pizza criada por si " + "(" + Session["CountPizzasCriadas"] + ")", idArt, idQ, idPizzaBase, RadioButtonListMassa.SelectedItem.Text, RadioButtonListTamanho.SelectedValue, "Extra Queijo", "Não", BLL.Tamanho.MostrarPreco(Convert.ToInt32(RadioButtonListTamanho.SelectedValue)), BLL.Artigo.MostrarPreco(idQ), BLL.Tamanho.MostrarPreco(Convert.ToInt32(RadioButtonListTamanho.SelectedValue)) + BLL.Artigo.MostrarPreco(idQ), "Carrinho");
                        PQ = BLL.Artigo.MostrarPreco(idQ);
                    }
                    if (CheckBoxM.Checked == true)
                    {
                        int idM = BLL.Artigo.Mostrarid("Extra Molho");
                        Profile.PizzaIngrd.Insert("Pizza criada por si " + "(" + Session["CountPizzasCriadas"] + ")", idArt, idM, idPizzaBase, RadioButtonListMassa.SelectedItem.Text, RadioButtonListTamanho.SelectedValue, "Extra Molho", "Não", BLL.Tamanho.MostrarPreco(Convert.ToInt32(RadioButtonListTamanho.SelectedValue)), BLL.Artigo.MostrarPreco(idM), BLL.Tamanho.MostrarPreco(Convert.ToInt32(RadioButtonListTamanho.SelectedValue)) + BLL.Artigo.MostrarPreco(idM), "Carrinho");
                        PM = BLL.Artigo.MostrarPreco(idM);
                    }
                    //---------------------
                    for (int i = 0; i < GridViewIngredientes.Rows.Count; i++)
                    {

                        cbk = (CheckBox)GridViewIngredientes.Rows[i].Cells[0].FindControl("CheckBox1");
                        cbl = (CheckBox)GridViewIngredientes.Rows[i].Cells[0].FindControl("CheckBox2");
                        if (cbk.Checked == true)
                        {
                            Label lb = (Label)GridViewIngredientes.Rows[i].Cells[1].FindControl("Label1");
                            int idIngred = BLL.Artigo.Mostrarid(lb.Text);
                            if (cbl.Checked == true)
                                Profile.PizzaIngrd.Insert("Pizza criada por si " + "(" + Session["CountPizzasCriadas"] + ")", idArt, idIngred, idPizzaBase, RadioButtonListMassa.SelectedItem.Text, RadioButtonListTamanho.SelectedItem.Text, lb.Text, "Sim", BLL.Tamanho.MostrarPreco(Convert.ToInt32(RadioButtonListTamanho.SelectedValue)), BLL.Artigo.MostrarPreco(BLL.Artigo.Mostrarid(lb.Text)) * 2, priceTT + PM + PQ, "Carrinho");
                            else
                                Profile.PizzaIngrd.Insert("Pizza criada por si " + "(" + Session["CountPizzasCriadas"] + ")", idArt, idIngred, idPizzaBase, RadioButtonListMassa.SelectedItem.Text, RadioButtonListTamanho.SelectedItem.Text, lb.Text, "Não", BLL.Tamanho.MostrarPreco(Convert.ToInt32(RadioButtonListTamanho.SelectedValue)), BLL.Artigo.MostrarPreco(BLL.Artigo.Mostrarid(lb.Text)), priceTT + PM + PQ, "Carrinho");
                        }

                    }

                    if (RadioButtonListCriar.SelectedValue == "Escolher pizza base")
                    {
                        auxIngr = BLL.Ingrediente.MostrarTudoIngredientes(Convert.ToInt32(DropDownListPizzaBase.SelectedValue));
                        foreach (DataRow row in auxIngr.Rows)
                            Profile.PizzaIngrd.Insert("Pizza criada por si " + "(" + Session["CountPizzasCriadas"] + ")", idArt, Convert.ToInt32(row.ItemArray[0].ToString()), Convert.ToInt32(DropDownListPizzaBase.SelectedValue), RadioButtonListMassa.SelectedItem.Text, RadioButtonListTamanho.SelectedItem.Text, BLL.Artigo.MostrarNome(Convert.ToInt32(row.ItemArray[0].ToString())), "Não", BLL.Tamanho.MostrarPreco(Convert.ToInt32(RadioButtonListTamanho.SelectedValue)), BLL.Artigo.MostrarPreco(Convert.ToInt32(row.ItemArray[0].ToString())), priceTT, "Carrinho");
                        Profile.SCart.Insert(idArt, priceTT + PM + PQ, 1, "Pizza criada por si " + "(" + Session["CountPizzasCriadas"] + ")", BLL.Massa.MostrarImagem(Convert.ToInt32(RadioButtonListMassa.SelectedValue)));

                    }
                    else
                        Profile.SCart.Insert(idArt, priceTT + PM + PQ, 1, "Pizza criada por si " + "(" + Session["CountPizzasCriadas"] + ")", BLL.Massa.MostrarImagem(Convert.ToInt32(RadioButtonListMassa.SelectedValue)));


                }
                else //escolher da lista
                {

                    double PQ = 0;
                    double PM = 0;
                    if (CheckBoxQ.Checked == true)
                    {
                        int idQ = BLL.Artigo.Mostrarid("Extra Queijo");
                        Profile.PizzaIngrd.Insert(DropDownListPizzaList.SelectedItem.Text, Convert.ToInt32(DropDownListPizzaList.SelectedValue), idQ, -1, RadioButtonListMassa.SelectedItem.Text, RadioButtonListTamanho.SelectedItem.Text, "Extra Queijo", "Não", BLL.Tamanho.MostrarPreco(Convert.ToInt32(RadioButtonListTamanho.SelectedValue)), BLL.Artigo.MostrarPreco(idQ), BLL.Tamanho.MostrarPreco(Convert.ToInt32(RadioButtonListTamanho.SelectedValue)) + BLL.Artigo.MostrarPreco(idQ), "Carrinho");
                        PQ = BLL.Artigo.MostrarPreco(idQ);
                    }
                    if (CheckBoxM.Checked == true)
                    {
                        int idM = BLL.Artigo.Mostrarid("Extra Molho");
                        Profile.PizzaIngrd.Insert(DropDownListPizzaList.SelectedItem.Text, Convert.ToInt32(DropDownListPizzaList.SelectedValue), idM, -1, RadioButtonListMassa.SelectedItem.Text, RadioButtonListTamanho.SelectedItem.Text, "Extra Molho", "Não", BLL.Tamanho.MostrarPreco(Convert.ToInt32(RadioButtonListTamanho.SelectedValue)), BLL.Artigo.MostrarPreco(idM), BLL.Tamanho.MostrarPreco(Convert.ToInt32(RadioButtonListTamanho.SelectedValue)) + BLL.Artigo.MostrarPreco(idM), "Carrinho");
                        PM = BLL.Artigo.MostrarPreco(idM);
                    }


                    DataTable ingrd = BLL.Ingrediente.MostrarTudoIngredientes(Convert.ToInt32(DropDownListPizzaList.SelectedValue));
                    Profile.SCart.Insert(Convert.ToInt32(DropDownListPizzaList.SelectedValue), BLL.Tamanho.MostrarPreco(Convert.ToInt32(RadioButtonListTamanho.SelectedValue)) + PM + PQ, 1, DropDownListPizzaList.SelectedItem.Text, BLL.Artigo.MostrarImagem(Convert.ToInt32(DropDownListPizzaList.SelectedValue)));

                    foreach (DataRow row in ingrd.Rows)
                        Profile.PizzaIngrd.Insert(DropDownListPizzaList.SelectedItem.Text, Convert.ToInt32(DropDownListPizzaList.SelectedValue), Convert.ToInt32(row.ItemArray[0].ToString()), -1, RadioButtonListMassa.SelectedItem.Text, RadioButtonListTamanho.SelectedItem.Text, BLL.Artigo.MostrarNome(Convert.ToInt32(row.ItemArray[0].ToString())), row.ItemArray[1].ToString(), BLL.Tamanho.MostrarPreco(Convert.ToInt32(RadioButtonListTamanho.SelectedValue)), BLL.Artigo.MostrarPreco(Convert.ToInt32(row.ItemArray[0].ToString())), BLL.Tamanho.MostrarPreco(Convert.ToInt32(RadioButtonListTamanho.SelectedValue)) + PM + PQ, "Carrinho");
                }
                Session["AdicionouPizza"] = true;
                Server.Transfer("~/pedido.aspx");

            }

            

    }

    protected void ImageButtonAdicionarProduto_Click(object sender, ImageClickEventArgs e)
    {     

        CheckBox cbk1;

        for (int i = 0; i < GridViewUnidades.Rows.Count; i++)
        {

            cbk1 = (CheckBox)GridViewUnidades.Rows[i].Cells[0].FindControl("CheckBox1");

            if (cbk1.Checked == true)
            {
                Label lb = (Label)GridViewUnidades.Rows[i].Cells[1].FindControl("Label1");
                DropDownList dp = (DropDownList)GridViewUnidades.Rows[i].Cells[6].FindControl("DropDownList1");
                Profile.SCart.Insert(Convert.ToInt32(lb.Text), BLL.Artigo.MostrarPreco(Convert.ToInt32(lb.Text)), Convert.ToInt32(dp.SelectedItem.Text), BLL.Artigo.MostrarNome(Convert.ToInt32(lb.Text)), BLL.Artigo.MostrarImagem(Convert.ToInt32(lb.Text)));


            }

        }

        Session["AdicionouProduto"] = true;
        Server.Transfer("~/pedido.aspx");

    }

    protected void CheckBoxQ_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBoxQ.Checked == true)
        {
            int idQ = BLL.Artigo.Mostrarid("Extra Queijo");
           
            Session["valido"] = true;
           
        }
        else if (Convert.ToBoolean(Session["valido"]) == true && CheckBoxQ.Checked == false)
       {
            int idQ = BLL.Artigo.Mostrarid("Extra Queijo");
           
        }
    }

    protected void CheckBoxM_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBoxM.Checked == true)
        {
            int idM = BLL.Artigo.Mostrarid("Extra Molho");
            Session["valido"] = true;
          
        }
        else if (Convert.ToBoolean(Session["valido"]) == true && CheckBoxM.Checked == false)
        {
            int idM = BLL.Artigo.Mostrarid("Extra Molho");
            
        }
    }
   
    protected void ImageButtonTerminarMenu_Click(object sender, ImageClickEventArgs e)
    {

        if (ListBox1Menu.Items.Count != 0 && ListBox1Menu.Items[0].Value != "(none)")
        {

            DataTable dt = BLL.Menu.MostrarTudo(Convert.ToInt32(Session["catMenuID"]));
            int count = BLL.MenuCategoria.MostarQuantidadeCat(Convert.ToInt32(Session["catMenuID"]));
            
            for (int k = 0; k < ListBox1Menu.Items.Count; k++)
            {
                //if (BLL.Artigo.MostrarIdCategoria(Convert.ToInt32(ListBoxIdItens.Items[k])) == count)
                    Profile.MenuItens.Insert(DropDownListMenu.SelectedItem.Text, Convert.ToInt32(Session["catMenuID"]), Convert.ToInt32(ListBoxIdItens.Items[k].Text), ListBox1Menu.Items[k].Text, Convert.ToDouble(dt.Rows[0].ItemArray[2].ToString()), BLL.Artigo.MostrarImagem(Convert.ToInt32(ListBoxIdItens.Items[k].Text)));

            }


        
        
        for (int i = 0; i < ListBox1Menu.Items.Count; i++)
        {
            Profile.MenuItensAux.Insert(DropDownListMenu.SelectedItem.Text, Convert.ToInt32(DropDownListMenu.SelectedValue), Convert.ToInt32(ListBoxIdItens.Items[i].Text), ListBox1Menu.Items[i].Text, BLL.Menu.MostrarPreco(Convert.ToInt32(DropDownListMenu.SelectedValue)), BLL.Artigo.MostrarImagem(Convert.ToInt32(ListBoxIdItens.Items[i].Text)));
        }

        for (int i = 0; i < ListBox1Menu.Items.Count; i++)
        {
            ListBox1Menu.Items.RemoveAt(i);
            i--;
        }

        for (int i = 0; i < ListBoxIdItens.Items.Count; i++)
        {
            ListBoxIdItens.Items.RemoveAt(i);
            i--;
        }

        ListBox1Menu.Items.Add("(none)");
        ImageButtonTerminarMenu.Visible = false;






        int idMenu = 0;
        for (int i = 0; i < Profile.MenuItensAux.Items.Count; i++)
        {
            Profile.MenuItens.Insert(Profile.MenuItensAux.Items[i].MenuName, Profile.MenuItensAux.Items[i].MenuID, Profile.MenuItensAux.Items[i].ProductID, Profile.MenuItensAux.Items[i].ProductName, Profile.MenuItensAux.Items[i].Price, BLL.Artigo.MostrarImagem(Profile.MenuItensAux.Items[i].ProductID));
            idMenu = Profile.MenuItensAux.Items[i].MenuID;
            if (BLL.Artigo.MostrarIdCategoria(Profile.MenuItensAux.Items[i].ProductID) == -1 || BLL.Artigo.MostrarIdCategoria(Profile.MenuItensAux.Items[i].ProductID) == 2)
            {
                DataTable ingrd = BLL.Ingrediente.MostrarTudoIngredientes(Profile.MenuItensAux.Items[i].ProductID);
                string nomeTamanho = BLL.Menu.MostrarTamanho(Profile.MenuItensAux.Items[i].MenuID);
                string nomeMassa = BLL.Menu.MostrarMassa(Profile.MenuItensAux.Items[i].MenuID);
                foreach (DataRow row in ingrd.Rows)
                    Profile.PizzaMenu.Insert(Convert.ToInt32(row.ItemArray[0].ToString()), Profile.MenuItensAux.Items[i].ProductID, nomeMassa, Profile.MenuItensAux.Items[i].ProductName, nomeTamanho, BLL.Artigo.MostrarNome(Convert.ToInt32(row.ItemArray[0].ToString())), BLL.Ingrediente.MostrarExtra(Profile.MenuItensAux.Items[i].ProductID, Convert.ToInt32(row.ItemArray[0].ToString())));

            }


        }

        if (Profile.MenuItensAux.Items.Count != 0)
            Profile.SCart.Insert(idMenu, BLL.Menu.MostrarPreco(idMenu), 1, BLL.Menu.MostrarNome(idMenu), BLL.Menu.MostrarImagem(idMenu));






        Profile.MenuItensAux = new MenuExampleAux.MenuAux();
            

      
        Session["AdicionouMenu"] = true;
            Server.Transfer("~/pedido.aspx");


        }  


    
    }
  
    protected void ImageButtonRemoverMenu_Click(object sender, ImageClickEventArgs e)
    {
        if (ListBox1Menu.SelectedIndex != -1)
        {

            ListBox1Menu.Items.RemoveAt(ListBox1Menu.SelectedIndex);
            ListBoxIdItens.Items.RemoveAt(ListBox1Menu.SelectedIndex);
        }
        else
            this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('Tem que seleccionar o artigo antes de tentar removê-lo!');</script>");



        if (ListBox1Menu.Items.Count == 0)
        {
            ListBox1Menu.Items.Add("(none)");
            ImageButtonRemoverMenu.Visible = false;
        }
    }

    protected void ImageButtonAdicionarMenu_Click(object sender, ImageClickEventArgs e)
    {
        
        if (DropDownListArtigosMenu.SelectedItem.Text != "-")
        {
            Session["idMenuSeleted"] = DropDownListMenu.SelectedValue;

            bool existe = false;
            if (ListBox1Menu.Items[0].Value != "(none)")
            {
                for (int i = 0; i <= ListBox1Menu.Items.Count - 1; i++)
                {

                    if (BLL.Categoria.MostrarCat(Convert.ToInt32(BLL.Artigo.MostrarIdCategoria(BLL.Artigo.Mostrarid(ListBox1Menu.Items[i].Value)))) == labelcatMenu.Text && ListBox1Menu.Items.Count != BLL.MenuCategoria.CountCatIncluidas(Convert.ToInt32(Session["idMenuSeleted"])))
                    {
                        existe = true;
                        break;
                    }
                }
                if (existe == true)

                    this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('No seu menu já se encontra adicionado um artigo da categoria em causa. Para adicionar novo artigo, remova o que adicionou.');</script>");
                else
                {
                    ListBox1Menu.Items.Add(DropDownListArtigosMenu.SelectedItem.Text);
                    ListBoxIdItens.Items.Add(DropDownListArtigosMenu.SelectedItem.Value);
                    ImageButtonRemoverMenu.Visible = true;
                }
            }

            else
            {
                ListBox1Menu.Items.RemoveAt(0);
                ListBox1Menu.Items.Add(DropDownListArtigosMenu.SelectedItem.Text);
                ListBoxIdItens.Items.Add(DropDownListArtigosMenu.SelectedItem.Value);
                ImageButtonRemoverMenu.Visible = true;
            }

            if (ListBox1Menu.Items.Count == RepeaterMenu.Items.Count)
                ImageButtonTerminarMenu.Visible = true;
            else
                ImageButtonTerminarMenu.Visible = false;

        }
    }
      
    protected void RepeaterMenu_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        Session["catMenuID"] = Convert.ToInt32(e.CommandArgument);

        for (int i = 0; i < DropDownListArtigosMenu.Items.Count; i++)
        {
            DropDownListArtigosMenu.Items.RemoveAt(i);
            i--;
        }

        DropDownListArtigosMenu.Items.Add("-");

        DropDownListArtigosMenu.DataBind();
        labelcatMenu.Text = BLL.Categoria.MostrarCat(Convert.ToInt32(e.CommandArgument));
        labelcatMenu.Visible = true;
        labelauxMenu.Visible = true;
        divitensAMostrarMenu.Visible = false;
        DropDownListArtigosMenu.Visible = true;
    }
  
    protected void DropDownListArtigosMenu_SelectedIndexChanged(object sender, EventArgs e)
    {
        ImageDetMenu.ImageUrl = "~/Imagem_Artigo/" + BLL.Artigo.MostrarImagem(Convert.ToInt32(DropDownListArtigosMenu.SelectedValue));
        LabelDetMenu.Text = BLL.Artigo.MostrarDetalhe(Convert.ToInt32(DropDownListArtigosMenu.SelectedValue));
        divitensAMostrarMenu.Visible = true;
    }
   
    protected void DropDownListPizzaList_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownListPizzaList.SelectedItem.ToString() != "-")
        {
            ImagePizzaList.ImageUrl = "~/Imagem_Artigo/" + BLL.Artigo.MostrarImagem(Convert.ToInt32(DropDownListPizzaList.SelectedValue));
            LabelDetPizzaList.Text = BLL.Artigo.MostrarDetalhePizza(Convert.ToInt32(DropDownListPizzaList.SelectedValue));
            ImagePizzaList.Visible = true;
            LabelDetPizzaList.Visible = true;
            LabeldtList.Visible = true;

            TDcriarPzz.Visible = false;
            TDPizzas.Visible = true;

            DataTable ingrds = BLL.Ingrediente.MostrarTudoIngredientes(Convert.ToInt32(DropDownListPizzaList.SelectedValue));
            Boolean encontrouQ = false;
            Boolean encontrouM = false;
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

                TDExtraQ.Visible = false;

            else

                TDExtraQ.Visible = true;

            if (encontrouM == true)

                TDExtraM.Visible = false;

            else

                TDExtraM.Visible = true;
        }
        else
        {

            ImagePizzaList.Visible = false;
            LabelDetPizzaList.Visible = false;
            LabeldtList.Visible = false;
        }
     
    
    }
  
    protected void DropDownListPizzaBase_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownListPizzaBase.SelectedItem.ToString() != "-")
        {

            ImagePizzaBase.ImageUrl = "~/Imagem_Artigo/" + BLL.Artigo.MostrarImagem(Convert.ToInt32(DropDownListPizzaBase.SelectedValue));
            LabelDetPizzaBase.Text = BLL.Artigo.MostrarDetalhePizza(Convert.ToInt32(DropDownListPizzaBase.SelectedValue));
            ImagePizzaBase.Visible = true;
            LabelDetPizzaBase.Visible = true;
            LabeldtBase.Visible = true;
            LabelAtencao.Visible = true;

            TDPizzaBase.Visible = false;

            TDIngrd.Visible = true;
            TDPizzaBase.Visible = true;
            TDcriarPzz.Visible = true;

            DataTable ingrds = BLL.Ingrediente.MostrarTudoIngredientes(Convert.ToInt32(DropDownListPizzaBase.SelectedValue));
            Boolean encontrouQ = false;
            Boolean encontrouM = false;
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

                TDExtraQ.Visible = false;

            else
                TDExtraQ.Visible = true;

            if (encontrouM == true)

                TDExtraM.Visible = false;

            else

                TDExtraM.Visible = true;
        }
        else
        {
            ImagePizzaBase.Visible = false;
            LabelDetPizzaBase.Visible = false;
            LabeldtBase.Visible = false;           
            TDIngrd.Visible = false;
        }
    }

   
}