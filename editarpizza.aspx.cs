using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session["subTitle"] = "Detalhes das Pizzas do seu Pedido";



        if (Convert.ToBoolean(Session["Impedir"]) == true)
        {
            this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('Não foi possível eliminar o ingrediente, visto que já se encontra incluído na pizza por definição!');</script>");
         Session["Impedir"] = false;
        }
        else
        {
       

        if (Convert.ToBoolean(Session["Alerta"])==true)
        {
         this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('Não foi possível eliminar o ingrediente, visto que esta pizza apenas contém este ingrediente!');</script>");
        Session["Alerta"]=false;
        }
            
        }

        if (Convert.ToBoolean(Session["contem"]) == true)
        {
            this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('Não foi possível adicionar o ingrediente, visto que já se encontra incluído na pizza!');</script>");
            Session["contem"] = false;
        }

        if (Convert.ToBoolean(Session["addNovoIngred"]) == true)
        {
            this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('Adicionado com sucesso!');</script>");
            Session["addNovoIngred"] = false;
        }
       

     

    }
}