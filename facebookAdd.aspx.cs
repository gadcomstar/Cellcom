using isendAPI;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class facebookAdd : System.Web.UI.Page
{
    int step = 0;
    //  string fbUrl = siteDefaults.FbRedirectUrlReg;
    string fbUrl = siteDefaults.FbRedirectUrlAdd;
    FacebookCode fb = null;
    string _usermail = "";
    string myemail = "";
    public string appId = siteDefaults.FbClientId;


    protected void Page_Load(object sender, EventArgs e)
    {
        if (!String.IsNullOrEmpty(Request.QueryString["code"]))
        {


            fb = new FacebookCode(siteDefaults.FbClientId, siteDefaults.FbClientSecret, fbUrl);
            if (Session != null && Session["LoggedUserMail"] != null && Session["LoggedUserMail"].ToString() != "")
            {
                myemail = Session["LoggedUserMail"].ToString();
            }

            bool faceExists = false;
            using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
            {
                if (fb != null && fb.fbUser.id != null && Session["LoggedUserID"] != null)
                {
                    conn.Open();
                    // check if facebook id exists (Logintypeid)
                    string sql = String.Format("Select LoginTypeID from tblusers where LoginTypeID='{0}' and LoginTypeID is not null", fb.fbUser.id);
                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    MySqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        faceExists = true;
                    }
                    dr.Close();
                    if (!faceExists)
                    {
                        cmd.CommandText = String.Format("UPDATE tblUsers SET CountryName='{1}',LoginProfilePic='{2}',LoginTypeToken='{3}',LoginType ='{4}',LoginTypeID='{5}',LoginMailAddress='{6}',SignInByFace=1 WHERE EmailAddress='{7}'",
                                           Session["LoggedUserID"].ToString(), NullProof(fb.fbUser.countryName), "http://graph.facebook.com/" + NullProof(fb.fbUser.id) + "/picture?type=square", NullProof(fb.fbUser.tmpToken), "fb", NullProof(fb.fbUser.id), NullProof(fb.fbUser.email), NullProof(myemail));
                        cmd.ExecuteNonQuery();

                        Badge.AddBadge(BadgTypeEnum.Join, conn, Session["LoggedUserMail"].ToString());
                        Adduser_WL(5078, fb.fbUser.email, fb.fbUser.first_name + " " + fb.fbUser.last_name);

                        Response.Redirect("./");
                    }
                    else
                    {
                        Response.Redirect("./?fb=exists&");
                    }


                    //int loginID = LoginUser.InsertNewFaceBookUser(fb, conn); 
                    //Session["login"] = "fb";
                    //Session["userId"] = loginID;
                    //Session["Logged"] = "Yes";
                    //conn.Close();
                    //if (loginID == -1)
                    //{
                    //    Response.Write("user exists in the system!");
                    //}
                    //else
                    //{
                    //    Adduser_WL(5078, fb.fbUser.email, fb.fbUser.first_name + " " + fb.fbUser.last_name);
                    //    Page.ClientScript.RegisterStartupScript(GetType(), "closePopup", "window.opener.socialLogin('" + fb.fbUser.id + "','" + fb.fbUser.picture + "','" + fb.fbUser.first_name + "'); window.close();", true);
                    //}
                }
                else
                {
                    //Response.Write("Error at if (fb != null && fb.fbUser != null)");
                    Response.Redirect("./");
                }
            }
        }
        else
        {
            Response.Redirect("./");
            //Response.Write("doesn't have a code");
        }
    }
    private string NullProof(object x)
    {
        if (x!=null)
            return x.ToString();
        else
            return "";
    }

    protected void Adduser_WL(int SiteID, string Mail, string FullName)
    {
        bool tmp = false;
        SendMsgResults _res = new SendMsgResults();
        SendMsgService _svc = new SendMsgService();
        _svc.AddUsersOnly(SiteID, true, "IL110077", new SendMsgUser[] 
        { 
            new SendMsgUser() { EmailAddress = Mail, UserSystemFields = new SendMsgFields[2]{new SendMsgFields(){ Key="שם", Value=FullName}, new SendMsgFields() { Key = "נרשם דרך פייסבוק", Value = "1" }} }
        }, out tmp, out tmp, out _res);
        if (_res.ResultMessage.Contains("Failed:1"))
        {
            using (MySqlConnection conn = new MySqlConnection(cmstrDefualts.ConnStr))
            {
                conn.Open();
                LoginUser.NotAddedToISend(Mail, conn);
            }
        }

    }

    public static void UpdateBadges(bool IsToDo, MySqlConnection con, string UserMail, string mission)
    {
        if (IsToDo)
        {
            Badge.AddBadge(BadgTypeEnum.Join, con, UserMail);
        }
    }

}