using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Collections;
using System.Drawing;
using System.Data.OleDb;
using System.Data;
using System.ComponentModel;
using System.IO;
using EeekSoft.Web.Controls;
using System.Text;

public partial class tableControl : System.Web.UI.UserControl
{
    #region events
    public event GridViewRowEventHandler TableRowCreated;
    public event EventHandler TablePreRender;
    public event EventHandler TableDataBinding;
    public event EventHandler UpdatePanelPreRender;
    public event EventHandler PageChanged;

    public delegate void DeletedDelegate(string[] deletedIDs);
    public event DeletedDelegate ItemDeleted;
    public bool CancelDelete = false;
    public delegate void DeletingDelegate(string[] deletedIDs, ref bool Cancel);
    public event DeletingDelegate ItemDeleting;

    #endregion


    public static List<tableState> AllUserTables = new List<tableState>();


    #region properties
    protected string guid = Guid.NewGuid().ToString().Remove(8);
    private string ConnStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
    MySqlDataReader MyReader = null;
    private bool ignoreGroupbyInCount = false;


    protected string controlID = "";
    private string editUrl = "";//The link on the "edit" button, on the left of every record. the {field} is replaced with the value inside IdField
    private string delCommand = "";//The SQL statement for removing a record.
    private string addLink = "";//The "add" botton url. If empty, the botton does not show.
    private string tableTitle = "";//the text above the table.
    private string tblName = "";//the name of the table in the DB.
    private string[] tblHeaderNames = { };//The Header names as they are displayed in the table;
    private string[] sqlFieldNames = { };//The names of the fields in the actual SQL table in the DB.
    //private string[] sqlFieldNamesExtensions = { };
    private string[] sqlFieldNamesClean = { };
    private string[] fieldsToShow = { };//a comma-sepated array that determines which of the fields to show - 0=hide, 1=show.
    private string[] fieldsToSearch = { };//a comma-sepated array that determines which of the to search in- 0=hide, 1=show.
    private string[] fieldsToExport = { };//a comma-sepated array that determines which of the fields to export to excel - 0=hide, 1=show.
    private string[] fieldsToPrint = { };
    private string[] sqlFieldType = { };//Determines the type of the field in the system --> 1=Text, 2=Boolan, 3=Enum, 6=Date, 7=LongText, 8=range.
    private string[] sqlOptions = { };//In the case this is an Enum field=>determines the options as a zero based array.
    private string[] fieldsToPreview = { };//In the case this is an Enum field=>determ the field to show on mouse over.
    private bool isExcelExportable = true;//
    private bool isDelField = false;
    private bool isSelectField = false;
    private bool isSelectAll = true;
    private string sortBy = "";
    private string limit = "";
    private int sortByIndex = 0;
    protected int pageCont = 0;
    protected int currentPageNum = 0;
    private int maxResPerPage = 20;
    private int maxTextLength = 0;
    private int sqlStartFrom = 0;
    private string sqlWhereQuery = "";
    private string sqlGroupBy = "";
    private bool removeWhere = false;
    private bool removeFrom = false;
    string[] customField = { };
    string[] replaceField = { };
    string idField = "ID";
    private string orderField = "";
    private bool isSearch = true;
    private string checkedImg = "";
    string CountSql = "";
    string CountSql2 = "";
    string sql = "";
    protected int ResCount = 0;
    int numFound = 0;
    private string delImgLocation = "";
    private string delConfirmationText = "";
    private string delAllConfirmationText = "";
    private string delAllLabel = "";
    private int displayWidth = 800;
    private bool isAdvanceSearch = true;
    private bool delAllOneByOne = false;
    private string addImageButtonText = "";
    private string editTitle = "";
    private string tableOverflow = "";
    private bool editInFancy = false;

    public bool HasGroupBy { get; set; }
    public bool IgnoreGroupbyInCount
    {
        get { return ignoreGroupbyInCount; }
        set { ignoreGroupbyInCount = value; }
    }

    public bool EditInFancy
    {
        get { return editInFancy; }
        set { editInFancy = value; }
    }

    public UpdatePanelUpdateMode UpdateMode
    {
        get { return MainUP.UpdateMode; }
        set { MainUP.UpdateMode = value; }
    }
    public string TableOverflow
    {
        get { return tableOverflow; }
        set { tableOverflow = value; }
    }

    public string AssociatedUpdatePanelID
    {
        get { return UpdateProgress1.AssociatedUpdatePanelID; }
        set { UpdateProgress1.AssociatedUpdatePanelID = value; }

    }

    public string EditTitle
    {
        get { return editTitle; }
        set { editTitle = value; }
    }
    public string AddImageButtonText
    {
        get { return addImageButtonText; }
        set { addImageButtonText = value; }
    }

    public bool DelAllOneByOne
    {
        get { return delAllOneByOne; }
        set { delAllOneByOne = value; }
    }

    public bool RemoveWhere
    {
        get { return removeWhere; }
        set { removeWhere = value; }
    }


    public bool RemoveFrom
    {
        get { return removeFrom; }
        set { removeFrom = value; }
    }

    public bool IsAdvanceSearch
    {
        get { return isAdvanceSearch; }
        set { isAdvanceSearch = value; }
    }

    public string DisplayWidth
    {
        get { return displayWidth.ToString(); }
        set { int.TryParse(value, out displayWidth); }
    }

    public bool NoResFound
    {
        get { return NotFoundDiv.Visible; }
    }

    public string DelAllConfirmationText
    {
        get { return delAllConfirmationText; }
        set { delAllConfirmationText = value; }
    }

    public string DelAllLabel
    {
        get { return delAllLabel; }
        set { delAllLabel = value; }
    }

    public string DelImgLocation
    {
        get { return delImgLocation; }
        set { delImgLocation = value; }
    }

    public string DelConfirmationText
    {
        get { return delConfirmationText; }
        set { delConfirmationText = value; }
    }

    public bool IsSearch
    {
        get { return isSearch; }
        set { isSearch = value; }
    }

    public string OutputSql
    {
        get { return sql; }
        set { sql = value; }
    }

    public string SelectedValsHidVal
    {
        get { return SelectedValsHid.Value; }
        set { SelectedValsHid.Value = value; }
    }

    public string OrderField
    {
        get { return orderField; }
        set { orderField = value; }
    }

    public string CheckedImg
    {
        get { return checkedImg; }
        set { checkedImg = value; }
    }

    public string EditUrl
    {
        get { return editUrl; }
        set { editUrl = value; }
    }

    public string DelCommand
    {
        get { return delCommand; }
        set { delCommand = value; }
    }

    public string SqlFieldType
    {
        get { return string.Join(",", sqlFieldType); }
        set { sqlFieldType = value.Split(','); }
    }

    public string SqlOptions
    {
        get { return string.Join(",", sqlOptions); }
        set { sqlOptions = value.Split(','); }
    }
    public string FieldsToPreview
    {
        get { return string.Join(",", fieldsToPreview); }
        set { fieldsToPreview = value.Split(','); }
    }

    /// <summary>
    /// The link for the page where a form exists.
    /// </summary>
    public string AddLink
    {
        get { return addLink; }
        set { addLink = value; }
    }
    public string TableTitle
    {
        get { return tableTitle; }
        set { tableTitle = value; }
    }
    public string IsDelField
    {
        get { return isDelField.ToString(); }
        set { if (value.ToLower() == "true") { isDelField = true; } else { isDelField = false; }; }
    }


    public string IsSelectField
    {
        get { return isSelectField.ToString(); }
        set { if (value.ToLower() == "true") { isSelectField = true; } else { isSelectField = false; }; }
    }

    public bool IsSelectAll
    {
        get { return isSelectAll; }
        set { isSelectAll = value; }
    }

    public string ReplaceField
    {
        get { return string.Join(",", replaceField); }
        set { replaceField = value.Split(','); }
    }

    public string CustomField
    {
        get { return string.Join(",", customField); }
        set { customField = value.Split(','); }
    }


    public string SqlWhereQuery
    {
        get { return sqlWhereQuery; }
        set { sqlWhereQuery = value; }
    }

    public string SqlGroupBy
    {
        get { return sqlGroupBy; }
        set { sqlGroupBy = value; }
    }

    public int SqlStartFrom
    {
        get { return sqlStartFrom; }
        set { sqlStartFrom = value; }
    }

    public int MaxResPerPage
    {
        get { return maxResPerPage; }
        set { maxResPerPage = value; }
    }

    public int MaxTextLength
    {
        get { return maxTextLength; }
        set { maxTextLength = value; }
    }



    public int SortByIndex
    {
        get { return sortByIndex; }
        set { sortByIndex = value; }
    }

    public string Limit
    {
        get { return limit; }
        set { limit = value; }
    }

    public string SortBy
    {
        get { return sortBy; }
        set { sortBy = value; }
    }

    public bool IsExcelExportable
    {
        get { return isExcelExportable; }
        set { isExcelExportable = value; }
    }

    public string TblName
    {
        get { return tblName; }
        set { tblName = value; }
    }

    public string TblHeaderNames
    {
        get { return string.Join(",", tblHeaderNames); }
        set { tblHeaderNames = value.Split(','); }
    }

    public string SqlFieldNames
    {
        get { return string.Join(",", sqlFieldNames); }
        set { sqlFieldNames = value.Split(','); }
    }

    public string FieldsToExport
    {
        get { return string.Join(",", fieldsToExport); }
        set { fieldsToExport = value.Split(','); }
    }

    public string FieldsToShow
    {
        get { return string.Join(",", fieldsToShow); }
        set { fieldsToShow = value.Split(','); }
    }

    public string FieldsToSearch
    {
        get { return string.Join(",", fieldsToSearch); }
        set { fieldsToSearch = value.Split(','); }
    }

    public string FieldsToPrint
    {
        get { return string.Join(",", fieldsToPrint); }
        set { fieldsToPrint = value.Split(','); }
    }

    /// <summary>
    //     Gets or sets an array that contains the names of the primary key fields for
    //     the items displayed in a System.Web.UI.WebControls.GridView control.
    //
    // Returns:
    //     An array that contains the names of the primary key fields for the items
    //     displayed in a System.Web.UI.WebControls.GridView control.
    /// </summary>
    public string IdField
    {
        get { return idField; }
        set { idField = value; }
    }


    public int NumFound
    {
        get { return numFound; }
    }

    public GridViewRowCollection getRows
    {
        get { return GridView1.Rows; }
    }


    #endregion



    //TableControlColumn col = new TableControlColumn();

    //DataControlFieldCollection _fieldCollection;

    //[TemplateContainer(typeof(TableControlColumn))]
    //[TemplateInstance(TemplateInstance.Multiple)] 
    //[PersistenceMode(PersistenceMode.InnerProperty)]
    //public virtual DataControlFieldCollection Columns
    //{
    //    get
    //    {
    //        if (this._fieldCollection == null)
    //        {
    //            this._fieldCollection = new DataControlFieldCollection();
    //            //this._fieldCollection.FieldsChanged += new EventHandler(this.OnFieldsChanged);
    //            if (base.IsTrackingViewState)
    //            {
    //                ((IStateManager)this._fieldCollection).TrackViewState();
    //            }
    //        }
    //        return this._fieldCollection;
    //    }
    //}



    protected void Page_Init(object sender, EventArgs e)
    {

        controlID = this.ClientID;

        GridView1.Width = displayWidth;
        //GridView1.Style["table-layout"] = "fixed";
        mainpanel.Width = displayWidth;
        mainpanel.Style["overflow"] = tableOverflow;



        if (!IsPostBack)
        {
            if (MaxResText.Items.FindByValue(MaxResPerPage.ToString()) != null)
            {
                MaxResText.SelectedValue = MaxResPerPage.ToString();
            }
            else
            {
                MaxResText.SelectedIndex = 0;
            }
        }
        else
        {

        }

        GridView1.RowCreated += TableRowCreated;
        GridView1.PreRender += TablePreRender;
        GridView1.PageIndexChanged += PageChanged;
        GridView1.DataBinding += TableDataBinding;
        //MainUP.Load += UpdatePanelPreRender;

    }



    protected void RowCreated(object sender, GridViewRowEventArgs e)
    {
        ;
    }

    private ArrayList subs = new ArrayList();

