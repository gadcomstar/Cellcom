using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Controls_CMSTRFAQWebUserControl : System.Web.UI.UserControl
{

    #region Properties

    private int myid = 0;
    protected bool showNumbers = false;
    protected int linesInPage = 4;
    protected PagedDataSource objPds = new PagedDataSource();
    private string leftButtonText = "";
    private string rightButtonText = "";
    private DataView dv;
    private string cssClass = "ArticleHolderClass";
    private string fieldID = "ArticleID";
    private string fieldName = "ArticleName";
    private string fieldTitle = "ArticleTitle";
    private string fieldImage = "ArticleImage";
    private string fieldSEODesc = "ArticleSEODesc";
    private string fieldHeader = "ArticleHeader";
    private string fieldShortContent = "ArticleShortDesc";
    private string fieldSubtitle = "ArticleSubtitle";
    private string fieldContent = "ArticleContent";
    private string fieldHideImage = "HideImage";
    private string fieldShow = "ShowArticle";
    private string fieldDate = "ArticlePublish";
    private string fieldKeyWord = "ArticleKeyWord";
    private string dateFormat = "dd.MM.yyyy";
    private bool showImage = true;
    private bool showName = true;
    private bool showSubTitle = true;
    private bool showDate = true;
    private bool showShortContent = true;
    private bool showImageSelected = true;
    private bool showNameSelected = true;
    private bool showSubTitleSelected = true;
    private bool showDateSelected = true;
    private bool showContentSelected = true;
    private string goBackLinkText;
    private string defaultImage = "";

    private string linkText;

    private string pageURL = System.Web.HttpContext.Current.Request.Url.ToString();

    public String DefaultImage
    {
        set { this.defaultImage = value; }
        get { return this.defaultImage; }
    }
    public String PageURL
    {
        set { this.pageURL = value; }
        get { return this.pageURL; }
    }


    public String GoBackLinkText
    {
        set { this.goBackLinkText = value; }
        get { return this.goBackLinkText; }
    }
    public String LinkText
    {
        set { this.linkText = value; }
        get { return this.linkText; }
    }

    public bool ShowName
    {
        set { this.showName = value; }
        get { return this.showName; }
    }
    public bool ShowSubTitle
    {
        set { this.showSubTitle = value; }
        get { return this.showSubTitle; }
    }
    public bool ShowDate
    {
        set { this.showDate = value; }
        get { return this.showDate; }
    }
    public bool ShowShortContent
    {
        set { this.showShortContent = value; }
        get { return this.showShortContent; }
    }

    public bool ShowImageSelected
    {
        set { this.showImageSelected = value; }
        get { return this.showImageSelected; }
    }
    public bool ShowNameSelected
    {
        set { this.showNameSelected = value; }
        get { return this.showNameSelected; }
    }
    public bool ShowSubTitleSelected
    {
        set { this.showSubTitleSelected = value; }
        get { return this.showSubTitleSelected; }
    }
    public bool ShowDateSelected
    {
        set { this.showDateSelected = value; }
        get { return this.showDateSelected; }
    }
    public bool ShowContentSelected
    {
        set { this.showContentSelected = value; }
        get { return this.showContentSelected; }
    }



    public String DateFormat
    {
        set { this.dateFormat = value; }
        get { return this.dateFormat; }
    }

    public String DataSouceID
    {
        set { ArticleRepeater.DataSourceID = value; }
        get { return ArticleRepeater.DataSourceID; }
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


    public String FieldID
    {
        set { this.fieldID = value; }
        get { return this.fieldID; }
    }
    public String FieldName
    {
        set { this.fieldName = value; }
        get { return this.fieldName; }
    }

    public String FieldTitle
    {
        set { this.fieldTitle = value; }
        get { return this.fieldTitle; }
    }
    public String FieldImage
    {
        set { this.fieldImage = value; }
        get { return this.fieldImage; }
    }
    public String FieldSEODesc
    {
        set { this.fieldSEODesc = value; }
        get { return this.fieldSEODesc; }
    }

    public String FieldHeader
    {
        set { this.fieldHeader = value; }
        get { return this.fieldHeader; }
    }
    public String FieldShortContent
    {
        set { this.fieldShortContent = value; }
        get { return this.fieldShortContent; }
    }
    public String FieldSubtitle
    {
        set { this.fieldSubtitle = value; }
        get { return this.fieldSubtitle; }
    }

    public String FieldContent
    {
        set { this.fieldContent = value; }
        get { return this.fieldContent; }
    }
    public String FieldHideImage
    {
        set { this.fieldHideImage = value; }
        get { return this.fieldHideImage; }
    }
    public String FieldShow
    {
        set { this.fieldShow = value; }
        get { return this.fieldShow; }
    }
    public String FieldDate
    {
        set { this.fieldDate = value; }
        get { return this.fieldDate; }
    }
    public String FieldKeyWord
    {
        set { this.fieldKeyWord = value; }
        get { return this.fieldKeyWord; }
    }

    public String CssClass
    {
        set { this.cssClass = value; }
        get { return this.cssClass; }
    }

    public DataView DataViewTable
    {
        set { this.dv = value; }
        get { return this.dv; }

    }

    #endregion


    protected void Page_Init(object sender, EventArgs e)
    {

        if (!String.IsNullOrEmpty(Request.QueryString["article"]) && int.TryParse(Request.QueryString["article"], out myid))
        {

            ArticleHolderPanel.Visible = true;
            ArticleListHolderPanel.Visible = false;

        }

    }

    protected void Page_PreRender(object sender, EventArgs e)
    {

        ArticleHolderDiv.Attributes["class"] = this.cssClass;

        if (DataSouceID == "")
        {
            if (myid == 0)
            {
                NumberMenu.Visible = ShowNumbers;
                //string pagename = Request.Url.ToString() + "&";

                //if (Request.QueryString.Count == 0)
                //{
                //    pagename = Request.Url.ToString() + "?";
                //}
                //if (Request.QueryString["page"] != null)
                //{
                //    pagename = Request.Url.ToString().Replace("page=" + Request.QueryString["page"], "") + "&";
                //}
                string pagename = Request.Url.ToString();// +"&";

                if (Request.QueryString.Count == 0)
                {
                    pagename = Request.Url.ToString() + "?";
                }
                else
                {
                    pagename = Request.Url.ToString() + "&";
                }
                if (Request.QueryString["page"] != null)
                {
                    pagename = Request.Url.ToString().Replace("page=" + Request.QueryString["page"], "");// +"&";
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
                if (showNumbers)
                {
                    ArticleRepeater.DataSource = PageData(NavigationNumbers5, cmdPrev5, cmdNext5, dv, pagename, this.linesInPage, pageNum);
                    ArticleRepeater.DataBind();
                }
                else
                {
                    ArticleRepeater.DataSource = dv;
                    ArticleRepeater.DataBind();
                }
            }
            else
            {
                dv.RowFilter = this.fieldID + "=" + myid;
                ArticleNameDiv.InnerHtml = dv[0][fieldName].ToString();
                ArticleSubTitleDiv.InnerHtml = dv[0][fieldSubtitle].ToString();
                ArticleDateDiv.InnerHtml = ((DateTime)dv[0][fieldDate]).ToString(dateFormat);
                ArticleContentDiv.InnerHtml = dv[0][fieldContent].ToString();
                ArticleNameDiv.Visible = showNameSelected;
                ArticleSubTitleDiv.Visible = showSubTitleSelected;
                ArticleDateDiv.Visible = showDateSelected;
                ArticleContentDiv.Visible = showContentSelected;
                articleimage.Src = dv[0][fieldImage].ToString();
                articleimage.Alt = dv[0][fieldName].ToString();
                SelectedArticleImageHolder.Visible = showImageSelected;
            }
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