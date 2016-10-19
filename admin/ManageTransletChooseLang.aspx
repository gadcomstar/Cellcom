<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="ManageTransletChooseLang.aspx.cs" Inherits="ManageTransletChooseLang" %>
<%@ Register Src="tableControl.ascx" TagName="TableControl" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">

<asp:ScriptManager runat="server"></asp:ScriptManager>
		<br /><br />
	<cc1:TableControl ID="CatsTable" DisplayWidth="800"  IsDelField="false" TableTitle="Translate Pages: Choose Language"   runat="server" IsExcelExportable="false"  TblName="languages" SqlFieldNames="LangName" FieldsToShow="1" TblHeaderNames="Category Name" SqlFieldType="1" CustomField="" IdField="LangID"   MaxResPerPage="10"  />	


</asp:Content>

