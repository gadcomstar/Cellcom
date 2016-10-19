<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="ManageJoinus.aspx.cs" Inherits="EditSlid" ValidateRequest="false" %>

<%@ Register Src="tableControl.ascx" TagName="TableControl" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
     <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="js/jquery.uploadify.js"></script>
    <link href="js/uploadify.css" rel="stylesheet" />
    <link href="Cropjs/css/jquery.Jcrop.css" rel="stylesheet" type="text/css" />
    <script src="Cropjs/js/jquery.Jcrop.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">

    <asp:HyperLink Visible="false" CssClass="backLinkClass" runat="server" ID="backLink">חזור</asp:HyperLink>
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <br />
    <div class="titleSpan">
        <asp:Label runat="server" ID="TitleLabel">עריכת תגית</asp:Label>
    </div>
    <br />
    <cmsr:MyForm ValidationGroup="Vlidate" FormStatus="Update" VisibleSaveAndBackButton="false" VisibleBackButton="false"  SaveReturnText="שמור וחזור" BackButtonText="חזור" DataKeyField="joinuspageid" DataKeyFieldValue="2" SaveButtonText="שמור" TableName="joinuspage" CssClass="AdminMyForm" runat="server" ID="BlogTypeMyForm">
        <MessageTemplate>
            <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClass" DataFieldName="pagetitle" IsRequiredFieldValidator="true" RequiredFielderrorMessage="enter field" runat="server" ID="MyTextBox4" FieldName="כותרת דף" ValidationGroup="Vlidate" />
            <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClass" DataFieldName="pagetitle2" IsRequiredFieldValidator="false" RequiredFielderrorMessage="enter field" runat="server" TextMode="MultiLine" ID="MyTextBox1" FieldName="כותרת תוכן ראשון" ValidationGroup="Vlidate" />
            <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClass" DataFieldName="pagetext" IsRequiredFieldValidator="false" RequiredFielderrorMessage="enter field" runat="server" TextMode="CKEditor" ID="MyTextBox5" FieldName="תוכן ראשון" ValidationGroup="Vlidate" />
            <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClass" DataFieldName="pagetitle3" IsRequiredFieldValidator="false" RequiredFielderrorMessage="enter field" runat="server" TextMode="MultiLine" ID="MyTextBox2" FieldName="כותרת תוכן שני" ValidationGroup="Vlidate" />
            <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClass" DataFieldName="pagetext2" IsRequiredFieldValidator="false" RequiredFielderrorMessage="enter field" runat="server" TextMode="CKEditor" ID="MyTextBox3" FieldName="תוכן שני" ValidationGroup="Vlidate" />
            <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClass" DataFieldName="pagetext3" IsRequiredFieldValidator="false" RequiredFielderrorMessage="enter field" runat="server" TextMode="CKEditor" ID="MyTextBox6" FieldName="תוכן חופשי נוסף" ValidationGroup="Vlidate" />
            

        </MessageTemplate>
    </cmsr:MyForm>
  
</asp:Content>

