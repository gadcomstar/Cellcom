using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using MySql.Data.MySqlClient;
using isendAPI;
using System.Net;
using System.IO;

public partial class JoinUs : System.Web.UI.Page
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
        if (Request.QueryString != null && Request.QueryString["Exists"] != null && Request.QueryString["Exists"]=="true")
        {
            ((Label)MyFormHeb.FindControl("lblRegisterStatus")).Text = "* User Already Exists *";
        }

        ((HtmlGenericControl)Master.FindControl("MasterBG")).Visible = false;


        if (Request.QueryString != null && (Request.QueryString["fb_source"] != null || Request.QueryString["from"] == "facebook"))
        {
            //FB_Mode = true;
            //   joinuspageholder.Attributes.Add("style", "width:100%;");
            // LandingImgContentHolder.Attributes.Add("style", "background-size: 80%; background-position-x: 200%;");
        }

        if (Session["userId"] != null)
        {
            //    mylog.Text = "aaaa" + Session["userId"].ToString();
        }

        if (!string.IsNullOrEmpty(Request.QueryString["lang"]))
        {
            UserLang = Request.QueryString["lang"].ToString();
        }
        if (!string.IsNullOrEmpty(Request.QueryString["From"]))
        {
            FromToIsender = Request.QueryString["From"].ToString();
        }
        ((HtmlGenericControl)Master.FindControl("PageBody")).Attributes["class"] = "LoginBodyClass2";

        if (!string.IsNullOrEmpty(Request.QueryString["Grp"]) && int.TryParse(Request.QueryString["Grp"].ToString(), out GrpID))
        {

        }
        if (!string.IsNullOrEmpty(Request.QueryString["Sender"]) && Request.QueryString["Sender"].ToString() != "")
        {
            sender = Request.QueryString["Sender"];
        }
        if (!string.IsNullOrEmpty(Request.QueryString["name"]))
        {
            MissionName = Request.QueryString["name"].ToString();
        }

        using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
        {
            con.Open();
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = con;
            if (sender != "")
            {
                cmd.CommandText = "INSERT into tbljoinenters (MissionName,Date,GrpID,Referrer) Values ('" + MissionName + "',now(),'" + GrpID + "','" + sender + "')";

            }
            else
            {
                cmd.CommandText = "INSERT into tbljoinenters (MissionName,Date,GrpID) Values ('" + MissionName + "',now(),'" + GrpID + "')";

            }
            cmd.ExecuteNonQuery();

            cmd.CommandText = String.Format("Select slidertext,sliderimage From tblsliders");
            MySqlDataReader dr = cmd.ExecuteReader();
            SliderRepeater.DataSource = dr;
            SliderRepeater.DataBind();
            dr.Close();
            //cmd.CommandText = String.Format("Select pagetitle,pagetext,pagefooter,pagetitle2,pagetitle3 from joinuspage");
            cmd.CommandText = String.Format("Select pagetitle,pagetitle2,pagetitle3,pagetext,pagetext2,pagetext3 from joinuspage");
            dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                MyTitle.InnerText = dr["pagetitle"].ToString();
                ContentTitle1.InnerHtml = dr["pagetitle2"].ToString().Replace("\n", "<br />");
                ContentText1.InnerHtml = dr["pagetext"].ToString();
                ContentTitle2.InnerHtml = dr["pagetitle3"].ToString().Replace("\n", "<br />");
                ContentText2.InnerHtml = dr["pagetext2"].ToString();
                ContentText3.InnerHtml = dr["pagetext3"].ToString();

                //MyTitleMobile.InnerText = dr["pagetitle"].ToString();
                //MyContent.InnerHtml = dr["pagetext"].ToString();
                //MyBlueTitle.InnerText = dr["pagetitle2"].ToString();
                //MyOrangeTitle.InnerText = dr["pagetitle3"].ToString();
                //MyFooter.InnerText = dr["pagefooter"].ToString();
            }
            dr.Close();
            con.Close();
        }
        if (Request.QueryString["mail"] != null)
        {
            usermail = Request.QueryString["mail"].ToString();
            if (!IsPostBack)
            {
                ((CMSTRTextBoxControl)MyFormHeb.FindControl("txtMail")).Text = usermail;
            }
            //bool _userAllowed = false;
            //bool _userAllowed2 = false;
            //SendMsgService srvc = new SendMsgService();
            //SendMsgList _lst = new SendMsgList();
            //srvc.CheckIfUserExistsByMail2(5078, true, usermail, out _userAllowed, out _userAllowed2);


        }


        if (!string.IsNullOrEmpty(Request.QueryString["BadgeID"]) && int.TryParse(Request.QueryString["BadgeID"].ToString(), out BadgeID))
        {

        }
        if (BadgeID != 0)
        {
            using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
            {
                con.Open();
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "select * from tblbadges where badgid=" + BadgeID;
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    AddMeta("og:image", "http://" + Request.Url.Host + "/" + dr["badgeImage"].ToString().Replace("../", "").Replace("(Custom)", "").Replace("size0", "size2"));
                    //AddMeta("og:image", "http://" + Request.Url.Host + "/images/badges/GeneralBadge.png");
                    AddMeta("og:description", dr["badgedescription"].ToString());
                    AddMeta("og:title", "I Won a badge on Israelikers.org!");
                }

                dr.Close();
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        else
        {
            AddMeta("og:image", "http://" + Request.Url.Host + "/images/FacebookShare.jpg");
            //AddMeta("og:image", "http://" + Request.Url.Host + "/images/badges/GeneralBadge.png");
            AddMeta("og:description", "Raise your Voice – Join ISRAELikers");
            AddMeta("og:title", "Raise your Voice – Join ISRAELikers");
        }
        if (IsPostBack)
        {
            string js = String.Format("$('.joinusvalsummery').css('display','none');");
            ClientScript.RegisterStartupScript(GetType(), "hidesummry", js, true);

        }

    }
    protected void page_PreRender(object sender, EventArgs e)
    {
       
    }
    protected void AddMeta(string Name, string Content)
    {
        HtmlMeta meta = new HtmlMeta();

        meta.Attributes.Add("property", Name);
        meta.Content = Content;
        this.Page.Header.Controls.Add(meta);
    }
    protected void MyFormEng_ItemInserted(string NewUserID)
    {
    }
    protected void Login_Click(object sender, EventArgs e)
    {
        bool _userExists_onIL = false;
        bool _userExists_onWL = false;
        bool _userExists_onWL2 = false;
        bool _maillingListExists = false;
        bool _maillingListExistsRes;
        bool isSignIn = false;
        try
        {
            using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
            {
                //Checking if mail is Existing on I-Send under UserID 5078
                #region Check if user\mail exists on WL
                SendMsgService _svc = new SendMsgService();
                _svc.CheckIfUserExistsByMail2(5078, true, ((ASP.controls_cmstrtextboxcontrol_ascx)MyFormHeb.FindControl("txtMail")).Text, out _userExists_onWL, out _userExists_onWL2);

                #endregion
                //Checking if MailingList Exists on WL
                #region Check if Mail List Exists on WL
                SendMsgList[] _mailList;
                SendMsgResults _tt;
                // Get mailing lists
                _svc.GetMailingListNames(5078, true, "IL110077", out _maillingListExistsRes, out _maillingListExistsRes, out _mailList, out _tt);

                var SignInML = _mailList.ToList<SendMsgList>().FirstOrDefault(x => x.ExistingListID == 55);
                if (SignInML == null)
                {
                    isSignIn = true;
                }
                if (GrpID != 0)
                {
                    var q = _mailList.ToList<SendMsgList>().FirstOrDefault(x => x.ExistingListID == GrpID);
                    if (q != null && q.ExistingListID != 0)
                    {
                        _maillingListExists = true;
                    }
                }
                #endregion
                //Checking if User\Mail existing in Israelikers.org
                #region Check if user\mail exists on Israelikers.org
                con.Open();
                MySqlCommand _cmd = new MySqlCommand();
                _cmd.Connection = con;
                _cmd.CommandText = string.Format(" SELECT UserID from tblUsers where LoginMailAddress='{0}' OR EmailAddress ='{0}'", ((ASP.controls_cmstrtextboxcontrol_ascx)MyFormHeb.FindControl("txtMail")).Text.Replace("'", "''"));
                MySqlDataReader _dr = _cmd.ExecuteReader();
                if (_dr.HasRows)
                {
                    _userExists_onIL = true;
                }
                _dr.Close();
                con.Close();
                #endregion
            }

            //acting time:

            if (!_userExists_onIL)
            {
                MyFormHeb.IsInsertRedirect = false;
                string myguid = Guid.NewGuid().ToString();
                ((CMSTRHiddenField)MyFormHeb.FindControl("GuidMyHiddenField")).Value = myguid;
                ((CMSTRHiddenField)MyFormHeb.FindControl("SignByMailMyHiddenField")).Value = "true";
                // save data
                MyFormHeb.CalldoClick();
                if (!isSignIn)
                {
                    string regurl = siteDefaults.SiteUrl + "/login.aspx?guid=" + myguid + "&grp=" + (GrpID == 0 || !_maillingListExists ? 19 : GrpID);
                    Adduser_WL(5078, ((ASP.controls_cmstrtextboxcontrol_ascx)MyFormHeb.FindControl("txtMail")).Text, ((ASP.controls_cmstrtextboxcontrol_ascx)MyFormHeb.FindControl("txtFullName")).Text, GrpID == 0 || !_maillingListExists ? 19 : GrpID, regurl);

                    if (!String.IsNullOrEmpty(Request.QueryString["special"]) && Request.QueryString["special"]=="true")
                    {
                        string SanFransiscoUrl = "https://panel.i-send.co.il/AddUserFromSite.aspx?eMail=" + ((ASP.controls_cmstrtextboxcontrol_ascx)MyFormHeb.FindControl("txtMail")).Text.Replace("'", "''") + "&1=" + ((ASP.controls_cmstrtextboxcontrol_ascx)MyFormHeb.FindControl("txtFullName")).Text.Replace("'","''") + "&4=0&5=1&form=6557__d9fda905-f5aa-49ae-b6a6-e186f1f4613d";

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
                        catch (Exception ex)
                        {
                        }
                    }

                }
                //Session["Logged"] = "true";
                //Session["LoggedMail"] = ((ASP.controls_cmstrtextboxcontrol_ascx)MyFormHeb.FindControl("txtMail")).Text;
                using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
                {
                    con.Open();
                    MySqlCommand cmd = new MySqlCommand();
                    cmd.Connection = con;
                    if (!string.IsNullOrEmpty(Request.QueryString["Sender"]))
                    {
                        cmd.CommandText = String.Format("INSERT into tbljoinregisters (MissionName,CreationDate,GrpID,EmailAddress,FullName,Refferer) Values ('{0}',now(),'{1}','{2}','{3}','{4}')", MissionName, GrpID, ((ASP.controls_cmstrtextboxcontrol_ascx)MyFormHeb.FindControl("txtMail")).Text.Replace("'", "''"), ((ASP.controls_cmstrtextboxcontrol_ascx)MyFormHeb.FindControl("txtFullName")).Text.Replace("'", "''"), Request.QueryString["Sender"]);
                    }
                    else
                    {
                        cmd.CommandText = String.Format("INSERT into tbljoinregisters (MissionName,CreationDate,GrpID,EmailAddress,FullName) Values ('{0}',now(),'{1}','{2}','{3}')", MissionName, GrpID, ((ASP.controls_cmstrtextboxcontrol_ascx)MyFormHeb.FindControl("txtMail")).Text.Replace("'", "''"), ((ASP.controls_cmstrtextboxcontrol_ascx)MyFormHeb.FindControl("txtFullName")).Text.Replace("'", "''"));
                    }
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                Response.Redirect("joinusend.aspx?mail=" + ((ASP.controls_cmstrtextboxcontrol_ascx)MyFormHeb.FindControl("txtMail")).Text);
            }
            else
            {
                if (Request.QueryString != null && Request.QueryString["Exists"] != null && Request.QueryString["Exists"] == "true")
                {
                    Response.Redirect(Request.AppRelativeCurrentExecutionFilePath + "?" + Request.QueryString + "#Header");

                }
                Response.Redirect(Request.AppRelativeCurrentExecutionFilePath + "?Exists=true&" + Request.QueryString + "#Header");
            }
        }
        catch (Exception ex)
        {

        }

    }


    protected void Adduser_WL(int SiteID, string Mail, string FullName, int ListID, string sendurl)
    {
        bool tmp;
        bool AddUsersToListResult;
        SendMsgResults _res = new SendMsgResults();
        SendMsgService _svc = new SendMsgService();
        List<SendMsgUser> _UsersList = new List<SendMsgUser>();
        List<SendMsgList> _mailList = new List<SendMsgList>();
        //_mailList.Add(new SendMsgList() { ExistingListID = ListID, ExistingListIDSpecified = true });
        _mailList.Add(new SendMsgList() { ExistingListID = 55, ExistingListIDSpecified = true });
        _UsersList.Add(new SendMsgUser() { EmailAddress = Mail, UserSystemFields = new SendMsgFields[4] { new SendMsgFields() { Key = "שם", Value = FullName }, new SendMsgFields() { Key = "קישור הרשמה", Value = sendurl }, new SendMsgFields() { Key = "נרשם דרך מייל", Value = "1" }, new SendMsgFields() { Key = "מהיכן נרשם", Value = FromToIsender } } });

        _svc.AddUsersToLists(SiteID, true, "IL110077", _UsersList.ToArray(), _mailList.ToArray(), out AddUsersToListResult, out tmp, out _res);

    }
    protected void MyFormHeb_ItemInserted(string NewUserID)
    {

    }

    protected void RegisterFBLinkButton_Click(object sender, EventArgs e)
    {
        Session["login"] = null;
        Session["id"] = null;
        if (!String.IsNullOrEmpty(Request.QueryString["special"]) && Request.QueryString["special"]=="true")
        {
            Session["SanFransisco"] = "true";
        }

        if (Request.QueryString != null && Request.QueryString["grp"] != null && Request.QueryString["grp"] != "")
        {
            HttpCookie cookieGrp = new HttpCookie("JoinUsGroup");
            cookieGrp.Value = Request.QueryString["grp"];
            cookieGrp.Expires = DateTime.Now.AddMinutes(2.5);
            Response.SetCookie(cookieGrp);
        }

        if (Session["login"] == null && Session["id"] == null)
        {
            fb = new FacebookCode(siteDefaults.FbClientId, siteDefaults.FbClientSecret);

            //Response.Redirect("http://comstar.co/?aa=aaa");

            fb.LoginClick(fbUrl, "user_hometown,email,user_location");
        }
    }
}