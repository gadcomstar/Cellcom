<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="EditAdminPages.aspx.cs" Inherits="admin_EditAdminPages" ValidateRequest="false" %>
<%@ Register Src="~/admin/FormViewControl3.ascx" TagName="FormViewControl" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">

    <div class="EditPageTitleClass"><asp:Label runat="server" ID="PageTitleLabel" Text="ערוך כותרת\טקסט"  ></asp:Label></div>
    <asp:HyperLink CssClass="backLinkClass"  runat="server" ID="backLink" >חזור</asp:HyperLink>
    <br />
	<asp:ScriptManager runat="server"></asp:ScriptManager>
	<cc1:FormViewControl runat="server"  OnItemUpdated="CatFormView_ItemUpdated" ID="CatFormView" FormViewAction="Insert" IdField="catID" TblName="adminpages" SqlFieldNames="catParent,catOrder,catText,catTextEng,catLink,isHeader,secLevel" ReplaceField=",,,,,," TblHeaderNames="מספר Parent,סדר,טקסט,טקסט אנגלית,קישור,האם כותרת,מספר אבטחה" SqlFieldType="1,1,1,1,1,2,1" ReturnURL="" />
</asp:Content> 

