using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class WebUserControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Page.IsPostBack)
        {
            ReBindGrid();
        }     

    }

    private void ReBindGrid()
    {
        DataBind();

    }           
   
    protected void grdPizza_SelectedIndexChanged(object sender, EventArgs e)
    {       
        divPizza.Visible = true;      
        
    }     
   
    protected void ImageButtonPizza_Click(object sender, ImageClickEventArgs e)
    {
        if (Convert.ToInt32(DropDownListPizza.SelectedValue) != Profile.PizzaMenu.Items[grdPizza.SelectedIndex].id_pizza)
        {
            DataTable ingrd = BLL.Ingrediente.MostrarTudoIngredientes(Convert.ToInt32(DropDownListPizza.SelectedValue));               
                foreach (DataRow row in ingrd.Rows)          
            Profile.PizzaMenu.Insert(Convert.ToInt32(row.ItemArray[0].ToString()),Convert.ToInt32(DropDownListPizza.SelectedValue), Profile.PizzaMenu.Items[grdPizza.SelectedIndex].massa,DropDownListPizza.SelectedItem.Text,Profile.PizzaMenu.Items[grdPizza.SelectedIndex].tamanho, BLL.Artigo.MostrarNome(Convert.ToInt32(row.ItemArray[0].ToString())),BLL.Ingrediente.MostrarExtra(Convert.ToInt32(DropDownListPizza.SelectedValue),Convert.ToInt32(row.ItemArray[0].ToString())));
            
           Profile.PizzaMenu.DeleteItem(grdPizza.SelectedIndex);
        }
        ReBindGrid();
        Server.Transfer("~/editarpizza.aspx");
    }
}