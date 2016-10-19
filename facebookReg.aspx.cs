using isendAPI;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class facebookReg : System.Web.UI.Page
{
    int step = 0;   
    string fbUrl = siteDefaults.FbRedirectUrlReg;
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
                    int loginID = LoginUser.InsertNewFaceBookUser(fb, conn);
                    conn.Close();

                    //Response.Redirect("http://comstar.co/?aa=" + loginID);
                    if (loginID == 0)
                    {
                        Response.Redirect("joinus.aspx");
                    }
   
                    if (loginID == -1)
                    {
                        Response.Redirect("./") ;
                    }
                    else
                    {
                        if (Session["SanFransisco"]!=null && Session["SanFransisco"] == "true")
                        {
                            string SanFransiscoUrl = "https://panel.i-send.co.il/AddUserFromSite.aspx?eMail=" + fb.fbUser.email + "&1=" + fb.fbUser.first_name + " " + fb.fbUser.last_name + "&4=1&5=0&form=6557__d9fda905-f5aa-49ae-b6a6-e186f1f4613d";

                            HttpWebRequest webRequest = (HttpWebRequest)System.Net.WebRequest.Create(SanFransiscoUrl); //setting an httpWebRequest with the URL of the API
                            webRequest.Method = "GET";//the type of method the API returns
                            webRequest.Timeout = 20000;//sets the timeout for the request
                            webRequest.ContentType = "application/x-www-form-urlencoded";//the content type. most of the times it will be application/x-www-form-urlencoded
                            string responseData = "";
                            try
                            {
                                StreamReader MyStream = new StreamReader(webRequest.GetResponse().GetResponseStream());//creating a stream reader to read the results from the API
                                responseData = MyStream.ReadToEnd();//reading the result from the API into a string
                            }
                            catch
                            {
                            }

                        }
                        Adduser_WL(5078, fb.fbUser.email, fb.fbUser.first_name + " " + fb.fbUser.last_name);
                        Page.ClientScript.RegisterStartupScript(GetType(), "closePopup", "window.opener.socialLogin('" + fb.fbUser.id + "','" + fb.fbUser.picture + "','" + fb.fbUser.first_name + "'); window.close();", true);
                        Session["login"] = "fb";
                        Session["userId"] = loginID;
                        Session["Logged"] = "Yes";
                        Session["LoggedUserMail"] = fb.fbUser.email;
                        Session["LoggedUserPicture"] = "http://graph.facebook.com/" + fb.fbUser.id + "/picture?type=square";
                    }
                    Session["showStrap"] = true;
                    Response.Redirect("./?firsttime=face");
                }
                else
                {
                    Response.Write("has no fb user");
                }
            }
        }
        else
        {
            Response.Redirect("./");
            //fb = new FacebookCode(siteDefaults.FbClientId, siteDefaults.FbClientSecret);
            //fb.LoginClick(fbUrl, "user_hometown,email,user_location");
        }
    }
    protected void Adduser_WL(int SiteID, string Mail, string FullName)
    {
        string groupid="";
        if (Request.Cookies["JoinUsGroup"] != null)
        {
            groupid = Request.Cookies["JoinUsGroup"].Value;
        }

        int groupidInt;
        if(!int.TryParse(groupid, out groupidInt))
        {
            groupidInt = 19;
        }
        bool tmp = false;
        bool tmp2 = false;
        SendMsgResults _res = new SendMsgResults();
        SendMsgService _svc = new SendMsgService();
        
        List<SendMsgList> _mailList = new List<SendMsgList>();
        
        List<SendMsgUser> _UsersList = new List<SendMsgUser>();
        _UsersList.Add(new SendMsgUser() { EmailAddress = Mail, UserSystemFields = new SendMsgFields[2] { new SendMsgFields() { Key = "שם", Value = FullName }, new SendMsgFields() { Key = "נרשם דרך פייסבוק", Value = "1" } } });
        _mailList.Add(new SendMsgList() { ExistingListID = groupidInt , ExistingListIDSpecified = true });
        _svc.AddUsersToLists(SiteID, true, "IL110077", _UsersList.ToArray(), _mailList.ToArray(), out tmp2, out tmp, out _res);

        if (_res.ResultMessage.Contains("Failed:1"))
        {
            using (MySqlConnection conn = new MySqlConnection(cmstrDefualts.ConnStr))
            {
                conn.Open();
                LoginUser.NotAddedToISend(Mail, conn);
            }        
        }
    }


      //bool tmp;
      //  bool AddUsersToListResult;
      //  SendMsgResults _res = new SendMsgResults();
      //  SendMsgService _svc = new SendMsgService();
      //  List<SendMsgUser> _UsersList = new List<SendMsgUser>();
      //  List<SendMsgList> _mailList = new List<SendMsgList>();
      //  //_mailList.Add(new SendMsgList() { ExistingListID = ListID, ExistingListIDSpecified = true });
      //  _mailList.Add(new SendMsgList() { ExistingListID = 55, ExistingListIDSpecified = true });
      //  _UsersList.Add(new SendMsgUser() { EmailAddress = Mail, UserSystemFields = new SendMsgFields[4] { new SendMsgFields() { Key = "שם", Value = FullName }, new SendMsgFields() { Key = "קישור הרשמה", Value = sendurl }, new SendMsgFields() { Key = "נרשם דרך מייל", Value = "1" }, new SendMsgFields() { Key = "מהיכן נרשם", Value = FromToIsender } } });

      //  _svc.AddUsersToLists(SiteID, true, "IL110077", _UsersList.ToArray(), _mailList.ToArray(), out AddUsersToListResult, out tmp, out _res);
}