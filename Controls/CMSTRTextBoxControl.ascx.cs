using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Text;


public partial class CMSTRTextBoxControl : CMSTRBase
{
    public bool SetFocusOnError
    {
        set { 
            Validator1.SetFocusOnError = value;
            Validator2.SetFocusOnError = value;
            Validator3.SetFocusOnError = value;            
        }
    }
     public  enum RegExpression
    {        
        None,
        Telephone,
        Email,
        CellPhone,
        Password,
        Numeric
    }
     public enum MyTextBoxMode
    {
        SingleLine,
        MultiLine,       
        Password,       
        CKEditor
    }
    public enum TextDirection
    {
        ltr,
        rtl
    }
  
    #region Properties   
    
    private string cssClass = "TextBoxHolderDivClass";
    private string fieldName = "";
    private string compareFieldName = "";
    private bool isRequiredFieldValidator = false;
    private string requiredFieldErrorMessage = "*";
    private string regularExpressionErrorMessage = "*";
    private string validationGroup;
    private string watermarkText="שדה מידע";
    private bool hasWatermark = false;
    private string validationExpression="";
    private RegExpression selectExpresion;
    private string dataFieldName = "";
    private DataTypes dataFieldType = DataTypes.String;
    private bool IsCk = false;
    private bool hasCompareTextBox = false;
    private string comparevalidationmessage = "*";
    private TextDirection direction = TextDirection.rtl;
    private string onKeyPress = "";
    private string onBlur = "";
    private string onFocus = "";
    private AutoCompleteType autoCompleteType = AutoCompleteType.None;
    private bool enable = true;
    private string onKeyUp ="";
    private string ckBackGround = "";
    public string CKBackGroundColor
    {
        set { this.ckBackGround = value; }
        get { return this.ckBackGround; }
    }
    public string getValuepass = "";

    public bool Enabled
    {
        set { 
            MyTextBox.Enabled = value;
            Password2.Enabled = value;
            CompareTextBox.Enabled = value;
            this.enable = value; 
        }
        get { return enable; }
    }
    public string OnKeyUp
    {
        set { this.onKeyUp = value; }
        get { return this.onKeyUp; }
    }
    public string onkeypress
    {
        set { this.onKeyPress = value; }
        get { return this.onKeyPress; }
    }
    public string onblur
    {
        set { this.onBlur = value; }
        get { return this.onBlur; }
    }
    public string onfocus
    {
        set { this.onFocus = value; }
        get { return this.onFocus; }
    }
    public TextDirection Direction
    {
        set { this.direction = value; }   
    }
    public override string ClientID
    {
        get
        {
            if (TextMode == MyTextBoxMode.Password)
            {
                return Password2.ClientID;
            }
            else
            {
                return MyTextBox.ClientID;
            }
        }
    }
    public String GetValuepass
    {
        get { return this.Password2.Text; }
    }
    public TextBox TextBoxObject
    {
        set { this.MyTextBox = value; }
        get { return this.MyTextBox; }
    }
    public String CompareValidationMessage
    {
        set { this.comparevalidationmessage = value; }
        get { return this.comparevalidationmessage; }
    }
    public ValidatorDisplay Display
    {
        set {
            Validator1.Display = value;
            Validator2.Display = value;
            Validator3.Display = value;
        }    
    }
    public String CompareFieldName
    {
        set { this.compareFieldName = value; }
        get { return this.compareFieldName; }
    }
    public bool HasCompareTextBox
    {
        set { this.hasCompareTextBox = value; }
        get { return this.hasCompareTextBox; }
    }
    public bool HasWatermark
    {
        set { this.hasWatermark = value; }
        get { return this.hasWatermark; }
    }
    public int MaxLength
    {
        set
        {
            MyTextBox.MaxLength = value;
            Password2.MaxLength = value;
            if (TextMode == MyTextBoxMode.MultiLine)
            {
                MyTextBox.Attributes["maxlength"] =  value.ToString();
                Password2.Attributes["maxlength"] = value.ToString();
            }
        }
    }
    public String ValidationExpression
    {
        set { this.validationExpression = value; }
        get { return this.validationExpression; }
    }
    public String WatermarkText
    {
        set { this.watermarkText = value; }
        get { return this.watermarkText; }
    }
    public RegExpression SelectExpresion
    {
        set { this.selectExpresion = value; }
        get { return this.selectExpresion; }
    }
    public String ValidationGroup
    {
        set { this.validationGroup = value; }
        get { return this.validationGroup; }
    }
    public String RequiredFielderrorMessage
    {
        set { this.requiredFieldErrorMessage = value; }
        get { return this.requiredFieldErrorMessage; }
    }
    public String RegularExpressionErrorMessage
    {
        set { this.regularExpressionErrorMessage = value; }
        get { return this.regularExpressionErrorMessage; }
    }
    public bool IsRequiredFieldValidator
    {
        set { this.isRequiredFieldValidator = value; }
        get { return this.isRequiredFieldValidator; }
    }
    public String FieldName
    {
        set { this.fieldName = value; }
        get { return this.fieldName; }
    }
    public AttributeCollection Attributes
    {
        get { return MyTextBox.Attributes; }      
    }
    public String CssClass
    {
        set { this.cssClass = value; }
        get { return this.cssClass; }      
    }
    public override string DataFieldValue
    {
        set
        {            
            this.Text = value;
            TextBoxMessge.Value = value;           
        }
        get {
            if (TextMode == MyTextBoxMode.Password)
            {
                if (Text == "")
                {
                    return PasswordHiddenField.Value.ToString();
                }
                else
                {
                    return this.Text;
                }
            }
            else
            {
                if (IsCk)
                {
                    return TextBoxMessge.Value;
                }
                else
                {
                    return this.Text;
                }
            }
        }    
    }
    public String Text
    {
        set {
            if (this.TextMode == MyTextBoxMode.Password)
            {
                Password2.Text = value;
            }
            else
            {
                MyTextBox.Text = value;
            }            
           }
        get {
            if (this.TextMode == MyTextBoxMode.Password)
            {
                return Password2.Text;
            }
            else
            { 
             return MyTextBox.Text;
            }
          }
    }
    public MyTextBoxMode TextMode
    {
        set
        {
            if (value == MyTextBoxMode.Password)
            {
                MyTextBox.TextMode = TextBoxMode.SingleLine;
                Password2.TextMode = TextBoxMode.Password;
            }
            else
            {
                if (value == MyTextBoxMode.CKEditor)
                {
                    MyTextBox.TextMode = TextBoxMode.SingleLine;
                    IsCk = true;
                }
                else
                {
                    MyTextBox.TextMode = (TextBoxMode)value;
                }
            }
        }
        get {
            if (Password2.TextMode == (TextBoxMode)MyTextBoxMode.Password)
            {
                return (MyTextBoxMode)Password2.TextMode;
            }
            else
            {
                return (MyTextBoxMode)MyTextBox.TextMode;
            }
        }
    }
    #endregion
    protected void Page_Init(object sender, EventArgs e)
    {       
        Validator1.ValidationGroup = this.validationGroup;
        Validator2.ValidationGroup = this.validationGroup;
        Validator3.ValidationGroup = this.validationGroup;
        this.DataFieldValue = this.Text;        
        Password2.Attributes.Add("autocomplete", "off");
        CompareTextBox.Attributes.Add("autocomplete", "off");
    }    
    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (TextMode == MyTextBoxMode.Password && hasWatermark == true)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("setpass" + MyTextBox.ClientID + "('');");
            sb.Append("function focustext() {");
            
