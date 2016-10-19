<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="EditUser.aspx.cs" Inherits="admin_EditUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">
    <asp:ScriptManager runat="server" />
    <cmsr:MyForm runat="server" ID="frm_EditUser" FormStatus="Insert" TableName="tblUsers" OnItemInserted="frm_EditUser_ItemInserted" SaveButtonText="שמור" SaveReturnText="שמור וחזור">
        <MessageTemplate>
            <cmsr:MyTextBox ID="txtUsername" runat="server" CssClass="ManageTextBoxHolderDivClass" DataFieldName="EmailAddress" DataFieldType="String" FieldName="כתובת אי מייל:" IsRequiredFieldValidator="true" RequiredFielderrorMessage="חובה להכניס מייל" />
            <cmsr:MyTextBox ID="txtPassword" runat="server" CssClass="ManageTextBoxHolderDivClass" DataFieldName="Password"  DataFieldType="String" FieldName="סיסמא:" />
            <cmsr:MyTextBox ID="txtFullName" runat="server" CssClass="ManageTextBoxHolderDivClass" DataFieldName="FullName" DataFieldType="String" FieldName="שם מלא:" IsRequiredFieldValidator="true" RequiredFielderrorMessage=" חובה להכניס שם מלא" />
        </MessageTemplate>
    </cmsr:MyForm>
</asp:Content>

