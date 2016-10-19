using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;



/// <summary>
/// Summary description for BaseClass
/// </summary>
public class CMSTRBase : System.Web.UI.UserControl
{
    private string dataFieldName;

    private DataTypes dataFieldType;
    private string dataFieldValue;
    private bool enabled = true;
    private bool forceVlaue = false;

    public virtual bool Enabled
    {
        get { return this.enabled; }
        set { this.enabled = value; }
    }

    public bool DataForceValue
    {
        get { return this.forceVlaue; }
        set { this.forceVlaue = value; }
    }
    public String DataFieldName
    {
        get { return this.dataFieldName; }
        set { this.dataFieldName = value; }
    }
    public virtual String DataFieldValue
    {
        get { return this.dataFieldValue; }
        set { this.dataFieldValue = value; }
    }
    public DataTypes DataFieldType
    {
        get { return this.dataFieldType; }
        set { this.dataFieldType = value; }
    }
}

public enum DataTypes
{
    Bool,
    String,
    DateTime,
    Number,
    File
}