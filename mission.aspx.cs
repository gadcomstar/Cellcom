using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class mission : System.Web.UI.Page
{
    protected string _missionId = "";
    protected string _usermail = "";
    public Mission _newMission;
    bool _missionExists = false;
    public bool FBView = false;
    public string JoinURL = "";
    public string JoinTEXT = "";
    public string JoinIMG = "";
    public string PostHeader = "";
    public string PostText = "";
    public string PostTitle = "";
    bool bIsMobileDevice = false;
    public string UserGuid = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        string[] MobileDevices = new string[] { "iPhone", "iPad","iPod","BlackBerry",
                                                     "Nokia", "Android", "WindowsPhone",
                                                     "Mobile"
                                                     };
        foreach (string MobileDeviceName in MobileDevices)
        {
            if ((Request.UserAgent.IndexOf(MobileDeviceName, StringComparison.OrdinalIgnoreCase)) > 0)
            {
                bIsMobileDevice = true;
                break;

            }
        }

        ((HtmlGenericControl)Master.FindControl("PageBody")).Attributes["class"] = "LoginBodyClass";
        if (!Request.Url.ToString().StartsWith("https://israelikers.org") && !Request.Url.ToString().Contains("localhost:"))
        {
            Response.Redirect("https://israelikers.org" + Request.Url.PathAndQuery);
        }
        else
        {

        }
        if (!string.IsNullOrEmpty(Request.QueryString["fb_source"]))
        {
            FBView = true;
            if (FBView) //Facebook Mode
            {
                orText.Visible = false;
            }
            //MailHolder.Visible = false;
            MailBtn.Visible = false;
        }
        if (!string.IsNullOrEmpty(Request.QueryString["mail"]))
        {
            _usermail = Server.UrlDecode(Request.QueryString["mail"].ToString());
            using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
            {
                con.Open();

                MySqlCommand com = new MySqlCommand();
                com.Connection = con;
                com.CommandText = string.Format("select guid from tblusers where EmailAddress='{0}'", _usermail);
                MySqlDataReader dr = com.ExecuteReader();
                if (dr.Read())
                {
                    if (dr["guid"] == null || dr["guid"].ToString() == "")
                    {
                        UserGuid = Guid.NewGuid().ToString();
                        dr.Close();
                        com.CommandText = string.Format("update tblusers set guid='{0}' where EmailAddress='{1}'", UserGuid, _usermail);
                        com.ExecuteNonQuery();
                    }
                    else
                    {
                        UserGuid = dr["guid"].ToString();
                        dr.Close();
                    }
                }
               
                con.Close();
            }
        }
        if (!string.IsNullOrEmpty(Request.QueryString["name"]))
        {
            _newMission = new Mission();
            _missionId = Request.QueryString["name"].ToString();
            using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
            {
                con.Open();
                MySqlCommand _cmd = new MySqlCommand();
                _cmd.Connection = con;
                _cmd.CommandText = "select * from tblPages where PageGuid = '" + _missionId + "' limit 1";
                MySqlDataReader _dr = _cmd.ExecuteReader();
                _missionExists = _dr.HasRows;
                if (_dr.Read())
                {

                    if (bIsMobileDevice)
                    {
                        _newMission.ArticleContent = _dr["pagemobilecontent"].ToString();
                    }
                    else
                    {
                        _newMission.ArticleContent = _dr["pagecontent"].ToString();
                    }

                    _newMission.FullArticle = _dr["FullArticleLink"].ToString();
                    _newMission.Name = _dr["PageGuid"].ToString();
                    _newMission.Img = _dr["sideImg"].ToString();
                    _newMission.PageTitle = _dr["pageseotitle"].ToString();
                    _newMission.EndingDate = DateTime.Parse(_dr["EndingDate"].ToString());
                    _newMission.StartingDate = DateTime.Parse(_dr["StartingDate"].ToString());
                    _newMission.MailAutoSubject = _dr["MailAutoSubject"].ToString();
                    _newMission.MailAutoBody = _dr["MailAutoBody"].ToString();
                    lbl_ReadFull.InnerText = _dr["FullArticleBtnText"].ToString();
                    if (_newMission.MailAutoBody != null && _newMission.MailAutoBody != "")
                    {
                        _newMission.MailAutoBody = _newMission.MailAutoBody.Replace("[[LINK]]", _newMission.FullArticle).Replace("\r\n", "%0D%0A");
                    }
                    else
                    {
                        _newMission.MailAutoBody = _newMission.FullArticle;
                    }
                    //join control
                    JoinURL = _dr["JoinURL"].ToString();
                    if (JoinURL.Contains("?"))
                    {
                        JoinURL += "&name=" + _newMission.Name;

                    }
                    else
                    {
                        JoinURL += "?name=" + _newMission.Name;
                    }
                    JoinURL += "&Sender=" + UserGuid;
                    JoinTEXT = _dr["JoinText"].ToString();
                    JoinIMG = _dr["JoinIMG"].ToString();
                    PostHeader = _dr["PostHeader"].ToString();
                    PostText = _dr["PostText"].ToString().Replace("\n", "");
                    PostTitle = _dr["PostTitle"].ToString();

                }
                _dr.Close();
                con.Close();
            }
            if (_usermail == "" && !FBView)
            {
                Response.Redirect("./");
            }
            using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
            {
                bool userexists = false;
                bool UserHasFB = false;
                bool UserHasMail = false;
                con.Open();
                MySqlCommand _cmd = new MySqlCommand();
                _cmd.Connection = con;
                _cmd.CommandText = "SELECT * from tblUsers where EmailAddress='" + _usermail.Replace("'", "''") + "'";
                MySqlDataReader _dr = _cmd.ExecuteReader();
                if (_dr.Read())
                {
                    userexists = true;
                    if (_dr["SignInByFace"] != null && _dr["SignInByFace"] != "")
                    {
                        UserHasFB = true;
                    }

                    if (_dr["SignInByMail"] != null && _dr["SignInByMail"] != "")
                    {
                        UserHasMail = true;
                    }
                }

                _dr.Close();
                con.Close();
                if (!userexists && !FBView)
                {
                    //FB_Holder.Visible = false;
                    facebookbtn.Visible = false;
                    orText.Visible = false;

                }
                if (userexists && !UserHasFB && !FBView)
                {
                    //FB_Holder.Visible = false;
                    facebookbtn.Visible = false;
                    orText.Visible = false;
                    fblogin.Visible = true;
                    //FB_Login.Visible = true;
                    Session["WLmail"] = _usermail;
                }
                if (userexists && UserHasFB)
                {
                    Session["WLmail"] = null;
                }

            }
            if (!_missionExists)
            {
                Panel_Error.Visible = true;

            }
            else if (_newMission.StartingDate.Date > DateTime.Now.Date) //if not started yet
            {
                Panel_MissionNotStarted.Visible = true;
            }
            else if (_newMission.EndingDate.Date < DateTime.Now.Date) //if expired
            {
                Panel_Expired.Visible = true;
            }
            else
            {

                //siteDefaults.CheckUserIsAllowedInMission(_missionId, _usermail);
                Panel_Mission.Visible = true;
                this.Title = _newMission.PageTitle;
                List<Mission> _lst = new List<Mission>() { _newMission };
                //MissionHolder.DataSource = _lst;
                //MissionHolder.DataBind();

            }
        }
        else
        {
            Panel_Error.Visible = true;
            this.Title = "Mission Not Found";
        }


        MailBtn.Attributes["onclick"] = "MailShare('mailto:?subject=" + _newMission.MailAutoSubject.Replace("?", "") + "&body=" + _newMission.MailAutoBody + "');";
        // HiddenAShare.HRef="mailto:?subject=" + _newMission.MailAutoSubject.Replace("?","") + "&body=" + _newMission.MailAutoBody;
        facebookbtn.Attributes["data-href"] = _newMission.FullArticle;
        fblogin.Attributes["onclick"] = "window.open('" + siteDefaults.FbRedirectUrl + "', 'fbLogin', 'width=600, height=500'); return false;";
    }

    [System.Web.Services.WebMethod]
    public static string AddPtsMail(string mail, string MissionName)
    {
        List<Badge> NewBadgeRecieved = new List<Badge>();
        string result = "";
        string _missionID = "";
        string UserMail = "";
        bool UserAlreadyPosted = false;
        //try
        //{
            Dictionary<string, string> _fields = new Dictionary<string, string>();
            _fields.Add("DatePosted", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
            _fields.Add("Platform", "Mail");
            _fields.Add("Source", "Site");

            if (mail != "undefined") // checking if mail address was specified
            {
                UserMail = mail.Replace("%40", "@");
                _fields.Add("UserMail", UserMail);

            }
            if (MissionName != "undefined") // checking if mission name was specified
            {
                _missionID = MissionName;
                _fields.Add("MissionName", _missionID);
            }
            if (_missionID != "" && UserMail != "")
            {
                using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
                {
                    MySqlCommand _cmd = new MySqlCommand();
                    con.Open();
                    _cmd.Connection = con;
                    _cmd.CommandText = "Select * from tblposts2missions where UserMail ='" + UserMail + "' AND MissionName ='" + _missionID + "' Limit 1";
                    MySqlDataReader _dr = _cmd.ExecuteReader();
                    if (_dr.HasRows)
                    {
                        UserAlreadyPosted = true;

                    }
                    _dr.Close();
                    _cmd.CommandText = "select * from tblpages where PageGuid = '" + _missionID + "'";
                    _dr = _cmd.ExecuteReader();
                    if (_dr.Read())
                    {
                        _fields.Add("MissionID", _dr["idtblpages"].ToString());
                        if (!UserAlreadyPosted)
                        {
                            _fields.Add("GivenPts", _dr["MissionPoints"].ToString());
                        }
                    }
                    _dr.Close();
                    //NewBadgeRecieved = UpdateBadges(true, con, UserMail, MissionName);
                    NewBadgeRecieved = UpdateBadges(!UserAlreadyPosted, con, UserMail, _fields["MissionName"]);


                    StringBuilder sb_Fields = new StringBuilder();
                    StringBuilder sb_Values = new StringBuilder();
                    foreach (KeyValuePair<string, string> item in _fields)
                    {
                        sb_Fields.AppendFormat("{0},", item.Key);
                        sb_Values.AppendFormat("'{0}',", item.Value);
                    }
                    sb_Fields.Remove(sb_Fields.Length - 1, 1);
                    sb_Values.Remove(sb_Values.Length - 1, 1);

                    _cmd.CommandText = string.Format("Insert INTO tblposts2missions({0}) Values({1})", sb_Fields, sb_Values);
                    int Rows = _cmd.ExecuteNonQuery();

                   

                    con.Close();
                }
            }
    //}
        //catch (Exception ex)
        //{
        //    result = ex.StackTrace;
        //}
        if (NewBadgeRecieved.Count > 0)
        {
            result = NewBadgeRecieved[0].Image.Replace("../", "").Replace("_size0.", "_size1.") + "|" + NewBadgeRecieved[0].Name + "|" + NewBadgeRecieved[0].ID;
        }

        return result;
    }

    public static List<Badge> UpdateBadges(bool IsToDo, MySqlConnection con, string UserMail, string mission)
    {
        List<List<Badge>> NewBadgeList = null;
        if (IsToDo)
        {
            NewBadgeList = new List<List<Badge>>();
            NewBadgeList.Add(Badge.AddBadge(BadgTypeEnum.NumberOfMission, con, UserMail, mission));
            NewBadgeList.Add(Badge.AddBadge(BadgTypeEnum.FastReaction, con, UserMail, mission));
            NewBadgeList.Add(Badge.AddBadge(BadgTypeEnum.Points, con, UserMail, mission));
            NewBadgeList.Add(Badge.AddBadge(BadgTypeEnum.Mission, con, UserMail, mission));
            NewBadgeList.Add(Badge.AddBadge(BadgTypeEnum.Tags, con, UserMail, mission));
            NewBadgeList.Add(Badge.AddBadge(BadgTypeEnum.FirstPeople, con, UserMail, mission));
            NewBadgeList.Add(Badge.AddBadge(BadgTypeEnum.SeveralBadges, con, UserMail, mission));

        }
        List<Badge> EarnedBadgeList = new List<Badge>();
        if (NewBadgeList!=null)
        {
            for (int i = 0; i < NewBadgeList.Count; i++)
            {
                if (NewBadgeList[i] != null)
                {
                    for (int ii = 0; ii < NewBadgeList[i].Count; ii++)
                    {
                        EarnedBadgeList.Add(NewBadgeList[i][ii]);
                    }
                }
            } 
        }



        return EarnedBadgeList;
    }
    [System.Web.Services.WebMethod]
    public static string AddPts(string FB_Response, string mail, string MissionName, string fb_source)
    {
        string result = "";
        List<Badge> NewBadgeRecieved = new List<Badge>();
        try
        {
            string _mode = "";
            bool FBView = false;
            string _missionID = "";
            string FB_User_ID = "";
            string FB_Post_ID = "";
            string UserMail = "";
            bool UserExistsByID = false;
            bool UserExistsByMail = false;
            bool UserExistsByIDAndMail = false;
            bool UserAlreadyPosted = false;
            Dictionary<string, string> _fields = new Dictionary<string, string>();
            _fields.Add("DatePosted", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
            _fields.Add("Platform", "FB");
            //   result = HttpContext.Current.Request.QueryString["mail"].ToString();

            if (mail != "undefined") // checking if mail address was specified
            {
                UserMail = mail.Replace("%40", "@");
                _fields.Add("UserMail", UserMail);

            }
            if (MissionName != "undefined") // checking if mission name was specified
            {
                _missionID = MissionName;
                _fields.Add("MissionName", _missionID);

            }
            if (fb_source != "undefined") // checking if working inside facebook
            {
                FBView = true;
                _fields.Add("Source", "FB");

            }
            else
            {
                _fields.Add("Source", "Site");
            }
            
            //if (FBView) //Facebook Mode
            //{
               
            
            //    string[] FB_Response_Items = FB_Response.Split('_');
            //    if (FB_Response_Items.Length > 1)
            //    {
            //        FB_User_ID = FB_Response_Items[0];
            //        FB_Post_ID = FB_Response_Items[1];
            //        _fields.Add("FBResponseID", FB_User_ID);
            //        _fields.Add("FBResponsePostID", FB_Post_ID);
            //    }
            //    using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
            //    {

            //        con.Open();
            //        MySqlCommand _cmd = new MySqlCommand();
            //        _cmd.Connection = con;
            //        _cmd.CommandText = "Select * from tblUsers where LoginTypeID='" + FB_Post_ID + "'";
            //    }
            //}
            if (_missionID != "" && UserMail != "" && FB_Response.Contains("_")) //site Mode
            {
                _mode = "3";
                string[] FB_Response_Items = FB_Response.Split('_');
                if (FB_Response_Items.Length > 1)
                {
                    FB_User_ID = FB_Response_Items[0];
                    FB_Post_ID = FB_Response_Items[1];
                    _fields.Add("FBResponseID", FB_User_ID);
                    _fields.Add("FBResponsePostID", FB_Post_ID);
                }


                using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
                {
                    con.Open();
                    MySqlCommand _cmd = new MySqlCommand();
                    _cmd.Connection = con;
                    _cmd.CommandText = "SELECT * from tblposts2missions where MissionName='" + _missionID + "' AND (UserMail='" + UserMail + "' OR FBResponseID='" + FB_User_ID + "')";
                    MySqlDataReader _dr;
                    _dr = _cmd.ExecuteReader();
                    if (_dr.HasRows)
                    {
                        UserAlreadyPosted = true;
                    }
                    _dr.Close();
                    _cmd.CommandText = "select * from tblpages where PageGuid = '" + _missionID + "'";
                    _dr = _cmd.ExecuteReader();
                    if (_dr.Read())
                    {
                        _fields.Add("MissionID", _dr["idtblpages"].ToString());
                        if (!UserAlreadyPosted)
                        {
                            _fields.Add("GivenPts", _dr["MissionFacebookPoints"].ToString());
                        }
                    }
                    _dr.Close();

                    // send add badge to user
                    NewBadgeRecieved = UpdateBadges(!UserAlreadyPosted, con, UserMail,  _fields["MissionName"]);
                    //NewBadgeRecieved = UpdateBadges(true, con, UserMail, _fields["_missionID"]);

                    StringBuilder sb_Fields = new StringBuilder();
                    StringBuilder sb_Values = new StringBuilder();
                    foreach (KeyValuePair<string, string> item in _fields)
                    {
                        sb_Fields.AppendFormat("{0},", item.Key);
                        sb_Values.AppendFormat("'{0}',", item.Value);
                    }
                    sb_Fields.Remove(sb_Fields.Length - 1, 1);
                    sb_Values.Remove(sb_Values.Length - 1, 1);
                    _cmd.CommandText = string.Format("Insert INTO tblposts2missions({0}) Values({1})", sb_Fields, sb_Values);
                    int Rows = _cmd.ExecuteNonQuery();
                 
                    con.Close();
                }
            }
        }
        catch (Exception ex)
        {
            result = ex.Message;
        }
        if (NewBadgeRecieved != null)
        {
            result = NewBadgeRecieved[0].Image.Replace("../", "").Replace("_size0.", "_size1.") + "|" + NewBadgeRecieved[0].Name;
        }
        return result;
    }
}

public class Mission
{
    public string Name { get; set; }
    public string FullArticle { get; set; }
    public string Img { get; set; }
    public string ArticleContent { get; set; }
    public DateTime EndingDate { get; set; }
    public DateTime StartingDate { get; set; }
    public string PageTitle { get; set; }
    public string MailAutoSubject { get; set; }
    public string MailAutoBody { get; set; }

}
public class UserDetails
{

}

