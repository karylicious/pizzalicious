using System;
using System.Data;
using System.Configuration;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;

public partial class SiteMaster : System.Web.UI.MasterPage
{

    

    protected void Page_Load(object sender, EventArgs e)
    {

        if (Convert.ToBoolean(Session["Limpar"]) != true)
        {
            BLL.Artigo.Eliminar_Antigos();
            Session["Limpar"] = true;
           
        }


        if (Convert.ToBoolean(Session["Entrou"]) == true)
            Session["Entrou"] = false;

        if (!this.Context.User.Identity.IsAuthenticated)
        {
           
            ImageButtonLog.ImageUrl = "~/Images/logiin.png";
                LabelLog.Text = "";
                HyperLinkPerfil.Visible = false;           

        }
        else
        {
            ImageButtonLog.ImageUrl = "~/Images/logoout.png";
            LabelLog.Text = "Seja bem-vindo(a) " + this.Context.User.Identity.Name;
            HyperLinkPerfil.Visible = true;

            if (this.Context.User.Identity.Name == "Admin")
            {
                HyperLinkPerfil.Text = "(Administração)";
                HyperLinkPerfil.NavigateUrl = "~/gestao.aspx";

            }
        }

        
        if (Session["subTitle"]!=null)
        {
            LabelSubtitle.Text = (String)Session["subTitle"];
        }

      
       

        ImageButtonProdEspc.ImageUrl = "~/Imagem_Artigo/" + BLL.Promocao.MostrarEspecial();

        
        if(Profile.SCart.Items.Count!=0)
        {           
            
               LabelItem.Text = Convert.ToString(Profile.SCart.Items.Count);
               LabelPrice.Text = string.Format("Total:{0,19:C}", Profile.SCart.Total);
        }
        else
        {
            LabelItem.Text = "0";
            LabelPrice.Text = "0.00€";
        }




        if (this.Context.User.Identity.IsAuthenticated && Session["UserMail"] == null)
        {
            FormsAuthentication.SignOut();
            ImageButtonLog.ImageUrl = "~/Images/logiin.png";
            LabelLog.Text = "";
            HyperLinkPerfil.Visible = false;
        }


    }
    protected void ImageButtonLog_Click(object sender, ImageClickEventArgs e)
    {
        if (!this.Context.User.Identity.IsAuthenticated)
        {
            ImageButtonLog.ImageUrl = "~/Images/logiin.png";
            HyperLinkPerfil.Visible = false;
            
            
        }
        else
        {
            ImageButtonLog.ImageUrl = "~/Images/logiin.png";
            LabelLog.Text = "";
            HyperLinkPerfil.Visible = false;
            FormsAuthentication.SignOut();
            Profile.SCart = new ShoppingCartExample.Cart();
            Profile.SCartAux = new ShoppingCartExampleAux.CartAux();
            Profile.PizzaIngrd = new PizzaExample.Pizza();
            Profile.PizzaIngrdAux = new PizzaExampleAux.PizzaAux();
            Profile.MenuItens = new MenuExample.Menu();
            Profile.MenuItensAux = new MenuExampleAux.MenuAux();
            Profile.PizzaMenu = new PizzaMenuExample.PizzaMenus();
            Profile.PizzaMenuAux = new PizzaMenuExampleAux.PizzaMenusAux();

            string ImagePath = "TemporaryFiles/";
            string[] Files = Directory.GetFiles(Server.MapPath(ImagePath));

            foreach (string file in Files)
                File.Delete(file);
           
        }

        

        Response.Redirect("~/login.aspx");
    }

  


    protected void ImageButton4_Click(object sender, ImageClickEventArgs e)
    {
        if (TextBox1.Text!="")
        Response.Redirect("search.aspx?ref=" + '%' + TextBox1.Text + '%');
    }
    
}
