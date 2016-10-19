<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="EditTags.aspx.cs" Inherits="EditTags" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="js/jquery.uploadify.js"></script>
    <link href="js/uploadify.css" rel="stylesheet" />
   
    <link href="Cropjs/css/jquery.Jcrop.css" rel="stylesheet" type="text/css" />
    <script src="Cropjs/js/jquery.Jcrop.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">

<asp:HyperLink Visible="false" CssClass="backLinkClass"  runat="server" ID="backLink" >חזור</asp:HyperLink>
	<asp:ScriptManager runat="server"></asp:ScriptManager><br />
	<div class="titleSpan">
	<asp:Label runat="server" ID="TitleLabel" >נהל תגית</asp:Label>
	</div>
	<br />
<cmsr:MyForm FormStatus="Update"  SaveReturnText="שמור וחזור"  BackButtonText="Back"  DataKeyField="tblTagsid" OnItemInserted="BlogTypeMyForm_ItemInserted" OnItemUpdated="BlogTypeMyForm_ItemInserted"  SaveButtonText="שמור" TableName="tblTags"  CssClass="AdminMyForm" runat="server" ID="BlogTypeMyForm" >
    <MessageTemplate>
        <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClassLeft"   DataFieldName="tagName" IsRequiredFieldValidator="true" RequiredFielderrorMessage="enter field" runat="server" ID="MyTextBox4" FieldName="שם התג" />        
         
          </MessageTemplate>
</cmsr:MyForm>
   
</asp:Content>

