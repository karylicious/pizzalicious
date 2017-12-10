using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net .Mail ;


/// <summary>
/// Summary description for Email
/// </summary>
public class Email
{
	public static bool Enviarmail(string from, string recepient, string subject, string body)
    {
        try
        {
            //cria uma instância do objeto MailMessage
            MailMessage mMailMessage = new MailMessage();

            //Define o endereço do remetente
            mMailMessage.From = new MailAddress(from);

            //Define o destinario da mensagem
            mMailMessage.To.Add(new MailAddress(recepient));

            //Define o assunto 
            mMailMessage.Subject = subject;

            //Define o corpo da mensagem
            mMailMessage.Body = body;

            //Define o formato do email como  HTML
            mMailMessage.IsBodyHtml = true;

            // Define a prioridade da mensagem como normal
            mMailMessage.Priority = MailPriority.Normal;

            //Cria uma instância de SmtpClient
            SmtpClient mSmtpClient = new SmtpClient("smtp.sapo.pt");
            mSmtpClient.Port = 587;
            mSmtpClient.EnableSsl = true;

            //feirones@hotmail.com

            mSmtpClient.Credentials = new System.Net.NetworkCredential(from, "daniel2");

            //Envia o email
            //System.Net.WebProxy wp = new System.Net.WebProxy("172.16.16.3", 81);
          
            mSmtpClient.Send(mMailMessage);
        }
        catch (Exception ex)
        {
            System.Diagnostics.Trace.WriteLine(ex.Message, "Não Possivel Enviar E-mail Veja a Sua Conta");
        }
        
        
            

            return true;
        
    }
}
 

        
       
