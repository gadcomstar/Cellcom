<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="EditSiteLanguages.aspx.cs" Inherits="admin_EditSiteLanguages" ValidateRequest="false" %>
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
        <br />
     <br />
	<div class="titleSpan">
	<asp:Label runat="server" ID="TitleLabel" >Enter language</asp:Label>
	</div>
	<br />
    <cmsr:MyForm FormStatus="Update" BackButtonText="Back" OnItemInserted="BuildLang" SaveButtonText="Save" SaveReturnText="Save & Back" TableName="languages" DataKeyField="LangID"  CssClass="AdminMyForm" runat="server" ID="LangMyForm" >
        <MessageTemplate>
            <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClassLeft" DataFieldName="LangName" runat="server" ID="LangName" FieldName="Language Name" />
          
            <cmsr:MyDropDown CssClass="DropDownHolderDivClass" runat="server" FieldName="Site Direction" DataFieldName="LandDir" DataFieldType="String" ID="DirctionMyDropDown" >
                <ListItems>
                    <asp:ListItem Text="RTL" Value="rtl" ></asp:ListItem>
                    <asp:ListItem Text="LTR" Value="ltr" Selected="True" ></asp:ListItem>
                </ListItems>
            </cmsr:MyDropDown>
              <div class="commentdiv">LTR- Left to right, RTL - Right to left</div>
             <cmsr:MyDropDown CssClass="DropDownHolderDivClass" runat="server" FieldName="Lang Culture" DataFieldName="LangCulture" DataFieldType="String" ID="CultureMyDropDown" >
               
            </cmsr:MyDropDown>
            <div style="float:left;font-size:15px;font-weight:bold;color:#0269b1;" >Google Code</div>
             <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClassLeft" DataFieldName="GoogleClientID" runat="server" ID="MyTextBox1" FieldName="Client ID:" />          
             <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClassLeft" DataFieldName="GoogleSecret" runat="server" ID="MyTextBox2" FieldName="Client secret:" />
          

             
        </MessageTemplate>
    </cmsr:MyForm>
	
   </asp:Content>

