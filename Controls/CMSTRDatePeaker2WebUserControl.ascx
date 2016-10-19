<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CMSTRDatePeaker2WebUserControl.ascx.cs" Inherits="Controls_CMSTRDatePeaker2WebUserControl" %>
<%@ Register TagPrefix="cmsr" TagName="MyDropDown2" Src="~/Controls/CMSTRDropDownControl2.ascx" %>
<script type="text/javascript">
    var myhidden = "<%= DateHiddenField.ClientID %>";  
</script>
<%--<script src="../Script/DatePeaker2WebUserControl.js"></script>--%>
  <div runat="server" id="SelectDateHolder" class="BirthdayHolder">
        <cmsr:MyDropDown2 runat="server" OnClientSelectedChanged="setday1(value);" CssClass="DateDropDownClass"  ID="DayDropDown" >       
        </cmsr:MyDropDown2>
        <cmsr:MyDropDown2 runat="server" OnClientSelectedChanged="setmounth(value);" CssClass="DateDropDownClass"  ID="MonthDropDown" >            
        </cmsr:MyDropDown2>
        <cmsr:MyDropDown2 runat="server" OnClientSelectedChanged="setyear(value);" CssClass="DateDropDownClass"  ID="YearDropDown" >
        </cmsr:MyDropDown2>
        <asp:HiddenField runat="server" ID="DateHiddenField"  Value="xxxx-xx-xx" />
    </div>