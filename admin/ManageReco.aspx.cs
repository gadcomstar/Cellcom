using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ManageReco : System.Web.UI.Page
{

	protected void Page_Load(object sender, EventArgs e)
	{					
                CatsTable.AddLink = "EditReco.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];
                CatsTable.EditUrl = "EditReco.aspx?id={field}&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];			
	}

   


}
