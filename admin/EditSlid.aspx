<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="EditSlid.aspx.cs" Inherits="EditSlid" ValidateRequest="false" %>

<%@ Register Src="tableControl.ascx" TagName="TableControl" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
    <cmsr:MyForm ValidationGroup="Vlidate" FormStatus="Update"  SaveReturnText="שמור וחזור" BackButtonText="חזור" DataKeyField="sliderid" SaveButtonText="שמור" TableName="tblsliders" CssClass="AdminMyForm" runat="server" ID="BlogTypeMyForm">
        <MessageTemplate>
            <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClass" DataFieldName="slidertext" IsRequiredFieldValidator="true" RequiredFielderrorMessage="enter field" runat="server" ID="MyTextBox4" FieldName="הכנס טקסט" ValidationGroup="Vlidate" />
            <cmsr:MyUpload CssClass="adminloadfile" runat="server" ID="LoadImage" ButtonText="Load" DataFieldType="File" DataFieldName="sliderimage" UploadImage="images/loadimgbtn.gif" Text="תמונה חיה" ShowImage="true" Width="80" Types="Image" Height="30" SaveDirectory="slids" Dimension="490x256" />

        </MessageTemplate>
    </cmsr:MyForm>
  
</asp:Content>

