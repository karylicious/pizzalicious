using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class recuperarpass : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["subTitle"] = "Recuperar palavra-passe";
        LabelAlerta.Visible = false;


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
                    CaptchaIncorrectLabel.Visible = false;
                    Session["ValidateCapcha"] = "1";
                }
            }
            else
            {
                if (Convert.ToString(Session["ValidateCapcha"]) == "-1")
                {

                    CaptchaIncorrectLabel.Visible = true;
                }
            }
        }




    }

    protected void ImageButtonRecuperar_Click(object sender, ImageClickEventArgs e)
    {
        if(TextBoxMail.Text!="")
        {
            if (Convert.ToString(Session["ValidateCapcha"]) == "1")
            {

                int id = BLL.Utilizador.VerificaExisteUser(TextBoxMail.Text);
                if (id != 0)
                {
                    string Pass = BLL.Utilizador.MostrarPass(TextBoxMail.Text);
                    Email.Enviarmail("email", TextBoxMail.Text, "Recuperação de palavra-passe", "Verificou-se que está a tentar recuperar a palavra-passe da sua conta na Pizzalicious! <br/>" + "A palavra-passe é: " + Pass);
                    this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('O seu pedido foi efectuado com sucesso!');</script>");
                }
                else
                    LabelAlerta.Visible = true;
            }
        }
    }
}
