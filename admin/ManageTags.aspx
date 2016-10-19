<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="ManageTags.aspx.cs" Inherits="ManageTags" %>

<%@ Register Src="tableControl.ascx" TagName="TableControl" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">

    <asp:ScriptManager runat="server"></asp:ScriptManager>
   
   <div style="width: 100%; float: left;">
        <cc1:TableControl ID="CatsTable" DisplayWidth="800" IsDelField="true" IsSelectField="true" IsSelectAll="true" TableTitle="ניהול תגיות(נושאים)" runat="server"
            IsExcelExportable="false"  TblName="tbltags" SqlFieldNames="tagName"
            FieldsToShow="1" TblHeaderNames="שם התג" SqlFieldType="1" SortBy="tagName"  IdField="tblTagsid" MaxResPerPage="20" />
    </div>
</asp:Content>

