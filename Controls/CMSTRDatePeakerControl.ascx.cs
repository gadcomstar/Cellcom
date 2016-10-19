using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class CMSTRDatePeakerControl : CMSTRBase
{
   public enum Laung { 
        English,
        Hebrew                              
    }
    #region Properties
    private string cssClass = "DatePeakerHolderDiv";
    private Laung datePeakerLaung = Laung.Hebrew;
    private string dateFormat = "dd/mm/yyyy";
    private int monthsToShow = 1;
    private DateTime minDate ;
    private DateTime maxDate;
    private DateTime defaultDate;
    private string fieldName = "";
    private string validationGroup;
    private string requiredFieldErrorMessage = "*";
    private bool isRequiredFieldValidator = false;
    private string yearRange = "12:0";

    /// <summary>
    ///  range of year display on the year drop box dd:dd
    /// </summary>
    public string YearRange
    {
        set { this.yearRange = value; }
        get { return this.yearRange; }
    }
    public bool IsRequiredFieldValidator
    {
        set { this.isRequiredFieldValidator = value; }
        get { return this.isRequiredFieldValidator; }
    }
    public String RequiredFielderrorMessage
    {
        set { this.requiredFieldErrorMessage = value; }
        get { return this.requiredFieldErrorMessage; }
    }
    public String ValidationGroup
    {
        set { this.validationGroup = value; }
        get { return this.validationGroup; }
    }
    public string FieldName
    {
        set { this.fieldName = value; }
        get { return this.fieldName; }
    }
    public override string DataFieldValue
    {
        get
        {
            return this.SelectedDate;
        }
        set
        {
            if (value != "")
            {
                this.SelectedDate = (DateTime.Parse(value)).ToShortDateString();
            }
            else
            {
                this.SelectedDate = null;
            }
        }
    }
    public string SelectedDate
    {
        set { DateTextBox.Text = value; }
        get { return DateTextBox.Text; }    
    }
    public DateTime DefaultDate
    {
        set { this.defaultDate = value; }
        get { return this.defaultDate; }
    }
    public DateTime MinDate
    {
        set { this.minDate = value; }
        get { return this.minDate; }
    }
    public DateTime MaxDate
    {
        set { this.maxDate = value; }
        get { return this.maxDate; }
    }
    public int MonthsToShow
    {
        set { this.monthsToShow = value; }
        get { return this.monthsToShow; }
    }
    public string DateFormat
    {
        set { this.dateFormat = value; }
        get { return this.dateFormat; }
    }
    public string CssClass
    {
        set { this.cssClass = value; }
        get { return this.cssClass; }  
    }
    public Laung Language
    {
        set { this.datePeakerLaung = value; }
        get { return this.datePeakerLaung; }
    }
    #endregion
    protected void Page_PreRender(object sender, EventArgs e)
    {
        string minDateString = "";
        Validator1.ValidationGroup = this.validationGroup;
        Validator1.ErrorMessage = this.requiredFieldErrorMessage;
        Validator1.Visible = this.isRequiredFieldValidator;
        if (minDate != DateTime.MinValue)
        {
            minDateString = ",minDate: new Date("+ minDate.Year +", "+ minDate.Month+" - "+ minDate.Month+", "+ minDate.Day +")";
        }
        string maxDateString = "";
        if (maxDate != DateTime.MinValue)
        {
            maxDateString = ",maxDate: new Date(" + maxDate.Year + ", " + maxDate.Month + " - " + maxDate.Month + ", " + maxDate.Day + ")";
        }      
        if (defaultDate != DateTime.MinValue)
        {
            maxDateString = ",defaultDate: new Date(" + defaultDate.Year + ", " + defaultDate.Month + " - " + defaultDate.Month + ", " + defaultDate.Day + ")";
        }
        DatePeakerHolderDiv.Attributes["class"] = this.cssClass;
        string[] YearRangearry = yearRange.Split(':');
        string _jsScript = " $('.DateTextBoxClass').datepick({  dateFormat: '" + dateFormat + "',yearRange:" + "'c-" + YearRangearry[0] + ":c+" + YearRangearry[1] + "' ,monthsToShow:" + this.monthsToShow + minDateString + maxDateString + "  });";
        Page.ClientScript.RegisterStartupScript(GetType(), "datepik", _jsScript, true);      
        switch (datePeakerLaung)
        { 
            case Laung.Hebrew:
                Page.ClientScript.RegisterClientScriptInclude("he", "datepik/jquery.datepick-he.js");
                break;
            case Laung.English:
                break;
        
            default:
                Page.ClientScript.RegisterClientScriptInclude("he", "datepik/jquery.datepick-he.js");
                break;
        }       
    }
}