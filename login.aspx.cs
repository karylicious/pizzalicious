using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.IO;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["subTitle"] = "Login";
        if (Convert.ToString(Session["UserMail"]) == "")
            Session["UserMail"] = "teste";
        if (Convert.ToBoolean(Session["Registou-se"]) == true)
        {
            Session["Registou-se"] = false;
            this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('O seu registo foi efectuado com sucesso!');</script>");

        }
        
    }

    protected void Login1_Authenticate(object sender, AuthenticateEventArgs e)
    {
       
        String strResult = BLL.Utilizador.MostrarNome(Login1.UserName);

        if (strResult != null && strResult != "" && Login1.Password == BLL.Utilizador.MostrarPass(Login1.UserName))
        {
                       
                Session["UserMail"] = Login1.UserName;

                FormsAuthenticationTicket authTicket = new FormsAuthenticationTicket(strResult, false, 15);              

                Session.Add("Usuario", strResult);
                Session["idUser"] = BLL.Utilizador.MostrarId(Login1.UserName);
            FormsAuthentication.RedirectFromLoginPage(strResult, false);
                if (this.Context.User.Identity.Name == "admin")
                   Response.Redirect("~/gestao.aspx");
                else
                    Response.Redirect("~/perfil.aspx");      
            

        }
        else
            Login1.FailureText = "O e-mail ou a palavra-passe estão errados.";

    }
    
}