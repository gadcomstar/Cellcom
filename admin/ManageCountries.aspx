<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="ManageCountries.aspx.cs" Inherits="ManageCountries" ValidateRequest="false" %>
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
    <cmsr:MyForm FormStatus="Update"  OnItemUpdated="CheckData" TableName="countries"  CssClass="AdminMyForm" runat="server" ID="BlogTypeMyForm" >
        <MessageTemplate>
            <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClassLeft" runat="server" ID="BlogTypeName" FieldName="Country Name" />           
           <cmsr:MyCheckBox runat="server" DataFieldType="Bool" DataFieldName="countryshow" CssClass="admincheckbox" ImageOff="../admin/images/SelectOff.png" ImageOn="../admin/images/SelectOn.png" ID="ShowArticle" FieldName="Show Country" />            
            <cmsr:MyUpload CssClass="adminloadfile" runat="server" ID="LoadImage" ButtonText="Load" DataFieldType="File" DataFieldName="countryflage" UploadImage="images/loadimgbtn.gif" Text="Load Flag Image" ShowImage="true" Width="80" Types="Image" Height="30" SaveDirectory="countries"  Dimension="16x11" />
        

           
        </MessageTemplate>
    </cmsr:MyForm>
	
    <div style="width:800px;position:relative;float:left;margin:20px;">
    <cc1:TableControl ID="CatsTable" DisplayWidth="800" TableTitle="Manage Countries"    runat="server" IsExcelExportable="false"  TblName="countries" SqlFieldNames="CountryNameeng" FieldsToShow="1,1" TblHeaderNames="Country name,Country Text" SqlFieldType="1,1" CustomField="" IdField="countryid" SortBy="CountryNameeng"   MaxResPerPage="10"  />	
    </div>

</asp:Content>

