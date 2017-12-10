using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        tdPizzas.Visible = false;
        tdOutros.Visible = false;
        if (Convert.ToInt32(Session["idItemMenuEditar"]) != 0)
        {
            if (BLL.Artigo.MostrarIdCategoria(Convert.ToInt32(Session["idItemMenuEditar"])) != -1 && BLL.Artigo.MostrarIdCategoria(Convert.ToInt32(Session["idItemMenuEditar"])) != 2)
            {
                tdOutros.Visible = true;
                tdPizzas.Visible = false;

            }

            else
            {
                tdPizzas.Visible = true;
                tdOutros.Visible = false;
            }
        }

        Session["subTitle"] = "Detalhes dos Menus do seu Pedido";
        divitensAMostrarMenu.Visible = false;

    }

    protected void DropDownListArtigosMenu_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownListArtigosMenu.SelectedItem.Text != "-")
        {
            ImageDetMenu.ImageUrl = "~/Imagem_Artigo/" + BLL.Menu.MostrarImagem(Convert.ToInt32(DropDownListArtigosMenu.SelectedValue));
            LabelDetMenu.Text = BLL.Artigo.MostrarDetalhe(Convert.ToInt32(DropDownListArtigosMenu.SelectedValue));
            divitensAMostrarMenu.Visible = true;
        }
        else
            divitensAMostrarMenu.Visible = false;
    }

    protected void ImageButtonAlterar_Click(object sender, ImageClickEventArgs e)
    {
        if (Convert.ToInt32(DropDownListArtigosMenu.SelectedValue) != Convert.ToInt32(Session["idItemMenuEditar"]))
        {
            Profile.MenuItens.Insert(BLL.Menu.MostrarNome(Convert.ToInt32(Session["idMenuEditar"])),0,Convert.ToInt32(DropDownListArtigosMenu.SelectedValue),DropDownListArtigosMenu.SelectedItem.Text,BLL.Menu.MostrarPreco(Convert.ToInt32(Session["idMenuEditar"])),BLL.Menu.MostrarImagem(Convert.ToInt32(Session["idMenuEditar"])));
               
            Profile.MenuItens.DeleteItem(Convert.ToInt32(Session["idItemMenuEditarRow"]));
        }
       
        Server.Transfer("~/editarpizza.aspx");
    }
}