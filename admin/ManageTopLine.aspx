<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="ManageTopLine.aspx.cs" Inherits="ManageTopLine" %>

<%@ Register Src="tableControl.ascx" TagName="TableControl" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">

    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <br />
    <br />

    <cmsr:MyForm FormStatus="Update" BackButtonText="חזור" OnItemUpdated="BlogTypeMyForm_ItemUpdated" DataKeyField="toplinemsgid" VisibleSaveAndBackButton="false" SaveButtonText="שמור" TableName="toplinemsg" CssClass="AdminMyForm" runat="server" ID="BlogTypeMyForm">
        <MessageTemplate>
            <%-- <cmsr:MyDatePeaker runat="server" ID="CouponValidDate" DataFieldType="DateTime" IsRequiredFieldValidator="true" RequiredFielderrorMessage="enter expiration date "  DataFieldName="MsgSiteDate" FieldName="Message Sute Date" />--%>
            <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClass" TextMode="CKEditor" DataFieldName="topMessgaeSite" runat="server" ID="BlogTypeName" FieldName="טקסט מעל האתר" />
            <cmsr:MyCheckBox runat="server" CssClass="admincheckbox" ImageOff="../admin/images/SelectOff.png" ImageOn="../admin/images/SelectOn.png" ID="MyCheckBox1" DataFieldType="Bool" FieldName="האם טקסט מתעדכן?" DataFieldName="isupadte1" />
            <%--<cmsr:MyDatePeaker runat="server" ID="MyDatePeaker1" DataFieldType="DateTime" IsRequiredFieldValidator="true" RequiredFielderrorMessage="enter expiration date "  DataFieldName="MsgSystemDate" FieldName="Message System Date" />--%>
            <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClass" TextMode="CKEditor" DataFieldName="topMessgaeSystem" runat="server" ID="MyTextBox1" FieldName="טקסט מעל מערכת" />
            <cmsr:MyCheckBox runat="server" CssClass="admincheckbox" ImageOff="../admin/images/SelectOff.png" ImageOn="../admin/images/SelectOn.png" ID="MyCheckBox2" DataFieldType="Bool" FieldName="האם טקסט מתעדכן?" DataFieldName="isupadte2" />
            <cmsr:MyHiddenField runat="server" ID="LangMyHiddenField" DataFieldType="Number" DataFieldName="toplang" />
            <cmsr:MyHiddenField runat="server" ID="MyHiddenField1" DataFieldType="String" DataFieldName="msgkeysite" />
            <cmsr:MyHiddenField runat="server" ID="MyHiddenField2" DataFieldType="String" DataFieldName="msgkeysystem" />
        </MessageTemplate>
    </cmsr:MyForm>



</asp:Content>

