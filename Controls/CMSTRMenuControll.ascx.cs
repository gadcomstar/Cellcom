using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

public partial class Controls_CMSTRMenuControll : System.Web.UI.UserControl
{
    public enum mode { SEOANDMENU, SEO, NOTACTIVE }

    #region Properties
    public static string ConnStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
    private string cssClass = "menuholderClass";
    private int pageId = 0;
    private DataView dv;
    private string pageName = "";
    private string pageHeader = "";
    private string pageContent = "";
    private string pageTitle = "";
    private string pageDesc = "";
    private string pageLink = "";
    private string pageKeyWord = "";
    private string pageParentName = "";
    private int pageParent = 0;
    private string pageParentLink = "";
    private mode menuMode = mode.SEOANDMENU;
    public mode MenuMode
    {
        set { this.menuMode = value; }
        get { return this.menuMode; }
    }

    public String PageParentLink
    {
        set { this.pageParentLink = value; }
        get { return this.pageParentLink; }
    }
    public String PageParentName
    {
        set { this.pageParentName = value; }
        get { return this.pageParentName; }
    }
    public String PageKeyWord
    {
        set { this.pageKeyWord = value; }
        get { return this.pageKeyWord; }
    }
    public String PageLink
    {
        set { this.pageLink = value; }
        get { return this.pageLink; }
    }
    public String PageDesc
    {
        set { this.pageDesc = value; }
        get { return this.pageDesc; }

    }
    public String PageTitle
    {
        set { this.pageTitle = value; }
        get { return this.pageTitle; }
    }
    public String PageContent
    {
        set { this.pageContent = value; }
        get { return this.pageContent; }
    }
    public String PageHeader
    {
        set { this.pageHeader = value; }
        get { return this.pageHeader; }
    }
    public String PageName
    {
        set { this.pageName = value; }
        get { return this.pageName; }
    }
    public int PageParent
    {
        set { this.pageParent = value; }
        get { return this.pageParent; }
    }
    public int PageId
    {
        set { this.pageId = value; }
        get { return this.pageId; }
    }
    public String CssClass
    {
        set { this.cssClass = value; }
        get { return this.cssClass; }
    }
    #endregion
    protected void Page_Init(object sender, EventArgs e)
    {
        using (MySqlConnection conn = new MySqlConnection(ConnStr))
        {
            string sql = "select * from pages";
            MySqlDataAdapter da = new MySqlDataAdapter(sql, conn);
            DataSet ds = new DataSet();
            da.Fill(ds, "pages");
            dv = ds.Tables["pages"].DefaultView;
            dv.RowFilter = "IsPageOnMainMenu=true";
            PageREpeater.DataSource = dv;
            PageREpeater.DataBind();
        }
        pageId = GetPageUrl();
        dv.RowFilter = "pageid=" + pageId;
        if (dv.Count > 0 && menuMode != mode.NOTACTIVE)
        {
            pageName = dv[0]["pagename"].ToString();
            pageContent = dv[0]["pagecontent"].ToString();
            pageTitle = dv[0]["PageTitle"].ToString();
            pageDesc = dv[0]["PageSEODesc"].ToString();
            pageLink = dv[0]["PageURL"].ToString();
            pageHeader = dv[0]["pageheader"].ToString();
            pageKeyWord = dv[0]["PageKeyWords"].ToString();
            pageParent = int.Parse(dv[0]["PageParent"].ToString());
            PageId = pageId;
            dv.RowFilter = "pageid=" + dv[0]["PageParent"];
            if (dv.Count > 0)
            {
                pageParentName = dv[0]["pagename"].ToString();
                pageParentLink = dv[0]["PageURL"].ToString();
            }
        }
        else
        {
            menuHolder.Visible = false;
        }
        if (menuMode == mode.SEO)
        {
            menuHolder.Visible = false;
        }

    }
    protected int GetPageUrl()
    {
        dv.RowFilter = "";
        int myId = 0;
        string path = "";
        string query = "";
        string url = Request.Url.ToString();
        url = url.Remove(0, url.LastIndexOf("/") + 1).ToLower();
        //url = url.Remove(0, url.LastIndexOf("/")).ToLower();       
        int totalscor = 0;
        for (int i = 0; i < dv.Count; i++)
        {
            int score = 0;
            string templink = dv[i]["PageURL"].ToString().ToLower();
            int qmark = templink.IndexOf("?");
            if (qmark > -1)
            {
                path = templink.Remove(qmark);
                query = templink.Remove(0, qmark + 1);
                if (Request.Url.ToString().Contains("localhost"))
                {
                    if (path == "")
                    {

                        path = "default.aspx";
                    }
                }


            }
            else
            {
                path = templink;
                if (Request.Url.ToString().Contains("localhost"))
                {
                    if (path == "")
                    {
                        path = "default.aspx";
                    }
                }
            }
            if (url.Contains(path) && path != "")
            {
                score++;
            }
            else
            {
                if (path == "" && url.Contains("default.aspx"))
                {
                    score++;
                }
            }

            if (url.Contains(query.ToLower()) && query != "")
            {
                string[] querysplit = query.Split('=');
                if (Request.QueryString[querysplit[0]].ToString() == querysplit[1])
                {
                    score++;
                }
            }
            if (totalscor < score)
            {
                totalscor = score;
                myId = int.Parse(dv[i]["pageid"].ToString());
            }
        }
        return myId;
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        menuHolder.Attributes["class"] = this.cssClass;
    }
    public DataView GetData(string myID)
    {
        dv.RowFilter = "PageParent=" + myID + "  AND IsChild=true";
        return dv;
    }
    public bool IsPageParent(string myID)
    {
        int mypageID = GetPageUrl();
        bool isparent = false;
        dv.RowFilter = "PageID=" + mypageID + "  AND IsChild=true and PageParent=" + myID;
        if (dv.Count > 0)
        {
            isparent = true;
        }
        return isparent;
    }
    public siteDefaults.pageDetails GetPageDetails(int mypageid)
    {
        siteDefaults.pageDetails mypage;
        dv.RowFilter = "pageID=" + mypageid;
        if (dv.Count > 0)
        {
            string pagename = dv[0]["pagename"].ToString();
            string pagelink = dv[0]["PageURL"].ToString();
            int parentid = int.Parse(dv[0]["PageParent"].ToString());
            mypage = new siteDefaults.pageDetails(pagename, pagelink, parentid);
        }
        else
        {
            mypage = null;
        }
        return mypage;
    }

    public bool CheckHasChildren(string myid)
    {
        bool HasChildren = false;
        dv.RowFilter = String.Format("PageParent={0} AND IsChild=true", myid);
        if (dv.Count > 0)
        {
            HasChildren = true;

        }
        return HasChildren;
    }
}