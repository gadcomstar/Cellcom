<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="ManageSitePage.aspx.cs" Inherits="ManageSitePage" %>

<%@ Register Src="tableControl.ascx" TagName="TableControl" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">

    <asp:ScriptManager runat="server"></asp:ScriptManager>
   
   <div style="width: 100%; float: left;">
        <cc1:TableControl ID="CatsTable" DisplayWidth="800" IsDelField="false" TableTitle="ניהול דפים" runat="server"
            IsExcelExportable="false" TblName="sitepages" SqlFieldNames="PageName,PageURL"
            FieldsToShow="1,1" TblHeaderNames="שם הדף,כתובת"  SqlFieldType="1,1"  SortBy="PageName"  IdField="PageID" MaxResPerPage="20" />
    </div>
</asp:Content>

