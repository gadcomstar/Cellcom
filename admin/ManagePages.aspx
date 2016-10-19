<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="ManagePages.aspx.cs" Inherits="ManagePages" %>

<%@ Register Src="tableControl.ascx" TagName="TableControl" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
       
    </script>
    <style type="text/css">
        .WindowArea {
            padding: 10px 15px;
            border: 1px solid black;
            box-shadow: 2px 2px 5px black;
            border-radius: 5px;
            position: relative;
            float: right;
            margin-top: 30px;
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

        input[type=text] {
            padding: 2px 5px;
        }

        textarea {
            padding: 2px 5px;
        }

        .fbHolder {
            min-height: 100px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">

    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <br />
    <br />
    <asp:HiddenField runat="server" ID="hid_PostID" />
    <cmsr:MyForm FormStatus="Update" BackButtonText="חזור" DataKeyField="idtblpages" SaveReturnText="שמור וחזור" SaveButtonText="שמור" TableName="tblpages" CssClass="AdminMyForm" runat="server" ID="BlogTypeMyForm" OnItemInserted="BlogTypeMyForm_ItemInserted">
        <MessageTemplate>
            <div class="WindowArea">
                <div class="HeaderDiv">תוכן משימה</div>
                <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClass" DataFieldName="pagename" runat="server" ID="BlogTypeName" FieldName="שם הדף" />
                <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClass" DataFieldName="missionheader" runat="server" ID="MyTextBox9" FieldName="כותרת המשימה" />
                <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClass" TextMode="CKEditor" CKBackGroundColor="#aaaaaa" DataFieldName="pagecontent" runat="server" ID="SpecialMyTextBox" FieldName="תוכן הדף" />
                <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClass" TextMode="CKEditor" CKBackGroundColor="#aaaaaa" DataFieldName="pagemobilecontent" runat="server" ID="MyTextBox11" FieldName="תוכן הדף עבור מוביל" />

                <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClass" ID="Post_Link" DataFieldName="FullArticleLink" FieldName="כתובת לכתבה מלאה" runat="server" />
                <cmsr:MyDropDown runat="server" DataFieldType="String" CssClass="DropDownHolderDivClass" ID="DDL_MissionType" DataFieldName="MissionType" DataTextField="MissionType" FieldName="סוג המשימה">
                    <ListItems>
                        <asp:ListItem Text="picture" />
                        <asp:ListItem Text="story" />

                        <asp:ListItem Text="video" />
                    </ListItems>
                </cmsr:MyDropDown>
                <cmsr:MyTextBox DataFieldType="String" Direction="ltr" CssClass="ManageTextBoxHolderDivClass" ID="MyTextBox8" DataFieldName="FullArticleBtnText" FieldName="טקסט לכפתור צפייה בכתבה מלאה" runat="server" />
            </div>
            <div class="WindowArea">
                <div class="HeaderDiv">ניהול משימה</div>
                <cmsr:MyTextBox DataFieldType="Number" CssClass="ManageTextBoxHolderDivClass" ID="txtPoints" DataFieldName="MissionPoints" FieldName="נקודות למשימה" runat="server" />
                <cmsr:MyTextBox DataFieldType="Number" CssClass="ManageTextBoxHolderDivClass" ID="MyTextBox10" DataFieldName="MissionFacebookPoints" FieldName="נקודות למשימה דרך פייסבוק" runat="server" />
                <cmsr:MyDatePeaker DataFieldType="DateTime" CssClass="ManageTextBoxHolderDivClass" ID="txtStartDate" DataFieldName="StartingDate" runat="server" FieldName="תאריך תחילת משימה" />
                <cmsr:MyDatePeaker DataFieldType="DateTime" CssClass="ManageTextBoxHolderDivClass" ID="txtDate" DataFieldName="EndingDate" runat="server" FieldName="תאריך סיום משימה" />

                <div style="float:right">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true">
                        <ContentTemplate>
                            <cc1:TableControl runat="server" ID="TagsTable" TblHeaderNames="תגיות מקושרות" TblName="tblTags" SqlFieldNames="TagName" SqlFieldType="1" IdField="tblTagsID" IsSelectField="true" />
                            <asp:Button Text="עדכן תגיות" ID="UpdateTags" runat="server" OnClick="UpdateTags_Click" />
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>

            </div>
            <cmsr:MyHiddenField runat="server" DataFieldType="String" DataFieldName="PageGuid" ID="Hid_Guid" />
            <div class="WindowArea">
                <div class="HeaderDiv">ניהול פייסבוק</div>
                <asp:UpdatePanel runat="server" ChildrenAsTriggers="true">
                    <ContentTemplate>
                        <cmsr:MyTextBox runat="server" ID="txt_PostText" DataFieldName="FB_Text" CssClass="ManageTextBoxHolderDivClassMultiMin300 fbHolder" DataFieldType="String" FieldName="תוכן לפייסבוק" TextMode="MultiLine" />
                        <asp:Button Text="פרסם בפייסבוק" ID="btnPost" runat="server" OnClick="btnPost_Click" />
                        <asp:Label Text="" runat="server" ForeColor="Red" ID="lblStatus" />
                        <asp:Button Text="שמור פוסט למערכת" ID="btnSavePost" runat="server" OnClick="Unnamed_Click" Visible="false" />
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
            <div class="WindowArea">
                <div class="HeaderDiv">ניהול Shares</div>
                <cmsr:MyTextBox ID="MyTextBox3" CssClass="ManageTextBoxHolderDivClass" runat="server" DataFieldName="PostHeader" DataFieldType="String" IsRequiredFieldValidator="true" FieldName="כותרת הפוסט" />
                <cmsr:MyTextBox ID="MyTextBox6" CssClass="ManageTextBoxHolderDivClass" runat="server" DataFieldName="PostTitle" DataFieldType="String" IsRequiredFieldValidator="true" FieldName="טייטל הפוסט" />
                <cmsr:MyTextBox ID="MyTextBox1" CssClass="ManageTextBoxHolderDivClass" runat="server" DataFieldName="PostText" DataFieldType="String" IsRequiredFieldValidator="true" FieldName="תוכן הפוסט" />
                <cmsr:MyTextBox ID="MyTextBox2" CssClass="ManageTextBoxHolderDivClass" runat="server" DataFieldName="JoinIMG" DataFieldType="String" FieldName="כתובת תמונת הפוסט:" />
                <cmsr:MyTextBox ID="MyTextBox4" CssClass="ManageTextBoxHolderDivClass" runat="server" DataFieldName="JoinText" DataFieldType="String" IsRequiredFieldValidator="true" FieldName="כותרת הJOIN" />
                <cmsr:MyTextBox ID="MyTextBox5" CssClass="ManageTextBoxHolderDivClass" runat="server" DataFieldName="JoinURL" DataFieldType="String" IsRequiredFieldValidator="true" FieldName="כתובת אתר הJOIN" />
            </div>
            <div class="WindowArea">
                <div class="HeaderDiv">ניהול שיתוף מייל</div>
                <cmsr:MyTextBox ID="txtMailSubject" runat="server" CssClass="ManageTextBoxHolderDivClass" DataFieldName="MailAutoSubject" DataFieldType="String" FieldName="נושא המייל" />
                <span style="direction: ltr;">
                    <cmsr:MyTextBox ID="MyTextBox7" runat="server" CssClass="ManageTextBoxHolderDivClassMultiMin300" DataFieldName="MailAutoBody" TextMode="MultiLine" DataFieldType="String" FieldName="גוף המייל" />
                </span>
            </div>
            <%--<cmsr:MyHiddenField runat="server" ID="hid_PostID" DataFieldName="FB_PostID" DataFieldType="String" />--%>

            <br />
            <div class="WindowArea">
                <div class="HeaderDiv">ניהול וקידום הדף</div>
                <%--<div class="floatRight" style="color: #0269b8; font-weight: bold; margin-top: 25px;">ניהול וקידום הדף</div>--%>
                <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClass" DataFieldName="pageseotitle" runat="server" ID="PriceMyTextBox" FieldName="כותרת הדף" />
                <cmsr:MyTextBox DataFieldType="String" TextMode="MultiLine" CssClass="ManageTextBoxHolderDivClass" DataFieldName="pageseodesc" runat="server" ID="CommentMyTextBox" FieldName="תיאור הדף" />
                <cmsr:MyTextBox DataFieldType="string" TextMode="MultiLine" CssClass="ManageTextBoxHolderDivClass" DataFieldName="pagekeyword" runat="server" ID="LongMyTextBox" FieldName="מילות מפתח לדף" />
            </div>

        </MessageTemplate>
    </cmsr:MyForm>
    <div style="width: 100%; float: left;">
        <cc1:TableControl ID="CatsTable" DisplayWidth="800" IsDelField="true" IsSelectField="true" IsSelectAll="true" TableTitle="ניהול דפים" runat="server"
            IsExcelExportable="true" FieldsToExport="1,1,1,1,0,0,1" TblName="tblpages" SqlFieldNames="idtblpages,pagename,(select count(distinct(UserMail)) from tblposts2missions where  tblposts2missions.MissionName = tblpages.PageGuid) as MyCount,PageGuid,PageGuid,idtblpages,CreationDate"
            FieldsToShow="0,1,1,1,1,1,1" TblHeaderNames="מספר דף,שם הדף,שיתופים,תצוגה מקדימה,קישור לדף,,תאריך" SqlFieldType="1,1,1,1,1,1,6" SortBy="CreationDate desc,idtblpages desc" IdField="idtblpages" MaxResPerPage="10" />
    </div>
    <script type="text/javascript">
        function selectonfocus(sender) {
            $(sender).select();

            // Work around Chrome's little problem
            $(sender).mouseup(function () {
                // Prevent further mouseup intervention
                $this.unbind("mouseup");
                return false;
            });
        };

        // $(iframe).contents().find('body').css('background-color', 'black');
    </script>

</asp:Content>

