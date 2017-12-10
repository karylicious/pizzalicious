using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MenuControlAux : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {


        
            ReBindGrid();
        
    


    }
 
    
    protected void grdMenu_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
                  
            Profile.MenuItensAux.Items.RemoveAt(e.RowIndex);         

            ReBindGrid();
            
       
    }

    private void ReBindGrid()
    {
        grdMenu.DataSource = Profile.MenuItensAux.Items;
        DataBind();

  
    }

}