    /// <summary>
    /// returns a list of IDs for rows what were checked or uncehecked in the last postback.
    /// </summary>
    /// <returns></returns>
    public string[] getSelectedVals()
    {
        ArrayList CheckArr = new ArrayList();
        if (SelAllHid.Value == "true")
        {
            using (MySqlConnection con = new MySqlConnection(ConnStr))
            {

                con.Open();
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = con;

                if (sql.Contains("FROM"))
                {
                    cmd.CommandText = "SELECT " + idField + " " + sql.Substring(sql.IndexOf("FROM")) + " ";
                }
                else
                {
                    if (removeFrom)
                    {
                        cmd.CommandText = " " + tblName + " ";
                    }
                    else
                    {
                        cmd.CommandText = "SELECT " + idField + " FROM  " + tblName + " ";
                    }
                }


                if (SearchHid.Value != "")
                {
                    if (!cmd.CommandText.Contains(" WHERE "))
                    {
                        cmd.CommandText += " WHERE " + SqlWhereQuery + SearchHid.Value.Replace("'", "''");
                    }
                    else
                    {
                        int lastWhere = cmd.CommandText.LastIndexOf(" WHERE ");
                        cmd.CommandText = cmd.CommandText.Insert(lastWhere + 6, SearchHid.Value.Substring(SearchHid.Value.IndexOf("AND") + 3) + " AND ");
                    }
                }

                if (SqlGroupBy != "")
                {
                    cmd.CommandText += " GROUP BY " + SqlGroupBy + " ";
                }

                MyReader = cmd.ExecuteReader();
                while (MyReader.Read())
                {

                    CheckArr.Add(MyReader[idField.Replace("`", "")].ToString());
                }
                MyReader.Close();


                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        else
        {

            foreach (GraphicalCheckBox check in cmstrDefualts.getControls(GridView1, typeof(GraphicalCheckBox)))
            {
                if (check.Checked && !CheckArr.Contains(check.ID.Replace("Check", "")) && !SelectedValsHid.Value.Split(',').Contains(check.ID.Replace("Check", "")))
                {
                    CheckArr.Add(check.ID.Replace("Check", ""));
                }
            }

            string[] splitter = { "," };
            foreach (string otherPagesCheck in SelectedValsHid.Value.Split(splitter, StringSplitOptions.RemoveEmptyEntries))
            {
                if (!CheckArr.Contains(otherPagesCheck))
                {
                    CheckArr.Add(otherPagesCheck);
                }
            }


        }
        return (string[])CheckArr.ToArray(typeof(string));
    }

    /// <summary>
    /// returns a list of IDs for rows what were checked or uncehecked in the last postback.
    /// </summary>
    /// <returns></returns>
    public string[] getAllVals()
    {
        string AllValsArr = "";
        foreach (GraphicalCheckBox check in cmstrDefualts.getControls(GridView1, typeof(GraphicalCheckBox)))
        {
            if (check.ID != null)
            {
                if (AllValsArr != "")
                {
                    AllValsArr += ",";
                }
                AllValsArr += check.ID.Replace("Check", "");
            }
        }
        if (AllValsArr != "" && AllValsHid.Value != "")
        {
            AllValsArr += ",";
        }
        AllValsArr += AllValsHid.Value;
        return AllValsArr.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);
    }


    protected void NextPrev_Command(object sender, CommandEventArgs e)
    {

        if (e.CommandArgument.ToString() == "Prev")
        {
            currentPageNum--;
        }
        else
        {
            currentPageNum++;
        }

        NewPageNumHid.Value = currentPageNum.ToString();

        setTableState();


        //AddChecked();

        ReCreate();
    }

    private tableState getTableState()
    {
        for (int i = 0; i < AllUserTables.Count; i++)
        {
            if (AllUserTables[i].sessionID == Session.SessionID && AllUserTables[i].siteId == Session["siteID"].ToString() && AllUserTables[i].tblName == Request.Url.AbsolutePath + "___" + this.ID)
            {
                return AllUserTables[i];
            }
        }
        return null;
    }

    private void setTableState()
    {
        bool tableFound = false;
        for (int i = 0; i < AllUserTables.Count; i++)
        {
            if (AllUserTables[i].sessionID == Session.SessionID && AllUserTables[i].siteId == Session["siteID"].ToString() && AllUserTables[i].tblName == Request.Url.AbsolutePath + "___" + this.ID)
            {
                tableFound = true;
                AllUserTables[i].tblName = Request.Url.AbsolutePath + "___" + this.ID;
                AllUserTables[i].siteId = Session["siteID"].ToString();
                AllUserTables[i].SearchHid = SearchHid.Value;
                AllUserTables[i].orderBy = sortBy;
                AllUserTables[i].PageNum = currentPageNum;
                AllUserTables[i].MaxResPerPage = maxResPerPage;
                AllUserTables[i].searchWord = SrchBox.Text;
                AllUserTables[i].sessionID = Session.SessionID;
                AllUserTables[i].UpdateTime = DateTime.Now;
            }
        }
        if (!tableFound)
        {
            tableState tempTableState = new tableState();
            tempTableState.tblName = Request.Url.AbsolutePath + "___" + this.ID;
            tempTableState.siteId = Session["siteID"].ToString();
            tempTableState.SearchHid = SearchHid.Value;
            tempTableState.orderBy = sortBy;
            tempTableState.PageNum = currentPageNum;
            tempTableState.MaxResPerPage = maxResPerPage;
            tempTableState.SearchHid = SrchBox.Text;
            tempTableState.sessionID = Session.SessionID;
            tempTableState.UpdateTime = DateTime.Now;
            AllUserTables.Add(tempTableState);
        }
    }


    protected void GridView1_PageIndexChanged(object sender, EventArgs e)
    {
        setTableState();
        NewPageNumHid.Value = currentPageNum.ToString();
        //AddChecked();

        ReCreate();
    }

    protected void RePost_Click(object sender, EventArgs e)
    {
        NewPageNumHid.Value = NewerPageNumHid.Value;
        //AddChecked();
        int pageIndex = 1;
        int.TryParse(NewPageNumHid.Value, out pageIndex);
        currentPageNum = pageIndex;
        setTableState();


        ReCreate();
    }



    public void AddChecked()
    {
        foreach (GraphicalCheckBox check in cmstrDefualts.getControls(GridView1, typeof(GraphicalCheckBox)))
        {
            if (check.ID != null)
            {
                if (check.Checked)
                {
                    if (SelectedValsHid.Value != "")
                    {
                        SelectedValsHid.Value += ",";
                    }
                    SelectedValsHid.Value += check.ID.Replace("Check", "");
                }
                if (AllValsHid.Value != "")
                {
                    AllValsHid.Value += ",";
                }
                AllValsHid.Value += check.ID.Replace("Check", "");
            }
        }
    }


    protected void GridView1_DataBinding1(object sender, EventArgs e)
    {
        AddChecked();
    }

    protected void Page_Load(object sender, EventArgs e)
    {



        SearchPanel.Attributes.Add("onKeyPress", "javascript:if (event.keyCode == 13) __doPostBack('" + SearchBtn.UniqueID + "','')");
        SearchBtnNew.Attributes.Add("onclick", "clicksearc();");
        string clicksearchkey = "function clicksearc(){ eval(document.getElementById('" + SearchBtn.ClientID + "').href); }";
        SrchBox.Attributes.Add("onKeyUp", "javascript:if(event.keyCode!='16' && event.keyCode!='17' && event.keyCode!='18' && event.keyCode!='20'&& event.keyCode!='9'&& event.keyCode!='91'&& event.keyCode!='45'&& event.keyCode!='37'&& event.keyCode!='38'&& event.keyCode!='39'&& event.keyCode!='40'&& event.keyCode!='35'&& event.keyCode!='36'&& event.keyCode!='33'&& event.keyCode!='34'&& event.keyCode!='13') {document.getElementById('" + isSerahching.ClientID + "').value='1';try{clearTimeout(t);} catch(err){};t=setTimeout(\"try{eval(document.getElementById('" + SearchBtn.ClientID + "').href);if(document.getElementById('" + SrchBox.ClientID + "').value==''){$('.ClearSrch').css('display','none');$('.AdvSerachIndicator').css('display','none')}else{$('.ClearSrch').css('display','');if($('#" + SrchBox.ClientID + "').val()==''){$('.AdvSerachIndicator').css('display','')}}}catch(ex){}\",1000)}");

        //SrchBox.Attributes.Add("onfocus", "focusSearch=true");
        //SrchBox.Attributes.Add("onblur", "focusSearch=false");
        //ScriptManager.RegisterStartupScript(MainUP, GetType(), "SearchFocus", "setTimeout(\"try{if(focusSearch){document.getElementById('" + SrchBox.ClientID + "').focus()};document.getElementById('" + SrchBox.ClientID + "').value = document.getElementById('" + SrchBox.ClientID + "').value;}catch(err){}\",10);" + clicksearchkey, true);
        ScriptManager.RegisterStartupScript(MainUP, GetType(), "SearchFocus", "if($('#" + SearchHid.ClientID + "').val()!='' && $('#" + SrchBox.ClientID + "').val()==''){$('.AdvSerachIndicator').css('display','');} else{$('.AdvSerachIndicator').css('display','none');};if($('#" + SearchHid.ClientID + "').val()==''){$('.ClearSrch').css('display','none')} else{$('.ClearSrch').css('display','')};$('.ClearSrch').click(function(){$('.ClearSrch').css('display','none');$('#" + SrchBox.ClientID + "').val('');clicksearc();}) ;setTimeout(\"try{if(document.getElementById('" + isSerahching.ClientID + "').value=='1'){document.getElementById('" + SrchBox.ClientID + "').focus(); document.getElementById('" + isSerahching.ClientID + "').value='0';};document.getElementById('" + SrchBox.ClientID + "').value = document.getElementById('" + SrchBox.ClientID + "').value;}catch(err){}\",10);" + clicksearchkey, true);
        if (AddImageButtonText != "")
        {
            AddHyperLink.Text = AddImageButtonText;
            // Img1.ImageUrl = AddImageButtonUrl;
        }
        else
        {
            AddHyperLink.Text = Languages2.MyText("General_Add New_הוסף חדש");
        }

        //ScriptManager.RegisterStartupScript(Page, GetType(), "sasd", "alert(document.getElementById('"+SelectedValsHid.ClientID+"').value)", true);
        if (NewPageNumHid.Value != "")
        {
            currentPageNum = int.Parse(NewPageNumHid.Value);
        }

        if (fieldsToSearch.Length != 0 && FieldsToSearch.Contains('1'))
        {
            AdvSearchOpenLit.Visible = true;
            if (isAdvanceSearch)
            {
                AdvSearchOpen.Visible = true;
                AdvSearchOpenLit.Visible = true;
            }
            else
            {
                AdvSearchOpen.Visible = false;
                AdvSearchOpenLit.Visible = false;
            }
        }
        else
        {
            AdvSearchOpenLit.Visible = false;
            AdvSearchOpen.Visible = false;
        }

        if (AdvSearchOpenHid.Value == "true")
        {
            AdvSearchOpen_Click(sender, e);
            AdvSearchOpenHid.Value = "";
        }

        if (TblName == "") { Exception exc = new Exception("You must specity a table name in the TblName Field"); throw exc; }
        foreach (SubControl sc in subs)
        { Controls.Add(sc); }

        if (IsPostBack)
        {
            SortBy = SortByHid.Value;
        }
        else
        {
            SortByHid.Value = SortBy;
        }
        CreateTable();
        TableTitleLit.Text = TableTitle;
        if (TableTitle == "")
        {
            SearchPanel.CssClass = "searchtableclass2";

        }
        else
        {

            SearchPanel.CssClass = "searchtableclass";
        }



        StringBuilder _js = new StringBuilder();
        _js.AppendLine("<script language=\"javascript\" type=\"text/javascript\">");
        _js.AppendLine("function PageChanged" + guid + "(sender){");
        _js.AppendLine("document.getElementById('" + NewerPageNumHid.ClientID + "').value=sender.options[sender.selectedIndex].value;");
        _js.AppendLine("document.getElementById('" + RePost.ClientID + "').click()");
        _js.AppendLine("");
        _js.AppendLine("");
        _js.AppendLine("");
        _js.AppendLine("");
        _js.AppendLine("}");


        _js.AppendLine("function unMarkAllPages(tableControl){");
        _js.AppendLine("document.getElementById('SelAllPagesDiv'+tableControl).style.display='none';");
        _js.AppendLine("document.getElementById('SelAllChecked'+tableControl).style.display='none';");
        _js.AppendLine("document.getElementById('checkAllBtn'+tableControl).style.display='';");
        _js.AppendLine("document.getElementById('uncheckAllBtn'+tableControl).style.display='none';");
        _js.AppendLine("document.getElementById(tableControl+'_SelAllHid').value = 'false';");
        _js.AppendLine("}");

        _js.AppendLine("function MarkAllPages(tableControl){");
        _js.AppendLine("document.getElementById('SelAllChecked'+tableControl).style.display='';");
        _js.AppendLine("document.getElementById('SelAllPagesDiv'+tableControl).style.display='none';");
        _js.AppendLine("document.getElementById('checkAllBtn'+tableControl).style.display='none';");
        _js.AppendLine("document.getElementById('uncheckAllBtn'+tableControl).style.display='';");
        _js.AppendLine("document.getElementById(tableControl+'_SelAllHid').value = 'true';");
        _js.AppendLine("}");

        _js.AppendLine("function showSelAllPages(tableControl){");
        _js.AppendLine("document.getElementById('SelAllPagesDiv'+tableControl).style.display='';");
        _js.AppendLine("document.getElementById('SelAllChecked'+tableControl).style.display='none';");
        _js.AppendLine("document.getElementById('checkAllBtn'+tableControl).style.display='none';");
        _js.AppendLine("document.getElementById('uncheckAllBtn'+tableControl).style.display='';");
        _js.AppendLine("document.getElementById(tableControl+'_SelAllHid').value = 'half';");
        _js.AppendLine("}");

        _js.AppendLine("function hideSelAllPages(tableControl){");
        _js.AppendLine("document.getElementById('SelAllPagesDiv'+tableControl).style.display='none';");
        _js.AppendLine("document.getElementById('SelAllChecked'+tableControl).style.display='none';");
        _js.AppendLine("document.getElementById('checkAllBtn'+tableControl).style.display='';");
        _js.AppendLine("document.getElementById('uncheckAllBtn'+tableControl).style.display='none';");
        _js.AppendLine("document.getElementById(tableControl+'_SelAllHid').value = 'half';");
        _js.AppendLine("}");

        StringBuilder _js2 = new StringBuilder();
        _js2.AppendLine("Sys.Browser.WebKit = {}; //Safari 3 is considered WebKit");
        _js2.AppendLine("if (navigator.userAgent.indexOf('WebKit/') > -1) {");
        _js2.AppendLine("Sys.Browser.agent = Sys.Browser.WebKit;");
        _js2.AppendLine("Sys.Browser.version = parseFloat(navigator.userAgent.match(/WebKit\\/(\\d+(\\.\\d+)?)/)[1]);");
        _js2.AppendLine("Sys.Browser.name = 'WebKit';");
        _js2.AppendLine("}");

        ScriptManager.RegisterStartupScript(MainUP, typeof(UpdatePanel), "AjaxToolKitFix", _js2.ToString(), true);


        _js.AppendLine("</script>");
        ScriptManager.RegisterClientScriptBlock(MainUP, typeof(UpdatePanel), "PageChanged" + guid, _js.ToString(), false);


    }




    protected void MaxResText_SelectedIndexChanged(object sender, EventArgs e)
    {
        //AddChecked();
        setTableState();


        int.TryParse(MaxResText.SelectedValue, out maxResPerPage);
        ReCreate();

    }



    public void CreateTable()
    {
        bool maxResPerPageChanged = false;
        tableState tempState = getTableState();
        if (!IsPostBack && tempState != null)//checks to see if the view state of the table was saved in a session.
        {
            if (tempState.PageNum != 0)
            {
                currentPageNum = tempState.PageNum;
                if (NewPageNumHid.Value == "")
                {
                    NewPageNumHid.Value = tempState.PageNum.ToString();
                }
            }

            if (tempState.MaxResPerPage != 0)
            {
                MaxResPerPage = tempState.MaxResPerPage;
                MaxResText.SelectedValue = tempState.MaxResPerPage.ToString();
                maxResPerPageChanged = true;
            }
            if (tempState.orderBy != "")
                SortBy = tempState.orderBy;
            if (tempState.SearchHid != null)
            {
                SearchHid.Value = tempState.SearchHid;
                if (SearchHid.Value != "" && isSearch)
                {
                    SearchPanel.Visible = true;
                }
            }

            if (tempState.searchWord != null)
            {
                SrchBox.Text = tempState.searchWord;
            }
        }

        if (!maxResPerPageChanged)
        {
            int.TryParse(MaxResText.SelectedValue, out maxResPerPage);
        }

        sqlFieldNamesClean = string.Join(",", sqlFieldNames).Split(',');
        //sqlFieldNamesExtensions = string.Join(",", sqlFieldNames).Split(',');

        //for (int i = 0; i < sqlFieldNamesExtensions.Length; i++)
        //{
        //    if (sqlFieldNamesExtensions[i].ToLower().Contains(" as "))
        //    {
        //        sqlFieldNamesExtensions[i] = sqlFieldNamesExtensions[i].Remove(0, sqlFieldNamesExtensions[i].ToLower().LastIndexOf(" as ")+4);
        //    }
        //}

        if (addLink != "")
        {
            AddHyperLink.Visible = true;
            AddButtonRightdiv.Visible = true;
            AddHyperLink.NavigateUrl = addLink;
        }
        else
        {
            AddHyperLink.Visible = false;
            AddButtonRightdiv.Visible = false;
        }

        exportToXlsBtn.OnClientClick = "javascript:setTimeout(\"document.getElementById('" + UpdateProgress1.ClientID + "').style.display='none'\",3000)";
        if (IsExcelExportable == true)
        {
            exportToXlsBtn.Visible = true;
        }
        else
        {
            exportToXlsBtn.Visible = false;
        }

        //GridView1.PageSize = MaxResPerPage;
        GridView1.CellSpacing = 0;
        GridView1.CellPadding = 0;
        GridView1.CssClass = "ltrLeft";
        GridView1.GridLines = GridLines.None;
        GridView1.ShowFooter = true;
        GridView1.AutoGenerateColumns = false;
        GridView1.HeaderStyle.CssClass = "resTH";
        GridView1.FooterStyle.CssClass = "resTF";
        GridView1.RowStyle.CssClass = "resTDeven";
        GridView1.AlternatingRowStyle.CssClass = "resTDuneven";


        string selWhat;
        if (IdField != "")
        {
            string[] idFieldString;
            if (IdField.Contains(" AS "))
            {
                idFieldString = IdField.Remove(0, IdField.LastIndexOf(" AS ") + 4).Replace("`", "").Split();
            }
            else
            {
                idFieldString = idField.Replace("`", "").Split();
            }
            GridView1.DataKeyNames = idFieldString;
            selWhat = IdField;
        }
        else
            selWhat = "";
        for (int i = 0; i < sqlFieldNames.Length; i++)
        {
            if (sqlFieldNames[i].Trim() != "")
            {
                int FieldisNumber = 0;
                if (int.TryParse(sqlFieldNames[i].ToString().Trim().Replace("`", ""), out FieldisNumber))
                {
                    if (selWhat != "")
                    {
                        selWhat += ",";
                    }
                    selWhat += "`" + FieldisNumber + "`";
                }
                else
                {
                    if (selWhat != "")
                    {
                        selWhat += ",";
                    }
                    selWhat += sqlFieldNames[i].ToString().Trim().Replace("|", ",");
                }
            }
        }

        if (OrderField != "")
        {
            selWhat += ",`" + OrderField + "`";

        }

        if (!removeFrom)
        {
            sql = "SELECT " + selWhat + " FROM " + tblName;
        }
        else
        {
            sql = tblName;
        }




        //adds search criteria if the user searched something
        //if (SqlWhereQuery != "")
        //{
        //if (SearchHid.Value != "")
        //{
        //    if (sqlWhereQuery != "" && !removeWhere)
        //    {
        //        if (!sql.Contains(" WHERE "))
        //        {
        //            sql += " WHERE " + SqlWhereQuery + SearchHid.Value;
        //        }
        //        else
        //        {
        //            sql = sql.Replace(" WHERE "," WHERE " + SqlWhereQuery + SearchHid.Value+" AND ");
        //        }
        //    }
        //    else
        //    {
        //        if (!sql.Contains(" WHERE "))
        //        {
        //            sql += " WHERE " + SearchHid.Value.Substring(SearchHid.Value.IndexOf("AND") + 3);
        //        //	CountSql += " WHERE " + SearchHid.Value.Substring(SearchHid.Value.IndexOf("AND") + 3);
        //        }
        //        else
        //        { 
        //            sql = sql.Replace(" WHERE "," WHERE " + SearchHid.Value.Substring(SearchHid.Value.IndexOf("AND") + 3)+" AND ");
        //        }
        //    }
        //}
        //if not searched for anithing, but there is a where query (and no removeWhere)
        //}

        if (sqlWhereQuery != "" && !removeWhere)
        {
            if (!sql.Contains(" WHERE "))
            {
                sql += " WHERE " + SqlWhereQuery;
            }
            else
            {
                sql = sql.Replace(" WHERE ", " WHERE " + SqlWhereQuery + " AND ");
            }
        }


        if (SearchHid.Value != "")
        {
            if (!sql.Contains(" WHERE "))
            {
                sql += " WHERE " + SqlWhereQuery + SearchHid.Value.Replace("|", ",").Substring(SearchHid.Value.Replace("|", ",").IndexOf("AND") + 3);
            }
            else
            {
                int lastWhere = sql.LastIndexOf(" WHERE ");

                if (sql.Contains(" UNION ") && sql.Contains(" AS ") && sql.LastIndexOf(" AS ") > lastWhere)
                {
                    sql = sql.Insert(sql.Length, " WHERE " + SearchHid.Value.Replace("|", ",").Substring(SearchHid.Value.Replace("|", ",").IndexOf("AND") + 3));
                }
                else
                {
                    sql = sql.Insert(lastWhere + 6, SearchHid.Value.Replace("|", ",").Substring(SearchHid.Value.Replace("|", ",").IndexOf("AND") + 3) + " AND ");
                }
            }
            setTableState();
        }

        if (SqlGroupBy != "")
        {
            sql += " GROUP BY " + SqlGroupBy + " ";
        }

        if (sql.Length > 6)
        {
            string tempIDField = idField;
            if (tempIDField.ToLower().Contains(" as "))
            {
                tempIDField = tempIDField.Remove(tempIDField.ToLower().IndexOf(" as "));
            }
            CountSql = "SELECT COUNT(" + tempIDField + ") AS ResCount, " + sql.Trim().Remove(0, 6);
            if (sql.Contains("FROM"))
            {
                if (HasGroupBy)
                {
                    CountSql2 = "SELECT COUNT(" + tempIDField + ") AS ResCount FROM (Select * " + sql.Remove(0, sql.LastIndexOf("FROM")) + ") as GroupCountTable";

                }
                else
                {
                    CountSql2 = "SELECT COUNT(" + tempIDField + ") AS ResCount " + sql.Remove(0, sql.LastIndexOf("FROM"));

                }
            }
        }

        //string emptySql = "SELECT "+ IdField;

        //for (int i = 0; i < sqlFieldNamesExtensions.Length; i++)
        //{
        //    emptySql += ",null AS `" + sqlFieldNamesExtensions[i].Replace("`","")+"`";
        //}

        //emptySql +=sql.Substring(sql.IndexOf(" FROM "));

        if (SortBy != "")
        {
            if (SortBy.Contains(" AS "))
            {
                SortBy = SortBy.Substring(SortBy.LastIndexOf(" AS ") + 4);
            }
            string[] splitSortBy = sortBy.ToLower().Split(',');
            bool isSortFeildExists = true;
            foreach (string checkfield in splitSortBy)
            {
                if (!sql.ToLower().Replace("`", "").Contains(checkfield.Replace(" asc", "").Replace("`", "").Replace(" desc", "")))//checks if the orderfield is in the query - it's not there if someone deleted a field then returns to this page
                {
                    isSortFeildExists = false;

                }
            }
            if (isSortFeildExists)
            {
                sql += " Order By " + SortBy;

            }
        }

        //int pageNum = currentPageNum;
        string viewSql = sql;

        //if (pageNum > 0)
        //{
        //    viewSql = "(" + emptySql + " limit " + ((pageNum -1) * MaxResPerPage) + "," + ((pageNum * MaxResPerPage)) + ") union all  (" + viewSql;
        //}
        //else
        //{
        //    viewSql = "(" + viewSql;
        //}

        if (currentPageNum < 0)
        {
            currentPageNum = 0;
        }
        viewSql = viewSql + " limit " + (currentPageNum * MaxResPerPage) + "," + MaxResPerPage;


        //viewSql = viewSql + ") union all (" + emptySql + " limit " + ((pageNum + 1) * MaxResPerPage) + "," + ((pageNum + 2) * MaxResPerPage) + ")";



        if (CountSql == "")
        {
            if (sql.Length > 6 && CountSql == "")
            {
                string tempIDField = idField;
                if (tempIDField.ToLower().Contains(" as "))
                {
                    tempIDField = tempIDField.Remove(tempIDField.ToLower().IndexOf(" as "));
                }
                CountSql = "SELECT COUNT(" + tempIDField + ") AS ResCount, " + sql.Trim().Remove(0, 6);
                if (sql.Contains("FROM"))
                {
                    CountSql2 = "SELECT COUNT(" + tempIDField + ") AS ResCount " + sql.Remove(0, sql.LastIndexOf("FROM"));
                }
            }
        }


        //ErrorMsg.Text = sql;
        if (Session["SuperUserID"] != null && Session["SuperUserID"].ToString() == "2")
        {
            ErrMsg.Text = sql;
            ErrMsg.Visible = true;
        }

        using (MySqlConnection con = new MySqlConnection(ConnStr))
        {
            con.Open();

            MySqlCommand cmd = new MySqlCommand(viewSql, con);
            //ErrorMsg.Text = cmd.CommandText;

            MyReader = cmd.ExecuteReader();

            TemplateField RightCol = new TemplateField();
            RightCol.ItemStyle.CssClass = "tableRight";
            RightCol.HeaderStyle.Width = 10;
            RightCol.FooterStyle.Width = 10;
            RightCol.HeaderText = "<div class=\"tableTopRight\"></div>";
            RightCol.HeaderStyle.VerticalAlign = VerticalAlign.Top;
            RightCol.FooterText = "<div class=\"tableBottomRight\"></div>";
            GridView1.Columns.Insert(0, RightCol);


            if (isSelectField == true)//adding the Select Field
            {
                TemplateField CheckCol = new TemplateField();
                GridViewTemplate1 GridViewTemplateDel = new GridViewTemplate1("CheckBox", IdField, IdField, checkedImg, TblName, maxTextLength);
                CheckCol.ItemTemplate = GridViewTemplateDel;
                //GridViewTemplate1 checkFooter = new GridViewTemplate1("CheckFooter", IdField, IdField, "", TblName);
                //CheckCol.FooterTemplate = checkFooter;
                CheckCol.FooterStyle.HorizontalAlign = HorizontalAlign.Right;
                GridView1.Columns.Add(CheckCol);
            }

            if (isDelField == true)//adding the delete Field
            {
                TemplateField DelCol = new TemplateField();
                GridViewTemplate1 GridViewTemplateDel = new GridViewTemplate1("DelItem", IdField, delImgLocation, delConfirmationText, TblName, maxTextLength);
                GridViewTemplateDel.DelClick += ClickDel;
                DelCol.ItemTemplate = GridViewTemplateDel;

                GridView1.Columns.Add(DelCol);
            }



            for (int RowNum = 0; RowNum < sqlFieldNames.Length; RowNum++)
            {
                if (fieldsToShow.Length != 0)
                {
                    if (fieldsToShow.Length > RowNum && fieldsToShow[RowNum].Trim() == "1")
                    {
                        string tempCustomField = "";
                        string tempReplaceField = "";
                        TemplateField Splitter = new TemplateField();
                        Splitter.HeaderText = "&nbsp;";


                        //Splitter.ItemStyle.CssClass = "tableSplitter";
                        Splitter.HeaderStyle.CssClass = "tableSplitter";

                        TemplateField InfCol = new TemplateField();
                        InfCol.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
                        if (customField.Length > RowNum && customField[RowNum] != "")
                        {
                            tempCustomField = customField[RowNum].ToString();
                        }

                        if (replaceField.Length > RowNum && replaceField[RowNum] != "")
                        {
                            tempReplaceField = replaceField[RowNum].ToString();
                        }

                        if (sqlFieldType.Length > RowNum && sqlFieldType[RowNum] != null && sqlFieldType[RowNum].ToString() == "3")
                        {
                            string[] optValues = sqlOptions[RowNum].Split('|');
                            for (int optValue = 0; optValue < optValues.Length; optValue++)
                            {
                                if (tempReplaceField != "")
                                {
                                    tempReplaceField += "|";
                                }
                                if (optValues[optValue].Contains("Languages2:"))
                                {
                                    tempReplaceField += (optValue + 1).ToString() + "=" + Languages2.MyText(optValues[optValue].Replace("Languages2:", ""));
                                }
                                else
                                {
                                    tempReplaceField += (optValue + 1).ToString() + "=" + optValues[optValue];
                                }
                            }
                        }

                        if (sqlFieldType.Length > RowNum && sqlFieldType[RowNum] != null && sqlFieldType[RowNum].ToString() == "2")
                        {
                            tempReplaceField = "1=" + Languages2.MyText("general_Yes") + "|0=" + Languages2.MyText("general_No") + "";
                        }


                        if (sqlFieldType.Length > RowNum && sqlFieldType[RowNum] != null && sqlFieldType[RowNum].ToString() == "20")
                        {
                            string mysrc = "";
                            string[] optValues = sqlOptions[RowNum].Split('|');
                            if (optValues.Length > 0)
                            {
                                mysrc = "src=\"" + optValues[0] + "\"";

                            }
                            if (optValues.Length > 1)
                            {


                            }
                            if (optValues.Length > 2)
                            {

                            }
                            //string mytable= "<table  cellpadding=\"0\" cellspacing=\"0\" dir=\""+Languages2.MyText("General_DirectionLtr")+"\" style=\"margin:auto; width:750px;\" >";
                            //mytable += "<tr><td class=\"longLTCell2\"><div></div></td>";
                            //mytable += "<td style=\"height:7px;font-size:1px; background-image:url('images/longTopCell2.gif'); background-repeat:repeat-x\">&nbsp;</td>";
                            //mytable += "<td class=\"longRTCell2\"><div></div></td></tr><tr><td class=\"longLeft\"></td><td  class=\"EditNewsAdvTD\" style=\"background:white;\">";

                            //mytable += "  <iframe frameBorder=\"0\" class=\"iframeClass\" width=\"725\" height=\"400\" " + mysrc + " ></iframe>";

                            //mytable += "</td><td class=\"longRight\"></td></tr><tr><td class=\"longLBCell2\"><div></div></td>";
                            //mytable +="<td style=\"height:7px;font-size:1px; background-image:url('images/longBottomCell.gif'); background-repeat:repeat-x\">&nbsp;</td>";
                            //mytable += "<td class=\"longRBCell2\"><div></div></td></tr></table>";

                            //tempCustomField = "<div style=\"position:relative;\" ><image style=\"cursor:pointer;\"  onclick=\"opendiv(this);\" src=\"images/icons/Folder2.png\" ><div class=\"framopen\" ><img onclick=\"$(this).parent().prev().click();\" class=\"cleartable\" src=\"images/delete.gif\" />" + mytable + "</div></div>";
                            maxTextLength = 2551;

                        }


                        if (sqlFieldNamesClean[RowNum].ToLower().Contains(" as "))
                        {
                            sqlFieldNamesClean[RowNum] = sqlFieldNamesClean[RowNum].Substring(sqlFieldNamesClean[RowNum].ToLower().LastIndexOf(" as ") + 4);
                        }

                        if (sqlFieldType.Length > RowNum && sqlFieldType[RowNum] != null && sqlFieldType[RowNum].ToString() == "20")
                        { }
                        else
                        {
                            InfCol.ItemTemplate = new GridViewTemplate1("TextAreaItem", sqlFieldNamesClean[RowNum].Trim(), tempCustomField, tempReplaceField, TblName, maxTextLength);
                        }
                        if (tblHeaderNames.Length > RowNum && tblHeaderNames[RowNum] != "")
                        {
                            string HeaderText = tblHeaderNames[RowNum];
                            if (HeaderText.Contains("Languages2:"))
                            {
                                HeaderText = Languages2.MyText(tblHeaderNames[RowNum].Replace("Languages2:", ""));
                            }
                            GridViewTemplate1 HeaderTemplate = new GridViewTemplate1("Header", HeaderText, sqlFieldNamesClean[RowNum].Trim(), "", TblName, maxTextLength);
                            HeaderTemplate.HeaderBtnClick += HeaderBtn_Click;
                            InfCol.HeaderTemplate = HeaderTemplate;
                        }


                        GridView1.Columns.Add(InfCol);
                        GridView1.Columns.Add(Splitter);
                    }
                    else
                    {

                        if (sqlFieldNamesClean[RowNum].ToLower().Contains(" as "))
                        {
                            sqlFieldNamesClean[RowNum] = sqlFieldNamesClean[RowNum].Substring(sqlFieldNamesClean[RowNum].ToLower().LastIndexOf(" as ") + 4);
                        }
                    }
                }
                else
                {
                    string tempCustomField = "";
                    string tempReplaceField = "";
                    TemplateField Splitter = new TemplateField();
                    Splitter.HeaderText = "<img src=\"images/tableTopLine.gif\">";

                    TemplateField InfCol = new TemplateField();
                    InfCol.HeaderStyle.HorizontalAlign = HorizontalAlign.Center;
                    if (customField.Length > RowNum && customField[RowNum] != "")
                    {
                        tempCustomField = customField[RowNum].ToString();
                    }

                    if (replaceField.Length > RowNum && replaceField[RowNum] != "")
                    {
                        tempReplaceField = replaceField[RowNum].ToString();
                    }

                    InfCol.ItemTemplate = new GridViewTemplate1("TextAreaItem", MyReader.GetName(RowNum + 1), tempCustomField, tempReplaceField, TblName, maxTextLength);

                    if (tblHeaderNames.Length > RowNum && tblHeaderNames[RowNum] != "" && tblHeaderNames.Length > 0)
                    {
                        string HeaderText = tblHeaderNames[RowNum];
                        if (HeaderText.Contains("Languages2:"))
                        {
                            HeaderText = Languages2.MyText(tblHeaderNames[RowNum].Replace("Languages2:", ""));
                        }
                        GridViewTemplate1 HeaderTemplate = new GridViewTemplate1("Header", HeaderText, sqlFieldNamesClean[RowNum].Trim(), "", TblName, maxTextLength);
                        HeaderTemplate.HeaderBtnClick += HeaderBtn_Click;
                        InfCol.HeaderTemplate = HeaderTemplate;
                    }




                    GridView1.Columns.Add(InfCol);
                    GridView1.Columns.Add(Splitter);
                }
                if (sqlFieldNamesClean[RowNum].ToLower().Contains(" as "))
                {
                    sqlFieldNamesClean[RowNum] = sqlFieldNamesClean[RowNum].Substring(sqlFieldNamesClean[RowNum].ToLower().LastIndexOf(" as ") + 4);
                }
            }

            if (GridView1.Columns.Count > 1)
            {
                GridView1.Columns.Remove(GridView1.Columns[GridView1.Columns.Count - 1]);
            }


            TemplateField ShowCol = new TemplateField();
            ShowCol.ItemStyle.CssClass = "hideshowdivclassTd";
            GridViewTemplate1 GridViewTemplateShow = new GridViewTemplate1("ShowItem", IdField, "", "", TblName, 0);
            ShowCol.ItemTemplate = GridViewTemplateShow;
            GridView1.Columns.Add(ShowCol);


            if (orderField != "")
            {
                TemplateField Splitter = new TemplateField();
                Splitter.HeaderText = "<img src=\"images/tableTopLine.gif\">";
                GridView1.Columns.Add(Splitter);

                TemplateField OrderCol = new TemplateField();

                GridViewTemplate1 HeaderTemplate = new GridViewTemplate1("Header", Languages2.MyText("general_order"), orderField, "", TblName, maxTextLength);
                HeaderTemplate.HeaderBtnClick += HeaderBtn_Click;
                OrderCol.HeaderTemplate = HeaderTemplate;
                GridViewTemplate1 GridViewTemplateOrder = new GridViewTemplate1("OrderItem", orderField, IdField, "", TblName, maxTextLength);
                GridViewTemplateOrder.UpClick += ReorderClickUp;
                GridViewTemplateOrder.DnClick += ReorderClickDn;
                OrderCol.ItemTemplate = GridViewTemplateOrder;

                GridView1.Columns.Add(OrderCol);
            }







            if (EditUrl != "")//adding the edit Field
            {
                TemplateField EditCol = new TemplateField();
                GridViewTemplate1 GridViewTemplateEdit = new GridViewTemplate1("EditItem", IdField, IdField, EditUrl, TblName, maxTextLength); ;
                if (editTitle != "")
                {

                    GridViewTemplateEdit = new GridViewTemplate1("EditItem", IdField, IdField, EditUrl, TblName, maxTextLength, editTitle);
                }
                GridViewTemplateEdit.EditClick += ClickEdit;
                EditCol.ItemTemplate = GridViewTemplateEdit;

                GridView1.Columns.Add(EditCol);
            }


            TemplateField LeftCol = new TemplateField();
            LeftCol.ItemStyle.CssClass = "tableLeft";
            LeftCol.HeaderStyle.CssClass = "tableTopLeft";
            LeftCol.FooterStyle.CssClass = "tableBottomLeft";
            LeftCol.HeaderText = "<div class=\"tableTopLeft\"></div>";
            LeftCol.HeaderStyle.VerticalAlign = VerticalAlign.Top;
            LeftCol.FooterText = "<div class=\"tableBottomLeft\"></div>";
            GridView1.Columns.Add(LeftCol);

            SqlDataSource1.SelectCommand = viewSql;
            //GridView1.DataSource = MyReader;
            GridView1.DataBind();
            MyReader.Close();
            //	ErrorMsg.Text = sql;
            con.Close();
        }


        string checkAllImg = "images/SelectOn.png";
        if (checkedImg != "")
        {
            checkAllImg = checkedImg;
        }
        ScriptManager.RegisterClientScriptBlock(MainUP, typeof(UpdatePanel), "CheckAllImg" + controlID, "var CheckAllImg" + controlID + " ='" + checkAllImg + "';", true);


        if (isSelectField && IsSelectAll)
        {
            if (GridView1.FooterRow != null && GridView1.Rows.Count > 0)
            {
                GridView1.Columns[1].HeaderText = "<a id=\"checkAllBtn" + controlID + "\" href=\"javascript:checkAll('" + controlID + "')\" style=\"color:#ffffff; text-decoration:none; border:none;\"><img src=\"images/SelectOff.png\" style=\"vertical-align:middle; border:none\" alt=\"" + Languages2.MyText("general_Select all in this page") + "\" /></a>";
                GridView1.Columns[1].HeaderStyle.HorizontalAlign = HorizontalAlign.Right;
                GridView1.Columns[1].HeaderText += "<a id=\"uncheckAllBtn" + controlID + "\" href=\"javascript:uncheckAll('" + controlID + "')\" style=\"color:#ffffff; text-decoration:none; border:none; display:none\"><img src=\"" + checkAllImg + "\" style=\"vertical-align:middle; border:none;\" alt=\"" + Languages2.MyText("general_Clear Selection") + "\" /></a>";
                //GridView1.FooterRow.Cells[1].Controls.Add(UnSelAllBtn);
            }

        }


        if (orderField != "")
        {
            if (GridView1.Rows.Count > 0)
            {
                if (editUrl == "")
                {
                    GridView1.Rows[GridView1.Rows.Count - 1].Cells[GridView1.Rows[GridView1.Rows.Count - 1].Cells.Count - 2].Controls[1].Visible = false;
                }
                else
                {
                    GridView1.Rows[GridView1.Rows.Count - 1].Cells[GridView1.Rows[GridView1.Rows.Count - 1].Cells.Count - 3].Controls[1].Visible = false;
                }

            }
        }





    }

    public void ReCreate()
    {
        GridView1.Columns.Clear();
        CreateTable();
    }


    protected void ReorderClickUp(string Table_Field_Order_KeyName)
    {
        string[] OrderArray = Table_Field_Order_KeyName.Split('_');
        if (OrderArray.Length == 4)
        {
            string Table = OrderArray[0];
            string Field = OrderArray[1];
            int order;
            int keyName;
            if (int.TryParse(OrderArray[2], out order) && int.TryParse(OrderArray[3], out keyName))
            {
                using (MySqlConnection con = new MySqlConnection(ConnStr))
                {
                    con.Open();
                    MySqlCommand cmd = new MySqlCommand();
                    cmd.Connection = con;
                    if (SqlWhereQuery == "")
                    {
                        cmd.CommandText = "UPDATE " + Table + " SET " + Field + "=(" + Field + "+1) WHERE " + Field + "=" + (order - 1);
                        cmd.ExecuteNonQuery();

                        cmd.CommandText = "UPDATE " + Table + " SET " + Field + "=" + (order - 1) + " WHERE " + IdField + "=" + keyName;
                        cmd.ExecuteNonQuery();
                    }
                    else
                    {

                        cmd.CommandText = "UPDATE " + Table + " SET " + Field + "=(" + Field + "+1) WHERE " + Field + "=" + (order - 1) + " AND " + SqlWhereQuery;
                        cmd.ExecuteNonQuery();

                        cmd.CommandText = "UPDATE " + Table + " SET " + Field + "=" + (order - 1) + " WHERE " + IdField + "=" + keyName + " AND " + SqlWhereQuery;
                        cmd.ExecuteNonQuery();


                    }




                    con.Close();
                }
                GridView1.Columns.Clear();
                CreateTable();
            }

        }
    }

    protected void ClickEdit(string Table_Field_Order_KeyName)
    {
        string[] OrderArray = Table_Field_Order_KeyName.Split('_');
        if (OrderArray.Length == 4)
        {
            Response.Redirect(editUrl.Replace("{table}", OrderArray[0]).Replace("{field}", OrderArray[3]));
        }
    }

    protected void ClickDel(string Table_Field_Order_KeyName)
    {
        ItemDeleted += DummyItemDel;
        ItemDeleting += DummyItemDeleting;

        string[] OrderArray = Table_Field_Order_KeyName.Split('_');
        if (OrderArray.Length == 4)
        {
            string Table = OrderArray[0];
            string Field = OrderArray[1];
            int order;
            int keyName;
            string[] splitter = { "where" };
            string[] TableArr = Table.ToLower().Split(splitter, StringSplitOptions.None);
            if (int.TryParse(OrderArray[2], out order) && int.TryParse(OrderArray[3], out keyName))
            {
                using (MySqlConnection con = new MySqlConnection(ConnStr))
                {
                    con.Open();
                    MySqlCommand cmd = new MySqlCommand();
                    cmd.Connection = con;



                    if (orderField != "")
                    {
                        int CurrentOrder = 0;
                        cmd.CommandText = "SELECT " + orderField + " AS CurrentOrder FROM " + TableArr[0] + " WHERE " + IdField + "=" + keyName;
                        MyReader = cmd.ExecuteReader();
                        if (MyReader.Read())
                        {
                            int.TryParse(MyReader["CurrentOrder"].ToString(), out CurrentOrder);
                        }
                        MyReader.Close();
                        if (CurrentOrder > 0)
                        {

                            string werecommnds = "";
                            if (sqlWhereQuery != "")
                            {
                                werecommnds = " And " + sqlWhereQuery;

                            }
                            cmd.CommandText = "UPDATE " + TableArr[0] + " SET " + orderField + " = " + orderField + "-1 WHERE " + orderField + ">" + CurrentOrder + werecommnds;
                            cmd.ExecuteNonQuery();

                        }
                    }


                    if (DelCommand == "")
                    {
                        cmd.CommandText = "DELETE FROM " + Table + " WHERE " + IdField + "=" + keyName;
                        if (SqlWhereQuery != "")
                        {
                            cmd.CommandText += " AND " + SqlWhereQuery;
                        }
                    }
                    else
                    {
                        if (DelCommand.Contains("{1}") || DelCommand.Contains("{2}"))
                        {
                            cmd.CommandText = DelCommand.Replace("{0}", Table).Replace("{1}", " WHERE " + IdField + "=" + keyName + " AND " + SqlWhereQuery).Replace("{2}", keyName.ToString());
                        }
                        else
                        {
                            if (SqlWhereQuery != "")
                            {
                                cmd.CommandText = DelCommand.Replace("{0}", Table) + " WHERE " + IdField + "=" + keyName + " AND " + SqlWhereQuery;
                            }
                            else
                            {
                                cmd.CommandText = DelCommand.Replace("{0}", Table) + " WHERE " + IdField + "=" + keyName;
                            }
                        }
                    }
                    string[] DelID = { keyName.ToString() };
                    ItemDeleting(DelID, ref CancelDelete);
                    if (!CancelDelete)
                    {
                        cmd.ExecuteNonQuery();

                        ItemDeleted(DelID);
                    }
                    con.Close();
                }
                GridView1.Columns.Clear();
                CreateTable();
            }
        }
    }



    protected void ReorderClickDn(string Table_Field_Order_KeyName)
    {
        string[] OrderArray = Table_Field_Order_KeyName.Split('_');
        if (OrderArray.Length == 4)
        {
            string Table = OrderArray[0];
            string Field = OrderArray[1];
            int order;
            int keyName;
            if (int.TryParse(OrderArray[2], out order) && int.TryParse(OrderArray[3], out keyName))
            {
                using (MySqlConnection con = new MySqlConnection(ConnStr))
                {
                    con.Open();
                    MySqlCommand cmd = new MySqlCommand();
                    cmd.Connection = con;

                    if (SqlWhereQuery == "")
                    {
                        cmd.CommandText = "UPDATE " + Table + " SET " + Field + "=(" + Field + "-1) WHERE " + Field + "=" + (order + 1);
                        cmd.ExecuteNonQuery();

                        cmd.CommandText = "UPDATE " + Table + " SET " + Field + "=" + (order + 1) + " WHERE " + IdField + "=" + keyName;
                        cmd.ExecuteNonQuery();
                    }
                    else
                    {
                        cmd.CommandText = "UPDATE " + Table + " SET " + Field + "=(" + Field + "-1) WHERE " + Field + "=" + (order + 1) + " AND " + SqlWhereQuery;
                        cmd.ExecuteNonQuery();

                        cmd.CommandText = "UPDATE " + Table + " SET " + Field + "=" + (order + 1) + " WHERE " + IdField + "=" + keyName + " AND " + SqlWhereQuery;
                        cmd.ExecuteNonQuery();

                    }

                    con.Close();
                }
                GridView1.Columns.Clear();
                CreateTable();
            }
        }
    }

    public void HeaderBtn_Click(string HeaderCol)
    {
        if (HeaderCol.ToLower().Contains(" as "))
        {
            HeaderCol = HeaderCol.Substring(HeaderCol.ToLower().LastIndexOf(" as ") + 4);
        }

        if (!HeaderCol.StartsWith("`") || !HeaderCol.EndsWith("`"))
        { HeaderCol = "`" + HeaderCol + "`"; }

        //AddChecked();
        if (SortBy == HeaderCol || SortBy == HeaderCol + " ASC")
        {
            SortBy = HeaderCol + " DESC";
            SortByHid.Value = SortBy;
        }
        else
        {
            SortBy = HeaderCol + " ASC";
            SortByHid.Value = SortBy;
        }
        GridView1.Columns.Clear();
        CreateTable();
    }



    protected void GridView1_DataBinding(object sender, EventArgs e)
    {




        if (CountSql == "")
        {
            if (sql.Length > 6 && CountSql == "")
            {
                string tempIDField = idField;
                if (tempIDField.ToLower().Contains(" as "))
                {
                    tempIDField = tempIDField.Remove(tempIDField.ToLower().IndexOf(" as "));
                }
                CountSql = "SELECT COUNT(" + tempIDField + ") AS ResCount, " + sql.Trim().Remove(0, 6);
                if (sql.Contains("FROM"))
                {
                    CountSql2 = "SELECT COUNT(" + tempIDField + ") AS ResCount " + sql.Remove(0, sql.LastIndexOf("FROM"));
                }

            }
        }
        if (CountSql != "")
        {
            using (MySqlConnection con = new MySqlConnection(ConnStr))
            {
                con.Open();
                MySqlCommand cmd = new MySqlCommand(CountSql2, con);
                try
                {
                    MyReader = cmd.ExecuteReader();
                }
                catch
                {
                    cmd.CommandText = CountSql;
                    MyReader = cmd.ExecuteReader();
                }

                if (MyReader.Read())
                {
                    int.TryParse(MyReader["ResCount"].ToString(), out ResCount);

                    pageCont = (ResCount / MaxResPerPage);
                    if (pageCont < currentPageNum)
                    {
                        currentPageNum = pageCont;
                    }

                    if (ResCount % MaxResPerPage > 0)
                    {
                        pageCont++;
                    }

                    if (currentPageNum > 0)
                    {
                        PrevBtn.Visible = true;
                    }
                    else
                    {
                        PrevBtn.Visible = false;
                    }


                    if (currentPageNum < pageCont - 1)
                    {
                        NextBtn.Visible = true;
                    }
                    else
                    {
                        NextBtn.Visible = false;
                    }

                    if (pageCont == 1)
                    {
                        PagingTable.Visible = false;
                    }


                    Label ResCountLbl = new Label();
                    LinkButton DelSelected = new LinkButton();
                    if (DelImgLocation != "")
                        DelSelected.Text = "<img src=\"" + DelImgLocation + "\" style=\"vertical-align:middle; border:none\" alt=\"\" /> ";
                    else
                        DelSelected.Text = "<img src=\"images/DelOn.png\" style=\"vertical-align:middle; border:none\" alt=\"\" /> ";

                    if (delAllLabel != "")
                        DelSelected.Text += delAllLabel;
                    else
                        DelSelected.Text += Languages2.MyText("general_Delete Selected");
                    if (delAllConfirmationText != "")
                        DelSelected.OnClientClick = "javascript:return confirm('" + delAllConfirmationText + "')";
                    else
                        DelSelected.OnClientClick = "javascript:return confirm('" + Languages2.MyText("general_Are you sure you want to delete all the selected entries?") + "')";
                    DelSelected.Attributes["style"] = "color:#ffffff; text-decoration:none; border:none";
                    DelSelected.Command += DelSelected_Command;
                    ResCountLbl.Text = "&nbsp;&nbsp;" + Languages2.MyText("general_Sum") + ":" + ResCount + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
                    if (GridView1.FooterRow != null && GridView1.Rows.Count > 0)
                    {
                        GridView1.FooterRow.VerticalAlign = VerticalAlign.Middle;
                        GridView1.FooterRow.Cells[1].Controls.Add(ResCountLbl);

                        if (isDelField == true && isSelectField == true)
                        {
                            GridView1.FooterRow.Cells[1].Controls.Add(DelSelected);
                        }

                        for (int i = 2; i < GridView1.Rows[0].Cells.Count - 1; i++)
                        {
                            GridView1.FooterRow.Cells.Remove(GridView1.FooterRow.Cells[2]);

                        }
                        GridView1.FooterRow.Cells[1].ColumnSpan = GridView1.Rows[0].Cells.Count - 2;
                    }
                }
                con.Close();
            }
        }

        numFound = ResCount;

        if (ResCount == 0)
        {
            NotFoundDiv.Visible = true;
            PagingTable.Visible = false;
            GridView1.Visible = false;
            exportToXlsBtn.Visible = false;
            MaxResDiv.Visible = false;
            if (SearchHid.Value == "")
                SearchPanel.Visible = false;
        }
        else
        {
            NotFoundDiv.Visible = false;
            if (pageCont > 1)
            {
                PagingTable.Visible = true;
            }
            GridView1.Visible = true;
            if (isExcelExportable)
                exportToXlsBtn.Visible = true;
            MaxResDiv.Visible = true;

            if (IsSearch == false)
            {
                SearchPanel.Visible = false;
            }
            else
            {
                SearchPanel.Visible = true;
            }
        }

        if (orderField != "")
        {
            if (GridView1.Rows.Count > 0)
            {
                if (editUrl == "")
                {
                    GridView1.Rows[GridView1.Rows.Count - 1].Cells[GridView1.Rows[GridView1.Rows.Count - 1].Cells.Count - 2].Controls[1].Visible = false;
                }
                else
                {
                    GridView1.Rows[GridView1.Rows.Count - 1].Cells[GridView1.Rows[GridView1.Rows.Count - 1].Cells.Count - 3].Controls[1].Visible = false;
                }

            }
        }
        //ErrorMsg.Text = SelectedValsHid.Value + "<br />" + AllValsHid.Value;
    }

    protected void SelAllBtn_Click(object sender, EventArgs e)
    {


        string SelAllSql = "SELECT " + idField + " FROM " + tblName;

        if (SqlWhereQuery != "" || SearchHid.Value != "")
        {
            if (SearchHid.Value != "")
            {
                if (sqlWhereQuery != "")
                {
                    SelAllSql += " WHERE " + SqlWhereQuery + SearchHid.Value;
                }
                else
                {
                    SelAllSql += " WHERE " + SqlWhereQuery + SearchHid.Value.Substring(SearchHid.Value.IndexOf("AND") + 3);
                }
            }
            else
            {
                SelAllSql += " WHERE " + SqlWhereQuery;
            }
        }

        if (SqlGroupBy != "")
        {
            SelAllSql += " GROUP BY " + SqlGroupBy + " ";
        }

        using (MySqlConnection con = new MySqlConnection(ConnStr))
        {
            con.Open();

            MySqlCommand cmd = new MySqlCommand(SelAllSql, con);
            try
            {
                MyReader = cmd.ExecuteReader();
            }
            catch
            {
                return;
            }

            //SelectedValsHid.Value = "";
            //while (MyReader.Read())
            //{
            //    SelectedValsHid.Value += "," + MyReader[idField.Replace("`","")].ToString();
            //}
            //if(SelectedValsHid.Value.Length>0 && SelectedValsHid.Value.StartsWith(","))
            //{
            //    SelectedValsHid.Value.Remove(0, 1);
            //}
            con.Close();
        }
        //AddChecked();
        ReCreate();
    }


    protected void UnSelAllBtn_Click(object sender, EventArgs e)
    {
        SelectedValsHid.Value = "";
        ReCreate();
    }

    protected void Page_DataBound(object sender, EventArgs e)
    {

    }



    protected void exportToXls(object sender, EventArgs e)
    {
        ArrayList headers = new ArrayList();
        ArrayList headersID = new ArrayList();
        string newFileName = "SendMsg_" + DateTime.Now.ToString("dd_MM_yyyy_HH-mm-ss") + ".xls";


        for (int i = 0; i < sqlFieldNamesClean.Length; i++)
        {
            if (sqlFieldType.Length > i && sqlFieldType.Length != 0)
            {
                if (sqlFieldNamesClean[i].Contains("getnewsletter"))
                {
                    string bla = "";
                }
                headersID.Add(sqlFieldNamesClean[i].Trim());
                if (tblHeaderNames.Length >= i)
                {
                    string HeaderText = tblHeaderNames[i];
                    if (HeaderText.Contains("Languages2:"))
                    {
                        HeaderText = Languages2.MyText(tblHeaderNames[i].Replace("Languages2:", ""));
                    }
                    if (!headers.Contains(HeaderText) && HeaderText.Trim() != "")
                    {
                        headers.Add(HeaderText);
                    }
                    else
                    {
                        headers.Add(HeaderText + "_" + i);
                    }
                }
            }
            else
            {
                headersID.Add(sqlFieldNamesClean[i].Trim());
                if (tblHeaderNames.Length >= i)
                {
                    string HeaderText = tblHeaderNames[i];
                    if (HeaderText.Contains("Languages2:"))
                    {
                        HeaderText = Languages2.MyText(tblHeaderNames[i].Replace("Languages2:", ""));
                    }
                    if (!headers.Contains(HeaderText))
                    {
                        headers.Add(HeaderText);
                    }
                    else
                    {
                        headers.Add(HeaderText + "_" + i);
                    }
                }
                else
                {
                    if (!headers.Contains(sqlFieldNamesClean[i].Trim()))
                    {
                        headers.Add(sqlFieldNamesClean[i].Trim());
                    }
                    else
                    {
                        headers.Add(sqlFieldNamesClean[i].Trim() + "_" + i);
                    }
                }
            }
        }

        if (!Directory.Exists(MapPath(".\\uploads") + "\\site" + Session["siteID"].ToString()))
        {
            Directory.CreateDirectory(MapPath(".\\uploads") + "\\site" + Session["siteID"].ToString());
        }

        string[] fileNames = Directory.GetFiles(MapPath("./uploads") + "/site" + Session["siteID"].ToString(), "SendMsg_*.*");
        foreach (string fileName in fileNames)
        {
            FileInfo excelOldBook = new FileInfo(fileName);
            try
            {
                if (excelOldBook.CreationTime < DateTime.Now.AddDays(-2))
                { excelOldBook.Delete(); }
            }
            catch
            {

            }
        }

        string connectionString = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=\"" + MapPath(".\\uploads") + "\\site" + Session["siteID"].ToString() + "\\" + newFileName + "\";Extended Properties=\"Excel 8.0;HDR=YES;\"";

        DirectoryInfo dir = new DirectoryInfo(MapPath(".\\uploads") + "\\site" + Session["siteID"].ToString());
        if (!dir.Exists)
        {
            Directory.CreateDirectory(MapPath(".\\uploads") + "\\site" + Session["siteID"].ToString());
        }

        string insrertString = "";
        ArrayList allValues = new ArrayList();
        List<string> allParams = new List<string>();
        using (MySqlConnection con = new MySqlConnection(ConnStr))
        {
            con.Open();
            MySqlCommand cmd = new MySqlCommand(sql, con);

            MyReader = cmd.ExecuteReader();

            string allNames = "";

            int counetr = 0;

            while (MyReader.Read())
            {
                if (counetr == 60000)//if there are more than 60,000 rows, uses XLSX (xls doesn't support more than 64,000 rows)
                {
                    newFileName = "SendMsg_" + DateTime.Now.ToString("dd_MM_yyyy_HH-mm-ss") + ".xlsx";
                    connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=\"" + MapPath(".\\uploads") + "\\site" + Session["siteID"].ToString() + "\\" + newFileName + "\"; Extended Properties=\"Excel 12.0 Xml;HDR=YES;\"";
                }
                counetr++;
                List<string> values = new List<string>();
                for (int i = 0; i < headersID.Count; i++)
                {
                    if (fieldsToExport.Length != 0)
                    {
                        if (fieldsToExport.Length > i && fieldsToExport[i].Trim() == "1")
                        {
                            if (sqlFieldType.Length > i && sqlFieldType.Length != 0)
                            {
                                if (sqlFieldType[i].ToString() != "4" && sqlFieldType[i].ToString() != "9")
                                {
                                    switch (sqlFieldType[i].ToString())
                                    {
                                        case "1":
                                            if (counetr == 1)
                                            {
                                                if (allNames != "")
                                                {
                                                    allNames += ",";
                                                }
                                                allNames += "`" + headers[i].ToString().Replace("'", "").Replace(".", "").Replace("!", "").Replace("[", "(").Replace("]", ")").Trim() + "`";
                                                allParams.Add("@col" + i);
                                            }

                                            values.Add(MyReader[headersID[i].ToString().Trim().Replace("`", "")].ToString());

                                            break;
                                        case "2":
                                            if (counetr == 1)
                                            {
                                                if (allNames != "")
                                                {
                                                    allNames += ",";
                                                }
                                                allNames += "`" + headers[i].ToString().Replace("'", "").Replace(".", "").Replace("!", "").Replace("[", "(").Replace("]", ")").Trim() + "`";
                                                allParams.Add("@col" + i);
                                            }
                                            if (MyReader[headersID[i].ToString().Trim().Replace("`", "")].ToString() == "1")
                                            { values.Add(Languages2.MyText("general_Yes")); }
                                            else
                                            { values.Add(Languages2.MyText("general_No")); }
                                            break;
                                        case "3":
                                            int optValue = 0;
                                            if (counetr == 1)
                                            {
                                                if (allNames != "")
                                                {
                                                    allNames += ",";
                                                }
                                                allNames += "`" + headers[i].ToString().Replace("'", "").Replace(".", "").Replace("!", "").Replace("[", "(").Replace("]", ")").Trim() + "`";
                                                allParams.Add("@col" + i);
                                            }

                                            if (sqlOptions.Length > i && int.TryParse(MyReader[headersID[i].ToString().Trim().Replace("`", "")].ToString(), out optValue))
                                            {
                                                string[] optValues = sqlOptions[i].Split('|');
                                                if (optValues.Length > optValue - 1 && optValue > 0)
                                                {
                                                    if (optValues[optValue - 1].Contains("Languages2:"))
                                                    {
                                                        values.Add(Languages2.MyText(optValues[optValue - 1].Replace("Languages2:", "")));
                                                    }
                                                    else
                                                    {
                                                        values.Add(optValues[optValue - 1]);
                                                    }
                                                }
                                                else
                                                    values.Add("null");
                                            }
                                            else
                                            {
                                                values.Add("null");
                                            }

                                            break;
                                        case "4": break;
                                        case "5": break;
                                        case "6":
                                            if (counetr == 1)
                                            {
                                                if (allNames != "")
                                                {
                                                    allNames += ",";
                                                }
                                                allNames += "`" + headers[i].ToString().Replace("'", "").Replace(".", "").Replace("!", "").Replace("[", "(").Replace("]", ")").Trim() + "`";
                                                allParams.Add("@col" + i);
                                            }

                                            string[] valuesArr = MyReader[headersID[i].ToString().Trim().Replace("`", "")].ToString().Replace("'", "''").Split(' ');
                                            values.Add(valuesArr[0]);
                                            break;
                                        case "7": goto case "1";
                                        case "8":
                                            if (counetr == 1)
                                            {
                                                if (allNames != "")
                                                {
                                                    allNames += ",";
                                                }
                                                allNames += "`" + headers[i].ToString().Replace("'", "").Replace(".", "").Replace("!", "").Replace("[", "(").Replace("]", ")").Trim() + "`";
                                                allParams.Add("@col" + i);
                                            }

                                            values.Add(MyReader[headersID[i].ToString().Trim().Replace("`", "")].ToString());
                                            break;
                                        case "9": break;
                                        default:
                                            if (counetr == 1)
                                            {
                                                if (allNames != "")
                                                {
                                                    allNames += ",";
                                                }
                                                allNames += "`" + headers[i].ToString().Replace("'", "").Replace(".", "").Replace("!", "").Replace("[", "(").Replace("]", ")").Trim() + "`";
                                                allParams.Add("@col" + i);
                                            }

                                            values.Add(MyReader[headersID[i].ToString().Trim().Replace("`", "")].ToString());
                                            break;
                                    }
                                }
                            }
                            else
                            {
                                if (counetr == 1)
                                {
                                    if (allNames != "")
                                    {
                                        allNames += ",";
                                    }
                                    allNames += "`" + headers[i].ToString().Replace("'", "").Replace(".", "").Replace("!", "").Replace("[", "(").Replace("]", ")").Trim() + "`";
                                    allParams.Add("@col" + i);
                                }

                                values.Add(MyReader[headersID[i].ToString().Trim().Replace("`", "")].ToString());

                            }
                        }
                    }
                    else
                    {
                        if (counetr == 1)
                        {
                            if (allNames != "")
                            {
                                allNames += ",";
                            }
                            allNames += "`" + headers[i].ToString().Replace("'", "").Replace(".", "").Replace("!", "").Replace("[", "(").Replace("]", ")").Trim() + "`";
                            allParams.Add("@col" + i);
                        }

                        values.Add(MyReader[headersID[i].ToString().Trim().Replace("`", "")].ToString());
                    }
                }


                //allValues += "(" + values + ")";
                if (counetr == 1)
                {
                    string joinedParams = string.Join(",", allParams.ToArray());
                    insrertString = "INSERT INTO MySheet values (" + joinedParams + ");";
                }

                allValues.Add(values);


                //ErrorMsg.Text = comm.CommandText;
            }
            MyReader.Close();

            con.Close();
        }


        using (OleDbConnection excelConnection = new OleDbConnection(connectionString))
        {
            OleDbCommand comm = new OleDbCommand();

            excelConnection.Open(); // this will open excel file
            comm.Connection = excelConnection;

            comm.CommandText = "Create Table MySheet (";

            for (int x = 0; x < headers.Count; x++)
            {
                if (fieldsToExport.Length != 0)
                {
                    if (fieldsToExport.Length > x && fieldsToExport[x].Trim() == "1")
                    {
                        if (sqlFieldType.Length > x && sqlFieldType.Length > 0)
                        {
                            if (sqlFieldType[x].ToString() != "4" && sqlFieldType[x].ToString() != "9")
                            {

                                switch (sqlFieldType[x].ToString())
                                {
                                    case "1":
                                        if (comm.CommandText != "Create Table MySheet (")
                                        {
                                            comm.CommandText += ",";
                                        }
                                        comm.CommandText += "`" + headers[x].ToString().Replace("'", "").Replace(".", "").Replace("!", "").Replace("[", "(").Replace("]", ")").Trim() + "`" + " memo";
                                        break;
                                    case "2": goto case "1";
                                    case "3": goto case "1";
                                    case "4": break;
                                    case "5": break;
                                    case "6":
                                        if (comm.CommandText != "Create Table MySheet (")
                                        {
                                            comm.CommandText += ",";
                                        }
                                        comm.CommandText += "`" + headers[x].ToString().Replace("'", "").Replace(".", "").Replace("!", "").Replace("[", "(").Replace("]", ")").Trim() + "`" + " memo";
                                        break;
                                    case "7":
                                        if (comm.CommandText != "Create Table MySheet (")
                                        {
                                            comm.CommandText += ",";
                                        }
                                        comm.CommandText += "`" + headers[x].ToString().Replace("'", "").Replace(".", "").Replace("!", "").Replace("[", "(").Replace("]", ")").Trim() + "`" + " memo";
                                        break;
                                    case "8":
                                        if (comm.CommandText != "Create Table MySheet (")
                                        {
                                            comm.CommandText += ",";
                                        }
                                        comm.CommandText += "`" + headers[x].ToString().Replace("'", "").Replace(".", "").Replace("!", "").Replace("[", "(").Replace("]", ")").Trim() + "`" + " memo";
                                        break;
                                    case "9": break;
                                    default:
                                        if (comm.CommandText != "Create Table MySheet (")
                                        {
                                            comm.CommandText += ",";
                                        }
                                        comm.CommandText += "`" + headers[x].ToString().Replace("'", "").Replace(".", "").Replace("!", "").Replace("[", "(").Replace("]", ")").Trim() + "`" + " char(255)";
                                        break;
                                }
                            }
                        }
                        else
                        {
                            if (comm.CommandText != "Create Table MySheet (")
                            {
                                comm.CommandText += ",";
                            }
                            comm.CommandText += "`" + headers[x].ToString().Replace("'", "").Replace(".", "").Replace("!", "").Replace("[", "(").Replace("]", ")").Trim() + "`" + " char(255)";
                        }
                    }
                }
                else
                {
                    if (sqlFieldType.Length > x && sqlFieldType.Length > 0)
                    {
                        if (sqlFieldType[x].ToString() != "4" && sqlFieldType[x].ToString() != "9")
                        {

                            switch (sqlFieldType[x].ToString())
                            {
                                case "1":
                                    if (comm.CommandText != "Create Table MySheet (")
                                    {
                                        comm.CommandText += ",";
                                    }
                                    comm.CommandText += "`" + headers[x].ToString().Replace("'", "").Replace(".", "").Replace("!", "").Replace("[", "(").Replace("]", ")").Trim() + "`" + " char(255)";
                                    break;
                                case "2": goto case "1";
                                case "3": goto case "1";
                                case "4": break;
                                case "5": break;
                                case "6":
                                    if (comm.CommandText != "Create Table MySheet (")
                                    {
                                        comm.CommandText += ",";
                                    }
                                    comm.CommandText += "`" + headers[x].ToString().Replace("'", "").Replace(".", "").Replace("!", "").Replace("[", "(").Replace("]", ")").Trim() + "`" + " char(255)";
                                    break;
                                case "7":
                                    if (comm.CommandText != "Create Table MySheet (")
                                    {
                                        comm.CommandText += ",";
                                    }
                                    comm.CommandText += "`" + headers[x].ToString().Replace("'", "").Replace(".", "").Replace("!", "").Replace("[", "(").Replace("]", ")").Trim() + "`" + " memo";
                                    break;
                                case "8":
                                    if (comm.CommandText != "Create Table MySheet (")
                                    {
                                        comm.CommandText += ",";
                                    }
                                    comm.CommandText += "`" + headers[x].ToString().Replace("'", "").Replace(".", "").Replace("!", "").Replace("[", "(").Replace("]", ")").Trim() + "`" + " char(255)";
                                    break;
                                case "9": break;
                                default:
                                    if (comm.CommandText != "Create Table MySheet (")
                                    {
                                        comm.CommandText += ",";
                                    }
                                    comm.CommandText += "`" + headers[x].ToString().Replace("'", "").Replace(".", "").Replace("!", "").Replace("[", "(").Replace("]", ")").Trim() + "`" + " char(255)";
                                    break;
                            }
                        }
                    }
                    else
                    {
                        if (comm.CommandText != "Create Table MySheet (")
                        {
                            comm.CommandText += ",";
                        }
                        comm.CommandText += "`" + headers[x].ToString().Replace("'", "").Replace(".", "").Replace("!", "").Replace("[", "(").Replace("]", ")").Trim() + "`" + " char(255)";
                    }
                }
            }
            comm.CommandText += ")";
            comm.ExecuteNonQuery();

            comm.CommandText = insrertString;
            OleDbParameterCollection param = comm.Parameters;
            for (int i = 0; i < allParams.Count; i++)
            {
                param.Add(new OleDbParameter(allParams[i], OleDbType.VarChar));
            }


            foreach (List<string> valueList in allValues)
            {
                for (int j = 0; j < valueList.Count; j++)
                {
                    param[j].Value = valueList[j];
                }
                comm.ExecuteNonQuery();
            }





            comm.Dispose();
            excelConnection.Close();
            excelConnection.Dispose();
        }

        //ErrorMsg.Text = sql;
        Response.Redirect("uploads/site" + Session["siteID"].ToString() + "/" + newFileName);
    }


    protected void SqlDataSource1_Selected(object sender, SqlDataSourceStatusEventArgs e)
    {

    }


    protected void DelSelected_Command(object sender, CommandEventArgs e)
    {
        //AddChecked();
        //ErrorMsg.Text += "delete:" + SelectedValsHid.Value;

        if (SelAllHid.Value == "true")
        {
            if (delAllOneByOne == false)
            {

                using (MySqlConnection con = new MySqlConnection(ConnStr))
                {
                    con.Open();
                    MySqlCommand cmd = new MySqlCommand();
                    cmd.Connection = con;

                    if (DelCommand == "")
                    {
                        cmd.CommandText = "DELETE FROM " + tblName + " ";
                        if (SqlWhereQuery != "")
                        {
                            cmd.CommandText += " WHERE " + SqlWhereQuery;
                        }
                        if (SearchHid.Value != "")
                        {
                            int lastWhere = cmd.CommandText.LastIndexOf(" WHERE ");
                            cmd.CommandText = cmd.CommandText.Insert(lastWhere + 6, SearchHid.Value.Substring(SearchHid.Value.IndexOf("AND") + 3) + " AND ");
                        }
                    }
                    else
                    {
                        if (DelCommand.Contains("{1}"))
                        {
                            cmd.CommandText = DelCommand.Replace("{0}", TblName).Replace("{1}", " WHERE " + SqlWhereQuery);
                        }
                        else if (DelCommand.Contains("{2}"))
                        {
                            cmd.CommandText = DelCommand.Replace("{0}", TblName) + " AND " + SqlWhereQuery;
                        }
                        else
                        {
                            cmd.CommandText = DelCommand.Replace("{0}", TblName) + " WHERE " + SqlWhereQuery;
                        }

                        if (SearchHid.Value != "")
                        {
                            if (!cmd.CommandText.Contains(" WHERE "))
                            {
                                cmd.CommandText += " WHERE " + SqlWhereQuery + SearchHid.Value.Replace("'", "''");
                            }
                            else
                            {
                                int lastWhere = cmd.CommandText.LastIndexOf(" WHERE ");
                                cmd.CommandText = cmd.CommandText.Insert(lastWhere + 6, SearchHid.Value.Substring(SearchHid.Value.IndexOf("AND") + 3) + " AND ");
                            }
                        }

                        if (cmd.CommandText.Contains("{2}") && cmd.CommandText.Contains(" ") && cmd.CommandText.LastIndexOf("{2}") > cmd.CommandText.IndexOf(" "))
                        {
                            int lastSpacePosition = cmd.CommandText.Substring(0, cmd.CommandText.LastIndexOf("{2}")).LastIndexOf(" ");
                            cmd.CommandText = cmd.CommandText.Replace("{2}", cmd.CommandText.Substring(lastSpacePosition, (cmd.CommandText.LastIndexOf("{2}") - lastSpacePosition)).Replace("=", ""));
                        }

                    }


                    cmd.ExecuteNonQuery();
                    con.Close();
                }
                GridView1.Columns.Clear();
                CreateTable();
            }
            else
            {
                string[] AllVals = getAllVals();
                ItemDeleting += DummyItemDeleting;
                ItemDeleting(AllVals, ref CancelDelete);
                if (!CancelDelete)
                {
                    foreach (string keyName in AllVals)
                    {

                        ClickDel(TblName + "_" + IdField + "_" + "0" + "_" + keyName);

                    }

                    ItemDeleted += DummyItemDel;
                    ItemDeleted(AllVals);
                }
            }
        }
        else
        {
            string[] AllVals = SelectedValsHid.Value.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);

            ItemDeleting += DummyItemDeleting;
            ItemDeleting(AllVals, ref CancelDelete);
            if (!CancelDelete)
            {
                foreach (string keyName in AllVals)
                {
                    ClickDel(TblName + "_" + IdField + "_" + "0" + "_" + keyName);
                }
                ItemDeleted += DummyItemDel;
                ItemDeleted(AllVals);
            }
        }
    }

