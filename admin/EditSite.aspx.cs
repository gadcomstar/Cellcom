using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

public partial class admin_EditSite : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["secLevel"] != null && (Session["secLevel"].ToString() == "2" || Session["secLevel"].ToString() == "1"))
        {
            BlogTypeMyForm.BackURL = "AdminHome.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&sitelang=" + Request.QueryString["sitelang"] + "&type=5";
            BlogTypeMyForm.DataKeyFieldValue = 2;

        }
        else
        {
            Response.Redirect("./");
        
        }
    }

    protected void BlogTypeMyForm_ItemUpdated(string NewUserID)
    {
        siteDefaults.SiteParam.Clear();
    }
}
