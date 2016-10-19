<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="ManageSiteLang.aspx.cs" Inherits="admin_ManageSiteLang" %>
<%@ Register Src="tableControl.ascx" TagName="TableControl" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">

<asp:ScriptManager runat="server"></asp:ScriptManager>
		<br /><br />
	<cc1:TableControl ID="CatsTable" DisplayWidth="800" OnItemDeleted="CatsTable_ItemDeleted"  IsDelField="true"   TableTitle="Manage languages"   runat="server" IsExcelExportable="false"  TblName="languages" SqlFieldNames="LangName" FieldsToShow="1" TblHeaderNames="Language Name" SqlFieldType="1" CustomField="" IdField="LangID"   MaxResPerPage="10"  />	

  
</asp:Content>

