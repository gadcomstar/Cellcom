<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="ManageUsers.aspx.cs" Inherits="admin_ManageUsers" %>

<%@ Register Src="tableControl.ascx" TagName="TableControl" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .WindowArea {
            padding: 10px 15px;
            border: 1px solid black;
            box-shadow: 2px 2px 5px black;
            border-radius: 5px;
            position: relative;
            float: right;
            margin-top: 30px;
            margin-right: 15px;
            margin-bottom: 15px;
        }

        .HeaderDiv {
            position: absolute;
            top: -11px;
            right: 15px;
            z-index: 10;
            background: white;
            font-style: italic;
            padding: 0 3px;
            font-weight: bold;
            font-size: 15px;
            color: #0269b8;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">
    <asp:ScriptManager runat="server" />
    <div class="WindowArea">
        <div class="HeaderDiv">כל המשתמשים</div>
        <cc1:TableControl ID="tblUsers" runat="server" TblName="tblusers" IdField="UserID" IsSelectField="true" IsSearch="true"
             IsSelectAll="true" IsDelField="true" FieldsToExport="0,1,1" SqlFieldNames="UserID,FullName,EmailAddress" TblHeaderNames="מספר, שם מלא, כתובת מייל" 
            EditUrl="EditUser.aspx?ID={field}" AddLink="EditUser.aspx" />
        <asp:Button ID="Button1" Text="ייבא מi-send" runat="server" OnClick="Unnamed_Click" />
    </div>
    <div class="WindowArea">
        <div class="HeaderDiv">משתמשים עם קונקט</div>
        <cc1:TableControl runat="server" ID="tblUsersWithFacebook" TblName="tblusers" IdField="UserID" IsSelectField="true" IsSearch="true"
             IsSelectAll="true" IsDelField="false" FieldsToExport="0,1,1" SqlFieldNames="UserID,FullName,EmailAddress" TblHeaderNames="מספר, שם מלא, כתובת מייל" 
            FieldsToShow="0,1,1" IsExcelExportable="true" SqlWhereQuery="LoginType = 'fb' AND LoginTypeID is not null" EditUrl="EditUser.aspx?ID={field}" />
        <asp:UpdatePanel runat="server" ChildrenAsTriggers="true">
            <ContentTemplate>
                <asp:Button Text="שלח נוטיפיקציה לנבחרים" runat="server" ID="btnSendNotification" OnClientClick="alert('Not Active Yet.');" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div class="WindowArea" style="margin-bottom: 40px;">
        <div class="HeaderDiv">משתמשים ללא קונקט</div>
        <cc1:TableControl runat="server" ID="TableControl1" TblName="tblusers" IdField="UserID" 
             IsSelectField="true" IsSelectAll="true" IsDelField="false" FieldsToExport="0,1,1" SqlFieldNames="UserID,FullName,EmailAddress" 
            TblHeaderNames="מספר, שם מלא, כתובת מייל" FieldsToShow="0,1,1" IsExcelExportable="true" SqlWhereQuery="(LoginType  = '' OR LoginType is null)" EditUrl="EditUser.aspx?ID={field}" />
        <div style="text-align: center;">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <asp:Button Text="שלח דף קונקט לנבחרים" runat="server" OnClientClick="alert('Not Active Yet.');" /><br />
                </ContentTemplate>
            </asp:UpdatePanel>
            <span>כתובת לדף קונקט</span>
            <asp:TextBox runat="server" Text="" />
        </div>
    </div>

</asp:Content>

