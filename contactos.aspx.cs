using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class contactos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["subTitle"] = "Contactos";
    }

    protected void ImageButtonEnviar_Click(object sender, ImageClickEventArgs e)
    {

        Email.Enviarmail("email", "email", TextBoxAssunto.Text, TextBoxMess.Text + "<br>" + TextBoxEmail.Text);
        this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('Mensagem enviada com sucesso!');</script>");
    }



}
