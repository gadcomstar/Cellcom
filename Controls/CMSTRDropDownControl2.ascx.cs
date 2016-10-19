using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.ComponentModel;
using MySql.Data.MySqlClient;

public partial class CMSTRDropDownControl2 : CMSTRBase
{
    #region Properties
    private ListItemCollection _listItem;
    private string cssClass = "DropDownHolderDivClass";
    private string onClientSelectedChanged = "";
    private string tableName = "";
    private string dataOrderField = "";
    private bool hasDataSource = false;
    private bool autoPostBack = false;
    private DataView dataSourse;
    private string ConnStr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
    DataView dropDownDataView = new DataView();
    public event EventHandler SelectedIndexChanged;
    public override string ClientID
    {
        get { return DropDownSelect.ClientID; }
    }
    public bool Enabled
    {
        set
        {
            EnableDrop.Visible = value;
        }
        get { return EnableDrop.Visible; }
    }
    public bool Visible
    {
        set { MyDropDown2.Visible = value; }
        get { return MyDropDown2.Visible; }
    }
    public override string DataFieldValue
    {
        set { MyHiddenFieldVlaue.Value = value; }
        get { return SelectedValue; }
    }
    public string SelectedValue
    {
        get { return MyHiddenFieldVlaue.Value; }
    }
    public string SelectedText
    {
        get { return MyHiddenField.Value; }
    }
    /// <summary>
    ///  select the DataBase Table Name
    /// </summary>
    public string TableName
    {
        set { this.tableName = value; }
        get { return this.tableName; }
    }
    public ListItem SelectedItem
    {
        get { return MyDropDown.SelectedItem; }
    }
    public string DataOrderField
    {
        set { this.dataOrderField = value; }
        get { return this.dataOrderField; }
    }
    public string DataTextField
    {
        set { MyDropDown.DataTextField = value; }
        get { return MyDropDown.DataTextField; }
    }
    public string DataValueField
    {
        set { MyDropDown.DataValueField = value; }
        get { return MyDropDown.DataValueField; }
    }
    public bool AutoPostBack
    {
        set { this.autoPostBack = value; }
        get { return this.autoPostBack; }
    }
    public string FieldName
    {
        set { DropText.InnerHtml = value; }
        get { return DropText.InnerHtml; }
    }
    public string OnClientSelectedChanged
    {
        get { return onClientSelectedChanged; }
        set { onClientSelectedChanged = value; }
    }
    public bool AppendDataBoundItems
    {
        set { MyDropDown.AppendDataBoundItems = value; }
        get { return MyDropDown.AppendDataBoundItems; }
    }
    public DataView DataSource
    {
        set
        {
            this.dataSourse = value;
            if (value != null)
            {
                hasDataSource = true;
            }
        }
    }
    public string DataSourceID
    {
        set { MyDropDown.DataSourceID = value; }
    }
    public String CssClass
    {
        set { this.cssClass = value; }
        get { return this.cssClass; }
    }
    #endregion
    protected void Page_Init(object sender, EventArgs e)
    {
        DataTable myTable = new DataTable();
        myTable.TableName = "myDrop";
        dropDownDataView.Table = myTable;
        DataColumn clm = new DataColumn("dropValue");
        dropDownDataView.Table.Columns.Add(clm);
        dropDownDataView.Table.Columns.Add("dropText");
        dropDownDataView.Table.Columns.Add("Selected");
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        string myvalue = MyHiddenFieldVlaue.Value;
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        string myvalue = MyHiddenFieldVlaue.Value;
        DropDownLiteral.Text = "";
        // insert into the drop down the user listItem    
        foreach (ListItem listItem in ListItems)
        {
            MyDropDown.Items.Add(listItem);
            DataRow myDatarow = dropDownDataView.Table.NewRow();
            myDatarow["dropValue"] = listItem.Value;
            myDatarow["dropText"] = listItem.Text;
            myDatarow["Selected"] = listItem.Selected.ToString();
            dropDownDataView.Table.Rows.Add(myDatarow);
        }
        if (hasDataSource)
        {
            dataSourse.Sort = DataValueField;
            for (int i = 0; i < dataSourse.Count; i++)
            {
                DataRow myDatarow = dropDownDataView.Table.NewRow();
                myDatarow["dropValue"] = dataSourse[i][DataValueField];
                myDatarow["dropText"] = dataSourse[i][DataTextField];
                myDatarow["Selected"] = false;
                dropDownDataView.Table.Rows.Add(myDatarow);
            }
        }
        for (int i = 0; i < dropDownDataView.Count; i++)
        {
            DropDownLiteral.Text += "<span title=\"" + dropDownDataView[i]["dropText"] + "\" onclick=\"setdropselected" + SelectedVal.ClientID + "(this);\" id=\"" + dropDownDataView[i]["dropValue"] + "\" class=\"itemclass\" >" + dropDownDataView[i]["dropText"] + "</span>";
        }
        TextBoxHolderDiv.Attributes["class"] = this.cssClass;
        string mySelected = DataFieldValue;
        dropDownDataView.RowFilter = "dropValue='" + mySelected + "'";
        if (!String.IsNullOrEmpty(mySelected) && dropDownDataView.Count > 0)
        {            
            SelectedVal.InnerText = dropDownDataView[0]["dropText"].ToString();
        }
        dropDownDataView.RowFilter = "";
        for (int i = 0; i < dropDownDataView.Count; i++)
        {
            if (!String.IsNullOrEmpty(mySelected) && dropDownDataView.Count > 0)
            {
                if (dropDownDataView[i]["dropValue"].ToString() == mySelected)
                {
                    SelectedVal.InnerText = dropDownDataView[i]["dropText"].ToString();
                    MyHiddenField.Value = dropDownDataView[i]["dropText"].ToString();
                    MyHiddenFieldVlaue.Value = dropDownDataView[i]["dropValue"].ToString();
                }
            }
            else if (dropDownDataView[i]["Selected"].ToString().ToLower() == "true")
            {
                SelectedVal.InnerText = dropDownDataView[i]["dropText"].ToString();
                MyHiddenField.Value = dropDownDataView[i]["dropText"].ToString();
                MyHiddenFieldVlaue.Value = dropDownDataView[i]["dropValue"].ToString();
            }
        }
        string _js = "";
        _js += " function setdropselected" + SelectedVal.ClientID + "(sender) {";
        _js += "var mytext = $(sender).text();";
        _js += "var value = $(sender).attr('id');";
        _js += "$('#" + MyHiddenField.ClientID + "').val( mytext );";
        _js += "$('#" + MyHiddenFieldVlaue.ClientID + "').val(value);";
        _js += "$('#" + SelectedVal.ClientID + "').text(mytext);";
        if (AutoPostBack == true)
        {
            _js += "eval($('#" + ClickButton.ClientID + "').attr('href') );";
        }
        _js += onClientSelectedChanged;
        _js += "}";
        Page.ClientScript.RegisterStartupScript(GetType(), "mydrop" + SelectedVal.ClientID, _js, true);
    }
    [PersistenceMode(PersistenceMode.InnerProperty)]
    [DesignerSerializationVisibility(DesignerSerializationVisibility.Content)]
    public ListItemCollection ListItems
    {
        get
        {
            if (_listItem == null)
                _listItem = new ListItemCollection();
            return _listItem;
        }
    }
    // take out the SelectedIndexChanged Event   
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        string myvalue = MyHiddenFieldVlaue.Value;

        if (this.SelectedIndexChanged != null)
        {
            this.SelectedIndexChanged(sender, e);
        }
    }
}