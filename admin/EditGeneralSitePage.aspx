<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="EditGeneralSitePage.aspx.cs" Inherits="admin_EditGeneralSitePage" ValidateRequest="false" %>
<%@ Register Src="~/admin/FormViewControl3.ascx" TagName="FormViewControl" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">


<asp:HyperLink CssClass="backLinkClass"  runat="server" ID="backLink" >חזור</asp:HyperLink>
<br />
<div class="titleSpan">
	<asp:Label runat="server" ID="TitleLabel" >ערוך דף</asp:Label>
	</div>
	<asp:ScriptManager runat="server"></asp:ScriptManager>
	<br />
	<cc1:FormViewControl  runat="server" ID="CatFormView" OnItemInserted="CatFormView_ItemInserted"  FormViewAction="Insert" IdField="PageID" TblName="sitepages" SqlFieldNames="PageName,PageHeader,pagecontent,PageID,PageTitle,PageSEODesc,PageKeyWords" ReplaceField=",,,,,," TblHeaderNames="שם הדף,כותרת הדף,תוכן,קידום,כותרת,תוכן,מילות מפתח" SqlFieldType="1,1,10,5,1,7,7" ReturnURL="" />


</asp:Content>

