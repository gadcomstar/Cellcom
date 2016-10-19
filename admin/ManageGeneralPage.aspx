<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="ManageGeneralPage.aspx.cs" Inherits="admin_ManageGeneralPage" %>
<%@ Register Src="tableControl.ascx" TagName="TableControl" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">

<asp:HyperLink CssClass="backLinkClass"  runat="server" ID="backLink" >חזור</asp:HyperLink>
<asp:ScriptManager runat="server"></asp:ScriptManager>
<br />
	<cc1:TableControl DelCommand="Delete from {0} {1}    OR PageParent={2}" ID="CatTable" runat="server" TblName="pages"  IsAdvanceSearch="false" SqlFieldNames="PageIsDel,PageID,PageName,PageID,PageID" FieldsToShow="1,1,1,1,1" FieldsToSearch="0,0,0,0,0"   TblHeaderNames=",מספר,שם הדף,ניהול טקסטים וכותרות,הוספת תת-דפים" SqlFieldType="1,1,1,1,1,1"  IdField="PageID" IsDelField="false" IsExcelExportable="false"  TableTitle="דפים כללים" MaxResPerPage="20" SortBy="PageID" EditUrl="EditGeneralPage.aspx?id={field}"  />

</asp:Content>

