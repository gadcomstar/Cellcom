using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;
using System.Threading;

public partial class Controls_CMSTRDatePeaker2WebUserControl : CMSTRBase
{
    string cssClass = "";
    string yearCssClass = "";
    string monthCssClass = "";
    string dayCssClass = "";
    string dayText = "Day";
    string monthText = "Month";
    string yearText = "Year";
    string myCulture = "en-US";
    int yearRange = 60;
    int startAge = 18;
    bool hasFirstField = true;
    string selectedDay = "0";
    string selectedMonth = "0";
    string selectedYear = "0";
    public string Culture
    {
        set { myCulture = value; }
        get { return myCulture; }
    }
    public string DayText
    {
        set { dayText = value; }
        get { return dayText; }
    }
    public string MonthText
    {
        set { monthText = value; }
        get { return monthText; }
    }
    public string YearText
    {
        set { yearText = value; }
        get { return yearText; }
    }
    public bool HasFirstField
    {
        set { hasFirstField = value; }
        get { return hasFirstField; }
    }
    public int YearRange
    {
        set { yearRange = value; }
        get { return yearRange; }
    }
    public int StartAge
    {
        set { startAge = value; }
        get { return startAge; }
    }
    public string CssClass
    {
        set { cssClass = value; }
        get { return cssClass; }    
    }
    public string YearCssClass
    {
        set { yearCssClass = value; }
        get { return yearCssClass; }
    }
    public string MonthCssClass
    {
        set { monthCssClass = value; }
        get { return monthCssClass; }
    }
    public string DayCssClass
    {
        set { dayCssClass = value; }
        get { return dayCssClass; }
    }
    public override string DataFieldValue
    {
        set { 
                DateTime myDateTime; 
                if ( DateTime.TryParse(value, out myDateTime) ) 
                { 
                    Value = myDateTime.ToString("yyyy-MM-dd");
                    selectedDay = myDateTime.Day.ToString();
                    selectedMonth = myDateTime.Month.ToString();
                    selectedYear = myDateTime.Year.ToString();
                } else {
                    Value = "xxxx-xx-xx";
                }
            }
        get { return Value; }
    }
    public string Value
    {
        set { DateHiddenField.Value = value; }
        get { return DateHiddenField.Value; }
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        DayDropDown.ListItems.Add(new ListItem(dayText, "0"));
        MonthDropDown.ListItems.Add(new ListItem(monthText, "0"));
        YearDropDown.ListItems.Add(new ListItem(yearText, "0"));
        SelectDateHolder.Attributes["class"] = cssClass;
        YearDropDown.CssClass = yearCssClass;
        MonthDropDown.CssClass = monthCssClass;
        DayDropDown.CssClass = dayCssClass;
        if (selectedDay == "0")
        {
            DayDropDown.ListItems[0].Selected = true;            
        }
        if (selectedMonth == "0")
        {
            MonthDropDown.ListItems[0].Selected = true;
        }
        if (selectedYear == "0")
        {
            YearDropDown.ListItems[0].Selected = true;
        }
        Thread.CurrentThread.CurrentCulture = new CultureInfo(myCulture);
        string[] months = CultureInfo.CurrentCulture.DateTimeFormat.MonthNames;
        if (!hasFirstField)
        {
            DayDropDown.ListItems.RemoveAt(0);
            MonthDropDown.ListItems.RemoveAt(0);
            YearDropDown.ListItems.RemoveAt(0);
        }
            for (int i = 1; i < 32; i++)
            {
                ListItem LI = new ListItem();
                LI.Text = i.ToString();
                LI.Value = i.ToString();
                if (LI.Value == selectedDay)
                {
                    LI.Selected = true;
                }
                DayDropDown.ListItems.Add(LI);
            }

            for (int i = 0; i < months.Length - 1; i++)
            {
                ListItem LI = new ListItem();
                if (months[i].Length > 3)
                {
                    LI.Text = months[i].Remove(3);
                }
                else
                {
                    LI.Text = months[i];
                }
                LI.Value = (i + 1).ToString();
                if (LI.Value == selectedMonth)
                {
                    LI.Selected = true;
                }
                MonthDropDown.ListItems.Add(LI);
            }
            for (int i = DateTime.Now.AddYears(-(yearRange+ startAge)).Year; i < DateTime.Now.AddYears(-startAge).Year; i++)
            {
                ListItem LI = new ListItem();
                LI.Text = i.ToString();
                LI.Value = i.ToString();
                if (LI.Value == selectedYear)
                {

                    LI.Selected = true;
                }
               YearDropDown.ListItems.Add(LI);
        }
    }
}