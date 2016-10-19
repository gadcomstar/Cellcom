using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using MySql.Data.MySqlClient;
using isendAPI;

public partial class JoinUsCheck : System.Web.UI.Page
{
    int GrpID = 0;
    string MissionName = "";
    string fbUrl = siteDefaults.FbRedirectUrlReg;
    FacebookCode fb = null;
    string usermail = "";
    string UserLang = "";
    string FromToIsender = "";
    bool BadgeMetaMode = false;
    int BadgeID = 0;
    string sender = "";
    public string appId = siteDefaults.FbClientId;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["JoinUsFBLink"] != null)
        {
            Address.InnerText = Request.Cookies["JoinUsFBLink"].Value;
        }

        if (Request.Cookies["JoinUsGroup"] != null)
        {
            Group.InnerText = Request.Cookies["JoinUsGroup"].Value;
        }

    }
    protected void page_PreRender(object sender, EventArgs e)
    {

    }


    protected void Adduser_WL(int SiteID, string Mail, string FullName, int ListID, string sendurl)
    {

    }


    protected void RegisterFBLinkButton_Click(object sender, EventArgs e)
    {
        HttpCookie cookie = new HttpCookie("JoinUsLink");
        cookie.Value = "true";
        cookie.Expires = DateTime.Now.AddMinutes(0.5);
        Response.SetCookie(cookie);

        Session["login"] = null;
        Session["id"] = null;
        if (Request.QueryString != null && Request.QueryString["grp"] != null && Request.QueryString["grp"] != "")
        {
            HttpCookie cookieGrp = new HttpCookie("JoinUsGroup");
            cookieGrp.Value = Request.QueryString["grp"];
            cookieGrp.Expires = DateTime.Now.AddMinutes(2.5);
            Response.SetCookie(cookieGrp);
        }
        fb = new FacebookCode(siteDefaults.FbClientId, siteDefaults.FbClientSecret);

        //Response.Redirect("http://comstar.co/?aa=aaa");

        fb.LoginClick(fbUrl, "user_hometown,email,user_location");


    }


}