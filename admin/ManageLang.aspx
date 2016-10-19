<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="ManageLang.aspx.cs" Inherits="admin_ManageLang" %>
<%@ Register Src="tableControl.ascx" TagName="TableControl" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">


<asp:ScriptManager runat="server"></asp:ScriptManager>
<br />
	<cc1:TableControl ID="CatTable" OnPreRender="ManageTable_PreRender" runat="server" TblName="langsite"  SqlFieldNames="ISDel,langid,langname,langcode" FieldsToShow="1,1,1,1" FieldsToSearch="0,0,0,0"   TblHeaderNames=",מספר,שם אתר,שפה" SqlFieldType="1,1,1,1"  IdField="langid" IsDelField="true" IsExcelExportable="false" OnItemDeleting="DeleteTables"  TableTitle="ניהול שפות"  OrderField="langorder" MaxResPerPage="10" SortBy="langOrder"   />

</asp:Content>

