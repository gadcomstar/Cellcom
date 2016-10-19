<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="EditSite.aspx.cs" Inherits="admin_EditSite" ValidateRequest="false" %>
<%@ Register Src="~/admin/FormViewControl3.ascx" TagName="FormViewControl" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">

<asp:HyperLink Visible="false" CssClass="backLinkClass"  runat="server" ID="backLink" >חזור</asp:HyperLink>
	<asp:ScriptManager runat="server"></asp:ScriptManager><br />
	<div class="titleSpan">
	<asp:Label runat="server" ID="TitleLabel" >Site setting</asp:Label>
	</div>
	<br />
<cmsr:MyForm FormStatus="Update" OnItemUpdated="BlogTypeMyForm_ItemUpdated"  SaveReturnText="Save & Back"  BackButtonText="Back"  DataKeyField="siteID"  SaveButtonText="Save" TableName="adminsites"  CssClass="AdminMyForm" runat="server" ID="BlogTypeMyForm" >
    <MessageTemplate>
        <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClassLeft"   DataFieldName="siteName" IsRequiredFieldValidator="true" RequiredFielderrorMessage="enter field" runat="server" ID="MyTextBox4" FieldName="Site Name" />
         <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClassLeft"  DataFieldName="siteURL" IsRequiredFieldValidator="true" RequiredFielderrorMessage="enter field" runat="server" ID="MyTextBox1" FieldName="Site Url" />
         <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClassLeft"  DataFieldName="SendMail" IsRequiredFieldValidator="true" RequiredFielderrorMessage="enter field" runat="server" ID="MyTextBox2" FieldName="Sender mail" />
         <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClassLeft"  DataFieldName="returnMail" IsRequiredFieldValidator="true" RequiredFielderrorMessage="enter field" runat="server" ID="MyTextBox3" FieldName="Return mail" />
         <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClassLeft"  DataFieldName="SMTPServer" IsRequiredFieldValidator="true" RequiredFielderrorMessage="enter field" runat="server" ID="MyTextBox5" FieldName="SMTP Server" />
         <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClassLeft"  DataFieldName="MailUserName" IsRequiredFieldValidator="true" RequiredFielderrorMessage="enter field" runat="server" ID="MyTextBox6" FieldName="Mail user name" />
         <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClassLeft" TextMode="Password"  DataFieldName="MailPassword"   runat="server" ID="MyTextBox7" FieldName="Mail password" />
         <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClassLeft"  DataFieldName="MailPort" IsRequiredFieldValidator="true" RequiredFielderrorMessage="enter field" runat="server" ID="MyTextBox8" FieldName="Mail port" />
         <cmsr:MyCheckBox runat="server" CssClass="admincheckbox" ImageOff="../admin/images/SelectOff.png" ImageOn="../admin/images/SelectOn.png" ID="MyCheckBox2" DataFieldType="Bool" FieldName="Is mail SSL" DataFieldName="IsMailSSL" />            
          
         <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClassLeft" Visible="false"  DataFieldName="siteDomain" IsRequiredFieldValidator="true" RequiredFielderrorMessage="enter field" runat="server" ID="MyTextBox9" FieldName="Site domain" />

    </MessageTemplate>
</cmsr:MyForm>

</asp:Content>

