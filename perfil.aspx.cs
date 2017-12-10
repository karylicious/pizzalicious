using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data;

public partial class perfil : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Context.User.Identity.IsAuthenticated)
        {
            if (this.Context.User.Identity.Name == "Admin")
                Response.Redirect("~/gestao.aspx");

            if (BLL.Pedido.MostarIdPromoUser(Convert.ToInt32(Session["idUser"])) != "")
            {
                tdPAnelComPromo.Visible = true;
                tdSemPromo.Visible = false;
            }
            else
            {
                tdSemPromo.Visible = true;
                tdPAnelComPromo.Visible = false;
            }




                Session["subTitle"] = "Perfil";

            DataTable dt = BLL.Utilizador.MostrarTudo(Convert.ToString(Session["UserMail"]));


            TextBoxNome.Text = dt.Rows[0].ItemArray[1].ToString();
            TextBoxEmail.Text = dt.Rows[0].ItemArray[8].ToString();
            TextBoxMorada.Text = dt.Rows[0].ItemArray[3].ToString();
            TextBoxLocal.Text = dt.Rows[0].ItemArray[4].ToString();
            TextBoxCodPost.Text = dt.Rows[0].ItemArray[7].ToString();
            TextBoxTelef.Text = dt.Rows[0].ItemArray[6].ToString();
            TextBoxTelem.Text = dt.Rows[0].ItemArray[5].ToString();
            LabelPontos.Text = dt.Rows[0].ItemArray[10].ToString();
            LabelAlerta.Visible = false;

            if (!(Session["Verifica"] == null))
            {
                if ((Boolean)Session["Verifica"] == true)
                {
                    this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('Alteração efectuada com sucesso!');</script>");
                    Session["Verifica"] = false;
                }
            }

            LabelAlertaMail.Visible = false;

        }
        else
            Response.Redirect("~/login.aspx");


    }

    protected void ImageButtonPalavra_Click(object sender, ImageClickEventArgs e)
    {
        if (Page.IsValid)
        {
            
            DataTable dt = BLL.Utilizador.MostrarTudo(Convert.ToString(Session["UserMail"]));

            if (TextBoxPassAnt.Text == dt.Rows[0].ItemArray[2].ToString())
            {

                BLL.Utilizador.Alterar(Convert.ToInt32(dt.Rows[0].ItemArray[0].ToString()), dt.Rows[0].ItemArray[1].ToString(), TextBoxConfPass.Text, dt.Rows[0].ItemArray[3].ToString(), dt.Rows[0].ItemArray[4].ToString(), Convert.ToInt32(dt.Rows[0].ItemArray[5].ToString()), Convert.ToInt32(dt.Rows[0].ItemArray[6].ToString()), dt.Rows[0].ItemArray[7].ToString(), Convert.ToString(Session["UserMail"]));
                Session["Verifica"] = true;
            
                Server.Transfer("perfil.aspx");
            }
            else
                LabelAlerta.Visible = true;

        }
    }

    protected void ImageButtonDados_Click(object sender, ImageClickEventArgs e)
    {
        DataTable dt = BLL.Utilizador.MostrarTudo(Convert.ToString(Session["UserMail"]));
        int aux = Convert.ToInt32(BLL.Utilizador.VerificaExisteUser(TextBoxEmail.Text));

            if (aux == 0)
            {
                 if (Page.IsValid)       
                     BLL.Utilizador.Alterar(Convert.ToInt32(dt.Rows[0].ItemArray[0].ToString()),TextBoxNome.Text, dt.Rows[0].ItemArray[2].ToString(),TextBoxMorada.Text,TextBoxLocal.Text, Convert.ToInt32(TextBoxTelem.Text), Convert.ToInt32(TextBoxTelef.Text),TextBoxCodPost.Text,Convert.ToString(Session["UserMail"]));
                 Session["UserMail"] = TextBoxEmail.Text;
            
            }

            else
                LabelAlertaMail.Visible=true;

    }
}