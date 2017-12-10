using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Collections;

public partial class artigos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["cat"] == "1")


            Response.Redirect("~/pedido.aspx");

        else if (Request.QueryString["cat"] == "7")
            Response.Redirect("~/menus.aspx");
     
        Session["subTitle"] = BLL.Categoria.MostrarCat(Convert.ToInt32(Request.QueryString["cat"].ToString()));

     

    }



}