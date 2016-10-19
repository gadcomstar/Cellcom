using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class CMSTRRadioButton : CMSTRBase
{

    DataView dv = new DataView();
    private string cssClass = "RadioButtonHolderClass";
    private string fieldName="";
    private string onRadioChange = "";
    private string imageOn = "~/admin/images/SelectOn.gif";
    private string imageOff = "~/admin/images/SelectOff.gif";
    private string imageClass = "RadioImageclass";
    private string jsKey = "";
    public string JSKey
    {
        set { this.jsKey = value; }
        get { return this.jsKey; }
    }
    public string ImageOn
    {
        set { this.imageOn = value; }
        get { return this.imageOn; }
    }
    public string ImageOff
    {
        set { this.imageOff = value; }
        get { return this.imageOff; }
    }
    public string ImageClass
    {
        set { this.imageClass = value; }
        get { return this.imageClass; }
    }
    public string OnRadioChange
    {
        set { this.onRadioChange = value; }
        get { return this.onRadioChange; }
    }
    public string FieldName
    {
        set { this.fieldName = value; }
        get { return this.fieldName; }
    }
    public string CssClass
    {
        set { this.cssClass = value; }
        get { return this.cssClass; }
    }
    protected void Page_Init(object sender, EventArgs e)
    {
        imageClass = "class" + (JSKey == "" ? RadioHiddenField.ClientID : JSKey) + " " + imageClass; 
    }
    public override string DataFieldValue
    {
        set
        {
            if (DataFieldType == DataTypes.Bool)
            {
                Selected = value == "1" || value.ToLower() == "true" ? "true" : "false";
            }
            else
            {
                Selected = value;
            }
        }
        get
        {
            string mySelected = Selected;
            if (DataFieldType == DataTypes.Bool)
            {
                mySelected = Selected == "1" || Selected.ToLower()=="true" ? "true" : "false";

            }
            return mySelected;
        }
    }
    public string Selected
    {
        set { this.RadioHiddenField.Value = value; }
        get { return this.RadioHiddenField.Value; }    
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        string[] fieldsNames = fieldName.Split(',');
        DataTable dt = new DataTable();
        dt.Columns.Add("fieldName");
        dt.Columns.Add("value");      
        for (int i = 0; i < fieldsNames.Length; i++)
	    {            
            string[] myfieldsNames = fieldsNames[i].Split('|');
            DataRow newRow = dt.NewRow();
            newRow["fieldName"] = myfieldsNames[0];
            if (myfieldsNames.Length > 1)
            {
                newRow["value"] = myfieldsNames[1];
            }
            else
            {
                newRow["value"] = myfieldsNames[0];
            }
            dt.Rows.Add(newRow);
            if (i == 0)
            {
                if (Selected == null)
                {
                    Selected = myfieldsNames[1];
                }               
            }
	    }
        RadioRepiter.DataSource = dt;
        RadioRepiter.DataBind();
        string myKey = (JSKey==""? RadioHiddenField.ClientID : JSKey);
        string _js = "";
        _js += "function SetSelectedRadio" + myKey + "(sender) {";
        _js += "$('.class" + myKey + "').attr('src', '" + imageOff.Replace("~/admin/", "") + "');";
        _js += "$(sender).children('.RadioImageclass').attr('src', '" + imageOn.Replace("~/admin/", "") + "');"; 
         _js +=  "var myVal=$(sender).next().val();";
         _js += "$('#" + myKey + "').val(myVal);";
         _js += onRadioChange;
        _js +=  " }";
        Page.ClientScript.RegisterStartupScript(GetType(), "RadioKey" + myKey, _js, true);
    }
}