            sb.Append("var input = $('#" + Password2.ClientID + "');");
        sb.Append("setTimeout(function() { ");
        sb.Append("input.select();");
        sb.Append("},100);");
        sb.Append("}");
            sb.Append("function setpass" + MyTextBox.ClientID + "() {");

            sb.Append(" $(function () {");
            sb.Append(" $('#" + MyTextBox.ClientID + "').show();");
            sb.Append(" $('#" + Password2.ClientID + "').hide();");

            sb.Append(" $('#" + MyTextBox.ClientID + "').focus(function () {");
            sb.Append("  $(this).hide();");
            sb.Append("  $('#" + Password2.ClientID + "').show();");
            sb.Append("focustext();");
            sb.Append("  $('#" + Password2.ClientID + "').focus();");
            sb.Append(" });");

            sb.Append("  $('#" + Password2.ClientID + "').blur(function () {");

            sb.Append("   if ($(this).val().length == 0) {");
            sb.Append("  $(this).hide();");
            sb.Append("   $('#" + MyTextBox.ClientID + "').show();");
            sb.Append(" }");
            sb.Append(" });");
            sb.Append("   });  ");
            sb.Append(" };");
            Page.ClientScript.RegisterStartupScript(GetType(), MyTextBox.ClientID, sb.ToString(), true);
            MyTextBox.TextMode = TextBoxMode.SingleLine;
            Validator1.ControlToValidate = "Password2";
            Validator2.ControlToValidate = "Password2";

        }
        else if (TextMode == MyTextBoxMode.Password)
        {
            MyTextBox.Visible = false;
            Password2.Visible = true;

            if (!IsPostBack)
            {
                PasswordHiddenField.Value = this.Text;
            }
            Validator1.ControlToValidate = "Password2";
            Validator2.ControlToValidate = "Password2";
        }
        else
        {
            Password2.Visible = false;
        }
        switch (selectExpresion)
        { 
            case RegExpression.None:
                Validator2.Visible = false;

                break;
            case RegExpression.Email:
                Validator2.ValidationExpression = @"\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*";
                break;
            case RegExpression.CellPhone:
                Validator2.ValidationExpression = @"^[0-9]{3}[-][0-9]{7}|[0-9]{10}$";
                break;
            case RegExpression.Telephone:
                Validator2.ValidationExpression = @"^[0-9]{3}[-][0-9]{7}|[0-9]{2}[-][0-9]{7}|[0-9]{10}|[0-9]{9}$";
                break;
            case RegExpression.Password:
                Validator2.ValidationExpression = @"^[a-zA-Z0-9]{6,20}";
                break;
            case RegExpression.Numeric:
                Validator2.ValidationExpression = @"^\-*\d*\.?\d+$";
                break;
            default:
                Validator2.Visible = false;
                break;
        }
        if (validationExpression != "")
        {
            Validator2.Visible = true;
            Validator2.ValidationExpression = this.validationExpression;
        }           
        Validator1.Visible =  this.isRequiredFieldValidator;
        Validator1.ErrorMessage = this.requiredFieldErrorMessage;       
        Validator2.ErrorMessage = this.regularExpressionErrorMessage;
        Validator3.ErrorMessage = this.comparevalidationmessage ;
        MyTextBoxWatermarkExtender.WatermarkText = this.watermarkText;
        MyTextBoxWatermarkExtender.Enabled = this.hasWatermark;
        TextBoxHolderDiv.Attributes["class"] = this.cssClass;
        CompareHolderDiv.Attributes["class"] = this.cssClass;
        CompareHolderDiv.Visible = HasCompareTextBox;
        Validator3.Visible = HasCompareTextBox;
        PasswordHiddenField.Value = Text;
        if (onKeyPress != "")
        {
            MyTextBox.Attributes["onkeypress"] = this.onKeyPress;
            if (this.TextMode == MyTextBoxMode.Password)
            { 
                Password2.Attributes["onkeypress"] = this.onKeyPress;
            }
        }
        if (onBlur != "")
        {
            MyTextBox.Attributes["onblur"] = this.onBlur;
            if (this.TextMode == MyTextBoxMode.Password)
            {
                Password2.Attributes["onblur"] = this.onBlur;
            }
        }
        if (onFocus != "")
        {
            MyTextBox.Attributes["onfocus"] = this.onFocus;
            if (this.TextMode == MyTextBoxMode.Password)
            {
                Password2.Attributes["onfocus"] = this.onFocus;
            }
        }

        if (onKeyUp != "")
        {
            MyTextBox.Attributes["onkeyup"] = this.onKeyUp;
        }
    }
    protected void MyTextBox_PreRender(object sender, EventArgs e)
    {
        if (IsCk)
        {
            HiddenField longtxtboxHidden = (HiddenField)sender;
            StringBuilder _js = new StringBuilder();
            _js.AppendLine("<script type='text/javascript' language='javascript'>");

         
            _js.AppendLine("var instance = CKEDITOR.instances." + MyTextBox.ClientID + ";");
            _js.AppendLine("if (instance) { CKEDITOR.remove(CKEDITOR.instances." + MyTextBox.ClientID + "); }");
            _js.AppendLine("CKEDITOR.replace( '" + MyTextBox.ClientID + "',{height:'400px',width:'600px', id:'cklongtxtbox',contentsLangDirection : '" + direction.ToString() + "',filebrowserBrowseUrl : 'ckfinder/ckfinder.html',filebrowserImageBrowseUrl : 'ckfinder/ckfinder.html?Type=Images',filebrowserFlashBrowseUrl : 'ckfinder/ckfinder.html?Type=Flash',filebrowserUploadUrl : 'ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Files',filebrowserImageUploadUrl : 'ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Images',filebrowserFlashUploadUrl : 'ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Flash'});");
            if (longtxtboxHidden.Value != "")
                _js.AppendLine("CKEDITOR.instances." + MyTextBox.ClientID + ".setData(document.getElementById('" + longtxtboxHidden.ClientID + "').value)");
            //_js.AppendLine("CKEDITOR.instances." + MyTextBox.ClientID + ".document.getBody().setStyle('background-color', 'red');");
            _js.AppendLine("CKEDITOR.instances." + MyTextBox.ClientID + ".on('blur',function() {setHidden" + longtxtboxHidden.ClientID + "()})");
            _js.AppendLine("function setHidden" + longtxtboxHidden.ClientID + "(){document.getElementById('" + longtxtboxHidden.ClientID + "').value= CKEDITOR.instances." + MyTextBox.ClientID + ".getData();}");

            if (this.ckBackGround != "")
            {
                _js.AppendLine("    $(window).ready( function () {   eval('CKEDITOR.instances." + MyTextBox.ClientID + "').on('instanceReady', function (ev) { BgCk(); });");
                _js.AppendLine(" function BgCk(){  eval('CKEDITOR.instances." + MyTextBox.ClientID + "').document.$.childNodes[1].childNodes[1].style.background = '" + this.ckBackGround + "';   };})");
            }
            _js.AppendLine("</script>");
            Page.ClientScript.RegisterStartupScript(GetType(), "CKEditor" + longtxtboxHidden.ClientID, _js.ToString(), false);

            // window.onload = function () {             eval('CKEDITOR.instances.' + NameCkEditor).on('instanceReady', function (ev) { BgCk(); });
            //  eval('CKEDITOR.instances.' + NameCkEditor).document.$.childNodes[1].childNodes[1].style.background = 'url(\'' + UrlImg + '\') top right no-repeat';
     
        }
    }
}