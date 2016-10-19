<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="ManageSite.aspx.cs" Inherits="admin_ManageSite" %>
<%@ Register Src="tableControl.ascx" TagName="TableControl" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">

<asp:ScriptManager runat="server"></asp:ScriptManager>
	<br />
	<div class="titleSpan">
	ניהול הגדרות
	</div>
<br />
	<cc1:TableControl ID="CatsTable"   runat="server"  TblName="adminsites" SqlFieldNames="siteID,siteName" FieldsToShow="1,1" TblHeaderNames="מספר,שם האתר" SqlFieldType="1,1" CustomField="," IdField="siteID"   IsExcelExportable="false"     MaxResPerPage="10"   />
	

</asp:Content>

