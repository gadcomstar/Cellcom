using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class admin_EditPrivacyPolicy : System.Web.UI.Page
{
    private string ConnStr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;			
    protected void Page_Load(object sender, EventArgs e)
	{

        CatFormView.ReturnURL = "AdminHome.aspx?cat=" + Request.QueryString["cat"] + "&sitelang=" + Request.QueryString["sitelang"];
      
            CatFormView.IdValue = "1";
            CatFormView.FormViewAction = FormViewControl13.FormViewActionTypes.Edit;
    }
}
