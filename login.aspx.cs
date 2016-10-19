using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using isendAPI;

public partial class login : System.Web.UI.Page
{
    string guid = "";
    string MyEmail="";
    int GrpID = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString["grp"]) && int.TryParse(Request.QueryString["grp"], out GrpID))
        {

        }

        if (!string.IsNullOrEmpty(Request.QueryString["mail"]))
        {
            txtUsername.Text = Request.QueryString["mail"].ToString();
        }
        if (Request.QueryString["guid"] != null)
        {
            guid = Request.QueryString["guid"].ToString().Replace("'", "''").Trim();
            Session["showStrap"] = true;
            ActivateUser(guid);
        }
        
        Panel_login.Visible = true;

        ((HtmlGenericControl)Master.FindControl("PageBody")).Attributes["class"] = "LoginBodyClass2";

    }
    protected void btn_Login_Click(object sender, EventArgs e)
    {
        bool UserExists = false;
        using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
        {
            con.Open();
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = con;
            cmd.CommandText = " SELECT * from tblUsers where EmailAddress='" + txtUsername.Text.Replace("'", "''") + "' AND  Password='" + txtPassword.Text.Replace("'", "''") + "' Limit 1";
            MySqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
              //  if (dr["isActive"].ToString().ToLower()=="true")
                //{
                    Session["Logged"] = "true";
                    Session["LoggedUserMail"] = dr["EmailAddress"].ToString();
                    Session["LoggedUserPicture"] = dr["LoginProfilePic"].ToString();
                    Session["LoggedUserID"] = ID;
                    UserExists = true;
                    con.Close();
                //}
                //else
                //{
                //    string mail = dr["EmailAddress"].ToString();
                //    con.Close();
                //    Response.Redirect("joinusend.aspx?resend=true&mail="+mail);
                //}
            }
            
        }
        if (UserExists)
        {
            Response.Redirect("./");
        }
        else
        {
            lblLoginStatus.Text = "Incorrect User\\Password";
        }
    }

    protected void btn_ForgotPassword_Click(object sender, EventArgs e)
    {
        bool UserExists = false;
        bool mailSent = false;
        string userPass = "";
        using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
        {

            con.Open();
            MySqlCommand _cmd = new MySqlCommand();
            _cmd.Connection = con;
            _cmd.CommandText = "SELECT * from tblUsers where EmailAddress='" + txtUsername.Text + "' AND SignInByMail=1 limit 1";
            MySqlDataReader _dr = _cmd.ExecuteReader();
            if (_dr.Read())
            {
                UserExists = true;
                userPass = _dr["Password"].ToString();
            }
            else
            {
                lblLoginStatus.Text = "User not Exists";

            }
            _dr.Close();
            con.Close();
        }
        if (UserExists)
        {
            string _body = "";

            _body += "<div><span>Username: </span><span style=\"font-weight:bold;\">" + txtUsername.Text + "</span></div>";
            _body += "<div><span>Password: </span><span style=\"font-weight:bold;\">" + userPass + "</span></div>";
            _body += "<div><a href='" + Request.Url.ToString() + "?mail=" + txtUsername.Text + "'>click here to login</a></div>";
            mailSent = cmstrDefualts.SendMail(_body, "Password Recovery from Israelikers.org", txtUsername.Text);
        }
        if (mailSent)
        {
            lblLoginStatus.Text = "Mail has been sent to your inbox";
        }
    }
    protected void ActivateUser(string guid)
    {
        bool UserExists = false;
        int myid =0;
        using (MySqlConnection conn = new MySqlConnection(cmstrDefualts.ConnStr))
        {
            conn.Open();
            string sql = String.Format("Select UserID, EmailAddress,LoginProfilePic From tblusers where Guid='{0}' ", guid);
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            MySqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                Session["Logged"] = "true";
                Session["LoggedUserMail"] = dr["EmailAddress"].ToString();
                MyEmail = dr["EmailAddress"].ToString();
                Session["LoggedUserPicture"] = dr["LoginProfilePic"].ToString();
                Session["LoggedUserID"] = ID;
                UserExists = true;
                myid = dr.GetInt32("UserID");
               
            }
            dr.Close();
            
            cmd.CommandText = String.Format("Update tblusers set isActive=1 where UserID={0}", myid);
            int myUpdate = cmd.ExecuteNonQuery();
            if (UserExists && myUpdate > 0)
            {
                Adduser_WL(5078, MyEmail, "", GrpID, "");
                Response.Redirect("./");
            }
            else
            {
                Session["Logged"] = null;
                Session["LoggedUserMail"] = null;
                Session["LoggedUserPicture"] = null;
                Session["LoggedUserID"] = null;
            }
        }
    }

    [System.Web.Services.WebMethod]//facebookLogin inside Website
    public static string LogUserWithWebsite(string ID)
    {
        string _res = "";
        if (HttpContext.Current.Session["Logged"] == null || HttpContext.Current.Session["Logged"].ToString().ToLower() != "true")
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
                    HttpContext.Current.Session["Logged"] = "true";
                    HttpContext.Current.Session["LoggedUserMail"] = dr["EmailAddress"].ToString();
                    HttpContext.Current.Session["LoggedUserPicture"] = dr["LoginProfilePic"].ToString();
                    HttpContext.Current.Session["LoggedUserID"] = ID;
                    _res = "JustLogged";
                }
                else
                {
                    _res = "UserNotFound";
                }
                dr.Close();
            }
        }
        else
        {
            _res = "AlreadyLogged";
        }
        return _res;
    }
    protected void Adduser_WL(int SiteID, string Mail, string FullName, int ListID, string sendurl)
    {
        bool tmp;
        bool AddUsersToListResult;
        SendMsgResults _res = new SendMsgResults();
        SendMsgService _svc = new SendMsgService();
        List<SendMsgUser> _UsersList = new List<SendMsgUser>();
        List<SendMsgList> _mailList = new List<SendMsgList>();
        _mailList.Add(new SendMsgList() { ExistingListID = ListID, ExistingListIDSpecified = true });
        //_mailList.Add(new SendMsgList() { ExistingListID = 55, ExistingListIDSpecified = true });
        _UsersList.Add(new SendMsgUser() { EmailAddress = Mail });

        _svc.AddUsersToLists(SiteID, true, "IL110077", _UsersList.ToArray(), _mailList.ToArray(), out AddUsersToListResult, out tmp, out _res);

    }
}