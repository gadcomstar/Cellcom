using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_CMSTRLabel : CMSTRBase
{

    private string fieldName = "";
    private string cssClass = "cmstrLabelHolderClass";
    private string condition = "";

    public string Condition
    {
        set { this.condition = value; }
        get { return this.condition; }
    }
    public string CssClass
    {
        set { this.cssClass = value; }
        get { return this.cssClass; }
    }
    public string Text
    {
        set { this.MyLabel.Text = value; }
        get { return this.MyLabel.Text; }
    }
    public override string DataFieldValue
    {
        set { Text = value; }
        get { return Text; }
    }
    public string FieldName
    {
        set { this.fieldName = value; }
        get { return this.fieldName; }    
    }
    protected void Page_Prerender(object sender, EventArgs e)
    {
        int myValue;
        int myCondition;
        if (int.TryParse(condition, out myCondition) && int.TryParse(DataFieldValue, out myValue))
        {
            if (myValue > myCondition)
            {               
                Labeldiv.Attributes["class"] = this.cssClass + "sel";
            }
            else
            {
                Labeldiv.Attributes["class"] = this.cssClass;
            }
        }
        else
        {
            Labeldiv.Attributes["class"] = this.cssClass;        
        }
    }
}