using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
//using System.Data.OleDb;
using System.Web.UI.WebControls;
using System.Data;
using System.Net.Mail;
using MySql.Data.MySqlClient;
using System.Net;
using System.IO;
using isendAPI;
using System.Text.RegularExpressions;
using System.Threading;


/// <summary>
/// Summary description for siteDefaults
/// </summary>
public static class siteDefaults
{
    
    
    public static string SiteUrl="" ;
    public static string SiteName ;
    public static string ConnStr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
    public static bool hasSubmenu = true;
    public static bool isAddingPages = false;
    public static Dictionary<string, string> SiteTextDictionary = new Dictionary<string, string>();
    public static Dictionary<string, string> SiteParam = new Dictionary<string, string>();
    public static string errormsg = "";
    public static string Domain;
    public static System.Windows.Forms.Timer ProcTimer = new System.Windows.Forms.Timer();
    
    public static void StartProccesses()
    {
        Thread _t = new Thread(new ThreadStart(Processes.processMissions));
        _t.IsBackground = true;
        _t.Start();

    }
    //Facebook Info
    #region Facebook Info
    public static string FbClientId = "556455487770171";
    public static string FbClientSecret = "940e2fff628ae38ccbd21e9844695542";
    public static string FbRedirectUrl = "https://israelikers.org/facebookLogin.aspx";
    public static string FbRedirectUrlAdmin = "http://israelikers.org/admin/facebookLoginAdmin.aspx";
    public static string FbRedirectUrlReg = "http://israelikers.org/facebookReg.aspx";
    public static string FbRedirectUrlAdd = "http://israelikers.org/facebookAdd.aspx";

    //public static string FbClientId = "746926731995090";
    //public static string FbClientSecret = "1ad093bb8b5c86cf25a2807bd766e3ef";
    //public static string FbRedirectUrl = "http://israelikers.comstar.co/facebookLogin.aspx";
    //public static string FbRedirectUrlAdmin = "http://israelikers.comstar.co/admin/facebookLoginAdmin.aspx";
    //public static string FbRedirectUrlReg = "http://israelikers.comstar.co/facebookReg.aspx";
    //public static string FbRedirectUrlAdd = "http://israelikers.comstar.co/facebookAdd.aspx";

    public static string MyAppToken
    {
        get
        {
            HttpWebRequest webRequest = (HttpWebRequest)System.Net.WebRequest.Create("https://graph.facebook.com/oauth/access_token?client_id=" + FbClientId + "&client_secret=" + FbClientSecret + "&grant_type=client_credentials"); //setting an httpWebRequest with the URL of the API
            webRequest.Method = "GET";//the type of method the API returns
            //webRequest.Timeout = 60000;//sets the timeout for thew request
            //
            webRequest.AllowAutoRedirect = true;
            webRequest.UserAgent = "Mozilla/4.0 (compatible; MSIE 5.01; Windows NT 5.0)";
            webRequest.PreAuthenticate = true;
            webRequest.Credentials = CredentialCache.DefaultCredentials;
            //

            webRequest.ContentType = "application/x-www-form-urlencoded";//the content type. most of the times it will be application/x-www-form-urlencoded
            StreamReader MyStream = new StreamReader(webRequest.GetResponse().GetResponseStream());//creating a stream reader to read the results from the API
            string responseData = MyStream.ReadToEnd();//reading the result from the API into a string
            return responseData.Replace("access_token=", "");
        }
    }
    #endregion

