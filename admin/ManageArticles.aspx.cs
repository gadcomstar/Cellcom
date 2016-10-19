using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ManageFooterLinks : System.Web.UI.Page
{

	protected void Page_Load(object sender, EventArgs e)
	{	
				int ParentID = 1;
                CatsTable.AddLink = "EditArticle.aspx?&MainCat=" + ParentID + "&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];
                CatsTable.EditUrl = "EditArticle.aspx?id={field}&Maincat=" + ParentID + "&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];
			
	}

   


}
