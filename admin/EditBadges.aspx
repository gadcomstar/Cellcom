<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="EditBadges.aspx.cs" Inherits="EditBadges" ValidateRequest="false" %>

<%@ Register Src="tableControl.ascx" TagName="TableControl" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="js/jquery.uploadify.js"></script>
    <link href="js/uploadify.css" rel="stylesheet" />

    <link href="Cropjs/css/jquery.Jcrop.css" rel="stylesheet" type="text/css" />
    <script src="Cropjs/js/jquery.Jcrop.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">

    <asp:HyperLink Visible="false" CssClass="backLinkClass" runat="server" ID="backLink">חזור</asp:HyperLink>
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <br />
    <div class="titleSpan">
        <asp:Label runat="server" ID="TitleLabel">עריכת תגית</asp:Label>
    </div>
    <br />
    <cmsr:MyForm ValidationGroup="Vlidate" FormStatus="Update" OnItemInserting="BlogTypeMyForm_ItemInserting" OnItemUpdated="BlogTypeMyForm_ItemInserted" OnItemInserted="BlogTypeMyForm_ItemInserted" SaveReturnText="שמור וחזור" BackButtonText="חזור" DataKeyField="badgid" SaveButtonText="שמור" TableName="tblbadges" CssClass="AdminMyForm" runat="server" ID="BlogTypeMyForm">
        <MessageTemplate>
            <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClass" DataFieldName="badgename" IsRequiredFieldValidator="true" RequiredFielderrorMessage="enter field" runat="server" ID="MyTextBox4" FieldName="שם התג" ValidationGroup="Vlidate" />
            <cmsr:MyUpload CssClass="adminloadfile" runat="server" ID="LoadImage" ButtonText="Load" DataFieldType="File" DataFieldName="badgeImage" UploadImage="images/loadimgbtn.gif" Text="תמונה חיה" ShowImage="true" Width="80" Types="Image" Height="30" SaveDirectory="badges" Dimension="60x85,150x200,250x250" />
            <%--<cmsr:MyUpload CssClass="adminloadfile" runat="server" ID="LoadImage2" ButtonText="Load" DataFieldType="File" DataFieldName="badgeImageDisabled" UploadImage="images/loadimgbtn.gif" Text="תמונה מושהית" ShowImage="true" Width="80" Types="Image" Height="30" SaveDirectory="badges"  Dimension="60x85,150x200" />--%>
            <cmsr:MyHiddenField runat="server" ID="MyDateMyHiddenField" DataFieldName="badgedate" DataFieldType="DateTime" />
            <cmsr:MyTextBox DataFieldType="String" CssClass="ManageTextBoxHolderDivClassMultiMin300" TextMode="MultiLine" DataFieldName="badgedescription" runat="server" ID="ShortDescMyTextBox" FieldName="תיאור קצר" />
            <cmsr:MyTextBox DataFieldType="Number" CssClass="ManageTextBoxHolderDivClass" DataFieldName="BadgePriority" IsRequiredFieldValidator="true" RequiredFielderrorMessage="נא להכניס מקדם עדיפות" SelectExpresion="Numeric" RegularExpressionErrorMessage="נא להכניס מספרים בלבד"  runat="server" ID="MyTextBox2" FieldName="מקדם עדיפות" ValidationGroup="Vlidate" />




            <%--<cmsr:MyDropDown runat="server" ID="BadgeTags" FieldName="תיוג" DataFieldType="Number" DataFieldName="bagdeassociation" Visible="false"></cmsr:MyDropDown>--%>




            <cmsr:MyDropDown runat="server" ID="BagTypeMyDropDown" FieldName="סוג תיוג" OnClientSelectedChanged="setbadgetype(this.options[this.selectedIndex].value)" DataFieldType="Number" DataFieldName="badgetype"></cmsr:MyDropDown>
            <div id="typecomment" class="typecommentclass"></div>
            <div id="channelid" class="myhiddenclass">
                <cmsr:MyDropDown runat="server" ID="ChannelMyDropDown" FieldName="ערוץ ביצוע" DataFieldType="Number" DataFieldName="badgechannel">
                    <ListItems>
                        <asp:ListItem Selected="True" Text="כל ערוץ" Value="0"></asp:ListItem>
                        <asp:ListItem Text="פייסבוק" Value="1"></asp:ListItem>
                        <asp:ListItem Text="דואר אלקטרוני" Value="2"></asp:ListItem>
                    </ListItems>
                </cmsr:MyDropDown>
            </div>
            <div id="tagid" class="myhiddenclass">
                <cmsr:MyDropDown runat="server" CssClass="DropDownHolderDivClass" ID="ChooseTagMyDropDown" FieldName="תיוג" DataFieldType="Number" DataFieldName="bagdeassociation"></cmsr:MyDropDown>
            </div>

            <div id="missionid" class="myhiddenclass">
                <cc1:TableControl runat="server" ID="MissionTable" TblHeaderNames="שם המשימה" TblName="tblpages" SqlFieldNames="pagename" SqlFieldType="1" IdField="idtblpages" IsSelectField="true" />
            </div>
            <div id="BadgesID" class="myhiddenclass">
                <cc1:TableControl runat="server" ID="BadgeTable" TblHeaderNames="שם הבאדג'" TblName="tblbadges" SqlFieldNames="badgename" SqlFieldType="1" IdField="badgid" IsSelectField="true" />
            </div>

            <div id="TagsID" class="myhiddenclass">
                <cc1:TableControl runat="server" ID="TagsTable" TblHeaderNames="תגיות מקושרות" TblName="tblTags" SqlFieldNames="TagName" SqlFieldType="1" IdField="tblTagsID" IsSelectField="true" />
            </div>


            <div id="countid" class="myhiddenclass">
                <cmsr:MyTextBox DataFieldType="Number" CssClass="ManageTextBoxHolderDivClass" SelectExpresion="Numeric" RegularExpressionErrorMessage="הכנס מספר" DataFieldName="badgecount" runat="server" ID="MyTextBox1" FieldName="כמות" />
            </div>

        </MessageTemplate>
    </cmsr:MyForm>
    <script type="text/javascript">

        var selectedType1 = '<%= ((CMSTRDropDownControl)BlogTypeMyForm.FindControl("BagTypeMyDropDown")).SelectedValue  %>';
        setbadgetype(selectedType1)


        function setbadgetype(myval) {
            $('.myhiddenclass').hide();
            $('#typecomment').text();
            switch (myval) {
                case '1':
                    $('#typecomment').text('התגית תתווסף לאחר הצטרפות.');
                    break;
                case '2':
                    $('#typecomment').text('התגית תתווסף לאחר X משימות מהסוג הנבחר.');
                    $('#channelid').show();
                    $('#countid').show();
                    break;
                case '3':
                    $('#typecomment').text('בחר זמן תגובה בשעות , אם החבר ישתף את המשימה בזמן קטן מזמן התגובה ,יקבל תגית זאת.');
                    $('#countid').show();
                    break;
                case '4':
                    $('#typecomment').text('בחר כמות נקודות , לאחר שהחבר יעבור את סכום זה ,יקבל תגית זאת.');
                    $('#countid').show();

                    break;
                case '5':
                    $('#typecomment').text('תגית זאת תופעל רק לאחר שיוך למשימה , כדי להגביל את כמות המקבלים הכנס X משתפים ראשונים או 0 כדי שכל המשתתפים יקבלו את התגית.');
                    $('#countid').show();
                    $('#missionid').show();
                    break;
                case '6':
                    $('#typecomment').text('בחר תיוג, משתמש שיגיע ל-X משימות מהתיוג המוגדר יקבל תגית זאת.');
                    $('#countid').show();
                    $('#tagid').show();
                    break;
                case '7':
                    $('#typecomment').text('בחר כמות אנשים. אותה כמות משתמשים אשר יבצעו את המשימה ראשונים יקבלו תגית זו.');
                    $('#countid').show();
                    $('#missionid').show();
                    break;
                case '8':
                    $('#typecomment').text("בחר באדג'ים. הבאדג' יתקבל לאחר קבלת כל הבאדג'ים המסומנים");
                    $('#BadgesID').show();

                    break;
                default:
                    break;
            }
        }
    </script>
</asp:Content>

