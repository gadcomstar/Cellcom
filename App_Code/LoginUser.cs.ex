﻿using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for LoginUser
/// </summary>
public static class LoginUser
{
    public static User GetLoginUser(int loginID)
    {
        User u = new User();

        using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
        {
            conn.Open();

            string sql = String.Format("SELECT LoginType,LoginTypeID,FirstName,LastName,CountryName,LoginProfilePic,LoginTypeToken FROM tblUsers WHERE UserID={0}", loginID);
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            MySqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                u.LoginID = loginID;
                u.LoginType = dr["LoginType"].ToString();
                u.LoginTypeID = dr["LoginTypeID"].ToString();
                u.LoginFirstName = dr["FirstName"].ToString();
                u.LoginLastName = dr["LastName"].ToString();
                u.LoginCountryName = dr["CountryName"].ToString();
                u.LoginProfilePic = dr["LoginProfilePic"].ToString();
                u.LoginTmpToken = dr["LoginTypeToken"].ToString();
            }
            dr.Close();
            conn.Close();
        }

        return u;
    }

    public static int InsertUpdateLoginUser(object socialObj, MySqlConnection conn)
    {
        int loginID = 0;
        User u = new User();

        if (socialObj is FacebookCode)
        {
            FacebookCode fb = (FacebookCode)socialObj;
            u.LoginType = "fb";
            u.LoginTypeID = fb.fbUser.id;
            u.LoginFirstName = fb.fbUser.first_name;
            u.LoginLastName = fb.fbUser.last_name;
            u.LoginCountryName = fb.fbUser.countryName;
            u.LoginMail = fb.fbUser.email;
            //u.LoginProfilePic = fb.fbUser.picture.data.url;
            u.LoginProfilePic = "http://graph.facebook.com/" + fb.fbUser.id + "/picture?type=square";
            u.LoginTmpToken = fb.fbUser.tmpToken;

        }
        //else if (socialObj is GooglePlus)
        //{
        //    GooglePlus gp = (GooglePlus)socialObj;
        //    u.LoginType = "gp";
        //    u.LoginTypeID = gp.gpUser.id;
        //    u.LoginFirstName = gp.gpUser.name.givenName;
        //    u.LoginLastName = gp.gpUser.name.familyName;
        //    u.LoginCountryName = gp.gpUser.countryName;
        //    u.LoginProfilePic = gp.gpUser.image.url;
        //    //u.LoginProfilePic = "https://plus.google.com/s2/photos/profile/" + gp.gpUser.id + "?sz=50";
        //    u.LoginTmpToken = gp.gpUser.tmpToken;
        //}
        //else if (socialObj is Twitter)
        //{            
        //    Twitter twit = (Twitter)socialObj;
        //    u.LoginType = "twit";
        //    u.LoginTypeID = twit.twitUser.id.ToString();

        //    u.LoginFirstName = twit.twitUser.name.Remove(twit.twitUser.name.IndexOf(' ')).Trim();
        //    u.LoginLastName = twit.twitUser.name.Substring(twit.twitUser.name.IndexOf(' ')).Trim();

        //    u.LoginCountryName = twit.twitUser.location.ToString();
        //    u.LoginProfilePic = twit.twitUser.profile_image_url;
        //    u.LoginTmpToken = "";           
        //}

        int userIdInt = 0;
        bool userIdValid = false;
        foreach (char num in u.LoginTypeID)
        {
            if (!int.TryParse(num.ToString(), out userIdInt))
            {
                userIdValid = false;
                break;
            }
            else
            {
                userIdValid = true;
            }
        }

        if (userIdValid)
        {
            bool AddBadge = false;
            //string sql = String.Format("SELECT UserID FROM tblUsers WHERE LoginType='{0}' AND LoginTypeID='{1}'", u.LoginType, u.LoginTypeID);
            string sql = String.Format("SELECT UserID FROM tblUsers WHERE EmailAddress='{0}'", HttpContext.Current.Session["WLmail"]);

            MySqlCommand cmd = new MySqlCommand(sql, conn);
            MySqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                int.TryParse(dr["UserID"].ToString(), out loginID);
            }
            dr.Close();

            if (loginID > 0)
            {
                sql = String.Format("UPDATE tblUsers SET CountryName='{1}',LoginProfilePic='{2}',LoginTypeToken='{3}',LoginType ='{4}',LoginTypeID='{5}',LoginMailAddress='{6}' WHERE UserID={0}",
                                            loginID, u.LoginCountryName, u.LoginProfilePic, u.LoginTmpToken, u.LoginType, u.LoginTypeID, u.LoginMail);
                if (u.LoginType == "fb")
                {
                    AddBadge = true;
                }
            }
            else
            {
                //sql = String.Format("UPDATE tblUsers SET LoginDate=now(),CountryName='{1}',LoginProfilePic='{2}LoginTypeToken='{3}' WHERE EmailAddress={0}",
                //                            u.LoginMail, u.LoginCountryName, u.LoginProfilePic, u.LoginTmpToken);
            }

            object lastId;
            try
            {

                cmd.CommandText = sql;
                cmd.ExecuteNonQuery();
                if (AddBadge)
                {
                    Badge.AddBadge(BadgTypeEnum.Join, conn, loginID);
                }
                //if (loginID == 0)
                //{
                //    sql = "SELECT @@IDENTITY;";
                //    cmd.CommandText = sql;
                //    lastId = cmd.ExecuteScalar();
                //    int.TryParse(lastId.ToString(), out loginID);
                //}

            }
            catch (Exception ex)
            {

            }


        }

        return loginID;
    }
}

public class User
{
    public int LoginID { get; set; }
    public string LoginType { get; set; }
    public string LoginTypeID { get; set; }
    public string LoginFirstName { get; set; }
    public string LoginLastName { get; set; }
    public string LoginCountryName { get; set; }
    public string LoginProfilePic { get; set; }
    public string LoginTmpToken { get; set; }
    public string LoginMail { get; set; }
}