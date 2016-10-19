<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="ManageUserFields.aspx.cs" Inherits="admin_ManageUserFields" %>
<%@ Register Src="tableControl.ascx" TagName="TableControl" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">

<asp:ScriptManager runat="server"></asp:ScriptManager>
		<br /><br />
	
     <cmsr:MyForm FormStatus="Update" OrderField="fieldorder" HasOrder="true" BackButtonText="Back"  DataKeyField="idtbluserfield" VisibleSaveAndBackButton="false" SaveButtonText="Save" TableName="tbluserfield"  CssClass="AdminMyForm" runat="server" ID="BlogTypeMyForm" >
        <MessageTemplate>
             <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClassLeft"  DataFieldName="fieldname" runat="server" ID="BlogTypeName" FieldName="Field Name" />
            <div class="commentdiv">Internal name</div>
            <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClassLeft"  DataFieldName="fieldname" runat="server" ID="ValueMyTextBox" FieldName="Field Text" />
            <div class="commentdiv">The field name in setting and profile pages</div>
             <cmsr:MyDropDown DataFieldType="Number" FieldName="Choose category:" DataFieldName="fieldtype" runat="server" ID="fieldtype" ><ListItems>
                <asp:ListItem Text="Important Facts" Value="1" Selected="True" ></asp:ListItem>
                <asp:ListItem Text="My Look" Value="2" ></asp:ListItem>
                <asp:ListItem Text="My Lifestyle" Value="3" ></asp:ListItem>
                <asp:ListItem Text="My Background" Value="4" ></asp:ListItem>
             </ListItems></cmsr:MyDropDown>
         </MessageTemplate>
    </cmsr:MyForm>
    <div style="width:100%;float:left;">
	<cc1:TableControl ID="CatsTable" DisplayWidth="800"  IsDelField="true" IsSelectField="true" IsSelectAll="true" TableTitle="Manage User Fields"   runat="server" IsExcelExportable="false"  TblName="tbluserfield" SqlFieldNames="fieldname" FieldsToShow="1,1" TblHeaderNames="Field Name,Field Text" SqlFieldType="1,1" CustomField="" IdField="idtbluserfield"  SortBy="fieldorder" OrderField="fieldorder"  MaxResPerPage="10"  />	
    </div>

   <cc1:TableControl ID="LangTableControl" DisplayWidth="800"  IsDelField="false" TableTitle="Translate Pages: Choose Language"   runat="server" IsExcelExportable="false"  TblName="languages" SqlFieldNames="LangName" FieldsToShow="1" TblHeaderNames="Category Name" SqlFieldType="1" CustomField="" IdField="LangID"   MaxResPerPage="10"  />	


</asp:Content>