    protected void SearchBtn_Click(object sender, EventArgs e)
    {
        //AddChecked();
        SearchHid.Value = "";
        string[] sqlFieldNamesForSearch = string.Join(",", sqlFieldNames).Split(','); ;
        for (int i = 0; i < sqlFieldNamesForSearch.Length; i++)
        {
            if (sqlFieldNamesForSearch[i].Contains(" AS "))
            {
                sqlFieldNamesForSearch[i] = sqlFieldNamesForSearch[i].Substring(0, sqlFieldNamesForSearch[i].LastIndexOf(" AS "));
            }
            sqlFieldNamesForSearch[i] = sqlFieldNamesForSearch[i].Replace("|", ",");
        }


        for (int i = 0; i < sqlFieldNamesForSearch.Length; i++)
        {
            string[] plusSplitter = { "+" };
            string[] SearchPhrases = SrchBox.Text.Trim().Split(plusSplitter, StringSplitOptions.RemoveEmptyEntries);
            foreach (string searchPhrase in SearchPhrases)
            {
                if (sqlFieldNamesForSearch[i].Trim() != "")
                {
                    if (sqlFieldType.Length > i && sqlFieldType.Length != 0)
                    {
                        {
                            if (fieldsToSearch.Length <= i || fieldsToSearch[i].Trim() == "1")
                            {
                                int fieldAsNum = 0;

                                string fldName = sqlFieldNamesForSearch[i].ToString();
                                if (int.TryParse(sqlFieldNamesForSearch[i].ToString().Replace("`", "").Trim(), out fieldAsNum))
                                {
                                    fldName = fldName.Replace("`", "");
                                }

                                switch (sqlFieldType[i].ToString())
                                {
                                    case "1":
                                    case "8":
                                        if (SearchHid.Value == "")
                                        {
                                            SearchHid.Value += " AND (1=2 OR ";
                                        }
                                        else
                                        {
                                            SearchHid.Value += " OR ";
                                        }
                                        if (searchPhrase.StartsWith("\"") && searchPhrase.EndsWith("\""))
                                        {
                                            SearchHid.Value += (fieldAsNum > 0 ? "`" : "") + fldName + (fieldAsNum > 0 ? "`" : "") + " = " + "'" + searchPhrase.Substring(1, searchPhrase.Length - 2).Replace("'", "''").Replace("_", "\\_") + "'";
                                        }
                                        else
                                        {
                                            SearchHid.Value += (fieldAsNum > 0 ? "`" : "") + fldName + (fieldAsNum > 0 ? "`" : "") + " like " + "'%" + searchPhrase.Replace("'", "''").Replace("_", "\\_") + "%'";
                                        }
                                        break;
                                    case "7":
                                        int fieldNumber = 0;
                                        if (int.TryParse(searchPhrase, out fieldNumber))
                                        {
                                            if (SearchHid.Value == "")
                                            {
                                                SearchHid.Value += " AND (";
                                            }
                                            else
                                            {
                                                SearchHid.Value += " OR ";
                                            }
                                            SearchHid.Value += (fieldAsNum > 0 ? "`" : "") + fldName + (fieldAsNum > 0 ? "`" : "") + " = " + fieldNumber + " ";
                                        }
                                        break;
                                }
                            }
                        }
                    }
                    else
                    {
                        int fieldAsNum = 0;

                        string fldName = sqlFieldNamesForSearch[i].ToString();
                        if (int.TryParse(sqlFieldNamesForSearch[i].ToString().Replace("`", "").Trim(), out fieldAsNum))
                        {
                            fldName = fldName.Replace("`", "");
                        }
                        if (fieldsToSearch.Length <= i || fieldsToSearch[i].Trim() == "1")
                        {
                            if (SearchHid.Value == "")
                            {
                                SearchHid.Value += " AND (";
                            }
                            else
                            {
                                SearchHid.Value += " OR ";
                            }
                            if (searchPhrase.StartsWith("\"") && searchPhrase.EndsWith("\""))
                            {
                                SearchHid.Value += (fieldAsNum > 0 ? "`" : "") + fldName + (fieldAsNum > 0 ? "`" : "") + " = " + "'" + searchPhrase.Substring(1, searchPhrase.Length - 2).Replace("'", "''").Replace("_", "\\_") + "'";
                            }
                            else
                            {
                                SearchHid.Value += (fieldAsNum > 0 ? "`" : "") + fldName + (fieldAsNum > 0 ? "`" : "") + " like " + "'%" + searchPhrase.Replace("'", "''").Replace("_", "\\_") + "%'";
                            }
                        }
                    }
                }
            }
        }
        if (SearchHid.Value != "")
        {
            SearchHid.Value += ")";
        }
        //ErrorMsg.Text = "Search: "+SearchHid.Value;
        //GridView1.Columns.Clear();
        currentPageNum = 0;
        ReCreate();
        setTableState();
    }


