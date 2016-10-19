<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="ManageReco.aspx.cs" Inherits="admin_ManageReco" %>
<%@ Register Src="tableControl.ascx" TagName="TableControl" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">

<asp:ScriptManager runat="server"></asp:ScriptManager>
	<br />	
	<br />
	<cc1:TableControl ID="CatsTable"  TableTitle="ניהול המלצות"  runat="server"  TblName="recommadations" SqlFieldNames="recoid,recoName" FieldsToShow="1,1" TblHeaderNames="מספר,שם ההמלצה" SqlFieldType="1,1" CustomField="," IdField="recoid" IsDelField="true"  IsExcelExportable="false" IsSelectAll="true" IsSelectField="true" IsAdvanceSearch="true"  MaxResPerPage="10" SortBy="recoOrder"  OrderField="recoOrder" />	

</asp:Content>

