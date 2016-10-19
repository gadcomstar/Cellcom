using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Linq;
public partial class ManageSlider : System.Web.UI.Page
{
    int contatctid = 0;
    int siteLang = 0;
	protected void Page_Load(object sender, EventArgs e)
	{

        CatsTable.AddLink = "EditSlid.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&sitelang=" + Request.QueryString["sitelang"] + "&badge=0";
        CatsTable.EditUrl = "EditSlid.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&sitelang=" + Request.QueryString["sitelang"] + "&badge={field}";
        CatsTable.CustomField = ",<img src='{0}' />";
       
        
        
	}





  
}
