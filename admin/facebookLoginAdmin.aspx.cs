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
    string fbUrl = siteDefaults.FbRedirectUrlAdmin;
    FacebookCode fb = null;
    string _usermail = "";

    public string appId = "943F0773-399C-4154-A213-A81E049914CC";


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
                    //int loginID = LoginUser.InsertUpdateLoginUser(fb, conn); // Talal - you need to change the method so it will insert all the details requiered.
                    Session["login"] = "fb";
                    Session["userId"] = fb.fbUser.id;
                    Session["token"] = fb.fbUser.tmpToken;

                    //Response.Write(fb.fbUser.id);

                    //Session["userId"] = loginID;
                    Session["Logged"] = "Yes";
                    conn.Close();

                    Page.ClientScript.RegisterStartupScript(GetType(), "closePopup", "window.opener.socialLoginAdmin('" + fb.fbUser.tmpToken + "'); window.close();", true);
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
            fb.LoginClick(fbUrl, "user_hometown,email,user_location,manage_pages,publish_stream,read_insights");
        }

    }

}