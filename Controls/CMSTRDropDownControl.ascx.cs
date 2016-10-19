using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.ComponentModel;
using MySql.Data.MySqlClient;

public partial class CMSTRDropDownControl : CMSTRBase
{ 
    #region Properties
    private ListItemCollection _listItem;
    private string cssClass = "DropDownHolderDivClass";
    private string onClientSelectedChanged = "";
    private string tableName = "";
    private string dataOrderField = "";
    private bool hasDataSource = false;  
    private string ConnStr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;   
    public event EventHandler OnSelectedIndexChanged;
    public string ValueHiddenFieldClientID
    {
        get { return MyHiddenFieldVlaue.ClientID; }
    }
    public override string ClientID
    {
        get { return MyDropDown.ClientID; }
    }
    public override bool Enabled
    {
        set { MyDropDown.Enabled = value; }
        get { return MyDropDown.Enabled; }
    }
    public bool Visible
    {
        set { TextBoxHolderDiv.Visible = value; }
        get { return TextBoxHolderDiv.Visible; }
    }
    public override string DataFieldValue
    {
        set { MyHiddenFieldVlaue.Value = value; }
        get { return SelectedValue; }
    }
    public string SelectedValue
    {
        set { MyDropDown.SelectedValue = value; }
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
        set { MyDropDown.AutoPostBack = value; }
        get { return MyDropDown.AutoPostBack; }    
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
        set {  MyDropDown.AppendDataBoundItems = value; }
        get { return MyDropDown.AppendDataBoundItems; }
    }
    public object DataSource
    {
        set
        {
            MyDropDown.DataSource = null;
            MyDropDown.DataSource = value;
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
    protected void Page_PreRender(object sender, EventArgs e)
    {
        // insert into the drop down the user listItem
         MyDropDown.Items.Clear();
        foreach (ListItem listItem in ListItems)
        {
            MyDropDown.Items.Add(listItem);
        }
        if (!hasDataSource)
        {
            if (tableName != "")
            {
                using (MySqlConnection conn = new MySqlConnection(ConnStr))
                {
                    string sql = String.Format("Select {0},{1} From {2} {3} ", this.DataTextField, DataValueField, this.tableName, this.dataOrderField == "" ? "" : "Order By " + this.dataOrderField);
                    MySqlDataAdapter da = new MySqlDataAdapter(sql, conn);
                    DataSet ds = new DataSet();
                    da.Fill(ds, "dropDown");
                    MyDropDown.DataSource = ds.Tables["dropDown"].DefaultView;
                    MyDropDown.DataBind();
                }
            }
        }
        else
        {           
            MyDropDown.DataBind();           
        }
        TextBoxHolderDiv.Attributes["class"] = this.cssClass;       
        string mySelected = DataFieldValue;
        string a = SelectedValue;
        if (!String.IsNullOrEmpty(mySelected) && MyDropDown.Items.FindByValue(mySelected) != null)
        {
            MyDropDown.SelectedItem.Selected = false;
            for (int i = 0; i < MyDropDown.Items.Count; i++)
            {
                MyDropDown.Items[i].Selected = false;
                if (MyDropDown.Items[i].Value == mySelected)
                {
                    MyDropDown.Items[i].Selected = true;
                    myspan.InnerText = MyDropDown.Items[i].Text;
                    MyHiddenField.Value = MyDropDown.Items[i].Text;
                    MyHiddenFieldVlaue.Value = MyDropDown.Items[i].Value;
                }
            }               
        }
        else
        {
            for (int i = 0; i < MyDropDown.Items.Count; i++)
            {
                if (MyDropDown.Items[i].Selected)
                {
                    myspan.InnerText = MyDropDown.Items[i].Text;
                    MyHiddenField.Value = MyDropDown.Items[i].Text;
                    MyHiddenFieldVlaue.Value = MyDropDown.Items[i].Value;
                }
            }
        }
        MyDropDown.Attributes.Add("onchange", "javascript:document.getElementById('" + myspan.ClientID + "').innerHTML=this.options[this.selectedIndex].text;document.getElementById('" + MyHiddenField.ClientID + "').value=this.options[this.selectedIndex].text;document.getElementById('" + MyHiddenFieldVlaue.ClientID + "').value=this.options[this.selectedIndex].value;" + onClientSelectedChanged);       
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
        if (this.OnSelectedIndexChanged != null)
        {
            this.OnSelectedIndexChanged(sender, e);
        }
    }

    public void DataBind()
    {
        MyDropDown.DataBind();
    }
}