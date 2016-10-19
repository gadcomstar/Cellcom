<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="ManageBadgtypes.aspx.cs" Inherits="ManageBadgtypes" %>

<%@ Register Src="tableControl.ascx" TagName="TableControl" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">

    <asp:ScriptManager runat="server"></asp:ScriptManager>
   
   <div style="width: 100%; float: left;">
        <cc1:TableControl ID="CatsTable" DisplayWidth="800" IsDelField="true" IsSelectField="true" IsSelectAll="true" TableTitle="סוגי תגיות" runat="server"
            IsExcelExportable="false"  TblName="tblbadgetypes" SqlFieldNames="tblBadgeTypesName"
            FieldsToShow="1" TblHeaderNames="שם התג" SqlFieldType="1" SortBy="tblBadgeTypesid"  IdField="tblBadgeTypesid" MaxResPerPage="20" />
    </div>
</asp:Content>

