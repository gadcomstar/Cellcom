using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using isendAPI;






public partial class Register : System.Web.UI.Page
{
    protected string _Usermail = "";
    protected string _UserLang = "";
    public bool _UserExists = false;
 




    protected void Page_Load(object sender, EventArgs e)
    {

        if (!Request.Url.ToString().StartsWith("https://israelikers.org") && !Request.Url.ToString().Contains("localhost:"))
        {
            Response.Redirect("https://israelikers.org" + Request.Url.PathAndQuery);
        }
        else
        {

        }
        if (!string.IsNullOrEmpty(Request.QueryString["lang"]))
        {
            _UserLang = Request.QueryString["lang"].ToString();
        }
        if (!string.IsNullOrEmpty(Request.QueryString["mail"]))
        {
            _Usermail = Request.QueryString["mail"].ToString();

        }
        if (_Usermail == "")
        {
            Panel_Error.Visible = true;
        }
        if (_Usermail != "")
        {
            bool _userAllowed = false;
            bool _userAllowed2 = false;
            SendMsgService _srvc = new SendMsgService();
            SendMsgList _lst = new SendMsgList();
            _srvc.CheckIfUserExistsByMail2(5078, true, _Usermail, out _userAllowed, out _userAllowed2);
            
            if (!_userAllowed)
            {
                Response.Redirect("./");
            }

            using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
            {
                con.Open();
                MySqlCommand _cmd = new MySqlCommand();
                _cmd.Connection = con;
                _cmd.CommandText = "select * from tblusers where EmailAddress='" + _Usermail + "'";
                MySqlDataReader _dr = _cmd.ExecuteReader();
                if (_dr.HasRows)
                {
                    _UserExists = true;
                }
                _dr.Close();
            }
            if (_UserLang == "")
            {
                _UserLang = "Heb";
            }
            if (!_UserExists)
            {
                switch (_UserLang.ToLower())
                {
                    case "heb":
                        Panel_HebReg.Visible = true;
                        ((ASP.controls_cmstrtextboxcontrol_ascx)MyFormHeb.FindControl("txtMail")).Text = _Usermail;
                        MyFormHeb.BackURL = "FacebookConnect.aspx?mail=" + _Usermail + "&lang=" + _UserLang;
                        break;
                    case "eng":
                        Panel_EngReg.Visible = true;
                        ((ASP.controls_cmstrtextboxcontrol_ascx)MyFormEng.FindControl("txtMail")).Text = _Usermail;
                        MyFormEng.BackURL = "FacebookConnect.aspx?mail=" + _Usermail + "&lang=" + _UserLang;
                        break;
                    default:
                        break;
                }
            }
            else
            {
                Response.Redirect("FacebookConnect.aspx?mail=" + _Usermail + "&lang=" + _UserLang);
                if (_UserLang == "Heb")
                {
                    Panel_HebExists.Visible = true;
                    ProceedLinkHeb.HRef = "FacebookConnect.aspx?mail=" + _Usermail + "&lang=" + _UserLang;
                }
                else
                {
                    Panel_EngExists.Visible = true;
                    ProceedLinkEng.HRef = "FacebookConnect.aspx?mail=" + _Usermail + "&lang=" + _UserLang;
                }
            }
            MyFormHeb.BackURL = "FacebookConnect.aspx?mail=" + _Usermail + "&lang=" + _UserLang;
        }
    }

    protected void MyFormHeb_ItemInserted(string NewUserID)
    {
        using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
        {
            con.Open();
            MySqlCommand _cmd = new MySqlCommand();
            _cmd.Connection = con;
            _cmd.CommandText = "UPDATE tblusers set CreationTime = now() where UserID =" + NewUserID;
            _cmd.ExecuteNonQuery();
        }
        Session["justRegistered"] = "true";
    }

    protected void Unnamed_Click(object sender, EventArgs e)
    {
        MyFormHeb.CalldoClick();
    }
}