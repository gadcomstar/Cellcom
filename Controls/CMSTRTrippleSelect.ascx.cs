using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Controls_CMSTRTrippleSelect : CMSTRBase,IPostBackEventHandler
{
    private string cssClass = "CheckBoxHolderClass";
    private string fieldName = "כן\\לא";
    private bool myChecked = false;
    private string image2 = "../images/SelectOn.gif";
    private string image1 = "../images/SelectOff.gif";
    private string image3 = "../images/SelectOn.gif";
    private string onchange = "";
    private string myprerender = "";
    private bool enabled = true;
    private string validationGroup;
    private bool hasValidation = false;
    private bool isOnPanel = false;
    private Control panelControl = new Control();
    private string validationFieldErrorMessage = "*";
    private bool autoPostBack = false;
    private string imageAlt1 = "Select 1";
    private string imageAlt2 = "Select 2";
    private string imageAlt3 = "Select 3";
    private bool hasToolTip = false;
    private bool disableOnSelected = false;
    private string startpath = "";
    public String StartPath
    {
        set { this.startpath = value; }
        get { return this.startpath; }
    }
    public bool DisableOnSelected
    {
        set { this.disableOnSelected = value; }
        get { return this.disableOnSelected; }
    }
    public bool HasToolTip
    {
        set { this.hasToolTip = value; }
        get { return this.hasToolTip; }
    }
    public event EventHandler OnSelectedChanged;

    public String ImageAlt1
    {
        set { this.imageAlt1 = value; }
        get { return this.imageAlt1; }
    }
    public String ImageAlt2
    {
        set { this.imageAlt2 = value; }
        get { return this.imageAlt2; }
    }
    public String ImageAlt3
    {
        set { this.imageAlt3 = value; }
        get { return this.imageAlt3; }
    }
    public bool AutoPostBack
    {
        set { this.autoPostBack = value; }
        get { return this.autoPostBack; }
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
    public string Image1
    {
        set { this.image1 = value; }
        get { return this.image1; }
    }
    public string Image2
    {
        set { this.image2 = value; }
        get { return this.image2; }
    }
    public string Image3
    {
        set { this.image3 = value; }
        get { return this.image3; }
    }
    public bool Enabled
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
    public int ImgNumber
    {
        set
        {
            if (value >= 0 && value < 4)
            {
                this.CheckBoxHiddenField.Value = value.ToString();
            }
            else
            {
                this.CheckBoxHiddenField.Value = "0";
            }
          
        }
        get { return int.Parse(this.CheckBoxHiddenField.Value); }
    }
    public override string DataFieldValue
    {
        set
        {           
            ImgNumber = int.Parse( value);
        }
        get
        {
            return ImgNumber.ToString();
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
        get { return this.cssClass; }
    }
    protected void Page_Init(object sender, EventArgs e)
    {
        CustomValidator1.ValidationGroup = this.validationGroup;
        CustomValidator1.ClientValidationFunction = "validateCheckbox" + CheckBoxHiddenField.ClientID;
        CustomValidator1.Visible = hasValidation;
        MyCheckBox.Attributes["onclick"] = "selectcheckbox" + CheckBoxHiddenField.ClientID + "()";
        string _js = "function validateCheckbox" + CheckBoxHiddenField.ClientID + "(source, arguments) { arguments.IsValid=  ($('#" + CheckBoxHiddenField.ClientID + "').val()=='2'); }";
         ScriptManager.RegisterStartupScript(this,GetType(), "ValidCB" + CheckBoxHiddenField.ClientID, _js, true);
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (autoPostBack)
        {
            MyCheckBox.Attributes["onclick"] = Page.ClientScript.GetPostBackEventReference(this, "ClickDiv");
        }
        if (this.ImgNumber==0)
        {
            checkboxImage.Src = startpath + image1;
            checkboxImage.Alt = imageAlt1;            
        }
        else if (this.ImgNumber == 1)
        {
            checkboxImage.Src = startpath + image2;
            checkboxImage.Alt = imageAlt2;
        }
        else
        {
            checkboxImage.Alt = startpath + imageAlt3;
            checkboxImage.Src = image3;        
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
            _js += "if( myVal.toLowerCase()=='0')";
            _js += "{$('#" + CheckBoxHiddenField.ClientID + "').val('1');$('#" + checkboxImage.ClientID + "').attr('src','" + image2.Replace("../", "") + "');";
            _js += "$('#" + checkboxImage.ClientID + "').attr('alt','" + imageAlt2 + "');";            
            _js += " " + onchange + "  } else if ( myVal.toLowerCase()=='1') ";
            _js += "{$('#" + CheckBoxHiddenField.ClientID + "').val('2');$('#" + checkboxImage.ClientID + "').attr('src','" + image3.Replace("../", "") + "');$('#" + checkboxImage.ClientID + "').attr('alt','" + imageAlt3 + "'); " + onchange + "  } else ";
            _js += "{$('#" + CheckBoxHiddenField.ClientID + "').val('0');$('#" + checkboxImage.ClientID + "').attr('src','" + image1.Replace("../", "") + "');$('#" + checkboxImage.ClientID + "').attr('alt','" + imageAlt1 + "'); " + onchange + " }";
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
    protected void Div1_Click()
    {        
        // Do something
        if (this.ImgNumber == 0)
        {
            this.ImgNumber = 1;
            checkboxImage.Src = image2;           
        }
        else if (this.ImgNumber == 1)
        {
            this.ImgNumber = 2;
            checkboxImage.Src = image3;
        }
        else
        {
            this.ImgNumber = 0;
            checkboxImage.Src = image1;
        }

        if (this.OnSelectedChanged != null && !disableOnSelected)
        {
            EventArgs e = new EventArgs();           
            this.OnSelectedChanged(this,e);
        }
    }
    #region IPostBackEventHandler Members
    public void RaisePostBackEvent(string eventArgument)
    {
        if (!string.IsNullOrEmpty(eventArgument))
        {
            if (eventArgument == "ClickDiv")
            {
                Div1_Click();
            }
        }
    }
    #endregion
}