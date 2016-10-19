<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="ManageSiteGenText.aspx.cs" Inherits="admin_ManageSiteGenText" %>
<%@ Register Src="~/admin/tableControl.ascx" TagName="TableControl" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">
<asp:ScriptManager runat="server"></asp:ScriptManager>
    <br />
<cc1:TableControl DisplayWidth="800" SortBy="pagename" TableTitle="select page for edit" TblName="pages2" IdField="pageid" SqlFieldNames="pagename,pagecomment"  TblHeaderNames="Page Name,Comment" SqlFieldType="1,1"  runat="server" ID="TextTable" />
</asp:Content>

