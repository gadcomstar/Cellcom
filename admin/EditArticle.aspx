<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="EditArticle.aspx.cs" Inherits="admin_EditArticle" ValidateRequest="false" %>
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
	<cc1:FormViewControl  runat="server" ID="CatFormView" FormViewAction="Insert" IdField="ArticleID" TblName="articles" SqlFieldNames="ArticleHeader,ArticlePublish,ShowArticle,ArticleImage,ArticleShortDesc,ArticleContent,ArticleID,ArticleTitle,ArticleSEODesc,ArticleKeyWord" ReplaceField=",,,../images/ArticleImages/--128x100--_tn,,,,,," TblHeaderNames="שם המאמר,תאריך המאמר,הראה מאמר,תמונה,תיאור קצר,המאמר,קידום,כותרת,תוכן,מילות מפתח" SqlFieldType="1,6,2,11,7,10,5,1,7,7" ReturnURL="" />


</asp:Content>

