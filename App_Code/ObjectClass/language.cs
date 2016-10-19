using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for language
/// </summary>
public class SiteLanguage
{
    public static List<SiteLanguage> languagesList = new List<SiteLanguage>();
    public int LangID { set; get; }
    public string LangName { set; get; }
    public string LandDir { set; get; }
    public string LangIcon { set; get; }
    public string LangCulture { set; get; }


    public SiteLanguage()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public static void SetLanguages()
    {
        using (MySqlConnection conn = new MySqlConnection(cmstrDefualts.ConnStr))
        {
            conn.Open();
            string sql = "Select LangID,LangName,LandDir,LangIcon,LangCulture From languages";
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            MySqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                SiteLanguage mylanguage = new SiteLanguage();
                int myid = 0;
                int.TryParse(dr["LangID"].ToString(), out   myid);
                mylanguage.LangID = myid;
                mylanguage.LangName = dr["LangName"].ToString();
                mylanguage.LangIcon = dr["LangIcon"].ToString();
                mylanguage.LandDir = dr["LandDir"].ToString();
                mylanguage.LangCulture = dr["LangCulture"].ToString();
                languagesList.Add(mylanguage);
            }
            dr.Close();
            if (languagesList.Count == 0)
            {
                SiteLanguage mylanguage = new SiteLanguage();
                mylanguage.LangID = 1;
                mylanguage.LangName = "עברית";
                mylanguage.LangIcon = "";
                mylanguage.LandDir = "rtl";
                mylanguage.LangCulture = "heb";
                languagesList.Add(mylanguage);

            }

        }

    }

    public static SiteLanguage GetLanguage()
    {
        int sitelang = 0;
        SiteLanguage myLang = new SiteLanguage();
        if (HttpContext.Current.Request.QueryString["sitelang"] != null && int.TryParse(HttpContext.Current.Request.QueryString["sitelang"].ToString(), out sitelang))
        {
            myLang = SiteLanguage.languagesList.FirstOrDefault(m => m.LangID == sitelang);
            HttpContext.Current.Session["SiteLang"] = sitelang.ToString();
        }
        else if (HttpContext.Current.Session["SiteLang"] != null && int.TryParse(HttpContext.Current.Session["SiteLang"].ToString(), out sitelang))
        {
            myLang = SiteLanguage.languagesList.FirstOrDefault(m => m.LangID == sitelang);
        }
        else
        {
            if (SiteLanguage.languagesList.Count > 0)
            {
                myLang = SiteLanguage.languagesList[0];
                HttpContext.Current.Session["SiteLang"] = myLang.LangID;
            }
        }
        return myLang;
    }
}