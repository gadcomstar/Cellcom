<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="ManageArticles.aspx.cs" Inherits="admin_ManageFooterLinks" %>
<%@ Register Src="tableControl.ascx" TagName="TableControl" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">

<asp:ScriptManager runat="server"></asp:ScriptManager>
	<br />
	<div class="titleSpan">
	ניהול מאמרים	</div>
	<br />
	<cc1:TableControl ID="CatsTable"   runat="server"  TblName="articles" SqlFieldNames="ArticleID,ArticleHeader" FieldsToShow="1,1" TblHeaderNames="מספר,שם המאמר" SqlFieldType="1,1" CustomField="," IdField="ArticleID" IsDelField="true"  IsExcelExportable="false" IsSelectAll="true" IsSelectField="true" IsAdvanceSearch="true" AddLink="editMidCats.aspx" MaxResPerPage="10" SortBy="ArticleOrder" EditUrl="editLink.aspx?id={field}" OrderField="ArticleOrder" />	


</asp:Content>

