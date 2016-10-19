using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class functions : System.Web.UI.Page
{
    private string ConnStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
	MySqlDataReader MyReader = null;
	
	protected void Page_Load(object sender, EventArgs e)
    {
		string act="";
		if (Request.QueryString["act"] == null)
		{
			if (Request.Form["act"] == null)
			{
				Response.Redirect("");
			}
			else
			{
				act = Request.Form["act"].ToString();
			}
		}
		else
		{
			act = Request.QueryString["act"].ToString();
		}

		switch (act){
			case "1":

				Session.Abandon();
                if (HttpContext.Current.Request.Cookies["adminspindate"] != null)
                {
                    HttpCookie myCookie = new HttpCookie("adminspindate");
                    myCookie.Expires = DateTime.Now.AddDays(-1d);
                    Response.Cookies.Add(myCookie);
                }
				Response.Redirect("./");
				break;
			default:
                if (HttpContext.Current.Request.Cookies["adminspindate"] != null)
                {
                    HttpCookie myCookie = new HttpCookie("adminspindate");
                    myCookie.Expires = DateTime.Now.AddDays(-1d);
                    Response.Cookies.Add(myCookie);
                }
				Response.Redirect("./");
				break;

			}


    }
}
