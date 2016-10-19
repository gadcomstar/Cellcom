<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="EditSitePage.aspx.cs" Inherits="EditSitePage" ValidateRequest="false" %>
<%@ Register Src="tableControl.ascx" TagName="TableControl" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">

<asp:HyperLink Visible="false" CssClass="backLinkClass"  runat="server" ID="backLink" >חזור</asp:HyperLink>
	<asp:ScriptManager runat="server"></asp:ScriptManager><br />
	<div class="titleSpan">
	<asp:Label runat="server" ID="TitleLabel" >עריכת תגית</asp:Label>
	</div>
	<br />
<cmsr:MyForm FormStatus="Update"   SaveReturnText="שמור וחזור"  BackButtonText="חזור"  DataKeyField="PageID"  SaveButtonText="שמור" TableName="sitepages"  CssClass="AdminMyForm" runat="server" ID="BlogTypeMyForm" >
    <MessageTemplate>
        <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClass"   DataFieldName="PageName" IsRequiredFieldValidator="true" RequiredFielderrorMessage="enter field" runat="server" ID="MyTextBox4" FieldName="שם הדף " />        
        <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClass"   DataFieldName="PageURL" IsRequiredFieldValidator="true" RequiredFielderrorMessage="enter field" runat="server" ID="MyTextBox2" FieldName="כתובת " />   
        <cmsr:MyTextBox DataFieldType="String" TextMode="CKEditor" CssClass="ManageTextBoxHolderDivClass"   DataFieldName="PageDescription"  runat="server" ID="MyTextBox3" FieldName="תוכן" />   
        <div style="float:right;font-size:18px;font-weight:bold;">קידום</div>
         <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClass"   DataFieldName="PageTitle"  runat="server" ID="MyTextBox1" FieldName="כותרת SEO" />        
         <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClassMultiMin300" TextMode="MultiLine"   DataFieldName="PageSEODesc"  runat="server" ID="MyTextBox5" FieldName="תיאור SEO" />        
     
        
    </MessageTemplate>
</cmsr:MyForm>
   
</asp:Content>

