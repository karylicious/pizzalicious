using System;
using System.Data;
using System.Configuration;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections;

public partial class trocar : System.Web.UI.Page
{
   
    protected void Page_Load(Object sender, EventArgs e)
    {

        Session["subTitle"] = "Resultados da pesquisa";
        
    }
    
}