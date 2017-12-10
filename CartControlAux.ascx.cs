using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using ShoppingCartExampleAux;
public partial class CartControlAux : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)

    {      
        
        
            ReBindGrid();       
       
        
       
    }

    protected void grdCart_RowEditing(object sender, GridViewEditEventArgs e)
    {
           
        grdCart.EditIndex = e.NewEditIndex;
        ReBindGrid();
       
    }   

    protected void grdCart_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        
       
        TextBox txtQuantity = (TextBox)grdCart.Rows[e.RowIndex].Cells[3].FindControl("TextBox1");
        int Quantity = Convert.ToInt32(txtQuantity.Text);
        if (Quantity == 0)
        {
            Profile.SCartAux.Items.RemoveAt(e.RowIndex);
        }
        else
        {
            Profile.SCartAux.Items[e.RowIndex].Quantity = Quantity;          
        }

        grdCart.EditIndex = -1;
        ReBindGrid();       

    }

    protected void grdCart_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        grdCart.EditIndex = -1;
        ReBindGrid();
    }

    protected void grdCart_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
           
        Profile.SCartAux.Items.RemoveAt(e.RowIndex);
        
        ReBindGrid();                
    }

    private void ReBindGrid()
    {
        grdCart.DataSource = Profile.SCartAux.Items;
        DataBind();
        
     
    }

       
}
