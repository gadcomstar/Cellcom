<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Join ISRAELikers</title>
    <link href="Style/Register.css" rel="stylesheet" />
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/jquery-ui.min.js"></script>
    <%--<script>
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
            m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-46208718-1', 'israelikers.org');
        ga('send', 'pageview');

</script>--%>

    <style type="text/css">
        /*.ContainerDiv {
            width: 1024px;
            margin: auto;
            text-align: center;
        }

        .FormHolder {
            display: inline-block;
        }*/
    </style>
    <script type="text/javascript">
        
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" />
        <div class="ContainerDiv">
            <div class="FormHolder">
                <asp:Panel runat="server" Visible="false" ID="Panel_Error">
                    <div>אירעה שגיאה</div>
                    <div>An Error occured</div>
                </asp:Panel>
                <asp:Panel ID="Panel_HebReg" runat="server" Visible="false">
                    <cmsr:MyForm ID="MyFormHeb" runat="server" TableName="tblusers" OnItemInserted="MyFormHeb_ItemInserted" BackButtonText="">
                        <MessageTemplate>
                            <div class="LandingPageHolder">
                                <div class="LandingContentHolder">
                                    <img src="RegisterImages/IsraelLikersLogo.png" alt="Welcome to Israel Likers" class="TopLogo" />
                                    <div class="TopTextHolder">
                                        The system was created to allow you to be a
                                <br />
                                        leading force on the worldwide information front with
                                <br />
                                        minimal effort on your part
                                    </div>
                                    <div class="BoxHolderBG">
                                        <div class="TboxTitle">To join now fill in the following information:</div>
                                        <%-- <div class="TboxValidator">validator</div>--%>
                                        <div class="TboxHolder Name">
                                            <cmsr:MyTextBox ID="MyTextBox1" DataFieldType="String" CssClass="TboxInput" IsRequiredFieldValidator="true" Display="Static" RequiredFielderrorMessage="Please supply full name" runat="server" DataFieldName="FullName" WatermarkText="Full Name" HasWatermark="true" />
                                        </div>
                                        <%--<div class="TboxValidator">validator</div>--%>
                                        <div class="TboxHolder Email">
                                            <cmsr:MyTextBox ID="txtMail" DataFieldType="String" CssClass="TboxInput" runat="server" DataFieldName="EmailAddress" IsRequiredFieldValidator="true" Display="Static" Enabled="false" />
                                        </div>
                                        <%--<div class="TboxValidator">validator</div>--%>
                                        <div class="TboxHolder Password">
                                            <cmsr:MyTextBox ID="txtPassword" CssClass="TboxInput" DataFieldType="String" TextMode="Password" runat="server" Display="Static" IsRequiredFieldValidator="true" RequiredFielderrorMessage="Please select a password" HasWatermark="true" WatermarkText="Password" DataFieldName="Password" />


                                        </div>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="TboxBtn" OnClick="Unnamed_Click">Join us!</asp:LinkButton>
                                        <%--<div class="TboxComment">* Required field</div>--%>
                                    </div>
                                </div>
                                <div class="LandingContentHolder">
                                    <img src="RegisterImages/GirlWithFlag.png" class="LandingImg" />
                                </div>
                            </div>

                        </MessageTemplate>
                    </cmsr:MyForm>
                </asp:Panel>
                <asp:Panel ID="Panel_EngReg" runat="server" Visible="false">
                    <cmsr:MyForm ID="MyFormEng" runat="server" TableName="tblusers" SaveButtonText="Join" OnItemInserted="MyFormHeb_ItemInserted" BackButtonText="">
                        <MessageTemplate>
                            <div class="LandingPageHolder">
                                <div class="LandingContentHolder">
                                    <img src="RegisterImages/IsraelLikersLogo.png" alt="Welcome to Israel Likers" class="TopLogo" />
                                    <div class="TopTextHolder">
                                        The system was created to allow you to be a
                                <br />
                                        leading force on the worldwide information front with
                                <br />
                                        minimal effort on your part
                                    </div>
                                    <div class="BoxHolderBG">
                                        <div class="TboxTitle">To join now fill in the following information:</div>
                                        <%-- <div class="TboxValidator">validator</div>--%>
                                        <div class="TboxHolder Name">
                                            <cmsr:MyTextBox ID="MyTextBox1" DataFieldType="String" CssClass="TboxInput" IsRequiredFieldValidator="true" RequiredFielderrorMessage="חובה לרשום שם מלא" runat="server" DataFieldName="FullName" WatermarkText="שם מלא" HasWatermark="true" />
                                        </div>
                                        <%--<div class="TboxValidator">validator</div>--%>
                                        <div class="TboxHolder Email">
                                            <cmsr:MyTextBox ID="txtMail" DataFieldType="String" CssClass="TboxInput" runat="server" DataFieldName="EmailAddress" Enabled="false" />
                                        </div>
                                        <%--<div class="TboxValidator">validator</div>--%>
                                        <div class="TboxHolder Password">
                                            <cmsr:MyTextBox ID="txtPassword" CssClass="TboxInput" DataFieldType="String" TextMode="Password" runat="server" IsRequiredFieldValidator="true" RequiredFielderrorMessage="חובה לבחור סיסמא" DataFieldName="Password" />

                                        </div>
                                        <%--<div class="TboxComment">* Required field</div>--%>
                                        <a class="TboxBtn" href="javascript:clickSave()">Join us!</a>
                                    </div>
                                </div>
                                <div class="LandingContentHolder">
                                    <img src="RegisterImages/GirlWithFlag.png" class="LandingImg" />
                                </div>
                            </div>
                        </MessageTemplate>
                    </cmsr:MyForm>
                </asp:Panel>
                <asp:Panel runat="server" ID="Panel_HebExists" Visible="false">
                    <div style="text-align: center;">

                        <div>משתמש קיים כבר במערכת להמשך להתחברות בעזרת הפייסבוק לחץ <a id="ProceedLinkHeb" runat="server" href="#">כאן</a></div>
                    </div>
                </asp:Panel>
                <asp:Panel runat="server" ID="Panel_EngExists" Visible="false">
                    <div>User alerady Registered to continue to connect with Facebook click <a id="ProceedLinkEng" runat="server" href="#">here</a></div>
                </asp:Panel>
            </div>
        </div>
    </form>
    <script type="text/javascript">
        function clickSave() {
            $('.savebuttonclass').attr("href");
            alert("");

        }
        $(document).ready(function () {
            $('.ValidetorClass').css("color", "white");
        });
    </script>
</body>

</html>
