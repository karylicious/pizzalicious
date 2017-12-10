using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class estadopedido : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        Session["subTitle"] = "Estado do seu Pedido";
        if(Convert.ToBoolean(Session["Entrou"]) == true)
            Response.Redirect("~/index.aspx");
        else
            Session["Entrou"]=true;
            
    }

    protected void ImageButtonCancelar_Click(object sender, ImageClickEventArgs e)
    {
        BLL.Pedido.AlterarEstado(Convert.ToInt32(Session["idPedido"]));
        Session.Abandon();
        Response.Redirect("~/index.aspx");
    }
}