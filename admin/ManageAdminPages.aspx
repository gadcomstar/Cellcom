<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="ManageAdminPages.aspx.cs" Inherits="admin_ManageAdminPages" %>
<%@ Register Src="~/admin/tableControl.ascx" TagName="TableControl" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">

<asp:ScriptManager runat="server"></asp:ScriptManager>
    <br />
	 
	<div runat="server" id="titleDiv" class="titleSpan">
		ניהול דפי ניהול
	</div>
	<div style="text-align:center; direction:rtl; width:100%">		
		<br />
	</div>	
	<cc1:TableControl ID="CatsTable" runat="server"   TblName="adminpages" SqlFieldNames="delfeild,catID,catParent,catOrder,catText,catLink" FieldsToShow="1,1,1,1,1,1" TblHeaderNames=",מספר,Parent,סדר,כותרת,קישור" SqlFieldType="1,1,1,1,1,1" CustomField='<span id="{0}"></span>,,,,,' IdField="catID"  IsExcelExportable="true"  IsDelField="true"  AddLink="" MaxResPerPage="50" SortBy="catID"   />
	
</asp:Content>

