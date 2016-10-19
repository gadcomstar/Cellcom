using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class admin_ManageSiteGenText : System.Web.UI.Page
{

    int mylang = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["sitelang"] != null && int.TryParse(Request.QueryString["sitelang"], out mylang))
        {
            TextTable.EditUrl = "editsitegentext.aspx?page={field}&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&sitelang=" + mylang;
        }
        else
        {
            Response.Redirect("./");
        }
                 

    }
}