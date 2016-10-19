using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Controls_CMSTRRanking : CMSTRBase
{
    private string cssClass = "RankingHolderClass";
    private string range = "1,10";
    int startNum = 1;
    int endNum = 10;
    private string fieldName = "";
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
    public int SelectedValue
    { 
      set { 
        this.rankingHiddenField.Value = value.ToString(); }
        get {
            int myValue =0;
            int.TryParse(this.rankingHiddenField.Value, out myValue);
            return myValue;
        }    
    }
    public override string DataFieldValue
    {
        set
        {
            int myValue = 0;
            int.TryParse(value, out myValue);
            SelectedValue = myValue;
        }
        get
        {
            return SelectedValue.ToString();
        }
    }
    public string Range
    {
        set {this.range = value; }
        get { return this.range; }    
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        FieldNameLiteral.Text = this.fieldName;
        DataTable dt = new DataTable();
        dt.Columns.Add("Number");
        string[] MyRange = range.Split(',');
        int.TryParse(MyRange[0], out startNum);
        int.TryParse(MyRange[1], out endNum);
        for (int i = startNum; i < endNum+1; i++)
        {
            DataRow newDataRow = dt.NewRow();
            newDataRow["Number"] = i;
            dt.Rows.Add(newDataRow);
        }
        RankingRepeater.DataSource = dt;
        RankingRepeater.DataBind();
        string _js = "";       
        _js = "function markit"+rankingHiddenField.ClientID+"(myNum) {";       
        _js += "$('#" + rankingHiddenField.ClientID + "').val(myNum);";
        _js += "mouseunmarkit" + rankingHiddenField.ClientID + "();";
        _js += "}";
        _js += " function mousemarkit" + rankingHiddenField.ClientID + "(myNum) {";           
        _js += "for (i = "+startNum+"; i < myNum+1; i++) {";
        _js += "$('#mynum" + rankingHiddenField.ClientID + "' + i).addClass('RankingNumClassSel');";
        _js += " }";
        _js += "for (i = myNum+1; i < "+endNum+"+1; i++) {";
        _js += "$('#mynum" + rankingHiddenField.ClientID + "' + i).removeClass('RankingNumClassSel');";
        _js += " }";
        _js += " }";
        _js += "function mouseunmarkit" + rankingHiddenField.ClientID + "() {";        
        _js += " myNum = $('#" + rankingHiddenField.ClientID + "').val();";
        _js += "if(myNum=='') {} else{myNum=parseInt(myNum);  }";       
        _js += " for (i = "+startNum+"; i < myNum + 1; i++) {";
        _js += "$('#mynum" + rankingHiddenField.ClientID + "' + i).addClass('RankingNumClassSel');";
        _js += "}";       
        _js += " for (i = myNum + 1; i < "+endNum+"+1; i++) {";    
        _js += "$('#mynum" + rankingHiddenField.ClientID + "' + i).removeClass('RankingNumClassSel');";
        _js += "}";
        _js += "}";
        Page.ClientScript.RegisterStartupScript(GetType(), "rankingkey" + rankingHiddenField.ClientID, _js, true);
    }
}