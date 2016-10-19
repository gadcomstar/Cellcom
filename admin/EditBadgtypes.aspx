<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="EditBadgtypes.aspx.cs" Inherits="EditBadgtypes" ValidateRequest="false" %>

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
<cmsr:MyForm FormStatus="Update"  SaveReturnText="שמור וחזור"  BackButtonText="Back"  DataKeyField="tblBadgeTypesid" OnItemInserted="BlogTypeMyForm_ItemInserted" OnItemUpdated="BlogTypeMyForm_ItemInserted"  SaveButtonText="שמור" TableName="tblbadgetypes"  CssClass="AdminMyForm" runat="server" ID="BlogTypeMyForm" >
    <MessageTemplate>
        <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClassLeft"   DataFieldName="tblBadgeTypesName" IsRequiredFieldValidator="true" RequiredFielderrorMessage="הכנס שם!" runat="server" ID="MyTextBox4" FieldName="שם סוג התגית" />        
         
          </MessageTemplate>
</cmsr:MyForm>
   
</asp:Content>

