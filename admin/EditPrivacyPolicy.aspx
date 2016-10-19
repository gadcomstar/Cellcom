<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="EditPrivacyPolicy.aspx.cs" Inherits="admin_EditPrivacyPolicy" ValidateRequest="false" %>
<%@ Register Src="~/admin/FormViewControl3.ascx" TagName="FormViewControl" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">

    <div class="EditPageTitleClass"><asp:Label runat="server" ID="PageTitleLabel" Text="ערוך כותרת\טקסט"  ></asp:Label></div>
    <br />
	<asp:ScriptManager runat="server"></asp:ScriptManager>
	<cc1:FormViewControl runat="server"
        ID="CatFormView" 
        FormViewAction="Insert" 
        IdField="EntryID" 
        TblName="PrivacyPolicyContent" 
        SqlFieldNames="PageHeader,PageContent" 
        ReplaceField="" 
        TblHeaderNames="כותרת,תוכן" 
        SqlFieldType="1,10" 
        ReturnURL="" />
</asp:Content> 

