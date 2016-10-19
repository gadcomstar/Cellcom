<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="ManageSiteManager.aspx.cs" Inherits="admin_ManageSiteManager" %>
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
	
	<cc1:TableControl ID="CatsTable" TableTitle="Edit admin Managers " DisplayWidth="700" runat="server"  TblName="adminmanagers" SqlFieldNames="ManID,ManUN,manageremail" FieldsToShow="1,1,1" TblHeaderNames="num,Manager name,e-mail," SqlFieldType="1,1,1" CustomField=",," IdField="ManID"  IsExcelExportable="false" IsSelectAll="true" IsSelectField="true" IsDelField="true"  AddLink="" MaxResPerPage="20" SortBy="ManID"   />
	


</asp:Content>