    protected void AdvSearchOpen_Click(object sender, EventArgs e)
    {
        if (AdvSearchTable.Visible != true)
        {
            AdvSearchTable.Visible = true;
            GridView1.Visible = false;
            AdvSearchOpenHid.Value = "true";

            string selWhat = IdField;
            for (int i = 0; i < sqlFieldNames.Length; i++)
            {
                if (sqlFieldNames[i].Trim() != "")
                {
                    if (selWhat != "")
                    {
                        selWhat += ",";
                    }
                    selWhat += sqlFieldNames[i].ToString().Trim();
                }
            }
            if (!removeFrom)
            {
                sql = "SELECT " + selWhat + " FROM " + tblName;
            }
            else
            {
                sql = tblName;
            }

            if (IdField.Contains(" AS "))
            {
                IdField = IdField.Substring(0, IdField.LastIndexOf(" AS "));
            }

            if (SqlWhereQuery != "")
            {
                if (!sql.Contains(" WHERE "))
                {
                    sql += " WHERE " + SqlWhereQuery;
                }
                else
                {
                    int lastWhere = sql.LastIndexOf(" WHERE ");

                    if (sql.Contains(" UNION ") && sql.Contains(" AS ") && sql.LastIndexOf(" AS ") > lastWhere)
                    {
                        sql = sql.Insert(sql.Length, " WHERE " + sqlWhereQuery);
                    }
                    else
                    {
                        sql = sql.Insert(lastWhere + 6, sqlWhereQuery + " AND ");
                    }
                }

                if (IdField != "" && idField != "")
                {
                    sql += " AND " + IdField + "=" + idField;
                }
            }
            else
            {
                if (IdField != "" && idField != "")
                {
                    if (!sql.Contains(" WHERE "))
                    {
                        sql += " WHERE " + IdField + "=" + idField;
                    }
                    else
                    {
                        int lastWhere = sql.LastIndexOf(" WHERE ");

                        if (sql.Contains(" UNION ") && sql.Contains(" AS ") && sql.LastIndexOf(" AS ") > lastWhere)
                        {
                            sql = sql.Insert(sql.Length, " WHERE " + IdField + "=" + idField);
                        }
                        else
                        {
                            int lastAnd = 0;
                            if (SearchHid.Value.Contains("AND"))
                            {
                                lastAnd = SearchHid.Value.IndexOf("AND") + 3;
                            }
                            sql = sql.Insert(lastWhere + 6, SearchHid.Value.Substring(lastAnd) + " AND ");
                        }
                    }
                }
            }

            if (SqlGroupBy != "")
            {
                sql += " GROUP BY " + SqlGroupBy + " ";
            }

            sql = sql.Replace("|", ",");

            using (MySqlConnection con = new MySqlConnection(ConnStr))
            {
                con.Open();
                MySqlCommand cmd = new MySqlCommand(sql, con);
                //MyReader = cmd.ExecuteReader();


                int TabNum = 2;
                for (int pos = 0; pos < sqlFieldNames.Length; pos++)
                {
                    if (fieldsToSearch.Length != 0)
                    {
                        if (fieldsToSearch.Length > pos && fieldsToSearch[pos].Trim() == "1")
                        {
                            TableCell catName = new TableCell();
                            TableCell catValue = new TableCell();
                            TableRow catRow = new TableRow();
                            catName.VerticalAlign = VerticalAlign.Top;

                            if (tblHeaderNames.Length >= pos)
                            {
                                string HeaderText = tblHeaderNames[pos].Replace("|", ",");
                                if (HeaderText.Contains("Languages2:"))
                                {
                                    HeaderText = Languages2.MyText(tblHeaderNames[pos].Replace("Languages2:", ""));
                                }
                                catName.Text = HeaderText;
                            }
                            if (sqlFieldType.Length >= pos && sqlFieldType.Length > 0)
                            {
                                switch (sqlFieldType[pos].ToString()) // check if the the kind of the field
                                {
                                    case "1"://the filed id a textbox
                                        TextBox txtbox = new TextBox();
                                        TableCell ValidatorCell = new TableCell();
                                        txtbox.ID = "Search" + sqlFieldNames[pos];
                                        txtbox.CssClass = "textbox";

                                        catValue.Controls.Add(txtbox);
                                        catValue.CssClass = "textbox";

                                        catRow.Cells.Add(catName);
                                        catRow.Cells.Add(catValue);
                                        catRow.Cells.Add(ValidatorCell);
                                        break;
                                    case "2"://the field is a selectbox
                                        RadioButtonList radio = new RadioButtonList();
                                        radio.RepeatDirection = RepeatDirection.Horizontal;
                                        radio.ID = "Search" + sqlFieldNames[pos];
                                        ListItem opt1 = new ListItem();
                                        opt1.Text = Languages2.MyText("general_Yes");
                                        opt1.Value = "1";
                                        ListItem opt2 = new ListItem();
                                        opt2.Text = Languages2.MyText("general_No");
                                        opt2.Value = "0";
                                        using (MySqlConnection con2 = new MySqlConnection(ConnStr))
                                        {
                                            if (replaceField.Length != 0)
                                            {
                                                foreach (string nameVal in replaceField)
                                                {
                                                    string[] nameValArr = nameVal.Split('=');
                                                    if (nameValArr[0] == sqlFieldNames[pos].Replace("`", ""))
                                                    {
                                                        if (nameValArr[1] == "1") { opt1.Selected = true; }
                                                        else { opt2.Selected = true; }
                                                    }
                                                }
                                            }
                                        }
                                        radio.Items.Add(opt1);
                                        radio.Items.Add(opt2);
                                        catValue.Controls.Add(radio);

                                        catRow.Cells.Add(catName);
                                        catRow.Cells.Add(catValue);
                                        break;
                                    case "3":
                                        DropDownList drop = new DropDownList();
                                        drop.ID = "Search" + sqlFieldNames[pos];
                                        drop.CssClass = "textbox";
                                        catValue.CssClass = "textbox";
                                        string[] options = { };
                                        if (sqlOptions.Length >= pos)
                                            options = sqlOptions[pos].Split('|');

                                        ListItem optEmpty = new ListItem("", "");
                                        drop.Items.Add(optEmpty);

                                        int i = 1;
                                        foreach (string str in options)
                                        {
                                            ListItem opt = new ListItem();

                                            string[] optitem = str.Split('=');
                                            if (optitem.Length > 1)
                                            {
                                                if (optitem[0].Contains("Languages2:"))
                                                {
                                                    opt.Text = Languages2.MyText(optitem[0].Replace("Languages2:", ""));
                                                }
                                                else
                                                {
                                                    opt.Text = optitem[0];
                                                }
                                                opt.Value = optitem[1];
                                                drop.Items.Add(opt);


                                            }
                                            else
                                            {

                                                if (str.Contains("Languages2:"))
                                                {
                                                    opt.Text = Languages2.MyText(str.Replace("Languages2:", ""));
                                                }
                                                else
                                                {
                                                    opt.Text = str;
                                                }
                                                opt.Value = i.ToString();
                                                drop.Items.Add(opt);

                                            }
                                            i++;
                                        }

                                        if (replaceField.Length != 0)
                                        {
                                            foreach (string nameVal in replaceField)
                                            {
                                                string[] nameValArr = nameVal.Split('=');
                                                if (nameValArr[0] == sqlFieldNames[pos].Replace("`", ""))
                                                {
                                                    drop.SelectedValue = nameValArr[1];
                                                }
                                            }
                                        }
                                        catValue.Controls.Add(drop);

                                        catRow.Cells.Add(catName);
                                        catRow.Cells.Add(catValue);
                                        break;
                                    case "4":
                                        catName.Text = "<hr />";
                                        catName.ColumnSpan = 2;

                                        catRow.Cells.Add(catName);
                                        break;
                                    case "5":
                                        TableCell TabsCell = new TableCell();
                                        TableCell SeperatorCell = new TableCell();
                                        SeperatorCell.Text = "<img src=\"images/EnterTableTopLine.gif\" alt=\"\" />";
                                        Label TabLabel = new Label();
                                        TabLabel.Text = "<div>&nbsp;&nbsp;" + catName.Text + "&nbsp;&nbsp;</div>";
                                        TabsCell.Attributes.Add("onclick", "ShowHide('tblUserCats" + TabNum.ToString() + "', this)");
                                        TabsCell.CssClass = "EnterTableTop";
                                        TabsCell.Controls.Add(TabLabel);
                                        TabsRow.Cells.Add(SeperatorCell);
                                        TabsRow.Cells.Add(TabsCell);

                                        catName.Text = "</td></tr></table><table id=\"tblUserCats" + TabNum.ToString() + "\" style=\"display:none; margin:auto;\" CellPadding=\"5px\"><tr><td>";
                                        TabNum++;
                                        catName.ColumnSpan = 2;

                                        catRow.Cells.Add(catName);
                                        break;
                                    case "6":
                                        TextBox fromCalSerialTxtBox = new TextBox();
                                        fromCalSerialTxtBox.ID = "SearchDateFrom" + sqlFieldNames[pos];
                                        fromCalSerialTxtBox.CssClass = "textbox";
                                        catValue.CssClass = "textbox";
                                        catValue.Controls.Add(fromCalSerialTxtBox);
                                        TableCell toLabelcell = new TableCell();
                                        toLabelcell.Text = Languages2.MyText("general_To");
                                        TableCell toCatValue = new TableCell();
                                        TextBox toCalSerialTxtBox = new TextBox();
                                        toCalSerialTxtBox.ID = "SearchDateTo" + sqlFieldNames[pos];
                                        toCalSerialTxtBox.CssClass = "textbox";
                                        toCatValue.CssClass = "textbox";
                                        if (replaceField.Length != 0)
                                        {
                                            foreach (string nameVal in replaceField)
                                            {
                                                string[] nameValArr = nameVal.Split('=');
                                                if (nameValArr[0] == "SearchDateFrom" + sqlFieldNames[pos].Replace("`", ""))
                                                {
                                                    DateTime thedate = new DateTime();
                                                    if (DateTime.TryParse(nameValArr[1], out thedate))
                                                    {
                                                        fromCalSerialTxtBox.Text = thedate.ToString("dd/MM/yyyy");
                                                    }
                                                }
                                                if (nameValArr[0] == "SearchDateTo" + sqlFieldNames[pos].Replace("`", ""))
                                                {
                                                    DateTime thedate = new DateTime();
                                                    if (DateTime.TryParse(nameValArr[1], out thedate))
                                                    {
                                                        toCalSerialTxtBox.Text = thedate.ToString("dd/MM/yyyy");
                                                    }
                                                }

                                            }
                                        }
                                        toCatValue.Controls.Add(toCalSerialTxtBox);

                                        RegularExpressionValidator fromCalValidator = new RegularExpressionValidator();
                                        fromCalValidator.ControlToValidate = "SearchDateFrom" + sqlFieldNames[pos];
                                        fromCalValidator.ValidationExpression = @"^(((0[1-9]|[12]\d|3[01])\/(0[13578]|1[02])\/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)\/(0[13456789]|1[012])\/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])\/02\/((19|[2-9]\d)\d{2}))|(29\/02\/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$";
                                        fromCalValidator.Text = "<span style=\"text-decoration:italic; cursor:pointer;\" title=\"" + Languages2.MyText("general_This field can only hold dates") + "\">*</span>";
                                        fromCalValidator.SetFocusOnError = true;
                                        catValue.Controls.Add(fromCalValidator);


                                        AjaxControlToolkit.CalendarExtender fromCalExt = new AjaxControlToolkit.CalendarExtender();
                                        fromCalExt.TargetControlID = fromCalSerialTxtBox.ID;
                                        fromCalExt.FirstDayOfWeek = FirstDayOfWeek.Sunday;
                                        fromCalExt.Format = "dd/MM/yyyy";
                                        catValue.Controls.Add(fromCalExt);


                                        RegularExpressionValidator toCalValidator = new RegularExpressionValidator();
                                        toCalValidator.ControlToValidate = toCalSerialTxtBox.ID;
                                        toCalValidator.ValidationExpression = @"^(((0[1-9]|[12]\d|3[01])\/(0[13578]|1[02])\/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)\/(0[13456789]|1[012])\/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])\/02\/((19|[2-9]\d)\d{2}))|(29\/02\/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$";
                                        toCalValidator.Text = "<span style=\"text-decoration:italic; cursor:pointer;\" title=\"" + Languages2.MyText("general_This field can only hold dates") + "\">*</span>";
                                        toCalValidator.SetFocusOnError = true;
                                        toCatValue.Controls.Add(toCalValidator);


                                        AjaxControlToolkit.CalendarExtender toCalExt = new AjaxControlToolkit.CalendarExtender();
                                        toCalExt.TargetControlID = toCalSerialTxtBox.ID;
                                        toCalExt.FirstDayOfWeek = FirstDayOfWeek.Sunday;
                                        toCalExt.Format = "dd/MM/yyyy";
                                        toCatValue.Controls.Add(toCalExt);



                                        catRow.Cells.Add(catName);
                                        catRow.Cells.Add(catValue);
                                        catRow.Cells.Add(toLabelcell);
                                        catRow.Cells.Add(toCatValue);

                                        break;
                                    case "7":
                                        TextBox Longtxtbox = new TextBox();
                                        Longtxtbox.ID = "Search" + sqlFieldNames[pos];
                                        Longtxtbox.CssClass = "textbox";

                                        if (replaceField.Length != 0)
                                        {
                                            foreach (string nameVal in replaceField)
                                            {
                                                string[] nameValArr = nameVal.Split('=');
                                                if (nameValArr[0] == "SearchDateFrom" + sqlFieldNames[pos].Replace("`", ""))
                                                {
                                                    Longtxtbox.Text = nameValArr[1];
                                                }
                                            }
                                        }
                                        catValue.Controls.Add(Longtxtbox);

                                        catValue.CssClass = "textbox";
                                        catRow.Cells.Add(catName);
                                        catRow.Cells.Add(catValue);

                                        catName.VerticalAlign = VerticalAlign.Top;
                                        catRow.Cells.Add(catName);
                                        catRow.Cells.Add(catValue);
                                        break;
                                    case "8":

                                        toCatValue = new TableCell();
                                        TableCell catUnit = new TableCell();
                                        toLabelcell = new TableCell();
                                        toLabelcell.Text = Languages2.MyText("general_To");

                                        Literal catunitLit = new Literal();
                                        string[] option = { };
                                        if (sqlOptions.Length > pos)
                                            catunitLit.Text = sqlOptions[pos];
                                        catUnit.Controls.Add(catunitLit);


                                        TextBox fromRangetxtbox = new TextBox();
                                        fromRangetxtbox.ID = "SearchRangeFrom" + sqlFieldNames[pos];
                                        fromRangetxtbox.CssClass = "textbox";
                                        RegularExpressionValidator fromRangeValidator = new RegularExpressionValidator();
                                        fromRangeValidator.ControlToValidate = "SearchRangeFrom" + sqlFieldNames[pos];
                                        fromRangeValidator.ValidationExpression = @"^[-+]?[0-9]*\.?[0-9]+$";
                                        fromRangeValidator.Text = "<span style=\"text-decoration:italic; cursor:pointer;\" title=\"" + Languages2.MyText("general_This Field Can Only Hold Numbers") + "\">*</span>";
                                        fromRangeValidator.SetFocusOnError = true;
                                        catUnit.Controls.Add(fromRangeValidator);
                                        catValue.CssClass = "textbox";



                                        TextBox toRangetxtbox = new TextBox();
                                        toRangetxtbox.ID = "SearchRangeTo" + sqlFieldNames[pos];
                                        toRangetxtbox.CssClass = "textbox";
                                        RegularExpressionValidator toRangeValidator = new RegularExpressionValidator();
                                        toRangeValidator.ControlToValidate = "SearchRangeTo" + sqlFieldNames[pos];
                                        toRangeValidator.ValidationExpression = @"^[-+]?[0-9]*\.?[0-9]+$";
                                        toRangeValidator.Text = "<span style=\"text-decoration:italic; cursor:pointer;\" title=\"" + Languages2.MyText("general_This Field Can Only Hold Numbers") + "\">*</span>";
                                        toRangeValidator.SetFocusOnError = true;
                                        catUnit.Controls.Add(toRangeValidator);
                                        toCatValue.CssClass = "textbox";

                                        if (replaceField.Length != 0)
                                        {
                                            foreach (string nameVal in replaceField)
                                            {
                                                string[] nameValArr = nameVal.Split('=');
                                                if (nameValArr[0] == ("SearchRangeFrom" + sqlFieldNames[pos].Replace("`", "")))
                                                {
                                                    fromRangetxtbox.Text = nameValArr[1];
                                                }
                                                if (nameValArr[0] == "SearchRangeTo" + sqlFieldNames[pos].Replace("`", ""))
                                                {
                                                    toRangetxtbox.Text = nameValArr[1];
                                                }

                                            }
                                        }

                                        catValue.Controls.Add(fromRangetxtbox);
                                        toCatValue.Controls.Add(toRangetxtbox);

                                        catRow.Cells.Add(catName);
                                        catRow.Cells.Add(catValue);
                                        catRow.Cells.Add(toLabelcell);
                                        catRow.Cells.Add(toCatValue);
                                        catRow.Cells.Add(catUnit);
                                        break;
                                    case "9":

                                        RadioButtonList fileRadio = new RadioButtonList();
                                        fileRadio.RepeatDirection = RepeatDirection.Horizontal;
                                        fileRadio.ID = "SearchFile" + sqlFieldNames[pos];
                                        ListItem fileOpt1 = new ListItem();
                                        fileOpt1.Text = Languages2.MyText("general_Yes");
                                        fileOpt1.Value = "1";
                                        ListItem fileOpt2 = new ListItem();
                                        fileOpt2.Text = Languages2.MyText("general_No");
                                        fileOpt2.Value = "0";
                                        fileRadio.Items.Add(fileOpt1);
                                        fileRadio.Items.Add(fileOpt2);
                                        catValue.Controls.Add(fileRadio);

                                        catRow.Cells.Add(catName);
                                        catRow.Cells.Add(catValue);
                                        break;

                                    default:
                                        break;
                                }
                            }
                            else
                            {
                                TextBox txtbox = new TextBox();
                                TableCell ValidatorCell = new TableCell();
                                txtbox.ID = "Search" + sqlFieldNames[pos];
                                txtbox.CssClass = "textbox";

                                catValue.Controls.Add(txtbox);
                                catValue.CssClass = "textbox";

                                catRow.Cells.Add(catName);
                                catRow.Cells.Add(catValue);
                                catRow.Cells.Add(ValidatorCell);


                            }

                            tblUserCats1.Rows.Add(catRow);
                        }
                    }
                }

                TableCell BtnCell = new TableCell();
                TableRow BtnRow = new TableRow();
                BtnCell.ColumnSpan = 3;

                Literal FormViewLit = new Literal();
                FormViewLit.Text = "</td></tr></table><table style=\"margin:auto;\"><tr class=\"EnterTableBottomRow\"><td>";
                BtnCell.Controls.Add(FormViewLit);

                BtnRow.Cells.Add(BtnCell);
                tblUserCats1.Rows.Add(BtnRow);
                con.Close();
            }
        }
        else
        {
            HideAdvSearchBtn_Click(sender, e);
        }
    }

