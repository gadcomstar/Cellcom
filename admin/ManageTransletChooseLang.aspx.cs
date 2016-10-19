using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManageTransletChooseLang : System.Web.UI.Page
{
    int sitelang = 0;
	protected void Page_Load(object sender, EventArgs e)
	{
        if (cmstrDefualts.CheckQueryString("sitelang", out sitelang))
        {
            Response.Redirect("ManageSiteGenText.aspx?sitelang=" + sitelang + "&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"]);
        }
        else
        {

            CatsTable.EditUrl = "ManageSiteGenText.aspx?sitelang={field}&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];
        }
		    
             
	}

   


}
