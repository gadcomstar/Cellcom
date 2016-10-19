<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="ManageListData.aspx.cs" Inherits="admin_ManageListData" %>

<%@ Register Src="tableControl.ascx" TagName="TableControl" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">

    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <br />
    <br />
    <div style="width: 100%; padding: 20px 0px;">
        <cc1:TableControl ID="LangTableControl" DisplayWidth="800" IsDelField="false" TableTitle="Site Data: Choose Language" runat="server" IsExcelExportable="false" TblName="languages" SqlFieldNames="LangName" FieldsToShow="1" TblHeaderNames="Category Name" SqlFieldType="1" CustomField="" IdField="LangID" MaxResPerPage="10" />
    </div>
    <div style="width: 100%; padding: 20px 0px;">
        <cc1:TableControl ID="CatsTable" DisplayWidth="800" TableTitle="Choose List Data Required fields" runat="server" IsExcelExportable="false" TblName="tbldropdown" SqlFieldNames="DropName" FieldsToShow="1" TblHeaderNames="List Name" SqlFieldType="1" CustomField="" IdField="dropeditpage" MaxResPerPage="10" />
    </div>
    <cc1:TableControl ID="CatsTable2" DisplayWidth="800" TableTitle="Choose List Data Choise fields" runat="server" IsExcelExportable="false" TblName="mysitedropdown" SqlFieldNames="dropdownname" FieldsToShow="1" TblHeaderNames="List Name" SqlFieldType="1" CustomField="" IdField="idmysitedropdown" MaxResPerPage="10" />


</asp:Content>