    protected void AdvSearch_Click(object sender, CommandEventArgs e)
    {

        ScriptManager.RegisterStartupScript(MainUP, typeof(UpdatePanel), "clearSrchBox", "$('#" + SrchBox.ClientID + "').val(''); $('.AdvSerachIndicator').css('display','')", true);

        SearchHid.Value = "";
        foreach (Control ctl in cmstrDefualts.getControls(this, typeof(TextBox)))
        {
            if (((TextBox)ctl).ID != null)
            {
                string tempIDField = ((TextBox)ctl).ID;
                if (tempIDField.ToLower().Contains(" as "))
                {
                    tempIDField = tempIDField.Remove(tempIDField.ToLower().IndexOf(" as "));
                }

                string[] plusSplitter = { "+" };
                string[] SearchPhrases = ((TextBox)ctl).Text.Trim().Split(plusSplitter, StringSplitOptions.RemoveEmptyEntries);
                foreach (string searchPhrase in SearchPhrases)
                {
                    if (searchPhrase != "")
                    {
                        if (((TextBox)ctl).ID.Contains("SearchDateFrom"))
                        {
                            string[] theDateStr = searchPhrase.Split('/');
                            if (theDateStr.Length > 2)
                                SearchHid.Value += " AND " + (tempIDField.Replace("SearchDateFrom", "")) + " >= " + "'" + (theDateStr[2] + "-" + theDateStr[1] + "-" + theDateStr[0]) + "'";
                        }
                        else if (((TextBox)ctl).ID.Contains("SearchDateTo"))
                        {
                            string[] theDateStr = searchPhrase.Split('/');
                            if (theDateStr.Length > 2)
                                SearchHid.Value += " AND " + (tempIDField.Replace("SearchDateTo", "")) + " <= " + "'" + (theDateStr[2] + "-" + theDateStr[1] + "-" + theDateStr[0]) + "'";
                        }
                        else if (((TextBox)ctl).ID.Contains("SearchRangeFrom"))
                        {
                            int TheNum;
                            if (int.TryParse(searchPhrase, out TheNum))
                                SearchHid.Value += " AND " + (tempIDField.Replace("SearchRangeFrom", "")) + " >= " + TheNum;
                        }
                        else if (((TextBox)ctl).ID.Contains("SearchRangeTo"))
                        {
                            int TheNum;
                            if (int.TryParse(searchPhrase, out TheNum))
                                SearchHid.Value += " AND " + (tempIDField.Replace("SearchRangeTo", "")) + " <= " + TheNum;
                        }
                        else if (((TextBox)ctl).ID.Contains("Search") && !((TextBox)ctl).ID.Contains("SearchFile"))
                        {
                            if (searchPhrase.StartsWith("\"") && searchPhrase.EndsWith("\""))
                            {
                                SearchHid.Value += " AND " + (tempIDField.Replace("Search", "")) + " = " + "'" + searchPhrase.Substring(1, searchPhrase.Length - 2).Replace("'", "''").Replace("_", "\\_") + "'";
                            }
                            else
                            {
                                SearchHid.Value += " AND " + (tempIDField.Replace("Search", "")) + " like " + "'%" + searchPhrase.Replace("'", "''").Replace("_", "\\_") + "%'";
                            }
                        }
                    }
                }
            }
        }


        foreach (Control ctl in cmstrDefualts.getControls(this, typeof(RadioButtonList)))
        {
            string tempIDField = ((RadioButtonList)ctl).ID;
            if (tempIDField.ToLower().Contains(" as "))
            {
                tempIDField = tempIDField.Remove(tempIDField.ToLower().IndexOf(" as "));
                if (((RadioButtonList)ctl).SelectedIndex != -1 && tempIDField.Contains("Search"))
                {
                    SearchHid.Value += " AND " + (tempIDField.Replace("Search", "")).Replace("`", "") + " = " + ((RadioButtonList)ctl).SelectedValue;
                }
            }
            else if (((RadioButtonList)ctl).SelectedIndex != -1 && tempIDField.Contains("Search"))
            {
                SearchHid.Value += " AND `" + (tempIDField.Replace("Search", "")).Replace("`", "") + "` = " + ((RadioButtonList)ctl).SelectedValue;
            }
        }

        foreach (Control ctl in cmstrDefualts.getControls(this, typeof(DropDownList)))
        {
            string tempIDField = ((DropDownList)ctl).ID;
            if (tempIDField.ToLower().Contains(" as "))
            {
                tempIDField = tempIDField.Remove(tempIDField.ToLower().IndexOf(" as "));
                if (((DropDownList)ctl).SelectedValue != "" && tempIDField.Contains("Search"))
                {
                    SearchHid.Value += " AND " + (tempIDField.Replace("Search", "")).Replace("`", "") + " = " + ((DropDownList)ctl).SelectedValue;
                }
            }
            else if (((DropDownList)ctl).SelectedValue != "" && tempIDField.Contains("Search"))
            {
                SearchHid.Value += " AND `" + (tempIDField.Replace("Search", "")).Replace("`", "") + "` = " + ((DropDownList)ctl).SelectedValue;
            }
        }

        GridView1.Columns.Clear();
        currentPageNum = 0;
        CreateTable();

        AdvSearchTable.Visible = false;
        GridView1.Visible = true;
    }

