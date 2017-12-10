using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;

public partial class verifica : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Context.User.Identity.IsAuthenticated)
        {

            Session["subTitle"] = "Confirmar código de verificação";


            if (Convert.ToBoolean(Session["enviouCod"]) != true)
            {
                Random random = new Random();
                int cod = random.Next(0, 99999999);

                Email.Enviarmail("email", Convert.ToString(Session["UserMail"]), "Código de verificação", "Verificou-se que está a tentar efectuar um pedido na Pizzalicious! <br/>" + "Para concluí-lo terá que introduzir o seguinte código: " + cod + "<br/>" + Convert.ToString(Session["UserMail"]));

                BLL.Utilizador.AlterarCodVF(BLL.Utilizador.MostrarId(Convert.ToString(Session["UserMail"])), cod);
                Session["enviouCod"] = true;
            }

        }
        else
            Response.Redirect("~/login.aspx");

    }
    protected void ImageButtonOK_Click(object sender, ImageClickEventArgs e)
    {


        if (TextBoxVerf.Text == BLL.Utilizador.VerificarCod(BLL.Utilizador.MostrarId(Convert.ToString(Session["UserMail"]))))
        {
            Session["enviouCod"] = false;
            Response.Redirect("~/concluirpedido.aspx");
        }

        else
            LabelVerf.Visible = true;
        Session["enviouCod"] = true;


    }



}
