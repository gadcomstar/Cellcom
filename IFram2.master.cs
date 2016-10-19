using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class IFram2 : System.Web.UI.MasterPage
{
    public bool IsSitePage = false;
    int memberid = 0;
    int lang = 1;
    string direction="";
    string culture = "";
    public string Culture
    {
        set { this.culture = value; }
        get { return this.culture; }
    }
    public string Direction
    {
        get { return this.direction; }
    }
    public int MyMemberID
    {
        get { return memberid; }
    }
    public int MyLangauge
    {
        get { return lang; }
    }

    protected void Page_Init(object sender, EventArgs e)
    {
        if (Session["memberid"] != null)
        {
            spinmember myspinmember = methods.GetMe();
            myspinmember.GetAlertFrom = "";
            // addmemberforDebug(16);
        }
        if (Request.QueryString["Lang"] != null && int.TryParse(Request.QueryString["Lang"], out lang))
        {
            using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
            {
                string sql = "Select LandDir,LangCulture From languages where LangID=" + lang;
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                conn.Open();
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    direction = dr["LandDir"].ToString();
                    culture = dr["LangCulture"].ToString();
                }
            }
        }
        else
        {
            direction = "ltr";
        }
        mystyle.Href = "Style/" + direction + ".css";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsSitePage)
        {

            if (!methods.CheckUserCradential())
            {
                string _js = "window.top.location.href='"+siteDefaults.SiteUrl+"' ";
                Page.ClientScript.RegisterStartupScript(GetType(), "goHome", _js, true);
                Response.Redirect("errorPage.aspx");

            }
            if (Session["memberid"] != null && int.TryParse(Session["memberid"].ToString(), out memberid))
            {
                if (!methods.MemberList[memberid].IsPassFirstStage)
                {

                    string _js = "window.parent. openMyprofile('registermsg.aspx?status=2', '480', '470');";
                    Page.ClientScript.RegisterStartupScript(GetType(), "WaitForConfirm", _js, true);

                    //Response.Redirect(siteDefaults.SiteUrl + "/lobby.aspx");




                }
            }
        }
       
        
       
    }
}
