<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="EditcropFile.aspx.cs" Inherits="admin_EditcropFile" ValidateRequest="false" %>
<%@ Register Src="~/admin/FormViewControl3.ascx" TagName="FormViewControl" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">

    <div class="EditPageTitleClass"><asp:Label runat="server" ID="PageTitleLabel" Text="ערוך כותרת\טקסט"  ></asp:Label></div>
    <asp:HyperLink CssClass="backLinkClass"  runat="server" ID="backLink" >חזור</asp:HyperLink>
    <br />
	<asp:ScriptManager runat="server"></asp:ScriptManager>
	<cc1:FormViewControl runat="server" ID="CatFormView" FormViewAction="Insert" IdField="idcrops" TblName="crops" SqlFieldNames="image1,image2,image3" ReplaceField="../images/Practiceimg/--245x160--_c_rop|../images/Practiceimg/--800x400--_c_prod,../images/Practiceimg/--245x160--_c_rop,../images/Practiceimg/--245x160--_c_rop" TblHeaderNames="תמונה 1,תמונה 2,תמונה 3" SqlFieldType="17,17,17" ReturnURL="" />

</asp:Content>

