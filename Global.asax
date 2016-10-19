<%@ Application Language="C#" %>

<script RunAt="server">

    void Application_BeginRequest(Object sender, EventArgs e)
    {
        //if (Request.Url.ToString().ToLower().EndsWith(".css") || Request.Url.ToString().ToLower().EndsWith(".js"))
        //{
        //    Response.Cache.SetCacheability(HttpCacheability.Public);           
        //    Response.Cache.SetMaxAge(new TimeSpan(8, 0, 0, 0));
        //}
        //if ( (Request.Url.ToString().ToLower().EndsWith(".jpg") || Request.Url.ToString().ToLower().EndsWith(".png") || Request.Url.ToString().ToLower().EndsWith(".gif")) && Request.Url.ToString().IndexOf("siteimage")>-1 )
        //{
        //    Response.Cache.SetCacheability(HttpCacheability.Public);
        //    Response.Cache.SetMaxAge(new TimeSpan(8, 0, 0, 0));
        //}
    }

    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
        siteDefaults.SiteGeneralDefaults();
        siteDefaults.SiteGeneralParam();
        adminpages.FillListFromDb();    
        //siteDefaults.GetCountry();
        //siteDefaults.GetState();
        //methods.CreateSmillyList();

        // process start
        //Processes.StartTimer();

    }


    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs
        ////Exception objErr = Server.GetLastError().GetBaseException();
        ////string aa = Request.PhysicalApplicationPath + "Logs\\errorlog";
        ////CreateLogFiles Err = new CreateLogFiles();
        ////Err.ErrorLog(aa, objErr.Message);
        ////Err.ErrorLog(aa, objErr.StackTrace);

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

        Badge.UpdateBadgeToOld(Session["LoggedUserMail"].ToString());

    }
       
</script>
