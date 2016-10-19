<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="EditEventArticle.aspx.cs" Inherits="admin_EditEventArticle" ValidateRequest="false" %>
<%@ Register Src="~/admin/FormViewControl3.ascx" TagName="FormViewControl" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">

	<asp:ScriptManager runat="server"></asp:ScriptManager>
      <asp:HyperLink CssClass="backLinkClass"  runat="server" ID="backLink" >חזור</asp:HyperLink>
      <br />
	<div class="titleSpan">
	<asp:Label runat="server" ID="TitleLabel" >הכנס מאמר</asp:Label>
	</div>
	<br />
	<cc1:FormViewControl  runat="server" ID="CatFormView" FormViewAction="Insert" IdField="idtblhelpcenter" TblName="tblevents" SqlFieldNames="helpheader,eventspublish,showHelp,helpShortDesc,helpcontent,idtblhelpcenter,helpTitle,helpDescription,helpkeyWord" ReplaceField=",,,,,,,," TblHeaderNames="שם המאמר,תאריך,הראה מאמר,תיאור קצר,תוכן,קידום,כותרת,תוכן,מילות מפתח" SqlFieldType="1,6,2,7,10,5,1,7,7" ReturnURL="" />


</asp:Content>

