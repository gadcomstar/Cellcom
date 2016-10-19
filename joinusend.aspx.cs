using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using isendAPI;
using System.Web.UI.HtmlControls;

public partial class joinusend : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["resend"] == "true")
        {
            TboxThankYouTextResend.Style.Add("display", "block");
            TboxThankYouTextResend2.Style.Add("display", "block");
            TboxThankYouTextResend3.Style.Add("display", "block");
        }
    }
    protected void TboxThankYouTextResend4_Click(object sender, EventArgs e)
    {
        TboxThankYouTextResend2_Click(sender,e);
    }

    protected void TboxThankYouTextResend2_Click(object sender, EventArgs e)
    {
        string email = Request.QueryString["mail"];
        string fullname="";
        string myguid="";
        using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
        {
            con.Open();
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "select FullName,GUID from tblusers where emailaddress='"+Request.QueryString["mail"]+"'";
            MySqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                fullname= dr["FullName"].ToString();
                myguid = dr["GUID"].ToString();
            }
            dr.Close();
            con.Close();
        }
        Adduser_WL(5078, email, fullname, 19, siteDefaults.SiteUrl + "/login.aspx?guid=" + myguid);
       Response.Redirect("./");
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
        _mailList.Add(new SendMsgList() { ExistingListID = 55, ExistingListIDSpecified = true });
        _UsersList.Add(new SendMsgUser() { EmailAddress = Mail, UserSystemFields = new SendMsgFields[3] { new SendMsgFields() { Key = "שם", Value = FullName }, new SendMsgFields() { Key = "קישור הרשמה", Value = sendurl }, new SendMsgFields() { Key = "נרשם דרך מייל", Value = "1" } } });

        _svc.AddUsersToLists(SiteID, true, "IL110077", _UsersList.ToArray(), _mailList.ToArray(), out AddUsersToListResult, out tmp, out _res);
        string bla;
    }
}