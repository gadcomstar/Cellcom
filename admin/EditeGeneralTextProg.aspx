<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="EditeGeneralTextProg.aspx.cs" Inherits="admin_EditeGeneralTextProg" ValidateRequest="false" %>
<%@ Register Src="~/admin/FormViewControl3.ascx" TagName="FormViewControl" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">

    <div class="EditPageTitleClass"><asp:Label runat="server" ID="PageTitleLabel" Text="ערוך כותרת\טקסט"  ></asp:Label></div>
    <asp:HyperLink CssClass="backLinkClass"  runat="server" ID="backLink" >חזור</asp:HyperLink>
    <br />
	<asp:ScriptManager runat="server"></asp:ScriptManager>
	<cc1:FormViewControl runat="server" ID="CatFormView" FormViewAction="Insert" IdField="genID" TblName="generaltexts" SqlNoDuplicateFieldID="genCode" SqlFieldNames="genName,genContent,genPage,genType,genCode" ReplaceField=",,,," TblHeaderNames="שם השדה,תוכן,מספר עמוד,1.טקסט 2.עורך 3.טקסט קצר,קוד" SqlFieldType="1,7,1,1,1" ReturnURL="" />


</asp:Content>

