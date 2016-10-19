<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="ManageBadges.aspx.cs" Inherits="ManageBadges" %>

<%@ Register Src="tableControl.ascx" TagName="TableControl" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">

    <asp:ScriptManager runat="server"></asp:ScriptManager>
   
   <div style="width: 100%; float: left;">
        <cc1:TableControl ID="CatsTable" DisplayWidth="800" IsDelField="true" IsSelectField="true" IsSelectAll="true" TableTitle="ניהול תגיות" runat="server"
            IsExcelExportable="false" TblName="tblbadges" SqlFieldNames="badgename,badgeImage,badgetype"
            FieldsToShow="1,1,1" TblHeaderNames="שם התג,תמונה,סוג"  SqlFieldType="1,1,3" CustomField=",aaa," SortBy="badgename" SqlWhereQuery="badgedel=0" IdField="badgid" MaxResPerPage="20" />
    </div>
</asp:Content>

