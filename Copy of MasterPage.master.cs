using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Web.UI.MobileControls;


public partial class MasterPage : System.Web.UI.MasterPage
{

    public string pageheader = "";
    public string pagecontent = "";
    public string pagelink = "";
    public string pageName = "";
    public string pageParentName = "";
    public string pageParentLink = "";
    public string pagetitle = "";
    public string pagekeywords = "";
    public string pageSEODesc = "";
    public int pageid = 0;
    public int pageparent = 0;
    public string memberImage = "";
    public string imagex = "";
    public string imagey = "";
    protected int memberid = 0;
    public bool IsSitePage = false;
    public bool IsLobby = false;
    public bool hideOnLineChat = true;
    public bool IsOnLine = true;
    Random rand = new Random();
    string culture = "";
    int lang=1;
    spinmember myspin = new spinmember();
    Dictionary<int, methods.smilly> MySmilly = methods.GetSmillyList();
    siteDefaults.BreadCrumbs bread = new siteDefaults.BreadCrumbs();
    public string Culture
    {
        set { this.culture = value; }
        get { return this.culture; }
    }
    public int MemberID
    {
        set { this.memberid=value; }
        get { return this.memberid; }
    }
    public string MemberImage
    {

        get { return this.memberImage; }
    }
    string direction = "";
    public int MyLangauge
    {
        get { return lang; }
    }
    public string Direction
    {
        get { return this.direction; }
    }
    public string GoogleClientId = "182289962199.apps.googleusercontent.com";
    public string GoogleSecret = "AskDXyBD5SKEjkVZuOXlNVNb";

    protected void Page_Init(object sender, EventArgs e)
    {
        if (siteDefaults.SiteUrl == "")
        {
           // siteDefaults.SiteGeneralDefaults();
        }
        if (Session["memberid"] != null && int.TryParse(Session["memberid"].ToString(), out memberid) && methods.MemberList.ContainsKey(memberid))
        {

        }
        else
        {

            if (Session["memberid"] != null && int.TryParse(Session["memberid"].ToString(), out memberid) && !methods.MemberList.ContainsKey(memberid))
            {
                methods.AddMember(memberid);
                // methods.CreateRooms(memberid);
            }
            else
            {
                if (Request.Cookies["spindate"] != null)
                {
                    bool HasCookie = false;
                    HttpCookie rememberCookie = Request.Cookies["spindate"];
                    string MyID = rememberCookie.Values["ID"];
                    string Email = rememberCookie.Values["user"];
                    if (!string.IsNullOrEmpty(MyID) && !string.IsNullOrEmpty(Email))
                    {
                        using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
                        {
                            string sql = String.Format("Select count(*) From tblusers where userid={0} AND useremail='{1}'", MyID, Email);
                            MySqlCommand cmd = new MySqlCommand(sql, conn);
                            conn.Open();
                            if (cmd.ExecuteScalar() != null)
                            {
                                HasCookie = true;
                            }
                            conn.Close();
                        }
                        Session["memberid"] = rememberCookie.Values["ID"];
                        memberid = int.Parse(rememberCookie.Values["ID"]);
                    }
                    if (!methods.AddMember(memberid))
                    {
                        HttpContext.Current.Session.Abandon();
                        if (HttpContext.Current.Request.Cookies["spindate"] != null)
                        {
                            HttpCookie myCookie = new HttpCookie("spindate");
                            myCookie.Expires = DateTime.Now.AddDays(-1d);
                            HttpContext.Current.Response.Cookies.Add(myCookie);
                        }
                        Response.Redirect(siteDefaults.GetLink("./"));
                    }
                }
            }
        }
        Session["mylang"] = "1";
        if (Request.QueryString["Lang"] != null && int.TryParse(Request.QueryString["Lang"], out lang))
        {
            Session["mylang"] = lang.ToString();
            using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
            {
                string sql = "Select LandDir,LangCulture From languages where LangID=" + lang;
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                conn.Open();
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    direction = dr["LandDir"].ToString();
                    Session["dir"] = direction;
                    culture = dr["LangCulture"].ToString();
                }
            }
        }
        else
        {
            direction = "ltr";
            Session["dir"] = direction;
        }
        mystyle.Href = "Style/"+direction+".css";
        LogoImage.Alt = Languages.MyText("Alt Logo_Master");

