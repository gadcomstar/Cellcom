using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FacebookConnect : System.Web.UI.Page
{
    public string _userMail = "";
    protected string _userLang = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Request.Url.ToString().StartsWith("https://israelikers.org") && !Request.Url.ToString().Contains("localhost:"))
        {
            Response.Redirect("https://israelikers.org" + Request.Url.PathAndQuery);
        }
        
        //Response.Write(Request.Url.Host + "/" + siteDefaults.FbRedirectUrl);
        if (!string.IsNullOrEmpty(Request.QueryString["lang"]))
        {
            _userLang = Request.QueryString["lang"].ToString();
        }
        if (!string.IsNullOrEmpty(Request.QueryString["mail"]))
        {
            _userMail = Request.QueryString["mail"].ToString();
            Session["WLmail"] = _userMail;
        }
        if (_userLang == "")
        {
            _userLang = "Heb";
        }
        if ((Session["justRegistered"] != null && Session["justRegistered"].ToString() == "true") || (Session["Logged"] != null && Session["Logged"].ToString() == "true" && Session["LoggedMail"] != null && Session["LoggedMail"].ToString() == _userMail))
        {
            switch (_userLang.ToLower())
            {
                case "heb":
                    Panel_FBHeb.Visible = true;
                    break;
                case "eng":
                    Panel_FBEng.Visible = true;
                    break;
                default:
                    break;
            }
        }
        else
        {
            Panel_login.Visible = true;
            if (_userMail != "")
            {
                txtUsername.Text = _userMail;
                txtUsername.Enabled = false;
            }
            else
            {
                Response.Redirect("./");
            }
        }

    }
    protected void Unnamed_Click(object sender, EventArgs e)
    {
        bool _loginCompleted = false;
        using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
        {
            con.Open();
            MySqlCommand _cmd = new MySqlCommand();
            _cmd.Connection = con;
            _cmd.CommandText = "SELECT * from tblUsers where EmailAddress='" + txtUsername.Text.Replace("'", "''").Trim() + "' AND Password='" + txtPassword.Text.Replace("'", "''").Trim() + "'";
            MySqlDataReader _dr = _cmd.ExecuteReader();
            if (_dr.HasRows)
            {
                Session["Logged"] = "true";
                Session["LoggedMail"] = _userMail;
                _loginCompleted = true;


            }
            else
            {
                lbl_login.Text = "Username or Password were incorrect";
            }
            _dr.Close();
            con.Close();
            if (_loginCompleted)
            {
                //Page_Load(null, null);
                Response.Redirect(Request.Url.ToString());
            }
        }
    }
    protected void Unnamed_Click1(object sender, EventArgs e)
    {
        bool UserExists = false;
        bool mailSent = false;
        string userPass = "";
        using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
        {

            con.Open();
            MySqlCommand _cmd = new MySqlCommand();
            _cmd.Connection = con;
            _cmd.CommandText = "SELECT * from tblUsers where EmailAddress='" + txtUsername.Text + "' limit 1";
            MySqlDataReader _dr = _cmd.ExecuteReader();
            if (_dr.Read())
            {
                UserExists = true;
                userPass = _dr["Password"].ToString();
            }
            else
            {
                lbl_Forgot.Text = "User not Exists";
                lbl_Forgot.Visible = true;
            }
            _dr.Close();
            con.Close();
        }
        if (UserExists)
        {
            string _body = "";

            _body += "<div><span>Username: </span><span style=\"font-weight:bold;\">" + txtUsername.Text + "</span></div>";
            _body += "<div><span>Password: </span><span style=\"font-weight:bold;\">" + userPass + "</span></div>";
            _body += "<div><a href='" + Request.Url.ToString() + "'>click here to login</a></div>";
            mailSent = cmstrDefualts.SendMail(_body, "Password Recovery from Israelikers.org", txtUsername.Text);
        }
        if (mailSent)
        {
            btn_Forgot.Visible = false;
            lbl_Forgot.Visible = true;
        }
    }
}