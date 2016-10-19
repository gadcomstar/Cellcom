using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_CMSTRCheckBox : CMSTRBase
{

    private string cssClass = "CheckBoxHolderClass";
    private string fieldName = "כן\\לא";
    private bool myChecked = false; 
    private string imageOn = "../images/SelectOn.gif";
    private string imageOff = "../images/SelectOff.gif";
    private string onchange = "";
    private string myprerender = "";
    private bool enabled = true;
    private string validationGroup;
    private bool hasValidation =false;
    private bool isOnPanel = false;
    private Control panelControl = new Control();
    private string validationFieldErrorMessage = "*";
    private string imageOnAlt = "true";
    private string imageOffAlt = "false";
    private bool hasToolTip = false;
    private string startpath = "";
    public String StartPath
    {
        set { this.startpath = value; }
        get { return this.startpath; }
    }
    public bool HasToolTip
    {
        set { this.hasToolTip = value; }
        get { return this.hasToolTip; }
    }
    public Control PanelControl
    {
        set { this.panelControl = value; }
        get { return this.panelControl; }
    }
    public bool IsOnPanel
    {
        set { this.isOnPanel = value; }
        get { return this.isOnPanel; }
    }
    public String ValidationFieldErrorMessage
    {
        set { CustomValidator1.ErrorMessage = value; }
        get { return CustomValidator1.ErrorMessage; }

    }
    public bool HasValidation
    {
        set { this.hasValidation = value; }
        get { return this.hasValidation; }
    }
    public String ImageOnAlt
    {
        set { this.imageOnAlt = value; }
        get { return this.imageOnAlt; }
    }
    public String ImageOffAlt
    {
        set { this.imageOffAlt = value; }
        get { return this.imageOffAlt; }
    }
    public String ValidationGroup
     {
         set { this.validationGroup = value; }
         get { return this.validationGroup; }
     }
    public ValidatorDisplay Display
     {
         set
         {
             CustomValidator1.Display = value;
         }
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
    public override bool Enabled
    {
        set { this.enabled = value; }
        get { return this.enabled; }
    }
    public string onprerender
    {
        set { this.myprerender = value; }
        get { return this.myprerender; }
    }
    public string OnChange
    {
        set { this.onchange = value; }
        get { return this.onchange; }
    }
    public bool Checked
    {
        set { 
            this.CheckBoxHiddenField.Value = value.ToString(); }
        get { return bool.Parse( this.CheckBoxHiddenField.Value); }
    }
    public override string DataFieldValue
    {
        set
        {
            string newValue = value == "1" || value.ToLower()=="true" ? "true" : "false";
            bool temp;
            if (bool.TryParse(newValue, out temp))
            {
                Checked = temp;
            }
            else
            {
                Checked = false;            
            }          
        }
        get
        {
            return Checked.ToString();
        }
    }
    public string FieldName
    {
        set { this.fieldName = value; }
        get { return this.fieldName; }
    }
    public string CssClass
    {
        set { this.cssClass = value; }
        get {return this.cssClass; }
    }
    protected void Page_Init(object sender, EventArgs e)
    {
        CustomValidator1.ValidationGroup = this.validationGroup;
        CustomValidator1.ClientValidationFunction = "validateCheckbox" + CheckBoxHiddenField.ClientID;
        CustomValidator1.Visible = hasValidation;
        MyCheckBox.Attributes["onclick"] = "selectcheckbox" + CheckBoxHiddenField.ClientID + "()";
        string _js= "function validateCheckbox"+ CheckBoxHiddenField.ClientID +"(source, arguments) { arguments.IsValid=  ($('#"+ CheckBoxHiddenField.ClientID +"').val()=='true'); }";
        Page.ClientScript.RegisterStartupScript(GetType(), "ValidCB" + CheckBoxHiddenField.ClientID, _js, true);
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {      
        if (this.Checked)
        {
            checkboxImage.Src = startpath+imageOn;
            checkboxImage.Alt = imageOnAlt;           
        }
        else
        {
            checkboxImage.Src = startpath+imageOff;
            checkboxImage.Alt = imageOffAlt;           
        }
        if (hasToolTip)
        {
            checkboxImage.Attributes["title"] = checkboxImage.Alt;
        }
        string _js = "";
        _js += "var myValStart =  $('#" + CheckBoxHiddenField.ClientID + "').val();";         
        _js += onprerender;
        if (enabled)
        {
            _js += "function selectcheckbox" + CheckBoxHiddenField.ClientID + "() {";
            _js += "var myVal =  $('#" + CheckBoxHiddenField.ClientID + "').val();";
            _js += "var clientid =  '" + MyCheckBox.ClientID + "';";
            _js += "if( myVal.toLowerCase()=='true')";
            _js += "{$('#" + CheckBoxHiddenField.ClientID + "').val('false');$('#" + checkboxImage.ClientID + "').attr('src','" + imageOff.Replace("../", "").Replace("admin/", "") + "');";
            _js += "$('#" + checkboxImage.ClientID + "').attr('alt','" + imageOffAlt + "');" + onchange + "  } else {$('#" + CheckBoxHiddenField.ClientID + "').val('true');";
            _js += "$('#" + checkboxImage.ClientID + "').attr('src','" + imageOn.Replace("../", "").Replace("admin/", "") + "');";
            _js += "$('#" + checkboxImage.ClientID + "').attr('alt','" + imageOnAlt + "');" + onchange + " }";
            if (hasToolTip)
            {
                _js += "$('#" + checkboxImage.ClientID + "').attr('title',$('#" + checkboxImage.ClientID + "').attr('alt'));";
            }

            _js += "}";
        }
        if (isOnPanel)
        {
            Page.ClientScript.RegisterStartupScript(GetType(), "checkkey" + CheckBoxHiddenField.ClientID, _js, true);
        }
        else
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "checkkey" + CheckBoxHiddenField.ClientID, _js, true);
        }
    }
}