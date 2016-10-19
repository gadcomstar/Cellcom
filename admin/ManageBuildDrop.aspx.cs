using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class ManageBuildDrop : System.Web.UI.Page
{
    int blogid = 0;   
//    int myLang = 1;
    protected void Page_Load(object sender, EventArgs e)
    {
            if (Request.QueryString["country"] != null && int.TryParse(Request.QueryString["country"], out blogid))
            {
                if (blogid == 0)
                {
                    BlogTypeMyForm.FormStatus = CMSTRFormWebUserControl.Status.Insert;
                    ((ASP.controls_cmstrtextboxcontrol_ascx)BlogTypeMyForm.FindControl("NameMyTextBox")).Visible = true;
                }
                else
                {
                    //((ASP.controls_cmstrtextboxcontrol_ascx)BlogTypeMyForm.FindControl("NameMyTextBox")).Visible = false;
                    BlogTypeMyForm.DataKeyFieldValue = blogid;
                }
               // ((ASP.controls_cmstrtextboxcontrol_ascx)BlogTypeMyForm.FindControl("BlogTypeName")).DataFieldName = myLang.ToString();
                BlogTypeMyForm.SaveButtonText = "Save";
                BlogTypeMyForm.DataKeyField = "idmysitedropdown";
                BlogTypeMyForm.BackButtonText = "Back";
                BlogTypeMyForm.SaveReturnText = "Save&Back";
                BlogTypeMyForm.BackURL = "ManageBuildDrop.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&sitelang=" + Request.QueryString["sitelang"];

            }
            else
            {
                BlogTypeMyForm.Visible = false;

            }
            // CatsTable.SqlFieldNames = String.Format("`{0}`", myLang);
            CatsTable.EditUrl = "ManageBuildDrop.aspx?country={field}&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&sitelang=" + Request.QueryString["sitelang"];
            CatsTable.AddLink = "ManageBuildDrop.aspx?country=0&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&sitelang=" + Request.QueryString["sitelang"];
          
    }
    protected void CheckData(string[] myid)
    {

        //foreach (string id in myid)
        //{
        //    CheckData(id);
        //}
    }
    protected void CheckData(string myid)
    {
       


    }

}
