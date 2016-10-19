using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ManageListData : System.Web.UI.Page
{
    int siteLang = 0;
	protected void Page_Load(object sender, EventArgs e)
	{

        if (siteDefaults.CheckQueryString("sitelang", out siteLang))
        {
            LangTableControl.Visible = false;
            CatsTable.Visible = true;
            CatsTable2.Visible = true;

        }
        else
        {
            LangTableControl.Visible = true;
            CatsTable.Visible = false;
            CatsTable2.Visible = false;
        
        }
        LangTableControl.EditUrl = "ManageListData.aspx?sitelang={field}&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];
        CatsTable.EditUrl = "{field}?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&sitelang=" + Request.QueryString["sitelang"];
        CatsTable2.EditUrl = "ManageDropDown.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&sitelang=" + Request.QueryString["sitelang"] + "&drop={field}";
      
	}

}
