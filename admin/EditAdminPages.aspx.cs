using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class admin_EditAdminPages : System.Web.UI.Page
{
    private string ConnStr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;			
    protected void Page_Load(object sender, EventArgs e)
	{

        CatFormView.ReturnURL = "ManageAdminPages.aspx?type=2&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&MainCatID=" + Request.QueryString["Maincat"];
        backLink.NavigateUrl = "ManageAdminPages.aspx?type=2&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&MainCatID=" + Request.QueryString["Maincat"];
      
        if (Request.QueryString["id"] != null)
        {
            CatFormView.IdValue = Request.QueryString["id"];
            CatFormView.FormViewAction = FormViewControl13.FormViewActionTypes.Edit;

        }
        else
        {           

            CatFormView.FormViewAction = FormViewControl13.FormViewActionTypes.Insert;
            //CatFormView.SqlFieldNames += ",delfeild";
            //CatFormView.ReplaceField += ",true";
            //CatFormView.TblHeaderNames += ",";
            //CatFormView.SqlFieldType += ",12";

		}
    }


    protected void CatFormView_ItemUpdated(string UserID)
    {
        adminpages.CreateList(true);
    }
}
