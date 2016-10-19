using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CMSTRHiddenField : CMSTRBase
{
    string value = "";
    private string dataFieldName = "";
    private DataTypes dataFieldType = DataTypes.String;
    private string OldValue = "";
    public string Value
    {
        set
        {
            MyHiddenField.Value = value;
        }
        get
        {
            return MyHiddenField.Value;
        }
    }
    public override string DataFieldValue
    {      
        get
        {
            return Value;
        }
        set {

            Value = value;
        }
    }
    public override string ClientID
    {
        get
        {
            return MyHiddenField.ClientID;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {        
    }
}