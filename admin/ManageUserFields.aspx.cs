using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ManageUserFields : System.Web.UI.Page
{
    int contatctid = 0;
    int siteLang = 0;
	protected void Page_Load(object sender, EventArgs e)
	{
        LangTableControl.EditUrl = "ManageUserFields.aspx?sitelang={field}&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];

        if (cmstrDefualts.CheckQueryString("sitelang", out siteLang))
        {
            LangTableControl.Visible = false;
            CatsTable.Visible = true;
            ((ASP.controls_cmstrtextboxcontrol_ascx)BlogTypeMyForm.FindControl("ValueMyTextBox")).DataFieldName = siteLang.ToString();


            CatsTable.SqlFieldNames = String.Format("fieldname,`{0}`", siteLang);
            CatsTable.AddLink = "ManageUserFields.aspx?sitelang=" + Request.QueryString["sitelang"] + "&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&contact=0";
            CatsTable.EditUrl = "ManageUserFields.aspx?sitelang=" + Request.QueryString["sitelang"] + "&contact={field}&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];

            if (Request.QueryString["contact"] != null && int.TryParse(Request.QueryString["contact"], out contatctid))
            {
                BlogTypeMyForm.BackURL = "ManageUserFields.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];
                if (contatctid == 0)
                {
                    BlogTypeMyForm.FormStatus = CMSTRFormWebUserControl.Status.Insert;
                }
                else
                {
                    BlogTypeMyForm.FormStatus = CMSTRFormWebUserControl.Status.Update;
                    BlogTypeMyForm.DataKeyFieldValue = contatctid;
                }
            }
            else
            {

                BlogTypeMyForm.Visible = false;
            }
          }
        else
        {
            LangTableControl.Visible = true;
            CatsTable.Visible = false;
            BlogTypeMyForm.Visible = false;


        }
        
	}

   


}
