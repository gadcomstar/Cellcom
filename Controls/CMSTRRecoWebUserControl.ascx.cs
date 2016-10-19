using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class CMSTRRECOWebUserControl : System.Web.UI.UserControl
{

    #region Properties


    protected bool showNumbers = false;
    protected int linesInPage = 4;
    protected PagedDataSource objPds = new PagedDataSource();
    private string leftButtonText = "";
    private string rightButtonText = "";
    private DataView dv;
    private string cssClass = "FieldHolderClass";
    private string fieldID = "FaqID";
    private string fieldQuestion = "FaqQuestion";
    private string fieldShortText = "FaqShortDesc";
    private string fieldAnswer = "FaqAnswer";
    private string fieldImage = "";
    private string fieldMovie = "";
    private string defaultImage = "";
    private string textOpen = "פתח";
    private string textClose = "סגור";
    private bool hasPic = false;
    private string textEnlageImage;


    private string fieldEnlageImage = "";
    public string TextEnlageImage
    {
        set { this.textEnlageImage = value; }
        get { return this.textEnlageImage; }
    }
    public string FieldEnlageImage
    {
        set { this.fieldEnlageImage = value; }
        get { return this.fieldEnlageImage; }
    }

    public String DefaultImage
    {
        set { this.defaultImage = value; }
        get { return this.defaultImage; }
    }

    public String FieldImage
    {
        set { this.fieldImage = value; }
        get { return this.fieldImage; }
    }
    public String FieldMovie
    {
        set { this.fieldMovie = value; }
        get { return this.fieldMovie; }
    }

    public bool HasPic
    {
        set { this.hasPic = value; }
        get { return this.hasPic; }
    }
    public String DataSouceID
    {
        set { FaqRepeater.DataSourceID = value; }
        get { return FaqRepeater.DataSourceID; }
    }

    public String LeftButtonText
    {
        set { this.leftButtonText = value; }
        get { return this.leftButtonText; }
    }
    public String RightButtonText
    {
        set { this.rightButtonText = value; }
        get { return this.rightButtonText; }
    }
    public bool ShowNumbers
    {
        set { this.showNumbers = value; }
        get { return this.showNumbers; }
    }
    public int LinesInPage
    {
        set { this.linesInPage = value; }
        get { return this.linesInPage; }
    }

    public String TextOpen
    {
        set { this.textOpen = value; }
        get { return this.textOpen; }
    }
    public String TextClose
    {
        set { this.textClose = value; }
        get { return this.textClose; }
    }
    public String FieldID
    {
        set { this.fieldID = value; }
        get { return this.fieldID; }
    }

    public String FieldShortText
    {
        set { this.fieldShortText = value; }
        get { return this.fieldShortText; }
    }

    public String FieldQuestion
    {
        set { this.fieldQuestion = value; }
        get { return this.fieldQuestion; }
    }

    public String FieldAnswer
    {
        set { this.fieldAnswer = value; }
        get { return this.fieldAnswer; }
    }

    public String CssClass
    {
        set { this.cssClass = value; }
        get { return this.cssClass; }
    }

    public DataView DataViewFaq
    {
        set { this.dv = value; }
        get { return this.dv; }

    }

    #endregion

    protected void Page_PreRender(object sender, EventArgs e)
    {

        FaqHolderDiv.Attributes["class"] = this.cssClass;


        if (DataSouceID == "")
        {
            NumberMenu.Visible = ShowNumbers;
            string pagename = Request.Url.ToString() + "&";

            if (Request.QueryString.Count == 0)
            {
                pagename = Request.Url.ToString() + "?";

            }

            if (Request.QueryString["page"] != null)
            {

                pagename = Request.Url.ToString().Replace("page=" + Request.QueryString["page"], "") + "&";
            }
            int pageNum = 1;
            if (!string.IsNullOrEmpty(Request.QueryString["page"]))
            {
                int.TryParse(Request.QueryString["page"], out pageNum);
                PagedDataSource objPds1 = new PagedDataSource();
                objPds1.DataSource = dv;
                objPds1.AllowPaging = true;
                objPds1.PageSize = this.linesInPage;

                if (objPds1.PageCount < pageNum)
                {
                    Response.Redirect(Request.Url.ToString().Replace("&page=" + pageNum, "").Replace("?page=" + pageNum, ""));
                }
            }
            FaqRepeater.DataSource = PageData(NavigationNumbers5, cmdPrev5, cmdNext5, dv, pagename, this.linesInPage, pageNum);
            FaqRepeater.DataBind();
        }
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
        //putting page numbers
        for (int i = pageNum - 3; i < pageNum; i++)
        //for (int i = 0; i < pageNum; i++)
        //for (int i = 0; i < pageNum; i++)
        {
            if (i > 0)
            {
                if (i == 1)
                {
                    NavigationNumbers.Text += "<a href=\"" + pagename + "\" class=\"navigate-number\">" + i + "</a>";


                    if (pagename.IndexOf("?&") > 0)
                    {
                        NavigationNumbers.Text = NavigationNumbers.Text.Replace("?&", "");
                    }

                    if (pagename.IndexOf("?") + 1 == pagename.Length)
                    {
                        NavigationNumbers.Text = NavigationNumbers.Text.Replace("?", "");
                    }
                    if (pagename.IndexOf("&") + 1 == pagename.Length)
                    {
                        NavigationNumbers.Text = NavigationNumbers.Text.Replace("&", "");
                    }

                }
                else
                    NavigationNumbers.Text += "<a href=\"" + pagename + "page=" + i + "\" class=\"navigate-number\">" + i + "</a>";
            }
        }
        if (objPds.PageCount != 1)
            NavigationNumbers.Text += "<div class=\"navigate-current\">" + pageNum + "</div>";
        for (int i = pageNum + 1; i < pageNum + 4; i++)
        //for (int i = pageNum + 1; i < dv.Count; i++)
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
            {
                cmdPrev.NavigateUrl = pagename;
                if (pagename.IndexOf("?&") > 0)
                {
                    cmdPrev.NavigateUrl = pagename.Replace("?&", "");
                }
                else
                {

                    if (pagename.IndexOf("?") + 1 == pagename.Length)
                    {
                        cmdPrev.NavigateUrl = pagename.Remove(pagename.Length - 2);
                    }
                    if (pagename.IndexOf("&") + 1 == pagename.Length)
                    {
                        cmdPrev.NavigateUrl = pagename.Remove(pagename.Length - 1);
                    }
                }

            }

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


}