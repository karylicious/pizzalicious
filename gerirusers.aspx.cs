using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class gerirusers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Context.User.Identity.IsAuthenticated && this.Context.User.Identity.Name == "Admin")
        {
            Session["subTitle"] = "Gestão de Utilizadores";

            if (Convert.ToBoolean(Session["Registou-se"]) == true)
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('Utilizador inserido com successo!');</script>");
                Session["Registou-se"] = false;
            }

            LabelAlerta.Visible = false;
        }
        else
            Response.Redirect("~/login.aspx");
    }
     
    protected void ImageButtonInserir_Click(object sender, ImageClickEventArgs e)
    {
        int aux = Convert.ToInt32(BLL.Utilizador.VerificaExisteUser(TextBoxEmail.Text));

        if (aux == 0)
        {

            BLL.Utilizador.Inserir(TextBoxNome.Text, TextBoxConfPass.Text, TextBoxMorada.Text, TextBoxLocal.Text, Convert.ToInt32(TextBoxTelem.Text), Convert.ToInt32(TextBoxTelef.Text), TextBoxCodP.Text, TextBoxEmail.Text,DateTime.Now);

            Session["Registou-se"] = true;

            if (Page.IsValid)
                Server.Transfer("~/gerirusers.aspx");
        }
        else
            LabelAlerta.Visible = true; 
    }
}