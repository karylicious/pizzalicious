using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class gerircat : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.Context.User.Identity.IsAuthenticated && this.Context.User.Identity.Name == "Admin")
        {
            Session["subTitle"] = "Gestão de Categorias";


            if (Convert.ToBoolean(Session["inseriu"]) == true)
            {
                this.ClientScript.RegisterStartupScript(this.GetType(), "Startup", "<script language='javascript'>alert('Categoria inserida com sucesso!');</script>");
                Session["inseriu"] = false;
            }
            LabelAlerta.Visible = false;
        }
        else
            Response.Redirect("~/login.aspx");

    }
 
    protected void ImageButtonInserir_Click(object sender, ImageClickEventArgs e)
    {
        if (TextBoxNome.Text != "")
        {
            Boolean existe = BLL.Categoria.ExisteCategoria(TextBoxNome.Text);
            if (existe != true)
            {
                BLL.Categoria.Inserir(TextBoxNome.Text, DateTime.Now);
                Session["inseriu"] = true;
                Server.Transfer("~/gerircat.aspx");
            }
            else
                LabelAlerta.Visible = true;
        }
    }
}