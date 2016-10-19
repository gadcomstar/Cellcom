<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="EditParameterProgramer.aspx.cs" Inherits="admin_EditParameterProgramer" ValidateRequest="false" %>
<%@ Register Src="~/admin/FormViewControl3.ascx" TagName="FormViewControl" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">

    <div class="EditPageTitleClass"><asp:Label runat="server" ID="PageTitleLabel" Text="ערוך כותרת\טקסט"  ></asp:Label></div>
    <asp:HyperLink CssClass="backLinkClass"  runat="server" ID="backLink" >חזור</asp:HyperLink>
    <br />
	<asp:ScriptManager runat="server"></asp:ScriptManager>
	<cc1:FormViewControl runat="server" ID="CatFormView" FormViewAction="Insert" IdField="ParameterID" TblName="genparameters" SqlFieldNames="ParameterName,ParameterValue" ReplaceField="," TblHeaderNames="שם השדה,תוכן" SqlFieldType="1,1" ReturnURL="" />


</asp:Content>

