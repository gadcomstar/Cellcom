<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="MissionStats.aspx.cs" Inherits="admin_MissionStats" %>

<%@ Register Src="tableControl.ascx" TagName="TableControl" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/jquery-ui.min.js"></script>
      <script src="../fancybox/jquery.fancybox-1.3.2.pack.js"></script>
    <link href="../fancybox/jquery.fancybox-1.3.2.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">
    <asp:ScriptManager runat="server" />
    <h1 runat="server" id="H1Title"></h1>
    <div class="WindowAligner">
        <div class="WindowHolder">
            <div class="WindowHeader">פרטי משימה</div>
            <div class="InfoHolder">
                <table style="text-align: right;">
                    <tr>
                        <td style="padding-left: 10px;">שם משימה:</td>
                        <td>
                            <asp:Label Text="" runat="server" ID="lbl_MissionName" /></td>
                    </tr>
                    <tr>
                        <td style="padding-left: 10px;">קוד משימה:</td>
                        <td>
                            <asp:Label Text="" runat="server" ID="lbl_MissionCode" /></td>
                    </tr>
                    <tr>
                        <td style="padding-left: 10px;">עריכת משימה:</td>
                        <td>
                            <asp:Literal Text="" runat="server" ID="lbl_MissionEditLink" />
                            <a runat="server" id="showmission" class="showmissionclass"></a>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 10px;">נקודות למשימה:</td>
                        <td>
                            <asp:Label Text="" runat="server" ID="lbl_MissionPts" /></td>
                    </tr>
                    <tr>
                        <td style="padding-left: 10px;">נקודות למשימה דרך פייסבוק:</td>
                        <td>
                            <asp:Label Text="" runat="server" ID="lbl_facebookMissionPts" /></td>
                    </tr>


                    <tr>
                        <td style="padding-left: 10px;">תוקף משימה:</td>
                        <td>
                            <asp:Label Text="" runat="server" ID="lbl_MissionDates" /></td>
                    </tr>
                    <tr>
                        <td style="padding-left: 10px;">סטטוס משימה:</td>
                        <td>
                            <asp:Literal Text="" runat="server" ID="lbl_MissionStatus" /></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div class="WindowAligner">
        <div class="WindowHolder">
            <div class="WindowHeader">תגיות</div>
            <div class="InfoHolder">
                <table style="text-align: right;">
                    <tr>
                        <td style="padding-left: 10px;">משויך לתגיות:</td>
                        <td>
                            <asp:Label ID="MissionTags" Text="" runat="server" /></td>
                    </tr>

                </table>
            </div>
        </div>
    </div>
    <div class="WindowAligner">
        <div class="WindowHolder">
            <div class="WindowHeader">רשימת שיתופים</div>
            <div class="InfoHolder">
                <cc1:TableControl ID="SharesTable" runat="server" TblName="tblposts2missions as tbl1" IdField="MissionPostID" IsExcelExportable="true" />
            </div>
        </div>
    </div>
    <div class="WindowAligner">
        <div class="WindowHolder">
            <div class="WindowHeader">כניסות JOIN</div>
            <div class="InfoHolder">
                <table style="text-align: right;">
                    <tr>
                        <td style="padding-left: 10px;">סך הכול כניסות:</td>
                        <td>
                            <asp:Label ID="lblJoinEnteries" Text="" runat="server" /></td>
                    </tr>
                </table>
                <cc1:TableControl ID="JoinEntersViaUsers" runat="server" IdField="JoinEntersID" IsExcelExportable="true" />
            </div>
        </div>
    </div>
    <div class="WindowAligner">
        <div class="WindowHolder">
            <div class="WindowHeader">הרשמות JOIN</div>
            <div class="InfoHolder">
                <%--<table style="text-align: right;">
                    <tr>
                        <td style="padding-left: 10px;">
                            <asp:Repeater runat="server" ID="RegistersRepeater">
                                <ItemTemplate>
                                    <span><%#Eval("EmailAddress") +" " + Eval("CreationDate") %></span>
                                </ItemTemplate>
                            </asp:Repeater>
                        </td>

                    </tr>

                </table>--%>
                <cc1:TableControl ID="JoinRegistersViaUsers" runat="server" IdField="tblJoinRegistersID" IsExcelExportable="true" />

            </div>
        </div>
    </div>
    <div class="WindowAligner">
        <div class="WindowHolder">
            <div class="WindowHeader">שיתופים</div>
            <div class="InfoHolder">
                <table style="text-align: right;">
                    <tr>
                        <td style="padding-left: 10px;">סך הכול שיתופים:</td>
                        <td>
                            <asp:Label ID="lbl_MissionTotalShares" Text="" runat="server" /></td>
                    </tr>
                    <tr>
                        <td style="padding-left: 10px;">שיתופים ייחודיים:</td>
                        <td>
                            <asp:Label ID="lbl_totalUniqeShares" Text="" runat="server" /></td>
                    </tr>
                    <tr>
                        <td style="padding-left: 10px;">סך הכול נקודות למשימה:</td>
                        <td>
                            <asp:Label ID="lbl_TotalGivenPts" Text="" runat="server" /></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div class="WindowAligner">
        <div class="WindowHolder">
            <div class="WindowHeader">רשימת משתפים ייחודים</div>
            <div class="InfoHolder">
                <asp:Repeater runat="server" ID="ShareresRepeater">
                    <ItemTemplate>
                        <div><%#Eval("UserMail") %> - <span style='color: <%#Eval("Platform").ToString() == "FB"?"Blue":"Red" %>'><%#Eval("Platform").ToString() == "FB"?"Facebook":"Mail"   %></span> - <%#Eval("DatePosted") %></div>
                    </ItemTemplate>
                </asp:Repeater>
                <cc1:TableControl ID="TblShares" runat="server" TblName="tblposts2missions as tbl1" IdField="MissionPostID"  SqlFieldNames="UserMail" TblHeaderNames="כתובת מייל" IsExcelExportable="true" />
            </div>
        </div>
    </div>
    <div class="BackDiv">
        <a id="backUrl" runat="server"></a>
    </div>

    <script type="text/javascript">
        $(document).ready(function () {
            editUserFancy();
        });
        function editUserFancy() {



            $('.showmissionclass').fancybox({
                'speedIn': 600,
                'speedOut': 200,
                'width': 1000,
                'height': 540,
                'background-Color': 'transparent',
                'border-width': 0,
                'autoDimensions': false,
                'overlayShow': true,
                'titleShow': false,
                type: 'iframe'
            });


        }

    </script>
</asp:Content>

