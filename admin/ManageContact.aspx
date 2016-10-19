<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="ManageContact.aspx.cs" Inherits="ManageContact" %>
<%@ Register Src="tableControl.ascx" TagName="TableControl" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">

<asp:ScriptManager runat="server"></asp:ScriptManager>
		<br /><br />
	<div style="width:100%;position:relative;">
  
     
    <br />
    <div style="display:block" id="block1">
   <cc1:TableControl ID="LangTableControl" SortBy="`date` desc" DisplayWidth="800"  IsAdvanceSearch="false" IsSelectAll="true" IsSelectField="true"
        IsDelField="true" TableTitle="Manage Contact"   runat="server" FieldsToSearch="0,1" IsExcelExportable="false"  
       TblName="tblcontact" SqlFieldNames="date(`date`) as mydate,content"  FieldsToShow="1,1" TblHeaderNames="Date,Content" 
       SqlFieldType="1,1" CustomField="," IdField="idtblcontact"   MaxResPerPage="10"  />	
    <br />
        </div>
   
    

   
        </div>
   
</asp:Content>