    public static List<string> GetUserMissions(string UserMail)
    {
        List<string> MissionList = new List<string>();
        bool UsersAllowed = false;
        SendMsgService _svc = new SendMsgService();
        bool _t3;
        bool _t4;
        int _t;
        bool _t2;
        SendMsgStatistics[] Messages_List = new SendMsgStatistics[0];
        SendMsgResults _results;
        //_svc.GetSentMessages(5078, true, "IL110077", out _t, out _t2, out Messages_List, out  _results);
        _svc.GetUserByMail(5078, true, UserMail, out _t, out _t2);//convert mail to UserID on Isend
        if (_t != 0)
        {
            _svc.GetUserMessages(5078, true, "IL110077", _t, true, out _t3, out _t4, out Messages_List, out _results); //Getting User Messages
            List<SendMsgStatistics> _lst = Messages_List.ToList();
            if (_lst.Count > 0)
            {
                using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
                {
                    con.Open();
                    MySqlCommand cmd = new MySqlCommand();
                    cmd.Connection = con;
                    MySqlDataReader dr;
                    foreach (SendMsgStatistics item in _lst)
                    {
                        bool MsgExists = false;

                        cmd.CommandText = string.Format("SELECT * from tblmission2msgs where MessageID={0}", item.MessageID);
                        dr = cmd.ExecuteReader();
                        if (dr.Read())
                        {
                            MsgExists = true;
                            if (!MissionList.Contains(dr["MissionName"].ToString()))
                            {
                                MissionList.Add(dr["MissionName"].ToString());
                            }

                        }

                        dr.Close();
                        if (!MsgExists)
                        {
                            
                            bool _x1;
                            bool _x2;
                            SendMsgStatistics _tmpMsg;
                            SendMsgResults _tmpResults;
                            _svc.GetMsgBasicStatistics(5078, true, "IL110077", item.MessageID, true, out _x1, out _x2, out _tmpMsg, out _tmpResults);
                            
                            if (_tmpResults.ResultID == 200)
                            {
                                string _msg = _tmpMsg.OriginalMessage.MessageContent;
                                Regex _reg = new Regex("name=[a-zA-Z0-9\\-]{36}\\&");
                                Match regMatch = _reg.Match(_msg);
                                if (regMatch != null && regMatch.ToString() != "")
                                {
                                    string missionNameReg = regMatch.ToString().Replace("name=", "").Replace("&", "");
                                    if (missionNameReg != "")
                                    {
                                        cmd.CommandText = "INSERT into tblmission2msgs (MissionName,MessageID) Values ('" + missionNameReg + "','" + item.MessageID + "')";
                                        cmd.ExecuteNonQuery();
                                        if (!MissionList.Contains(missionNameReg))
                                        {
                                            MissionList.Add(missionNameReg);
                                        }

                                    }
                                }


                            }
                        }
                    }
                    con.Close();
                }
            }
        }
        return MissionList;

    }
    public static void SiteGeneralDefaults()
    {
        using (MySqlConnection con = new MySqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString))
        {
            con.Open();
            MySqlCommand cmd = new MySqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "SELECT siteDomain,siteName,siteURL FROM adminsites ";
            MySqlDataReader MyReader;
            try
            {
                MyReader = cmd.ExecuteReader();
                if (MyReader.Read())
                {
                    SiteUrl = MyReader["siteURL"].ToString();
                    SiteName = MyReader["siteName"].ToString();
                    Domain = MyReader["siteDomain"].ToString();
                }
                MyReader.Close();

                cmd.CommandText = string.Format("Select genCode,genContent From generaltexts where lang='heb' ");
                MyReader = cmd.ExecuteReader();
                SiteTextDictionary.Clear();
                while (MyReader.Read())
                {
                    if (!SiteTextDictionary.ContainsKey(MyReader["genCode"].ToString()))
                    {
                        SiteTextDictionary.Add(MyReader["genCode"].ToString(), MyReader["genContent"].ToString());
                    }
                }
                MyReader.Close();
            }
            catch (Exception ex)
            {
                string msg = ex.Message;
                con.Close();
            }
            con.Close();
        }
    }
    public static void SiteGeneralParam()
    {
        SiteParam = new Dictionary<string, string>();
        using (MySqlConnection con = new MySqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString))
        {
            con.Open();
            string sql = String.Format("Select   twittercode,twittersecret,idletime,onlinecycle,blindaddmunutetoroom,roomshowleavebtn,blindshowleavebtn, `onlineshowleavebtn`,`onlinebeforesec`,`onlinebeforemin`,`onlinedatesec`,`onlinedatemin`,`blindbeforesec`,`blindbeforemin`,`blinddatesec`,`blinddatemin`,`favobeforesec`,`favobeforemin`,`favodatesec`,`favodatemin`, facebookAppID,FacebookSecretID,Secondsbeforestartspin,PayPalEmailAddress,SpinDatetime,SpinDatetime2,Minutesbeforestartspin,joinroommax,blindroomtime,hasConfirmPicture,hasDateFroDay,DateaDay,showbdinLobbyminRooms from systemparam where idsystemparam=1");           
            MySqlCommand cmd = new MySqlCommand(sql,con);
            MySqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                AddToSiteParam("hasDateFroDay",dr);
                AddToSiteParam("DateaDay", dr);
                AddToSiteParam("hasConfirmPicture", dr);
                AddToSiteParam("blindroomtime", dr);
                AddToSiteParam("showbdinLobbyminRooms", dr);
                AddToSiteParam("joinroommax", dr);
                AddToSiteParam("Minutesbeforestartspin", dr);
                AddToSiteParam("SpinDatetime", dr);
                AddToSiteParam("SpinDatetime2", dr);
                AddToSiteParam("PayPalEmailAddress", dr);
                AddToSiteParam("Secondsbeforestartspin", dr);
                AddToSiteParam("facebookAppID", dr);
                AddToSiteParam("FacebookSecretID", dr);
                AddToSiteParam("onlinebeforesec", dr);
                AddToSiteParam("onlinebeforemin", dr);
                AddToSiteParam("onlinedatesec", dr);
                AddToSiteParam("onlinedatemin", dr);
                AddToSiteParam("blindbeforesec", dr);
                AddToSiteParam("blindbeforemin", dr);
                AddToSiteParam("blinddatesec", dr);
                AddToSiteParam("blinddatemin", dr);
                AddToSiteParam("favobeforesec", dr);
                AddToSiteParam("favobeforemin", dr);
                AddToSiteParam("favodatesec", dr);
                AddToSiteParam("favodatemin", dr);
                AddToSiteParam("onlineshowleavebtn", dr);
                AddToSiteParam("roomshowleavebtn", dr);
                AddToSiteParam("blindshowleavebtn", dr);
                AddToSiteParam("blindaddmunutetoroom", dr);
                AddToSiteParam("onlinecycle", dr);
                AddToSiteParam("idletime", dr);
                AddToSiteParam("twittercode", dr);
                AddToSiteParam("twittersecret", dr);
               
            }
        }    
    }

    
    public static void AddToSiteParam(string fieldname,MySqlDataReader dr)
    {
        if (!SiteParam.ContainsKey(fieldname))
        {
            SiteParam.Add(fieldname, dr[fieldname].ToString());
        }
    }
    public static string GetParam(string param)
    { 
        string returnValue="";
        if (SiteParam != null && SiteParam.ContainsKey(param))
        {
            returnValue = SiteParam[param];
        }
        else
        {
            SiteGeneralParam();
            if (SiteParam != null && SiteParam.ContainsKey(param))
            {
                returnValue = SiteParam[param];
            }
        }
        return returnValue;
    }
   
   
    public static string GetGeneralText(string myText)
    {
        if (SiteTextDictionary.ContainsKey(myText))
        {
            myText = SiteTextDictionary[myText];
        }
        else
        {
            myText = "";
        }
        return myText;
    }
    public static string GetGeneralText(string myText,string code,int pageid,int type)
    {
        using (MySqlConnection con = new MySqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString))
        {
            con.Open();
            string sql = "select * From generaltexts where genCode='"+code+"'";          
            MySqlCommand cmd = new MySqlCommand(sql,con);
            MySqlDataReader MyReader = cmd.ExecuteReader();
            if (MyReader.Read())
            {
                if (SiteTextDictionary.ContainsKey(myText))
                {
                    myText = SiteTextDictionary[myText];
                }
                else
                {
                    myText = "";
                }
            }
            else {
                MyReader.Close();
                cmd.CommandText = String.Format("Insert Into generaltexts (genName,genContent,genPage,genType,genCode) values ('{0}','{0}',{1},{2},'{3}')", myText,pageid,type,code);
                cmd.ExecuteNonQuery();
            }
            con.Close();
        }
        return myText;
    }
	public static string GetGeneralParameter(int GenParamID)
	{
		string returnString = "";       
		using (MySqlConnection con = new MySqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString))
        {
			con.Open();
			MySqlCommand cmd = new MySqlCommand();
			cmd.Connection = con;
			cmd.CommandText = "SELECT ParameterValue FROM genparameters WHERE ParameterID="+GenParamID.ToString();
			try
			{
				MySqlDataReader MyReader = cmd.ExecuteReader();
				if (MyReader.Read())
				{
					returnString = MyReader["ParameterValue"].ToString();
				}
				MyReader.Close();
			}
			catch { }
			con.Close();
		}
		return returnString;
	}
	public static string GetPlaceHolder(int PlaceHolderNumber)
	{
		string returnString = "";
        using (MySqlConnection con = new MySqlConnection(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString))
		{
			con.Open();
			MySqlCommand cmd = new MySqlCommand();
			cmd.Connection = con;
			cmd.CommandText = "SELECT PlaceHolderText FROM placeholders WHERE PlaceHolderNumber=" + PlaceHolderNumber.ToString();
			try
			{
				MySqlDataReader MyReader = cmd.ExecuteReader();
				if (MyReader.Read())
				{
					returnString = MyReader["PlaceHolderText"].ToString();
				}
				MyReader.Close();
			}
			catch { }
			con.Close();
        }
		return returnString;
	}
	public static string GetRandomPassword(int length)
	{
		// Get the GUID
		string guidResult = System.Guid.NewGuid().ToString();
		// Remove the hyphens
		guidResult = guidResult.Replace("-", string.Empty);
		// Make sure length is valid
		if (length <= 0 || length > guidResult.Length)
			throw new ArgumentException("Length must be between 1 and " + guidResult.Length);
		// Return the first length bytes
		return guidResult.Substring(0, length);
	}
    public static string  GetLink(string link)
    {
        int mylang = 0;
        if (HttpContext.Current!=null && HttpContext.Current.Request.QueryString["Lang"] != null && int.TryParse(HttpContext.Current.Request.QueryString["Lang"], out mylang))
        {
            if (link.IndexOf("?") > -1)
            {
                link = siteDefaults.SiteUrl + "/" + link.Replace("?","?lang=" + mylang+"&")  ;
            }
            else
            {
                link = siteDefaults.SiteUrl + "/" + link + "?lang=" + mylang;
            }
        }
        else
        {
            link = siteDefaults.SiteUrl + "/" + link;
        }
        return link;
    }
    
    public static PagedDataSource PageData(Literal NavigationNumbers, HyperLink cmdPrev, HyperLink cmdNext, DataView dv, string pagename, int LinesInPage, int pageNum)
    {
        PagedDataSource objPds = new PagedDataSource();
        //pageNum = 1;
        objPds.DataSource = dv;
        objPds.AllowPaging = true;
        if (LinesInPage <= 0)
        {
            LinesInPage = 2;
        }
        objPds.PageSize = LinesInPage;    

        if (pageNum <= 0)
            pageNum = 1;
        objPds.CurrentPageIndex = pageNum - 1;       
        for (int i = 0; i < pageNum; i++)
        {
            if (i > 0)
            {
                if (i == 1)
                {
                    NavigationNumbers.Text += "<a href=\"" + pagename + "\" class=\"navigate-number\">" + i + "</a>";
                    if (pagename.IndexOf("?") + 1 == pagename.Length)
                    {
                        NavigationNumbers.Text = NavigationNumbers.Text.Replace("?", "");
                    }
                }
                else
                    NavigationNumbers.Text += "<a href=\"" + pagename + "page=" + i + "\" class=\"navigate-number\">" + i + "</a>";
            }
        }
        if (objPds.PageCount != 1)
            NavigationNumbers.Text += "<div class=\"navigate-current\">" + pageNum + "</div>";
        //for (int i = pageNum + 1; i < pageNum + 4; i++)
        for (int i = pageNum + 1; i < dv.Count; i++)
        {
            if (i <= objPds.PageCount)
            {
                NavigationNumbers.Text += "<a href=\"" + pagename + "page=" + i + "\" class=\"navigate-number\">" + i + "</a>";
            }
        }
        // Disable Prev or Next buttons if necessary 
        if (objPds.IsFirstPage)
        {
            cmdPrev.Visible = false;
        }
        else
        {
            cmdPrev.Visible = true;
            if ((pageNum - 1) == 1)
                cmdPrev.NavigateUrl = "" + pagename;
            else
                cmdPrev.NavigateUrl = "" + pagename + "page=" + (pageNum - 1);
        }

        if (objPds.IsLastPage)
        {
            cmdNext.Visible = false;
        }
        else
        {
            cmdNext.Visible = true;
            cmdNext.NavigateUrl = "" + pagename + "page=" + (pageNum + 1);
        }
        return objPds;
    }
   
    /// <summary>
    ///  class of Page details name,link..
    /// </summary>
   public class pageDetails
    {
        private string pageName;
        private string pageLink;
        private string pageCSSClass;
        private int pageParent;
       /// <summary>
       /// you must enter page name,link and class
       /// </summary>
       /// <param name="pageName"></param>
       /// <param name="pageLink"></param>
       /// <param name="pageClass"></param>
        public pageDetails(string pageName, string pageLink, string pageCSSClass)
        {
            this.pageName = pageName;
            this.pageLink = pageLink;
            this.pageCSSClass = pageCSSClass;
        }
        public pageDetails(string pageName, string pageLink, int pageParent)
        {
            this.pageName = pageName;
            this.pageLink = pageLink;
            this.pageParent = pageParent;
        }
        /// <summary>
        ///  get/set the class parebt id
        /// </summary>
        public int ParentID
        {
            set { this.pageParent = value; }
            get { return this.pageParent; }

        }
       /// <summary>
       ///  get/set the class name of the breadcrumb
       /// </summary>
        public string PageCSSClass
        {
            set { this.pageCSSClass = value; }
            get { return this.pageCSSClass; }
        }
       /// <summary>
       ///  get/set the page name
       /// </summary>
        public string PageName
        {
            set { this.pageName = value; }
            get { return this.pageName; }
        }
       /// <summary>
       ///  get/set the page url
       /// </summary>
        public string PageLink
        {
            set { this.pageLink = value; }
            get { return this.pageLink; }
        }       
    }
   public class BreadCrumbs
   {
       private List<pageDetails> MyPages = new List<pageDetails>();
       /// <summary>
       ///  add class pageDetails
       /// </summary>
       /// <param name="MyPage"></param>
       public void AddPage(pageDetails MyPage)
       {
           MyPages.Add(MyPage);
       }
       /// <summary>
       ///  build class pageDetails and add it
       /// </summary>
       /// <param name="myname"></param>
       /// <param name="mylink"></param>
       /// <param name="myclass"></param>
       public void AddPage(string myname,string mylink,string myclass)
       {
           pageDetails MyPage = new pageDetails(myname, mylink, myclass);
           AddPage(MyPage);          
       }
       /// <summary>
       ///  get Breadcrumbs string (html code)
       /// </summary>
       /// <returns></returns>
       public string GetBreadString()
       {
           string mybread = "";
           for (int i = 0; i < MyPages.Count; i++)
           {
               if (i == MyPages.Count - 1)
               {
                   mybread += "<span class=\"lastbreadcrumb\" >" + MyPages[i].PageName + " </span>";
               }
               else
               {
                   mybread += "<a href=\"" + SiteUrl + MyPages[i].PageLink + "\" class=\"" + MyPages[i].PageCSSClass + "\" >" + MyPages[i].PageName + " </a>";               
               }
           }
           return mybread;       
       }  
   }
 
   /// <summary>
   /// Recursive FindControl method, to search a control and all child
   /// controls for a control with the specified ID.
   /// </summary>
   /// <returns>Control if found or null</returns>
   public static Control FindControlRecursive(Control root, string id)
   {
       if (id == string.Empty)
           return null;
       if (root.ID == id)
           return root;
       foreach (Control c in root.Controls)
       {
           Control t = FindControlRecursive(c, id);
           if (t != null)
           {
               return t;
           }
       }
       return null;
   }
    
   
 

    
 
}