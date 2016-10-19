<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="ManageBuildDrop.aspx.cs" Inherits="ManageBuildDrop" %>

<%@ Register Src="~/admin/FormViewControl3.ascx" TagName="FormViewControl" TagPrefix="cc1" %>
<%@ Register Src="tableControl.ascx" TagName="TableControl" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="Uploadify/jquery.uploadify.js"></script>
    <link rel="Stylesheet" type="text/css" href="Uploadify/uploadify.css" />
    <link href="Cropjs/css/jquery.Jcrop.css" rel="stylesheet" type="text/css" />
    <script src="Cropjs/js/jquery.Jcrop.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">

    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <br />
    <div class="titleSpan">
        <asp:Label runat="server" ID="TitleLabel"></asp:Label>
    </div>
    <br />
    <cmsr:MyForm FormStatus="Update" OnItemUpdated="CheckData" TableName="mysitedropdown" CssClass="AdminMyForm" runat="server" ID="BlogTypeMyForm">
        <MessageTemplate>
            <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClassLeft" runat="server" DataFieldName="dropdownname" ID="NameMyTextBox" FieldName="DropDown Name" />

            <cmsr:MyCheckBox runat="server" DataFieldType="Bool" DataFieldName="showdropdown" Checked="true" CssClass="admincheckbox" ImageOff="../admin/images/SelectOff.png" ImageOn="../admin/images/SelectOn.png" ID="ShowArticle" FieldName="Show DropDown" />


        </MessageTemplate>
    </cmsr:MyForm>

    <div style="width: 800px; position: relative; float: left; margin: 20px;">
        <cc1:TableControl ID="CatsTable" DisplayWidth="800" IsDelField="true" OnItemDeleted="CheckData" TableTitle="ניהול דרופס" runat="server" IsExcelExportable="false" TblName="mysitedropdown" SqlFieldNames="dropdownname" FieldsToShow="1" TblHeaderNames="שם הדרופ" SqlFieldType="1" CustomField="" IdField="idmysitedropdown" MaxResPerPage="10" />
    </div>


</asp:Content>