        sitelogo.HRef = siteDefaults.GetLink("./");
        sitelogo.Title = Languages.MyText("Spindate_Master");
        if (memberid > 0 && methods.MemberList.ContainsKey(memberid))
        {

            myspin = methods.GetMe(memberid);
            myspin.GetAlertFrom = "";
            if (myspin.OnlineChat.Contains("menu"))
            {
                mychatonlineholderid.Style["overflow"] = "auto";  
                mychatonlineholderid.Style["top"] = "100%";
                MyChatSearchBox.CssClass = "mychatsearchtextbox searchboxnone";
                onlineoffline.Style["margin-top"] = "33px";
                 onlineoffline.Style["background"] = "url('Images/SiteImages/closechatbg.png') no-repeat left  bottom";
                
               
            }
            soundstate.Text = string.Format("<input id=\"soundid\" type=\"hidden\" value=\"{0}\" />", myspin.Sound);
           // addmemberforDebug(16);
        }
        homebutton.HRef = siteDefaults.GetLink("online.aspx");
        homebutton.InnerText = Languages.MyText("Lobby_Master");
        topmenuPanel.Attributes["title"] = Languages.MyText("Go To Lobby_Master");
        profilebutton.HRef = siteDefaults.GetLink("profile.aspx");
        profilebutton.InnerText = Languages.MyText("Profile_Master");
        profilebutton.Attributes["title"] = Languages.MyText("Go To Profile_Master");
        favoritebutton.HRef = siteDefaults.GetLink("Favourites.aspx");
        favoritebutton.InnerText = Languages.MyText("Favourites_Master");
        favoritebutton.Attributes["title"] = Languages.MyText("Go To Favourites_Master");
    }
    protected void Page_Load(object sender, EventArgs e)
    {       
       
        if (!IsSitePage)
        {
            if (!methods.CheckUserCradential())
            {
                Response.Redirect(siteDefaults.SiteUrl);
            }
            else
            {
                //int.TryParse(Session["memberid"].ToString(), out memberid);
                if (!methods.MemberList.ContainsKey(memberid))
                {
                    methods.AddMember(memberid);
                }
                if (!methods.MemberList[memberid].IsPassFirstStage)
                {                    
                    if (IsLobby)
                    {
                        string _js = " openMyprofile('" +siteDefaults.GetLink("registermsg.aspx?status=2")+"', '480', '470');";
                        Page.ClientScript.RegisterStartupScript(GetType(), "WaitForConfirm", _js, true);
                    }
                    else
                    {
                        Response.Redirect(siteDefaults.GetLink("online.aspx"));
                    }
                }
            }
            SystemBottomLiteral.Text = Languages.MyText("Bottom Code System_general");
            HeadContentSite.Text = Languages.MyText("Header Code System_general");
          
        }
        else
        {
            SiteBottomLiteral.Text = Languages.MyText("Bottom Code Site_general");  
            HeadContentSite.Text = Languages.MyText("Header Code Site_general_3");
          
        }
      
        if (!IsPostBack)
        {
            mainIframHolder.Style["height"] = "0px";
        }
        else
        {
            mainIframHolder.Style["height"] = "0px";
        }
        if (memberid > 0)
        {
          

            if (methods.MemberList.ContainsKey(memberid))
            {
               
                myspin = methods.GetMe();

                // yossi 
                //if (IsPostBack)
                //{
                //    myspin.IsAvailable = true;
                //}
                Myprofimg.Src = methods.SetImage(myspin.Image2.Replace("_size0", "_size1").Replace("../", ""), (myspin.Gender.ToString()));
                Myprofimg.Attributes["onload"] = "setimgposnew(this," + myspin.ImageX + "," + myspin.ImageY + ");";
                Myprofimg.Alt = myspin.FirstName + "(" + myspin.Age + ")";
                Myprofimg.Attributes["title"] = myspin.FirstName + "(" + myspin.Age + ")";

                buble1Topdiv.Visible = false;
                buble2Topdiv.Visible = false;
                buble3Topdiv.Visible = false;
                buble4Topdiv.Visible = false;
                IsOnLine = myspin.IsOnline;

                string a = myspin.OnlineChat;
                if (!IsOnLine)
                {
                    Page.ClientScript.RegisterStartupScript(GetType(), "setlogout", "window.onload= setchaton2($('.mychatoffbtn'));", true);
                }
                using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
                {
                    conn.Open();
                    string sql = "";
                    MySqlCommand cmd;
                    MySqlDataReader dr;
                    #region set account type
                    switch (myspin.AccountStatus)
                    {
                        case 3:
                        case 0:
                            // member in try time
                            if (siteDefaults.GetParam("hasDateFroDay").ToString().ToLower() == "true")
                            {
                                buble4Topdiv.Visible = true;
                                int date = 0;
                                DateTime datepablish = DateTime.Now;
                                bool setToDefault = false;
                                if (myspin.DateOnDayDate.ToString("ddMMyyyy") != DateTime.Now.ToString("ddMMyyyy"))
                                {

                                    sql = String.Format("Select userdateonday,userdateondaydate From tblusers where userid={0}", memberid);
                                    cmd = new MySqlCommand(sql, conn);
                                    dr = cmd.ExecuteReader();
                                    if (dr.Read())
                                    {
                                        if (DateTime.TryParse(dr["userdateondaydate"].ToString(), out datepablish) && datepablish.ToString("ddMMyyyy") == DateTime.Now.ToString("ddMMyyyy"))
                                        {
                                            int.TryParse(dr["userdateonday"].ToString(), out date);
                                            myspin.DateOnDay = date;
                                            myspin.DateOnDayDate = DateTime.Now;

                                        }
                                        else
                                        {
                                            setToDefault = true;
                                        }
                                    }
                                    dr.Close();
                                    if (setToDefault)
                                    {
                                        cmd.CommandText = String.Format("Update tblusers Set userdateonday={0} ,userdateondaydate=now() where   userid={1}", siteDefaults.SiteParam["DateaDay"], memberid);
                                        cmd.ExecuteNonQuery();
                                        int.TryParse(siteDefaults.SiteParam["DateaDay"], out date);
                                        myspin.DateOnDay = date;
                                        myspin.DateOnDayDate = DateTime.Now;
                                    }
                                }
                                else
                                {
                                    date = myspin.DateOnDay;
                                }
                                GuestSpinner2.InnerHtml = Languages.MyText("Guest spinner2_master_3").Replace("[[dates]]", date.ToString());

                            }
                            else
                            {
                                buble1Topdiv.Visible = true;
                            }
                            break;
                        case 1:
                            // member with coupon
                            if (myspin.SubscirbDate.Date > DateTime.Now.Date)
                            {
                                if (myspin.CouponType)
                                {
                                    buble4Topdiv.Visible = true;
                                    int date = 0;
                                    DateTime datepablish = DateTime.Now;
                                    bool setToDefault = false;
                                    if (myspin.DateOnDayDate.ToString("ddMMyyyy") != DateTime.Now.ToString("ddMMyyyy"))
                                    {

                                        sql = String.Format("Select userdateonday,userdateondaydate,cuopondateaday From tblusers left join tblcuopons ON tblcuopons.couponcode=tblusers.usercoupon  where userid={0}", memberid);
                                        cmd = new MySqlCommand(sql, conn);
                                        dr = cmd.ExecuteReader();
                                        if (dr.Read())
                                        {
                                            int.TryParse(dr["cuopondateaday"].ToString(), out date);
                                            if (DateTime.TryParse(dr["userdateondaydate"].ToString(), out datepablish) && datepablish.ToString("ddMMyyyy") == DateTime.Now.ToString("ddMMyyyy"))
                                            {
                                                int.TryParse(dr["userdateonday"].ToString(), out date);
                                                myspin.DateOnDay = date;
                                                myspin.DateOnDayDate = DateTime.Now;

                                            }
                                            else
                                            {
                                                setToDefault = true;
                                            }
                                        }
                                        dr.Close();
                                        if (setToDefault)
                                        {
                                            cmd.CommandText = String.Format("Update tblusers Set userdateonday=(select cuopondateaday from tblcuopons where couponcode='{0}') ,userdateondaydate=now() where   userid={1}", myspin.Coupon, memberid);
                                            cmd.ExecuteNonQuery();
                                            //int.TryParse(siteDefaults.SiteParam["DateaDay"], out date);
                                            myspin.DateOnDay = date;
                                            myspin.DateOnDayDate = DateTime.Now;

                                        }

                                    }
                                    else
                                    {
                                        date = myspin.DateOnDay;
                                    }
                                    GuestSpinner2.InnerHtml = Languages.MyText("Guest spinner2_master_3").Replace("[[dates]]", date.ToString());
                                }
                                else
                                {
                                    int mydays = (myspin.SubscirbDate - DateTime.Now).Days;
                                    coupondaydiv.InnerHtml = Languages.MyText("Your invitation will expire in 7 days._master_3").Replace("[[days]]", mydays.ToString()); ;
                                    buble3Topdiv.Visible = true;

                                }

                            }
                            else
                            {

                                sql = String.Format("Update tblusers Set userAccount=3 Where userid={0}", memberid);
                                cmd = new MySqlCommand(sql, conn);

                                cmd.ExecuteNonQuery();


                                Response.Redirect(siteDefaults.GetLink("./"));
                            }
                            break;
                        case 2:
                            // member subscribe
                            if (myspin.SubscirbDate.Date > DateTime.Now.Date)
                            {
                                int mydays = (myspin.SubscirbDate - DateTime.Now).Days;
                                buble2Topdiv.Visible = true;
                                freeacountdate.InnerHtml = Languages.MyText("premium user_master_3").Replace("[[days]]", mydays.ToString());
                            }
                            else
                            {
                                sql = String.Format("Update tblusers Set userAccount=3 Where userid={0}", memberid);
                                cmd = new MySqlCommand(sql, conn);
                               // conn.Open();
                                cmd.ExecuteNonQuery();

                                myspin.AccountStatus = 3;
                                Response.Redirect(siteDefaults.GetLink("./"));
                            }
                            break;

                        case 4:
                            // member frozen
                            //  buble1Topdiv.Visible = true;
                            //  freeacountdate.InnerHtml = Languages.MyText("premium user_master_3");
                            if (!IsSitePage)
                            {
                                LogOut(memberid, "frozen.aspx");
                            }
                            break;
                        case 5:
                            // member blocked
                            if (!IsSitePage)
                            {
                                LogOut(memberid, "./");
                            }
                            break;
                    }
                    #endregion
                    sql = String.Format("Select count(alertid) as alertcount From `" + siteDefaults.schemaalert + "`. `tblalert{0}` where memberid={0} and isread=false and alerttype<10 ", memberid);
                    cmd = new MySqlCommand(sql, conn);
                    dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        if (dr["alertcount"].ToString() == "0")
                        {
                            AlertbLabel.Visible = false;
                            leftmenubellclassid.Attributes["class"] = "leftmenubellclass";
                        }
                        else
                        {
                            AlertbLabel.Text = dr["alertcount"].ToString();
                            AlertbLabel.CssClass = "alertbubleclass alerticonholder2";
                            leftmenubellclassid.Attributes["class"] = "leftmenubellclass leftmenubellclassSel";

                        }
                    }
                    dr.Close();


                    inboxbutton.HRef = siteDefaults.GetLink("inbox.aspx");
                    cmd.CommandText = String.Format("Select  memberid as inboxcount From ( Select memberid From `" + siteDefaults.schemainbox + "`. `inboxmessages{0}` where memberid={0} and isRead=false and isDeleted=false Group by mymemberid ) as Myinbox ;", memberid);

                    dr = cmd.ExecuteReader();
                    int inboxcount = 0;
                    InboxSenderHiddenField.Value = "";
                    InboxbLabel.Style["display"] = "none";
                    while (dr.Read())
                    {
                        inboxcount++;
                        InboxSenderHiddenField.Value += "_" + dr["inboxcount"].ToString() + "_";
                        InboxbLabel.Text = inboxcount.ToString();
                        inboxbutton.Attributes["class"] = "leftmenuletterclass leftmenuletterclassred";
                        InboxbLabel.Style["display"] = "block";
                    }
                    dr.Close();

                    #region Top Line Content

                    string code = "";
                    string datacode = "";
                    sql = String.Format("Select topMessgaeSystem,msgkeysystem From toplinemsg where toplang={0} ", lang);
                    cmd = new MySqlCommand(sql, conn);
                    dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        datacode = dr["msgkeysystem"].ToString();
                        MyCodeLiteral.Text = string.Format("<input type=\"hidden\" id=\"topcodehidden\" value=\"{0}\" /> ", datacode);
                        TopeLineData.InnerHtml = dr["topMessgaeSystem"].ToString();
                    }
                    dr.Close();
                    if (Request.Cookies["spindatecode2"] != null)
                    {
                        HttpCookie rememberCookie = Request.Cookies["spindatecode2"];
                        code = rememberCookie.Values["code"];
                    }
                    if (code != "" && code == datacode)
                    {
                        MyToopLine.Visible = false;
                    }
                    #endregion

                    conn.Close();
                }
            }
            memberImage = methods.SetImage(methods.MemberList[memberid].Image2.Replace("../", "").Replace("_size0", "_size1"), methods.MemberList[memberid].Gender.ToString());
            imagex = methods.MemberList[memberid].ImageX.ToString();
            imagey = methods.MemberList[memberid].ImageY.ToString();
            #region set smilly icons
            SmillyLiteral.Text = "";
            for (int i = 1; i < MySmilly.Count; i++)
            {
                if (MySmilly.ContainsKey(i))
                {
                    SmillyLiteral.Text += "<img onclick=\"insertsmile('" + Server.HtmlEncode(MySmilly[i].SmillyCode) + "','mynumber','" + Mychattextboxmynumber.ClientID + "');\" class=\"smillyclass\" alt\"\" src=\"" + MySmilly[i].SmillyPath + "\" />";
                }
            }
            #endregion

            OnlineChatPAnel.Visible = true;
            ChatScriptPanel.Visible = true;
            if (Session["dir"].ToString() == "rtl")
            {
                OnlineJSRTLPanel.Visible = true;
                OnlineJSLTRPanel.Visible = false;
            }
        }
        else
        {
            using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
            {
                conn.Open();
                string code =""; 
                string datacode ="";
                string sql = String.Format( "Select topMessgaeSite,msgkeysite From toplinemsg where toplang={0} ",lang);              
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    datacode = dr["msgkeysite"].ToString();
                    MyCodeLiteral.Text = string.Format("<input type=\"hidden\" id=\"topcodehidden\" value=\"{0}\" /> ", datacode);
                    TopeLineData.InnerHtml = dr["topMessgaeSite"].ToString();
                }
                dr.Close();
                if (Request.Cookies["spindatecode"] != null)
                {
                    HttpCookie rememberCookie = Request.Cookies["spindatecode"];
                    code = rememberCookie.Values["code"];
                }
                if (code != "" && code == datacode)
                {
                    MyToopLine.Visible = false;
                }
            }
        
        }
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        //myspin.OnlineChat = "";
        //myspin.OnlineChatSide = "";
        if (MemberID!=0)
        {
            testdiv.InnerText = myspin.OnlineChat + " #  " + myspin.OnlineChatSide;
            if ( myspin.MemberID>0 && myspin.Code == "")
            {
                string newCode = Guid.NewGuid().ToString();
                myspin.Code = newCode;
                Session["code"] = newCode;
                if (Request.Cookies["spindate"] != null)
                {
                    HttpCookie myCookie = Request.Cookies["spindate"];
                    myCookie.Values["code"] = newCode;
                    Response.AppendCookie(myCookie);
                }
               
            }
            else
            {
               
            }
            // update page code
            //if (!IsPostBack)
            //{
            //    Guid myCode = Guid.NewGuid();
            //    myspin.Code = myCode.ToString();
            //    PageCodeLiteral.Text = String.Format("<input id=\"pagecodehidden\" type=\"hidden\" value=\"{0}\" />", myspin.Code);
            //}
        }    
    }
    protected void addmemberforDebug(int number)
    {
       // methods.MemberList.Clear();
        using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
        {
            conn.Open();
            String sql = String.Format("Select * From tblusers where userid<>{0} AND  userid<>64 ",memberid);
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            MySqlDataReader dr = cmd.ExecuteReader();
         
            for (int i = 0; i < number; i++)
            {
                if (dr.Read())
                {
                    int myid = int.Parse( dr["userid"].ToString());
                    if (!methods.MemberList.ContainsKey(myid))
                    {
                        methods.AddMember(myid);
                        methods.MemberList[myid].IsOnline = true;

                    }
                    else
                    {

                      //  methods.MemberList[myid].IsOnline = true;
                    }
                
                }
                
            }
        }

    }

    protected void CreateChat(object sender, CommandEventArgs e)
    {

        
        string _JS = "";
        int memberid = 0;
        string mynumber = ((HiddenField)((LinkButton)sender).Parent.FindControl("MyHidden")).Value;
        mynumber = mynumber.Remove(mynumber.IndexOf(','));
        int.TryParse(mynumber, out memberid);
        try
        {
            _JS = waiting.CreateChat(memberid, true, rand, 4);
            Page.ClientScript.RegisterStartupScript(GetType(), "chat", _JS, true);
        }
        catch
        {

        }

    }
    protected void LogOut(int memberid,string link)
    {
        methods.MemberList.Remove(memberid);
        Session.Abandon();
        if (HttpContext.Current.Request.Cookies["spindate"] != null)
        {
            HttpCookie myCookie = new HttpCookie("spindate");
            myCookie.Expires = DateTime.Now.AddDays(-1d);
            Response.Cookies.Add(myCookie);
        }
        Response.Redirect(siteDefaults.GetLink(link));
    }
   
   
}