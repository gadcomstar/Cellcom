using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

public partial class admin_ManageSiteManager : System.Web.UI.Page
{

  
    protected void Page_Load(object sender, EventArgs e)
	{
        if (Session["secLevel"] != null)
        {
            CatsTable.SqlWhereQuery = "secLevel>=" + Session["secLevel"];
             CatsTable.EditUrl = "EditSiteManager.aspx?id={field}&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];
            if (Session["secLevel"].ToString() == "1")
            {
                CatsTable.AddLink = "EditSiteManager.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];
         

            }
            else if  (Session["secLevel"].ToString() == "2")
            {
                CatsTable.AddLink = "EditSiteManager.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];
         
            
            } else
            {
                CatsTable.IsDelField = "false";
                CatsTable.SqlWhereQuery = "ManUN='" + Session["ManUN"]+"'";
            }
        }
        else
        {

            Response.Redirect("./");
        }


       
	}
}