    protected void HideAdvSearchBtn_Click(object sender, EventArgs e)
    {
        AdvSearchTable.Visible = false;
        GridView1.Visible = true;
        AdvSearchOpenHid.Value = "";
    }

    protected void GridView1_PreRender(object sender, EventArgs e)
    {
        try
        {
            bool isCategory = false;
            if (EditInFancy)
            {
                string _fancyjs = "editUserFancy();";
                ScriptManager.RegisterStartupScript(MainUP, GetType(), "fancy" + this.ClientID, _fancyjs, true);
            }
            DataView dv = (DataView)SqlDataSource1.Select(new DataSourceSelectArguments());
            int c = fieldsToPreview.Length;
            //tblHeaderNames
            List<string> showdiv = new List<string>();
            string dvRowFilter = "";
            foreach (GridViewRow row in GridView1.Rows)
            {
                string id = GridView1.DataKeys[row.RowIndex].Value.ToString();
                if (IdField.Contains(" AS "))
                {
                    dvRowFilter += IdField.Remove(0, IdField.LastIndexOf(" AS ") + 4).Replace("`", "") + "=" + id + " OR ";

                }
                else
                {
                    dvRowFilter += IdField.Replace("`", "") + "=" + id + " OR ";
                }

            }
            dvRowFilter = dvRowFilter.Remove(dvRowFilter.LastIndexOf("OR"));
            dv.RowFilter = dvRowFilter;

            for (int i = 0; i < dv.Count; i++)
            {
                string showdivS = "<div class=\"hideShowDivCategoryHolderActive\" onclick=\"hideShowInfoDiv(this);scrollerJS('mcs_container" + GridView1.ClientID + i + "');\">" + Languages2.MyText("general_General") + "</div><div class=\"hideshowdivcategorycontentholderOpen\">";
                for (int j = 0; j < fieldsToPreview.Length; j++)
                {

                    if (fieldsToPreview[j].ToString() == "1")
                    {
                        string HeaderNames = tblHeaderNames[j];
                        string valueText = "";
                        if (HeaderNames.Contains("Languages2:"))
                        {
                            HeaderNames = Languages2.MyText(HeaderNames.Replace("Languages2:", ""));

                        }
                        switch (sqlFieldType[j].ToString())
                        {
                            case "1":
                            case "4":
                            case "7":
                            case "8":
                            case "10":
                            case "9":
                                valueText = dv[i][j + 1].ToString().Replace("\n", "<br />");
                                break;
                            case "5":
                                isCategory = true;
                                break;
                            case "2":
                                if (dv[i][j + 1].ToString() == "1")
                                { valueText += "'" + Languages2.MyText("general_Yes") + "'"; }
                                else
                                { valueText += "'" + Languages2.MyText("general_No") + "'"; }
                                break;
                            case "6":
                                valueText = dv[i][j + 1].ToString().Replace("\n", "<br />").Replace(" 00:00:00", "");
                                break;
                            case "3":
                                int optValue = 0;
                                if (sqlOptions.Length > i && int.TryParse(dv[i][j + 1].ToString(), out optValue))
                                {
                                    string[] optValues = sqlOptions[j].Split('|');
                                    if (optValues.Length > optValue - 1 && optValue > 0)
                                    {
                                        if (optValues[optValue - 1].Contains("Languages2:"))
                                        {
                                            valueText += "'" + Languages2.MyText(optValues[optValue - 1].Replace("Languages2:", "")).Replace("'", "''") + "'";
                                        }
                                        else
                                        {
                                            valueText += "'" + optValues[optValue - 1].Replace("'", "''") + "'";
                                        }
                                    }
                                    else
                                        valueText += "null";
                                }

                                break;


                        }
                        if (!isCategory)
                        {
                            showdivS += "<div class=\"hideshowdivholder\"><div class=\"headershowdiv\">" + HeaderNames + "</div><div  class=\"valueshowdiv\"> " + valueText + "</div></div>";
                        }
                        else
                        {
                            showdivS += "</div><div class=\"hideShowDivCategoryHolderInActive\" onclick=\"hideShowInfoDiv(this);scrollerJS('mcs_container" + GridView1.ClientID + i + "');\">" + HeaderNames + "</div><div class=\"hideshowdivcategorycontentholderClose\">";
                        }
                        isCategory = false;
                    }
                }
                showdivS += "</div>";
                showdivS = "<div class=\"hideshowdivclass\"><div class=\"hideshowdivclassTop\"><div class=\"hideshowdivclassBottom\"><div class=\"hideshowdivclassMiddle\"><div id=\"mcs_container" + GridView1.ClientID + i + "\" class=\"mcs_containerPopUpInfoClass\"><div class=\"customScrollBox\"><div class=\"container\"><div class=\"content\">" + showdivS + "</div></div><div class=\"dragger_container\"><div class=\"dragger\"></div></div></div></div></div></div></div></div>";

                showdiv.Add(showdivS);
            }

            int k = 0;
            if (c > 0)
            {
                foreach (Literal lt in cmstrDefualts.getControls(GridView1, typeof(Literal)))
                {
                    if (lt.ID == "ShowLiteral")
                    {
                        string onmouseoutFunc = "onmouseout=\"$(this).children('.hideshowdivclass').hide();\"";
                        if (Request.Browser.Type.ToString().Contains("IE"))
                            onmouseoutFunc = "onmouseleave=\"$(this).children('.hideshowdivclass').hide();\"";

                        lt.Text = "<div onmouseover=\"if($(this).children('.hideshowdivclass').css('display')=='none'){$(this).children('.hideshowdivclass').show();scrollerJS('mcs_container" + GridView1.ClientID + k + "')};\"" + onmouseoutFunc + " style=\"position:relative\"><img src=\"images/preview.png\" />" + showdiv[k] + "</div>";
                        k++;
                    }
                }
            }

            foreach (GridViewRow Row in ((GridView)sender).Rows)
            {
                Row.Attributes.Add("oldcss", "");
                Row.Attributes["onmouseover"] = "document.getElementById('" + Row.ClientID + "').oldcss=document.getElementById('" + Row.ClientID + "').className; document.getElementById('" + Row.ClientID + "').className='resSelect';";
                Row.Attributes["onmouseout"] = "document.getElementById('" + Row.ClientID + "').className=document.getElementById('" + Row.ClientID + "').oldcss;";
            }

            ArrayList SelectedValsHidOld = new ArrayList();
            ArrayList AllValsHidOld = new ArrayList();
            SelectedValsHidOld.AddRange(SelectedValsHid.Value.Split(','));
            AllValsHidOld.AddRange(AllValsHid.Value.Split(','));
            foreach (GraphicalCheckBox check in cmstrDefualts.getControls(GridView1, typeof(GraphicalCheckBox)))
            {
                for (int i = 0; i < SelectedValsHidOld.Count; i++)
                {
                    if (SelectedValsHidOld[i].ToString() == check.ID.Replace("Check", ""))
                    {
                        check.Checked = true;
                        SelectedValsHidOld.RemoveAt(i);
                    }
                }
                for (int i = 0; i < AllValsHidOld.Count; i++)
                {
                    if (AllValsHidOld[i].ToString() == check.ID.Replace("Check", ""))
                    {
                        AllValsHidOld.RemoveAt(i);
                    }
                }
            }
            SelectedValsHid.Value = "";
            AllValsHid.Value = "";
            for (int i = 0; i < SelectedValsHidOld.Count; i++)
            {
                if (SelectedValsHid.Value != "")
                {
                    SelectedValsHid.Value += ",";
                }
                SelectedValsHid.Value += SelectedValsHidOld[i].ToString();
            }

            for (int i = 0; i < AllValsHidOld.Count; i++)
            {
                if (AllValsHid.Value != "")
                {
                    AllValsHid.Value += ",";
                }
                AllValsHid.Value += AllValsHidOld[i].ToString();
            }


            int CheckedCount = 0;

            foreach (GraphicalCheckBox check in cmstrDefualts.getControls(GridView1, typeof(GraphicalCheckBox)))
            {
                if (check.Checked)
                {
                    CheckedCount++;
                }
            }
            Label selectedCountLbl = new Label();
            string[] stringSplit = { "," };
            try
            {
                GridView1.FooterRow.Cells[1].Controls.Add(selectedCountLbl);
            }
            catch { }


            StringBuilder _js = new StringBuilder();
            _js.AppendLine("$(function() {");
            _js.AppendLine("var pressed = false;");
            _js.AppendLine("var start = undefined;");
            _js.AppendLine("var prevCell = undefined;");
            _js.AppendLine("var nextCell = undefined;");
            _js.AppendLine("var startX, startWidth,startNextWidth;");

            //_js.AppendLine("$('.tableSplitter').mousemove(function(e) {");
            //_js.AppendLine("var x = e.pageX - $(this).offset().left;");
            //_js.AppendLine("if(x<=5 || x>=(this.offsetWidth-5)){this.style.cursor='col-resize'}else {this.style.cursor='default';this.style.borderLeft='';this.style.borderRight=''};");
            //_js.AppendLine("this.style.cursor='e-resize';");
            //_js.AppendLine("});");

            _js.AppendLine("$('.tableSplitter').mouseout(function(e) {");
            //_js.AppendLine("this.style.borderLeft='';this.style.borderRight=''");
            //_js.AppendLine("pressed = false;");
            //_js.AppendLine("$(start).css('cursor','default');");
            //_js.AppendLine("$(start).prev().css('background-color','');");
            _js.AppendLine("});");

            _js.AppendLine("$('.tableSplitter').mousedown(function(e) {");
            _js.AppendLine("start = $(this);");
            _js.AppendLine("prevCell = $(this).prev();");
            _js.AppendLine("nextCell = $(this).next();");
            //_js.AppendLine("var x = e.pageX - $(start).offset().left;");
            //_js.AppendLine("if(x<=5 || x>=(this.offsetWidth-5)){");
            _js.AppendLine("pressed = true;");
            _js.AppendLine("startX = e.pageX;");
            _js.AppendLine("startWidth = $(this).prev().width();");
            _js.AppendLine("startNextWidth = $(this).next().width();");
            _js.AppendLine("$(start).css('cursor','e-resize');");
            //_js.AppendLine("$(start).prev().css('background-color','#993333');");

            //_js.AppendLine("}");
            _js.AppendLine("});");

            _js.AppendLine("$(document).mousemove(function(e) {");

            _js.AppendLine("if(pressed) {");
            _js.AppendLine("if($('.ltrLeft').css('direction')=='rtl'){");
            _js.AppendLine("$(prevCell).width(startWidth-(e.pageX-startX));");
            _js.AppendLine("$(nextCell).width(startNextWidth+(e.pageX-startX));");
            _js.AppendLine("$('.'+$(prevCell).attr('class').replace('resizeable cell','cellLbl')).width(startWidth-(e.pageX-startX));");
            _js.AppendLine("$('.'+$(nextCell).attr('class').replace('resizeable cell','cellLbl')).width(startNextWidth+(e.pageX-startX));");
            _js.AppendLine("$('.'+$(prevCell).attr('class').replace('resizeable cell','tableHid')).val(startWidth-(e.pageX-startX));");
            _js.AppendLine("$('.'+$(nextCell).attr('class').replace('resizeable cell','tableHid')).val(startNextWidth+(e.pageX-startX));");

            _js.AppendLine("}else{");
            _js.AppendLine("$(prevCell).width(startWidth+(e.pageX-startX));");
            _js.AppendLine("$(nextCell).width(startNextWidth-(e.pageX-startX));");
            _js.AppendLine("$('.'+$(prevCell).attr('class').replace('resizeable cell','cellLbl')).width(startWidth+(e.pageX-startX));");
            _js.AppendLine("$('.'+$(nextCell).attr('class').replace('resizeable cell','cellLbl')).width(startNextWidth-(e.pageX-startX));");
            _js.AppendLine("$('.'+$(prevCell).attr('class').replace('resizeable cell','tableHid')).val(startWidth+(e.pageX-startX));");
            _js.AppendLine("$('.'+$(nextCell).attr('class').replace('resizeable cell','tableHid')).val(startNextWidth-(e.pageX-startX));");
            _js.AppendLine("}");
            _js.AppendLine("}");
            _js.AppendLine("});");

            _js.AppendLine("$(document).mouseup(function() {");

            _js.AppendLine("if(pressed) {");
            _js.AppendLine("$(start).css('cursor','e-resize');");
            //_js.AppendLine("$(start).prev().css('background-color','');");
            //_js.AppendLine("$('.cellLbl').each(function(){$(this).width($(this).parent().width())});");
            _js.AppendLine("}");
            _js.AppendLine("pressed = false;");
            _js.AppendLine("});");

            //_js.AppendLine("alert();");
            _js.AppendLine("$('.tableHid').each(function(){if($(this).val()!=''){$('.'+$(this).attr('class').replace('tableHid tableHid','cell')).width(parseInt($(this).val()));$('.'+$(this).attr('class').replace('tableHid tableHid','cellLbl')).width(parseInt($(this).val())); }});");
            _js.AppendLine("})");


            ScriptManager.RegisterStartupScript(MainUP, typeof(UpdatePanel), "resizer", _js.ToString(), true);
        }
        catch
        {
        }
    }


