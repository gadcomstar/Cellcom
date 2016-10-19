<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="ManageProgram.aspx.cs" Inherits="ManageProgram" %>
<%@ Register Src="tableControl.ascx" TagName="TableControl" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">

<asp:ScriptManager runat="server"></asp:ScriptManager>
		<br /><br />
	
     <cmsr:MyForm FormStatus="Update" OnItemInserted="CheckBest"  OnItemUpdated="CheckBest" BackButtonText="Back"  DataKeyField="progid" VisibleSaveAndBackButton="false" SaveButtonText="Save" TableName="programs"  CssClass="AdminMyForm" runat="server" ID="BlogTypeMyForm" >
        <MessageTemplate>
             <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClassLeft"  DataFieldName="progName" runat="server" ID="BlogTypeName" FieldName="Program Name" />
             <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClassLeft"  DataFieldName="progSaveText" runat="server" ID="SpecialMyTextBox" FieldName="Program Discount" />
             <cmsr:MyTextBox DataFieldType="Number" CssClass="ManageTextBoxHolderDivClassLeft"  DataFieldName="progPricePerMonth" runat="server" ID="PriceMyTextBox" FieldName="Program Price Per Month" />
             <cmsr:MyCheckBox runat="server" CssClass="admincheckbox" ImageOff="../admin/images/SelectOff.png" ImageOn="../admin/images/SelectOn.png" ID="GameShowMyCheckBox" DataFieldType="Bool" FieldName="Is Best Program" DataFieldName="IsBest" />
              <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClassLeft"  DataFieldName="progComment" runat="server" ID="CommentMyTextBox" FieldName="Program Comment" />
            <cmsr:MyTextBox DataFieldType="Number" CssClass="ManageTextBoxHolderDivClassLeft"  DataFieldName="progLong" runat="server" ID="LongMyTextBox" FieldName="Program Months" />
          
         </MessageTemplate>
    </cmsr:MyForm>
    <div style="width:100%;float:left;">
	    <cc1:TableControl ID="CatsTable" DisplayWidth="800"  IsDelField="true" IsSelectField="true" IsSelectAll="true" TableTitle="Manage Plans"   runat="server" IsExcelExportable="false"  TblName="programs" SqlFieldNames="progName,IsBest" FieldsToShow="1,1" TblHeaderNames="Program Name,is Best" SqlFieldType="1,2" CustomField="" IdField="progid"   MaxResPerPage="10"  />	
    </div>
   <cc1:TableControl  ID="LangTableControl" DisplayWidth="800"  IsDelField="false" TableTitle="Waiting Room Content: Choose Language"   runat="server" IsExcelExportable="false"  TblName="languages" SqlFieldNames="LangName" FieldsToShow="1" TblHeaderNames="Category Name" SqlFieldType="1" CustomField="" IdField="LangID"   MaxResPerPage="10"  />	


</asp:Content>

