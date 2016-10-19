<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="ManageSlider.aspx.cs" Inherits="ManageSlider" %>

<%@ Register Src="tableControl.ascx" TagName="TableControl" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">

    <asp:ScriptManager runat="server"></asp:ScriptManager>
   
   <div style="width: 100%; float: left;">
        <cc1:TableControl ID="CatsTable" DisplayWidth="800" IsDelField="true" IsSelectField="true" IsSelectAll="true" TableTitle="ניהול תמונות מתחלפות" runat="server"
            IsExcelExportable="false" TblName="tblsliders" SqlFieldNames="slidertext,sliderimage"
            FieldsToShow="1,1" TblHeaderNames="טקטס,תמונה"  SqlFieldType="1,1" CustomField=",aaa,"   IdField="sliderid" MaxResPerPage="20" />
    </div>
</asp:Content>

