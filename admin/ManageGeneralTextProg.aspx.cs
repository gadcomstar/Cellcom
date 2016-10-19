using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

public partial class admin_ManageGeneralTextProg : System.Web.UI.Page
{

  
    protected void Page_Load(object sender, EventArgs e)
	{
        CatsTable.AddLink = "EditeGeneralTextProg.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];
        CatsTable.EditUrl = "EditeGeneralTextProg.aspx?id={field}&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];
        CatsTable.SqlWhereQuery = " lang='" + Session["langcode"] + "'";
       
	}
}
