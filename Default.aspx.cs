using isendAPI;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected bool FB_Mode = false;
    public string _usermail = "";
    protected string User_Fullname = "";
    protected int User_TotalFbShares = 0;
    protected int User_TotalFbUniqeShares = 0;
    protected int User_TotalMailShares = 0;
    protected int User_TotalMailUniqeShares = 0;
    protected int User_ID = 0;
    protected int User_Points = 0;
    int myheight = 0;
    int place = 0;
    int totalcount = 0;
    FacebookCode fb = null;
    bool SignByMail = false;
    bool SignByFace = false;
    bool showPopUp = false;
    string fbUrl = siteDefaults.FbRedirectUrlAdd;
	System.Text.StringBuilder sb = new System.Text.StringBuilder();
	System.Diagnostics.Stopwatch sw = new System.Diagnostics.Stopwatch();

    protected void Page_Load(object sender, EventArgs e)
    {
		sw.Start();
		sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "1");
        if (!string.IsNullOrEmpty(Request.QueryString["fb"]) && Request.QueryString["fb"]=="exists")
        {
            ClientScript.RegisterClientScriptBlock(GetType(), "openSigninbyface", "$(document).ready(function () {openSigninbyface();FaceBookExists();});", true);
        }
		sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "2");
        if (Request.QueryString!=null&& Request.QueryString["firsttime"]=="face")
        {
            ClientScript.RegisterClientScriptBlock(GetType(), "openSigninbymail", "$(document).ready(function () {openSigninbymail()});", true);
        }
		sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "3");
        if (Request.QueryString["firsttime"] != null && Request.QueryString["firsttime"] == "true")
        {
            ClientScript.RegisterStartupScript(GetType(), "openSigninbyface", "openSigninbyface();", true);
        }

        if (Session["showStrap"] != null)
        {
            OrangeStrap.Attributes["class"] = "orangestrap";
            Session["showStrap"] = null;
            showPopUp = true;
        }

        ((HtmlGenericControl)Master.FindControl("PageBody")).Attributes["class"] = "LoginBodyClass";
        if (!string.IsNullOrEmpty(Request.QueryString["fb_source"]))
        {
            //FB_Mode = true;
            Response.Redirect("joinus.aspx?fb_source=true");
        }
        if (!string.IsNullOrEmpty(Request.QueryString["mail"]))
        {
            _usermail = Request.QueryString["mail"].ToString();
        }
		sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "4");
        if (FB_Mode)
        {
            Panel_FacebookView.Visible = true;
            if (Session["Logged"] != null && Session["Logged"] == "true")
            {
				sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "5");
                if (Session["LoggedUserMail"] != null)
                {
                    lblName.Text = Session["LoggedUserMail"].ToString();

                }
				sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "6");
            }
        }
        else
        {
			sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "7");
            Panel_WebSiteView.Visible = true;
            if (Session["Logged"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
				sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "8");
                Panel_LoggedUser.Visible = true;
                UserIMG.Src = Session["LoggedUserPicture"] != null ? Session["LoggedUserPicture"].ToString().Replace("square", "large").Replace("http://","https://") + "&scrape=true" : "";
                if (Session["LoggedUserMail"] != null)
                {

                    _usermail = Session["LoggedUserMail"].ToString();
                }
				sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "9");
                if (_usermail != "")
                {
					sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "10");
                    //  lbl_User_Mail.Text = _usermail;
                    bool UsersExists = false;
                    using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
                    {
						sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "11");
                        con.Open();
                        MySqlCommand cmd = new MySqlCommand();
                        MySqlDataReader dr;
                        cmd.Connection = con;
						sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "12");
                        if (Session["LoggedUserPicture"] == null || Session["LoggedUserPicture"].ToString() == "" )
                        {
							sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "13");
                            cmd.CommandText = "SELECT * from tblUsers where EmailAddress='" + _usermail + "' limit 1";
                            dr = cmd.ExecuteReader();
                            if (dr.Read())
                            {
								sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "14");
                               Session["LoggedUserPicture"] = dr["LoginProfilePic"].ToString();
                               if (Session["LoggedUserPicture"].ToString() != "" )
                               {
                                  UserIMG.Src = Session["LoggedUserPicture"] != null ? Session["LoggedUserPicture"].ToString().Replace("square", "large") + "&scrape=true" : "";
                               }
                            }
                            dr.Close();
							sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "15");
                        }
                        cmd.CommandText = "SELECT UserID,UserPoints,FullName,SignInByMail,SignInByFace from tblUsers where EmailAddress='" + _usermail + "' limit 1";
                        dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
							sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "16");
                            int.TryParse(dr["UserID"].ToString(), out User_ID);
                            User_Points = dr.GetInt32("UserPoints");
                            User_Fullname = dr["FullName"].ToString();
                            UsersExists = true;
                            SignByMail = dr.GetBoolean("SignInByMail");
                            SignByFace = dr.GetBoolean("SignInByFace");
							sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "17");

                        }
                        dr.Close();

                        if (UsersExists)
                        {
							sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "18");
                            lbl_User_Name.Text = User_Fullname;

                            cmd.CommandText = string.Format("select MissionName,(select count(*) from tblposts2missions as tbl1 left join tblpages as tbl2 on tbl2.PageGuid = tbl1.MissionName where UserMail='{0}' AND Platform='FB' AND tbl2.pageguid is not null ) as 'CountFBShares',(select count(*) from tblposts2missions as tbl1 left join tblpages as tbl2 on tbl2.PageGuid = tbl1.MissionName where UserMail='{0}' AND Platform='Mail' AND tbl2.pageguid is not null ) as 'CountMailShares',(select sum(GivenPts)  from tblposts2missions where GivenPts !=0 AND UserMail='{0}') as 'MyTotalPoints'  from tblposts2missions  left join tblpages on PageGuid = MissionName where  UserMail='{0}' limit 1", _usermail);
                            dr = cmd.ExecuteReader();
                            if (dr.Read())
                            {

                                User_TotalFbShares = dr.GetInt32("CountFBShares") != null ? dr.GetInt32("CountFBShares") : 0;
                                User_TotalMailShares = dr.GetInt32("CountMailShares") != null ? dr.GetInt32("CountMailShares") : 0;

                                int.TryParse(dr["MyTotalPoints"].ToString(), out User_Points);
                                lbl_User_MailShares.Text = User_TotalMailShares.ToString();
                                lbl_User_FBShares.Text = User_TotalFbShares.ToString();
                                lbl_User_TotalPoints.Text = User_Points.ToString();
								sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "19");

                            }
                            else
                            {
								sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "20");
                                lbl_User_MailShares.Text = "0";
                                lbl_User_FBShares.Text = "0";
                                lbl_User_TotalPoints.Text = "0";
                            }
                            dr.Close();
                            if (!string.IsNullOrEmpty(Request.QueryString["tag"]))
                            {
								sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "21");
                                cmd.CommandText = "select tbl1.*, tbl2.*, tbltags.tagName from tblposts2missions as tbl1 left join tblpages as tbl2 left join tbltagsformissions left join tbltags on tbltags.tblTagsID=tbltagsformissions.tagID on tbltagsformissions.missionID=tbl2.idtblpages on tbl1.MissionName = tbl2.PageGuid where tbl1.UserMail='" + _usermail + "' AND idtblpages is not null and tagName='" + Request.QueryString["tag"] + "' group by tbl1.MissionName order by DatePosted Desc ";
								sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "22");
                            }
                            else
                            {
								sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "23");
                                cmd.CommandText = "select tbl1.*, tbl2.*, tbltags.tagName from tblposts2missions as tbl1 left join tblpages as tbl2 left join tbltagsformissions left join tbltags on tbltags.tblTagsID=tbltagsformissions.tagID on tbltagsformissions.missionID=tbl2.idtblpages on tbl1.MissionName = tbl2.PageGuid where tbl1.UserMail='" + _usermail + "' AND idtblpages is not null group by tbl1.MissionName order by DatePosted Desc ";
								sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "24");
                            }
							sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "25");
                            dr = cmd.ExecuteReader();
                            missionsDoneRepeater.DataSource = dr;
                            missionsDoneRepeater.DataBind();
                            dr.Close();

							sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "26");

                            cmd.CommandText = String.Format("Select badgeImage,badgename,badgeid,badgedescription,tblbadgesofuser.AlreadyWatched from tblbadges left join tblbadgesofuser on tblbadgesofuser.badgeid=tblbadges.badgid where userid={0} order by tblbadges.BadgePriority desc ,tblbadgesofuser.badgedate desc limit 8", User_ID);
                            dr = cmd.ExecuteReader();
                            BadgeRepeater.DataSource = dr;
                            BadgeRepeater.DataBind();
							sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "27");
                            if (dr.HasRows == false)
                            {
                                TopSeeAllBadge.Visible = false;
                                BottomSeeAllBadge.Visible = false;
                            }
                            dr.Close();
							sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "28");
                            cmd.CommandText = String.Format("select place as myPlace from (Select @row:=@row + 1 as place, mySum From (Select mySum, EmailAddress From (Select EmailAddress, mySum From (SELECT EmailAddress, Sum(GivenPts) as mySum FROM (tblusers Left join tblposts2missions ON tblusers.EmailAddress = tblposts2missions.UserMail) Group by EmailAddress Order by mySum desc , (SELECT @row:=0)) as table1) as table3) as table4 group by mySum order by mysum desc) as tbl1 where mySum = (select mysum2 from ((SELECT  Sum(GivenPts) as mySum2 FROM (tblusers Left join tblposts2missions ON tblusers.EmailAddress = tblposts2missions.UserMail) where EmailAddress = '{0}')) as tbl2)", _usermail);

                            dr = cmd.ExecuteReader();
                            if (dr.Read())
                            {
                                int.TryParse(dr["myPlace"].ToString(), out place);

                            }
                            dr.Close();
							sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "29");
                            cmd.CommandText = String.Format("select max(place) as Total from (Select @row:=@row + 1 as place, mySum From (Select mySum, EmailAddress From (Select EmailAddress, mySum From (SELECT EmailAddress, Sum(GivenPts) as mySum FROM (tblusers Left join tblposts2missions ON tblusers.EmailAddress = tblposts2missions.UserMail) Group by EmailAddress Order by mySum desc , (SELECT @row:=0)) as table1) as table3) as table4 group by mySum order by mysum desc) as mytbl");
                            dr = cmd.ExecuteReader();
                            if (dr.Read())
                            {
                                int.TryParse(dr["Total"].ToString(), out totalcount);
                                if (place==0)
                                {
                                    place = totalcount;
                                }
                            }
                            dr.Close();
							sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "30");
                            if (!IsPostBack)
                            {
                                //yossi
								sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "31");
                                List<string> _lst = siteDefaults.GetUserMissions(_usermail);
                                List<string> _lst2 = new List<string>();

                                foreach (string item in _lst)
                                {
                                    _lst2.Add("'" + item.ToString() + "'");

                                }
								sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "32");
                                if (_lst.Count > 0)
                                {
									sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "33");
                                    if (!string.IsNullOrEmpty(Request.QueryString["tag"]))
                                    {
                                        cmd.CommandText = string.Format("SELECT *,(select count(*) from tblposts2missions where MissionName = tblpages.pageguid AND usermail='{1}') as MyCount, tbltags.tagName from tblpages left join tbltagsformissions left join tbltags on tbltags.tblTagsID=tbltagsformissions.tagID on tbltagsformissions.missionID=tblpages.idtblpages where pageguid in({0})  AND (select count(*) from tblposts2missions where MissionName = tblpages.pageguid AND usermail='{1}') = 0 AND date(endingdate) >= date(now()) and tagname='" + Request.QueryString["tag"] + "' group by pageguid", string.Join(",", _lst2.ToArray()), _usermail);

                                    }
                                    else
                                    {
                                        cmd.CommandText = string.Format("SELECT *,(select count(*) from tblposts2missions where MissionName = tblpages.pageguid AND usermail='{1}') as MyCount, tbltags.tagName from tblpages left join tbltagsformissions left join tbltags on tbltags.tblTagsID=tbltagsformissions.tagID on tbltagsformissions.missionID=tblpages.idtblpages where pageguid in({0})  AND (select count(*) from tblposts2missions where MissionName = tblpages.pageguid AND usermail='{1}') = 0 AND date(endingdate) >= date(now())  group by pageguid", string.Join(",", _lst2.ToArray()), _usermail);
                                    }
									sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "34");
                                    dr = cmd.ExecuteReader();
                                    if (dr.HasRows)
                                    {
                                        RepaterMissionsToDo.DataSource = dr;
                                        RepaterMissionsToDo.DataBind();
                                    }
									sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "35");
                                }
                            }
                        }

                        con.Close();
                    }
					sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "36");
                    if (totalcount!=0)
                    {
                        myheight = 170 * (place * 10000 / totalcount) / 10000 + 4;
                        
                    }
                    else
                    {
                        myheight = 170;
                    }
					sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "37");
                    mygrayclass.Style["height"] = myheight + "px";
                }
            }

        }

    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
		sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "38");
        if (SignByMail)
        {
            MailPointsHolder.Visible = true;
            SignByMailButton.Visible = false;
            mailpopupholder.Visible = false;
            if (showPopUp)
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "openpop", "openSigninbyface(); closevar = 1;", true);
            }
			sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "39");
        }
        else
        {
			sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "40");
            MailPointsHolder.Visible = false;
            SignByMailButton.Visible = true;

        }
		sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "41");
        if (SignByFace)
        {
            FacePointHolder.Visible = true;
            SignByFaceButton.Visible = false;
            facepopupholder.Visible = false;
            if (showPopUp)
            {
                Page.ClientScript.RegisterStartupScript(GetType(), "openpop", "openSigninbyface(); closevar = 1;", true);
            }
        }
        else
        {
			sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "42");
            FacePointHolder.Visible = false;
            SignByFaceButton.Visible = true;
        }
        if (SignByMail && SignByFace)
        {
            popupholder.Visible = false;
        }
		sb.AppendFormat("Step {1} : {0}<br />", sw.ElapsedMilliseconds.ToString(), "43");
		if (Request.QueryString["test"] != null)
		{
			Response.Write(sb.ToString());
		}
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        Badge.UpdateBadgeToOld(HttpContext.Current.Session["LoggedUserMail"].ToString());
        if (Session["Logged"] != null)
        {
        }
        if (Session["LoggedMail"] != null)
        {
            Session["LoggedMail"] = null;
        }
        if (Session["justRegistered"] != null)
        {
            Session["justRegistered"] = null;
        }
        Session["Logged"] = null;
        Session["LoggedFB"] = null;
        Session["LoggedUser"] = null;
        Session["LoggedUserMail"] = null;
        Session["LoggedUserPicture"] = null;
        Response.Redirect("./");
    }


    [System.Web.Services.WebMethod] //facebookLogin inside Facebook
    public static string LogUserWithFB(string ID)
    {
        string _res = "";
        if (HttpContext.Current.Session["LoggedFB"] == null || HttpContext.Current.Session["LoggedFB"].ToString() != "true")
        {

            using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
            {
                con.Open();
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = con;
                cmd.CommandText = " SELECT * from tblUsers where LoginTypeID='" + ID + "' Limit 1";
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    HttpContext.Current.Session["LoggedFB"] = "true";
                    HttpContext.Current.Session["LoggedUserMail"] = dr["EmailAddress"].ToString();
                    HttpContext.Current.Session["LoggedUserPicture"] = dr["LoginProfilePic"].ToString();
                    HttpContext.Current.Session["LoggedUserID"] = ID;
                    _res = "JustLogged";
                }
                dr.Close();
                con.Close();
            }

        }
        else
        {
            _res = "AlreadyLogged";
        }
        return _res;
    }

    [System.Web.Services.WebMethod]
    public static void UpdateBadgeToOld()
    {
        if (HttpContext.Current.Session["LoggedUserMail"].ToString() != null)
        {
            Badge.UpdateBadgeToOld(HttpContext.Current.Session["LoggedUserMail"].ToString());
        }
    }

    protected void SignByMailLinkButton_Click(object sender, EventArgs e)
    {
        bool isExists = false;
        string email = SendByMailTextBox.Text.Replace("'", "''");
        SendByMailTextBox.Text = "";
        using (MySqlConnection conn = new MySqlConnection(cmstrDefualts.ConnStr))
        {
            conn.Open();
            string sql = String.Format("Select UserID From tblusers where (EmailAddress='{0}' OR LoginMailAddress='{0}') AND (EmailAddress<>'{1}') ", email, _usermail);
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            MySqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                isExists = true;
            }
            dr.Close();
            if (!isExists)
            {
                cmd.CommandText = String.Format("Update tblusers Set EmailAddress='{0}' , SignInByMail=1 where EmailAddress='{1}'", email, _usermail);
                Session["LoggedUserMail"] = email;
                cmd.ExecuteNonQuery();
                Badge.AddBadge(BadgTypeEnum.Join, conn, Session["LoggedUserMail"].ToString());

                bool tmp;
                bool AddUsersToListResult;
                SendMsgService svc = new SendMsgService();

                SendMsgResults resSendMsgResults = new SendMsgResults();
                List<SendMsgUser> _UsersList = new List<SendMsgUser>();
                _UsersList.Add(new SendMsgUser() { EmailAddress = email, UserSystemFields = new SendMsgFields[2] { new SendMsgFields() { Key = "שם", Value = User_Fullname }, new SendMsgFields() { Key = "נרשם דרך מייל", Value = "1" } } });
                svc.AddUsersOnly(5078, true, "IL110077", _UsersList.ToArray(), out tmp, out AddUsersToListResult, out resSendMsgResults);

                Response.Redirect("./");
            }
            else
            {
                maillerror.Text = "mail exists!!!";
            }
        }
    }
    protected void SignByFaceLinkButton_Click(object sender, EventArgs e)
    {
        using (MySqlConnection conn = new MySqlConnection(cmstrDefualts.ConnStr))
        {
            conn.Open();
            fb = new FacebookCode(siteDefaults.FbClientId, siteDefaults.FbClientSecret);
            fb.LoginClick(fbUrl, "user_hometown,email,user_location");
            Badge.AddBadge(BadgTypeEnum.Join, conn, Session["LoggedUserMail"].ToString());
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
public class LoggedUser
{
    public string FacebookID { get; set; }
    public string SystemMail { get; set; }
    public string UserPicture { get; set; }
    public string GetMail()
    {
        return SystemMail == null ? "" : SystemMail;
    }
}