    //protected void PageNumDrop_PreRender(object sender, EventArgs e)
    //{
    //    for (int i = 1; i <= GridView1.PageCount; i++)
    //    {
    //        ListItem LI = new ListItem(i.ToString(), i.ToString());
    //        if (i == GridView1.PageIndex + 1)
    //            LI.Selected = true;
    //        ((DropDownList)sender).Items.Add(LI);
    //    }
    //}

    //protected void PageNumDrop_SelectedIndexChaned(object sender, EventArgs e)
    //{
    //    Response.Redirect("http://www.google.com");
    //    int pageNum = 1;
    //    if (int.TryParse(((DropDownList)sender).SelectedValue, out pageNum))
    //    { 
    //        GridView1.PageIndex = pageNum-1;
    //        GridView1.DataBind();
    //    }
    //}

    protected void DummyItemDel(string[] str)
    {

    }
    protected void DummyItemDeleting(string[] str, ref bool cancel)
    {

    }



}















public partial class TableControlColumn : ITemplate, INamingContainer
{
    private string tblHeaderName = "";
    private string sqlFieldName = "";
    private bool showField = true;
    private bool exportField = true;
    private bool printField = true;


    public string TblHeaderName
    {
        get { return tblHeaderName; }
        set { tblHeaderName = value; }
    }


