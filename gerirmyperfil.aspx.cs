using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class gerirmyperfil : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Context.User.Identity.IsAuthenticated && this.Context.User.Identity.Name == "Admin")
        {
            Session["subTitle"] = "Gestão do Meu Perfil";

            if (!(Session["Verifica"] == null))
            {
                if (Convert.ToBoolean(Session["Verifica"]) == true)
                {
                    this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('A palavra-passe foi alterada com sucesso!');</script>");
                    Session["Verifica"] = false;
                }
            }
            LabelAlerta.Visible = false;
        }
        else
            Response.Redirect("~/login.aspx");
        
    }
   
    protected void ImageButtonPalavra_Click(object sender, ImageClickEventArgs e)
    {
        string pwantiga = BLL.Utilizador.MostrarPass(Convert.ToString(Session["UserMail"]));
        if (TextBoxPassAnt.Text == pwantiga)
        {
            int idUser = BLL.Utilizador.MostrarId(Convert.ToString(Session["UserMail"]));

            BLL.Utilizador.AlterarPass(idUser, TextBoxConfPass.Text);

            Session["Verifica"] = true;
            if (Page.IsValid)
                Server.Transfer("gerirmyperfil.aspx");
        }
        else
            LabelAlerta.Visible = true;
    }
}