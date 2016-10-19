using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

public partial class admin_ManageParameterProgramer : System.Web.UI.Page
{

  
    protected void Page_Load(object sender, EventArgs e)
	{
        CatsTable.AddLink = "EditParameterProgramer.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];
        CatsTable.EditUrl = "EditParameterProgramer.aspx?id={field}&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];
        
       
	}
}