    public string SqlFieldName
    {
        get { return sqlFieldName; }
        set { sqlFieldName = value; }
    }

    public bool ShowField
    {
        get { return showField; }
        set { showField = value; }
    }

    public bool ExportField
    {
        get { return exportField; }
        set { exportField = value; }
    }

    public bool PrintField
    {
        get { return printField; }
        set { printField = value; }
    }






    #region ITemplate Members

    public void InstantiateIn(Control container)
    {

    }

    #endregion



}






























public class tableState
{
    public string tblName;
    public string siteId;
    public string SearchHid;
    public string orderBy;
    public int PageNum = 0;
    public int MaxResPerPage = 0;
    public string searchWord;
    public string sessionID;
    public DateTime UpdateTime;

}



[ParseChildren(false), PersistChildren(true), ControlBuilderAttribute(typeof(SubControl))]
public class MainControl : WebControl
{
    private ArrayList subs = new ArrayList();
    protected override void AddParsedSubObject(object o)
    { subs.Add(o); }

    void Page_Load()
    {
        foreach (SubControl sc in subs)
        { Controls.Add(sc); }

    }
}


[ParseChildren(true)]
public class SubControl : WebControl, INamingContainer
{
    public string customAttr1
    {
        get { return ""; }
        set { }
    }

    public void newOne()
    {
        Label bla = new Label();
        bla.Text = "ok";
        Controls.Add(bla);
    }
}


public class MainControlBuilder : ControlBuilder
{
    public override Type GetChildControlType(String tagName, IDictionary attributes)
    {
        Type rv;

        rv = typeof(SubControl);
        return rv;
    }

    public void Add(SubControl sub)
    {

    }



    public override void AppendLiteralString(String s)
    { }
}