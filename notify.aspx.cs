using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class notify : System.Web.UI.Page
{
    protected string mail;
    protected string link;
    protected string msg;
    protected User _usr;
    string errorlog = " errorlog: ";
    protected string _missionID = "";
    protected void Page_Load(object sender, EventArgs e)
    {
       
        //siteDefaults.SendMail(Request.Url.PathAndQuery, "error from notify.aspx");

        try
        {
            errorlog = "1";
            MailMessage _msg = new MailMessage();
            if (!string.IsNullOrEmpty(Request.QueryString["email"]))
            {
                mail = Request.QueryString["email"].ToString();
            }
            else
            {
                throw new Exception();
            }
            if (!string.IsNullOrEmpty(Request.QueryString["link"]))
            {
                link = Request.QueryString["link"].ToString();
            }
            //else
            //{
            //    throw new Exception();
            //}
            if (!string.IsNullOrEmpty(Request.QueryString["msg"]))
            {
                msg = Request.QueryString["msg"].ToString();
            }
            else
            {
                throw new Exception();
            }
            //if (!string.IsNullOrEmpty(Request.QueryString["mission"]))
            //{
            //    _missionID = Request.QueryString["mission"].ToString();
            //}

            using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
            {
                con.Open();
                MySqlCommand _cmd = new MySqlCommand();
                _cmd.Connection = con;
                _cmd.CommandText = string.Format("select * from tblUsers where (EmailAddress='{0}' OR LoginMailAddress='{0}') AND LoginType='fb'", mail);
                MySqlDataReader _dr = _cmd.ExecuteReader();
                if (_dr.Read())
                {
                    _usr = new User();
                    _usr.LoginTmpToken = _dr["LoginTypeToken"].ToString();
                    _usr.LoginTypeID = _dr["LoginTypeID"].ToString();
                }
                _dr.Close();
            }
            if (msg.Contains("https://israelikers.org"))
            {
                _missionID = msg.Substring(msg.LastIndexOf("https://israelikers.org"));
                msg = msg.Replace(_missionID, "");
                _missionID = _missionID.Substring(_missionID.LastIndexOf("name="));
            }
            else if (msg.Contains("http://israelikers.org"))
            {
                _missionID = msg.Substring(msg.LastIndexOf("http://israelikers.org"));
                msg = msg.Replace(_missionID, "");
                _missionID = _missionID.Substring(_missionID.LastIndexOf("name="));

            }
            else if (msg.Contains("https://www.israelikers.org"))
            {
                _missionID = msg.Substring(msg.LastIndexOf("https://www.israelikers.org"));
                msg = msg.Replace(_missionID, "");
                _missionID = _missionID.Substring(_missionID.LastIndexOf("name="));

            }
            else if (msg.Contains("http://www.israelikers.org"))
            {
                _missionID = msg.Substring(msg.LastIndexOf("http://www.israelikers.org"));
                msg = msg.Replace(_missionID, "");
                _missionID = _missionID.Substring(_missionID.LastIndexOf("name="));

            }
            if (_usr != null)
            {
                //try
                //{

                   
                    HttpWebRequest webRequest = (HttpWebRequest)System.Net.WebRequest.Create("https://graph.facebook.com/" + _usr.LoginTypeID + "/notifications?access_token=" + siteDefaults.MyAppToken +
                        "&template=" + msg + (_missionID != "" ? "&href=" + Server.UrlEncode("mission.aspx?" + _missionID + "&mail=" + mail) : ""));
                    //    Response.Write(webRequest.Address.ToString());
                    webRequest.Method = "POST";
                    //    Response.Write(webRequest.Address.ToString());

                    webRequest.AllowAutoRedirect = true;
                    webRequest.UserAgent = "Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0)";
                    webRequest.PreAuthenticate = true;
                    webRequest.Credentials = CredentialCache.DefaultCredentials;

                  //  webRequest.Timeout = 60000;//sets the timeout for thew request

                    errorlog += "Timeout:" + webRequest.Timeout + "ReadWriteTimeout:" + webRequest.ReadWriteTimeout; 
                    webRequest.ContentType = "application/x-www-form-urlencoded";//the content type. most of the times it will be application/x-www-form-urlencoded
                    StreamReader MyStream = new StreamReader(webRequest.GetResponse().GetResponseStream());//creating a stream reader to read the results from the API
                    string responseData = MyStream.ReadToEnd();//reading the result from the API into a string
                    //    Response.Clear();
                    Response.Write(responseData.Contains("\"success\":true") ? "true" : "error - from facebook responseData:" + responseData);
               
                    cmstrDefualts.SendMail(Request.Url.PathAndQuery + " " + (responseData.Contains("\"success\":true") ? "true" : "error"), "error from notify.aspx");
                
                  
                //}
                //catch (Exception ex)
                //{
                //    Response.Clear();
                //    Response.Write("error - " + ex.InnerException.Message);
                //}

            }
            else
            {
                cmstrDefualts.SendMail(Request.Url.PathAndQuery + " " + " No User Found", "error from notify.aspx");
              
            }

        }
        catch (Exception ex)
        {

            Response.Clear();
            if (ex.InnerException == null)
            {
                Response.Write("error - " + ex.Message + "StackTrace:" + ex.StackTrace + errorlog);
            }
            else
            {
                Response.Write("error - " + ex.InnerException.Message + "InnerException.StackTrace:" + ex.InnerException.StackTrace + errorlog);
            }
        }

    }
}