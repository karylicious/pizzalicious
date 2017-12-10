<%@ Application Language="C#" %>
<%@ Import Namespace="System.Web.Profile" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
        // Code that runs on application startup

    }
    
    void Application_End(object sender, EventArgs e) 
    {
        //  Code that runs on application shutdown

    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
        // Code that runs when an unhandled error occurs

    }

    void Session_Start(object sender, EventArgs e) 
    {
        // Code that runs when a new session is started

    }

    void Session_End(object sender, EventArgs e)
    {
        // Code that runs when a session ends. 
        // Note: The Session_End event is raised only when the sessionstate mode
        // is set to InProc in the Web.config file. If session mode is set to StateServer 
        // or SQLServer, the event is not raised.

    }


    void Application_Unload(object sender, EventArgs e)
    {
        // Code that runs when a new session is started

    }

     void Application_Disposed (object sender, EventArgs e)
 {
     //System.IO.File.WriteAllText (@ "c: \ teste.txt", "Este é um teste", Encoding.UTF8);
 }

     void Profile_OnMigrateAnonymous(object sender, ProfileMigrateEventArgs e)
     {
         ProfileCommon anonymousProfile = Profile.GetProfile(e.AnonymousID);
         if (anonymousProfile.SCart != null)
         {
             if (Profile.SCart == null)
                 Profile.SCart = new ShoppingCartExample.Cart();

             Profile.SCart.Items.AddRange(anonymousProfile.SCart.Items);

             anonymousProfile.SCart = null;
         }

         if (anonymousProfile.PizzaIngrd != null)
         {
             if (Profile.PizzaIngrd == null)
                 Profile.PizzaIngrd = new PizzaExample.Pizza();

             Profile.PizzaIngrd.Items.AddRange(anonymousProfile.PizzaIngrd.Items);

             anonymousProfile.PizzaIngrd = null;
         }

         if (anonymousProfile.MenuItens != null)
         {
             if (Profile.MenuItens == null)
                 Profile.MenuItens = new MenuExample.Menu();

             Profile.MenuItens.Items.AddRange(anonymousProfile.MenuItens.Items);

             anonymousProfile.MenuItens = null;
         }
         
         //---Aux

         if (anonymousProfile.SCartAux != null)
         {
             if (Profile.SCartAux == null)
                 Profile.SCartAux = new ShoppingCartExampleAux.CartAux();

             Profile.SCartAux.Items.AddRange(anonymousProfile.SCartAux.Items);

             anonymousProfile.SCartAux = null;
         }

         if (anonymousProfile.PizzaIngrdAux != null)
         {
             if (Profile.PizzaIngrdAux == null)
                 Profile.PizzaIngrdAux = new PizzaExampleAux.PizzaAux();

             Profile.PizzaIngrdAux.Items.AddRange(anonymousProfile.PizzaIngrdAux.Items);

             anonymousProfile.PizzaIngrdAux = null;
         }

         if (anonymousProfile.MenuItensAux != null)
         {
             if (Profile.MenuItensAux == null)
                 Profile.MenuItensAux = new MenuExampleAux.MenuAux();

             Profile.MenuItensAux.Items.AddRange(anonymousProfile.MenuItensAux.Items);

             anonymousProfile.MenuItensAux = null;
         }

         if (anonymousProfile.PizzaMenu != null)
         {
             if (Profile.PizzaMenu == null)
                 Profile.PizzaMenu = new PizzaMenuExample.PizzaMenus();

             Profile.PizzaMenu.Items.AddRange(anonymousProfile.PizzaMenu.Items);

             anonymousProfile.PizzaMenu = null;
         }

         if (anonymousProfile.PizzaMenuAux != null)
         {
             if (Profile.PizzaMenuAux == null)
                 Profile.PizzaMenuAux = new PizzaMenuExampleAux.PizzaMenusAux();

             Profile.PizzaMenuAux.Items.AddRange(anonymousProfile.PizzaMenuAux.Items);

             anonymousProfile.PizzaMenu = null;
         }
         


         ProfileManager.DeleteProfile(e.AnonymousID);
         AnonymousIdentificationModule.ClearAnonymousIdentifier();
     }
    
    
    
       
</script>
