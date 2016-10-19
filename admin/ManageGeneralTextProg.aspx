<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="ManageGeneralTextProg.aspx.cs" Inherits="admin_ManageGeneralTextProg" %>
<%@ Register Src="~/admin/tableControl.ascx" TagName="TableControl" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">

<asp:ScriptManager runat="server"></asp:ScriptManager>
    <br />
	 
	<div runat="server" id="titleDiv" class="titleSpan">
		
	</div>
	<div style="text-align:center; direction:rtl; width:100%">		
		<br />
	</div>
	
	<cc1:TableControl ID="CatsTable" runat="server"  TableTitle="ניהול פרמטרים למתכנת" TblName="generaltexts" SqlFieldNames="genID,genName,genPage,genCode" FieldsToShow="1,1,1,1" TblHeaderNames="מספר,שם הטקסט,מספר דף,קוד" SqlFieldType="1,1,1,1" CustomField=",,," IdField="genID"  IsExcelExportable="true" IsSelectAll="true" IsSelectField="true" IsDelField="true"  AddLink="" MaxResPerPage="10" SortBy="genPage"   />
	


</asp:Content>

