using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Web.UI.WebControls;







/// <summary>
/// Summary description for cmstrDefualts
/// those are comstar methods, this file is for general methods methods to use 
/// Do not write new methods to this file !!!!! to add methods only to sitedefaults
/// </summary>
/// 
public  class cmstrDefualts
{

    public static string ConnStr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
	public cmstrDefualts()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    // sendmail methods
    public static bool SendMail(string body, string messageStart, bool isFromSite)
    {
        bool pass = true;
        string frommail = "";
        string tomail = "";
        string STMPServer = "";
        string MailUser = "";
        string MailPassword = "";
        bool issecure = false;
        string sitename = "";
        string siteurl = "";
        int siteport = 25;
        using (MySqlConnection conn = new MySqlConnection(ConnStr))
        {
            string sql = String.Format("Select SendMail,returnMail,SMTPServer,MailUserName,MailPassword,siteName,siteURL,MailPort,IsMailSSL From  adminsites Where siteID=2");
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            conn.Open();
            MySqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                frommail = dr["SendMail"].ToString();
                tomail = dr["returnMail"].ToString();
                STMPServer = dr["SMTPServer"].ToString();
                MailUser = dr["MailUserName"].ToString();
                MailPassword = dr["MailPassword"].ToString();
                sitename = dr["siteName"].ToString();
                siteurl = dr["siteURL"].ToString();
                siteport = int.Parse(dr["MailPort"].ToString());
                issecure = bool.Parse(dr["IsMailSSL"].ToString());
            }
            conn.Close();
            pass = SendMail(frommail, tomail, body, messageStart, STMPServer, MailUser, MailPassword, issecure, siteport, sitename, siteurl, isFromSite);
        }
        return pass;
    }
    public static bool SendMail(string body, string messageStart)
    {
        bool pass = SendMail(body, messageStart, true);
        return pass;
    }

    public static bool SendMail(string body, string messageStart, string tomail, bool isFromSite)
    {
        bool pass = true;
        string frommail = "";
        string STMPServer = "";
        string MailUser = "";
        string MailPassword = "";
        bool issecure = false;
        string sitename = "";
        string siteurl = "";
        int siteport = 25;
        using (MySqlConnection conn = new MySqlConnection(ConnStr))
        {
            string sql = String.Format("Select SendMail,SMTPServer,MailUserName,MailPassword,siteName,siteURL,MailPort,IsMailSSL From  adminsites Where siteID=2");
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            conn.Open();
            MySqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                frommail = dr["SendMail"].ToString();
                STMPServer = dr["SMTPServer"].ToString();
                MailUser = dr["MailUserName"].ToString();
                MailPassword = dr["MailPassword"].ToString();
                sitename = dr["siteName"].ToString();
                siteurl = dr["siteURL"].ToString();
                siteport = int.Parse(dr["MailPort"].ToString());
                issecure = bool.Parse(dr["IsMailSSL"].ToString());
            }
            conn.Close();
            pass = SendMail(frommail, tomail, body, messageStart, STMPServer, MailUser, MailPassword, issecure, siteport, sitename, siteurl, isFromSite);
        }
        return pass;
    }
    public static bool SendMail(string body, string messageStart, string tomail, bool isFromSite, string direction)
    {
        bool pass = true;
        string frommail = "";
        string STMPServer = "";
        string MailUser = "";
        string MailPassword = "";
        bool issecure = false;
        string sitename = "";
        string siteurl = "";
        int siteport = 25;
        using (MySqlConnection conn = new MySqlConnection(ConnStr))
        {
            string sql = String.Format("Select SendMail,SMTPServer,MailUserName,MailPassword,siteName,siteURL,MailPort,IsMailSSL From  adminsites Where siteID=2");
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            conn.Open();
            MySqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                frommail = dr["SendMail"].ToString();
                STMPServer = dr["SMTPServer"].ToString();
                MailUser = dr["MailUserName"].ToString();
                MailPassword = dr["MailPassword"].ToString();
                sitename = dr["siteName"].ToString();
                siteurl = dr["siteURL"].ToString();
                siteport = int.Parse(dr["MailPort"].ToString());
                issecure = bool.Parse(dr["IsMailSSL"].ToString());
            }
            conn.Close();
            pass = SendMail(frommail, tomail, body, messageStart, STMPServer, MailUser, MailPassword, issecure, siteport, sitename, siteurl, isFromSite, direction);
        }
        return pass;
    }
    public static bool SendMail(string body, string messageStart, string tomail)
    {
        bool pass = SendMail(body, messageStart, tomail, true);
        return pass;
    }
    public static bool SendMail(string frommail, string tomail, string body, string messageStart, string STMPServer, string MailUser, string MailPassword, bool issecure, int port, string sitename, string siteurl, bool isFromSite)
    {
        string direction = "ltr";
        if (HttpContext.Current.Session["dir"] != null)
        {
            direction = HttpContext.Current.Session["dir"].ToString();
        }
        return SendMail(frommail, tomail, body, messageStart, STMPServer, MailUser, MailPassword, issecure, port, sitename, siteurl, isFromSite, direction);
    }
    public static bool SendMail(string frommail, string tomail, string body, string messageStart, string STMPServer, string MailUser, string MailPassword, bool issecure, int port, string sitename, string siteurl, bool isFromSite, string direction)
    {
        string msgbody = "";
        if (direction == "rtl")
        {
            msgbody = String.Format(" <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\"><html xmlns=\"http://www.w3.org/1999/xhtml\"><body style=\"text-align:right;direction:rtl;font-size:18px\" ><div>");
        }
        else
        {
            msgbody = String.Format(" <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\"><html xmlns=\"http://www.w3.org/1999/xhtml\"><body style=\"text-align:left;direction:ltr;font-size:18px\" ><div>");
        }
        msgbody += "<p style=\"margin:0px;padding:0px;\">";
        msgbody += string.Format("{0} <br/>", messageStart);
        msgbody += "</p>";
        if (isFromSite)
        {
            msgbody += "<p style=\"margin:0px;padding:0px;\">";
            msgbody += string.Format("the mail was sent from site {0} address {1}", sitename, siteurl);
            msgbody += "</p>";
        }
        msgbody += body;
        msgbody += "</div></body></html>";
        bool pass = true;
        try
        {
            MailMessage message = new MailMessage();
            message.From = new MailAddress(frommail);
            message.To.Add(new MailAddress(tomail));
            message.Subject = messageStart;
            message.Body = msgbody;
            message.IsBodyHtml = true;
            SmtpClient client = new SmtpClient();
            client.Host = STMPServer;
            client.UseDefaultCredentials = false;
            client.Port = port;
            client.Credentials = new System.Net.NetworkCredential(MailUser, MailPassword);
            // client.UseDefaultCredentials = true;
            client.EnableSsl = issecure;
            client.Send(message);
        }
        catch (Exception ex)
        {
            string text = ex.Message;
            pass = false;
        }
        return pass;
    }


    public static List<Control> getControls(Control root, Type type) //a recusrion to get all the controlls in the page
    {
        List<Control> list = new List<Control>();
        foreach (Control c in root.Controls)
        {
            if (c.GetType() == type)
            {
                list.Add(c);
            }
            if (c.Controls.Count > 0)
            {
                list.AddRange(getControls(c, type));
            }
        }
        return list;
    }

   
    public static List<Control> getControls2(Control root) //a recusrion to get all the controlls in the page
    {
        List<Control> list = new List<Control>();
        foreach (Control c in root.Controls)
        {
            if (c is CMSTRBase && c.Visible == true)
            {
                list.Add(c);
            }
            else if (c.Controls.Count > 0)
            {
                list.AddRange(getControls2(c));
            }
        }
        return list;
    }  
    public static bool CheckIfImgExists(string imglink) // check image exists
    {
        bool isExists = false;
        if (imglink != "" && File.Exists(HttpContext.Current.Server.MapPath(imglink)))
        {
            isExists = true;
        }
        return isExists;
    }
    public static string CutIfLong(string myinput, int length) // return string cut if legth to long
    {
        if (myinput.Length > length)
        {
            myinput = myinput.Remove(length);
        }
        return myinput;
    }
    public static string AddQueryFieldToUrl(string url, string fieldName, string fieldValue)
    {
        string newurl = "";
        if (fieldName != "" && fieldValue != "")
        {
            if (url.IndexOf("?") > -1)
            {
                newurl = url + "&" + fieldName + "=" + fieldValue;
            }
            else
            {
                newurl = url + "?" + fieldName + "=" + fieldValue;
            }
        }
        return newurl;
    }
    public static bool CheckQueryString(string query, out int number)
    {
        if (HttpContext.Current.Request.QueryString[query] != null && int.TryParse(HttpContext.Current.Request.QueryString[query], out number))
        {
            return true;
        }
        else
        {
            number = 0;
            return false;
        }
    }
    public static bool CheckQueryString(string query, out double number)
    {
        if (HttpContext.Current.Request.QueryString[query] != null && double.TryParse(HttpContext.Current.Request.QueryString[query], out number))
        {
            return true;
        }
        else
        {
            number = 0;
            return false;
        }
    }
}