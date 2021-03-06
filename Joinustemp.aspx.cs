﻿using isendAPI;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class Joinustemp : System.Web.UI.Page
{
    int GrpID = 0;
    string MissionName = "";
    string fbUrl = siteDefaults.FbRedirectUrlReg;
    string _usermail = "";
    FacebookCode fb = null;
    public string appId = siteDefaults.FbClientId;
    
    protected void Page_Load(object sender, EventArgs e)
    {
        ((HtmlGenericControl)Master.FindControl("PageBody")).Attributes["class"] = "LoginBodyClass";

        if (!string.IsNullOrEmpty(Request.QueryString["GrpID"]) && int.TryParse(Request.QueryString["GrpID"].ToString(), out GrpID))
        {

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
            cmd.CommandText = "INSERT into tbljoinenters (MissionName,Date,GrpID) Values ('" + MissionName + "',now(),'" + GrpID + "')";
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
    protected void MyFormEng_ItemInserted(string NewUserID)
    {

    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        bool _userExists_onIL = false;
        bool _userExists_onWL = false;
        bool _userExists_onWL2 = false;
        bool _maillingListExists = false;
        bool _maillingListExistsRes;
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
                if (GrpID != 0)
                {


                    _svc.GetMailingListNames(5078, true, "IL110077", out _maillingListExistsRes, out _maillingListExistsRes, out _mailList, out _tt);
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
                _cmd.CommandText = " SELECT * from tblUsers where EmailAddress ='" + ((ASP.controls_cmstrtextboxcontrol_ascx)MyFormHeb.FindControl("txtMail")).Text + "'";
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
                MyFormHeb.CalldoClick();
                if (!_userExists_onWL)
                {
                    Adduser_WL(5078, ((ASP.controls_cmstrtextboxcontrol_ascx)MyFormHeb.FindControl("txtMail")).Text, ((ASP.controls_cmstrtextboxcontrol_ascx)MyFormHeb.FindControl("txtFullName")).Text, GrpID == 0 || !_maillingListExists ? 19 : GrpID);
                }
                Session["Logged"] = "true";
                Session["LoggedMail"] = ((ASP.controls_cmstrtextboxcontrol_ascx)MyFormHeb.FindControl("txtMail")).Text;
                using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
                {
                    con.Open();
                    MySqlCommand cmd = new MySqlCommand();
                    cmd.Connection = con;
                    cmd.CommandText = "INSERT into tbljoinregisters (MissionName,CreationDate,GrpID,EmailAddress,FullName) Values ('" + MissionName + "',now(),'" + GrpID + "','" + ((ASP.controls_cmstrtextboxcontrol_ascx)MyFormHeb.FindControl("txtMail")).Text + "','" + ((ASP.controls_cmstrtextboxcontrol_ascx)MyFormHeb.FindControl("txtFullName")).Text + "')";
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                Response.Redirect("FacebookConnect.aspx?mail=" + ((ASP.controls_cmstrtextboxcontrol_ascx)MyFormHeb.FindControl("txtMail")).Text);
            }
            else
            {
                lblRegisterStatus.Text = "User Already Exists";

            }

        }
        catch (Exception ex)
        {

        }

    }
    protected void Adduser_WL(int SiteID, string Mail, string FullName)
    {
        bool tmp = false;
        SendMsgResults _res = new SendMsgResults();
        SendMsgService _svc = new SendMsgService();

        _svc.AddUsersOnly(SiteID, true, "IL110077", new SendMsgUser[] 
        { 
            new SendMsgUser() { EmailAddress = Mail, UserSystemFields = new SendMsgFields[1]{new SendMsgFields(){ Key="שם", Value=FullName}} }
            
        }, out tmp, out tmp, out _res);


    }

    protected void Adduser_WL(int SiteID, string Mail, string FullName, int ListID)
    {
        bool tmp;
        bool AddUsersToListResult;
        SendMsgResults _res = new SendMsgResults();
        SendMsgService _svc = new SendMsgService();
        List<SendMsgUser> _UsersList = new List<SendMsgUser>();
        List<SendMsgList> _mailList = new List<SendMsgList>();
        _mailList.Add(new SendMsgList() { ExistingListID = ListID, ExistingListIDSpecified = true });
        _UsersList.Add(new SendMsgUser() { EmailAddress = Mail, UserSystemFields = new SendMsgFields[1] { new SendMsgFields() { Key = "שם", Value = FullName } } });

        _svc.AddUsersToLists(SiteID, true, "IL110077", _UsersList.ToArray(), _mailList.ToArray(), out AddUsersToListResult, out tmp, out _res);


    }
    protected void MyFormHeb_ItemInserted(string NewUserID)
    {

    }
    protected void Unnamed_Click(object sender, EventArgs e)
    {
        Adduser_WL(5078, ((ASP.controls_cmstrtextboxcontrol_ascx)MyFormHeb.FindControl("txtMail")).Text, ((ASP.controls_cmstrtextboxcontrol_ascx)MyFormHeb.FindControl("txtFullName")).Text);
    }

    protected void RegisterFBLinkButton_Click(object sender, EventArgs e)
    {
        fb = new FacebookCode(siteDefaults.FbClientId, siteDefaults.FbClientSecret);
        fb.LoginClick(fbUrl, "user_hometown,email,user_location");
    }
}