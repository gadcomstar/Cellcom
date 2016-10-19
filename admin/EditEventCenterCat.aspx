<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="EditEventCenterCat.aspx.cs" Inherits="admin_EditEventCenterCat" ValidateRequest="false" %>
<%@ Register Src="~/admin/FormViewControl3.ascx" TagName="FormViewControl" TagPrefix="cc1" %>
<%@ Register Src="tableControl.ascx" TagName="TableControl" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">

	<asp:ScriptManager runat="server"></asp:ScriptManager>
    <%--  <asp:HyperLink CssClass="backLinkClass"  runat="server" ID="backLink" >חזור</asp:HyperLink>--%>
      <br />
	<div class="titleSpan">
	<asp:Label runat="server" ID="TitleLabel" >הכנס קטגוריה</asp:Label>
	</div>
	<br />
    <cmsr:MyForm FormStatus="Update" OrderField="helpOrder" HasOrder="true" TableName="tblevents"  CssClass="AdminMyForm" runat="server" ID="BlogTypeMyForm" >
        <MessageTemplate>
            <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClassLeft" DataFieldName="helpheader" runat="server" ID="BlogTypeName" FieldName="Blog Type Name" />
           <asp:Panel runat="server" ID="ArticleFields" >
           <cmsr:MyHiddenField runat="server" DataFieldName="helpParent" DataFieldType="Number" ID="ParentMyHiddenField" />
            <cmsr:MyHiddenField runat="server" DataFieldName="eventLang" DataFieldType="Number" ID="LangMyHiddenField" />

           <cmsr:MyCheckBox runat="server" DataFieldType="Bool" DataFieldName="showHelp" CssClass="admincheckbox" ImageOff="../admin/images/SelectOff.png" ImageOn="../admin/images/SelectOn.png" ID="ShowArticle" FieldName="Show article" />
            <cmsr:MyDatePeaker runat="server" ID="MyDate" FieldName="Article Date" Language="English" DataFieldName="eventspublish" DataFieldType="DateTime" />
             <cmsr:MyTextBox DataFieldType="String" CssClass="MultTextbox" TextMode="MultiLine" DataFieldName="helpShortDesc" runat="server" ID="ShortDescMyTextBox" FieldName="Article Shrt Description" />
            <cmsr:MyTextBox Direction="ltr" DataFieldType="String" CssClass="MultTextbox" TextMode="CKEditor" DataFieldName="helpcontent" runat="server" ID="ContentMyTextBox" FieldName="Article Content" />

            </asp:Panel>
            <div style="float:left;margin-left:200px;font-weight:bold;color:#0269b1;margin-top:10px;">SEO Manage </div>
             <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClassLeft" DataFieldName="helpTitle" runat="server" ID="TitleMyTextBox" FieldName="Page Title" />
             <cmsr:MyTextBox DataFieldType="String" CssClass="MultTextbox" TextMode="MultiLine" DataFieldName="helpDescription" runat="server" ID="DescriptionMyTextBox" FieldName="Page Description" />
             <cmsr:MyTextBox DataFieldType="String" CssClass="MultTextbox" TextMode="MultiLine" DataFieldName="helpkeyWord" runat="server" ID="KeyWordsMyTextBox" FieldName="Page Key Words" />
        </MessageTemplate>
    </cmsr:MyForm>
	
    <div style="width:800px;position:relative;float:left;margin:20px;">
    <cc1:TableControl ID="CatsTable" DisplayWidth="800" TableTitle="Manage Blog Article" IsDelField="true" OrderField="helpOrder" IsSelectField="true" IsSelectAll="true"   runat="server" IsExcelExportable="false"  TblName="tblevents" SqlFieldNames="helpheader" FieldsToShow="1" TblHeaderNames="Article Name" SqlFieldType="1" CustomField="" IdField="idtblhelpcenter" SortBy="helpOrder"   MaxResPerPage="10"  />	
    </div>

</asp:Content>

