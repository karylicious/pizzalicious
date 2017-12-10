using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class regist : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["subTitle"] = "Registo";
        // initial page setup
        if (!IsPostBack)
        {
            // set control text

            CaptchaCorrectLabel.Text = "Correcto!";
            CaptchaIncorrectLabel.Text = "Incorrecto!";
            Session["ValidateCapcha"] = "-1";
            // these messages are shown only after validation
            CaptchaCorrectLabel.Visible = false;
            CaptchaIncorrectLabel.Visible = false;


        }

        LabelAlerta.Visible = false;
        // setup client-side input processing
        SampleCaptcha.UserInputClientID = CaptchaCodeTextBox.ClientID;

        if (IsPostBack)
        {
            // validate the Captcha to check we're not dealing with a bot
            string code = CaptchaCodeTextBox.Text.Trim().ToUpper();
            bool isHuman = SampleCaptcha.Validate(code);
            CaptchaCodeTextBox.Text = null; // clear previous user input

            if (isHuman)
            {
                if (Convert.ToString(Session["ValidateCapcha"]) == "-1")
                {
                    //CaptchaCorrectLabel.Visible = true;
                    CaptchaIncorrectLabel.Visible = false;
                    Session["ValidateCapcha"] = "1";
                }
            }
            else
            {
                if (Convert.ToString(Session["ValidateCapcha"]) == "-1")
                {
                    //CaptchaCorrectLabel.Visible = false;
                    CaptchaIncorrectLabel.Visible = true;
                }
            }
        }
    }


    protected void ImageButtonRegist_Click(object sender, ImageClickEventArgs e)
    {
        if (Convert.ToString(Session["ValidateCapcha"]) == "1")
        {
           int aux = Convert.ToInt32(BLL.Utilizador.VerificaExisteUser(TextBoxEmail.Text));

            if (aux == 0)
            {

                BLL.Utilizador.Inserir(TextBoxNome.Text, TextBoxConfPass.Text, TextBoxMorada.Text, TextBoxLocal.Text, Convert.ToInt32(TextBoxTelem.Text), Convert.ToInt32(TextBoxTelef.Text), TextBoxCodP.Text, TextBoxEmail.Text, DateTime.Now);

                Session["Registou-se"] = true;

                Email.Enviarmail("email", TextBoxEmail.Text, "Obrigado por registar-se na Pizzalicious", "<b><font color=red>" + "Bem vindo(a) " + TextBoxNome.Text + "!</font></b> <br><br>A partir deste momento poderá desfrutar das suas pizzas comodamente, ao seu ritmo e sem esperas por um preço excepcional.<br>Está preparado(a) para o seu próximo passo?<br><br>Obrigado por confiar na Pizzalicious.");
                Response.Redirect("~/login.aspx");

            }
            else
                LabelAlerta.Visible = true;
        }


    }

}
