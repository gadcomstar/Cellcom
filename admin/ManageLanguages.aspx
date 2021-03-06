﻿<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="ManageLanguages.aspx.cs" Inherits="ManageLanguages" ValidateRequest="false" %>
<%@ Register Src="~/admin/FormViewControl3.ascx" TagName="FormViewControl" TagPrefix="cc1" %>
<%@ Register Src="tableControl.ascx" TagName="TableControl" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
  <script type="text/javascript" src="Uploadify/jquery.uploadify.js"></script>
    <link rel="Stylesheet" type="text/css" href="Uploadify/uploadify.css" />
    <link href="Cropjs/css/jquery.Jcrop.css" rel="stylesheet" type="text/css" />
    <script src="Cropjs/js/jquery.Jcrop.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">

	<asp:ScriptManager runat="server"></asp:ScriptManager>
    <%--  <asp:HyperLink CssClass="backLinkClass"  runat="server" ID="backLink" >חזור</asp:HyperLink>--%>
      <br />
	<div class="titleSpan">
	<asp:Label runat="server" ID="TitleLabel" ></asp:Label>
	</div>
	<br />
    <cmsr:MyForm FormStatus="Update" OnItemUpdated="CheckData" TableName="tbllang"  CssClass="AdminMyForm" runat="server" ID="BlogTypeMyForm" >
        <MessageTemplate>
            <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClassLeft" runat="server" DataFieldName="langname" ID="NameMyTextBox" FieldName="Language General Name" />                    
            <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClassLeft" runat="server" ID="BlogTypeName" FieldName="Language Name" />           
              
           <cmsr:MyCheckBox runat="server" DataFieldType="Bool" DataFieldName="showlang" CssClass="admincheckbox" ImageOff="../admin/images/SelectOff.png" ImageOn="../admin/images/SelectOn.png" ID="ShowArticle" FieldName="Show State" />            
           
        </MessageTemplate>
    </cmsr:MyForm>
	
    <div style="width:800px;position:relative;float:left;margin:20px;">
    <cc1:TableControl ID="CatsTable" DisplayWidth="800" IsDelField="true" OnItemDeleted="CheckData" TableTitle="Manage Langauges"    runat="server" IsExcelExportable="false"  TblName="tbllang" SqlFieldNames="langname" FieldsToShow="1,1" TblHeaderNames="Langauges Name,Langauges Text" SqlFieldType="1,1" CustomField="" IdField="idtbllang" SortBy="langname"   MaxResPerPage="10"  />	
    </div>

</asp:Content>

