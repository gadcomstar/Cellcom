using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class facebookLogin : System.Web.UI.Page
{
    int step = 0;
    //string fbUrl = HttpContext.Current.Request.Url.Host.Contains("www.") ? siteDefaults.FbRedirectUrl.Replace("israelikers.org", "www.israelikers.org") : siteDefaults.FbRedirectUrl;
    string fbUrl = siteDefaults.FbRedirectUrl;
    FacebookCode fb = null;
    string _usermail = "";

    public string appId = siteDefaults.FbClientId;


    protected void Page_Load(object sender, EventArgs e)
    {
          if (!String.IsNullOrEmpty(Request.QueryString["code"]))
        {

            fb = new FacebookCode(siteDefaults.FbClientId, siteDefaults.FbClientSecret, fbUrl);
            using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
            {
                if (fb != null && fb.fbUser != null)
                {
                    conn.Open();
                    int loginID = LoginUser.InsertUpdateLoginUser(fb, conn); 
                    Session["login"] = "fb";
                    Session["userId"] = loginID;
                    Session["Logged"] = "Yes";
                    Session["LoggedUserMail"] = fb.fbUser.email;

                    conn.Close();
                    Page.ClientScript.RegisterStartupScript(GetType(), "closePopup", "window.opener.socialLogin('" + fb.fbUser.id + "','" + fb.fbUser.picture + "','" + fb.fbUser.first_name + "'); window.close();", true);
                }
                else
                {
                    Response.Write("has no fb user");
                }
            }
        }
        else
        {
            fb = new FacebookCode(siteDefaults.FbClientId, siteDefaults.FbClientSecret);
            fb.LoginClick(fbUrl, "user_hometown,email,user_location");
        }

    }

}