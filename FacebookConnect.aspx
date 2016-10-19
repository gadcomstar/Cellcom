<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FacebookConnect.aspx.cs" Inherits="FacebookConnect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>דף הרשמה IsraelLikers</title>
    <link href="Style/Connect.css" rel="stylesheet" />
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/jquery-ui.min.js"></script>
   <%-- <script>
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
        .logBtn {
            color: white;
            margin: auto;
            border-radius: 7px;
            padding: 3px 5px;
            font-size: 14px;
            background-color: #117BC0;
            cursor: pointer;
            border: none;
        }

        .logBtn1 {
            color: white;
            margin: auto;
            border-radius: 7px;
            padding: 3px 5px;
            font-size: 12px;
            cursor: pointer;
            border: none;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server" />
        <div class="ContainerDiv">
            <div class="FormHolder">

                <asp:Panel runat="server" ID="Panel_login" DefaultButton="btn_Login" Visible="false">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <div style="text-align: center; padding-top: 25px;">
                                <span style="color: white; font-weight: bold; font-size: 32px;">Please Login:</span><br />
                                <div style="display: inline-block; direction: ltr; text-align: left; color: white; font-size: 16px;">

                                    <br />
                                    <asp:Label ID="Label1" Text="Username:" runat="server" />
                                    <asp:TextBox runat="server" ID="txtUsername" />
                                    <br />
                                    <asp:Label ID="Label2" Text="Password:" runat="server" />
                                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" />
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="*" ForeColor="red" ControlToValidate="txtPassword" runat="server" Display="Dynamic" />

                                    <br />
                                    <div style="margin-top: 15px; text-align: center;">
                                        <asp:Button Text="Login" runat="server" OnClick="Unnamed_Click" ID="btn_Login" CssClass="logBtn" />
                                    </div>
                                    <div style="margin-top: 10px; text-align: center;">
                                        <asp:LinkButton CssClass="logBtn1" Text="Forgot Password?" runat="server" CausesValidation="false" OnClick="Unnamed_Click1" ID="btn_Forgot" />

                                    </div>
                                    <div style="text-align: center;">
                                        <asp:Label ForeColor="Red" Text="" ID="lbl_login" runat="server" />
                                    </div>
                                    <div style="margin-top: 20px; font-size: 12px; text-align: center;">
                                        <asp:Label Text="A mail has been sent to your Email" runat="server" Visible="false" ID="lbl_Forgot" ForeColor="White" />
                                    </div>
                                </div>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </asp:Panel>

                <asp:Panel runat="server" ID="Panel_FBHeb" Visible="false">
                    <div class="LandingPageHolder">
                        <div class="LandingContentHolder">
                            <img src="ConnectImages/IsraelLikersLogo.png" alt="Welcome to Israel Likers" class="TopLogo" />
                            <div class="ThankYouTextHolder">
                                <img src="ConnectImages/ThankYouIcon.png" />
                                <span>Thank you for joining ISRAELikers</span>
                            </div>
                            <div class="ThankYouBelowTopText">
                                We will send you the first post for sharing shortly
                            </div>
                            <div class="ThankYouShareViaFbTxt">
                                Want to share via facebook?
                            </div>
                            <div class="ThankYouShareViaFbBtn" onclick="window.open('<%= siteDefaults.FbRedirectUrl %>', 'fbLogin', 'width=600, height=500'); return false;">
                                Connect with Facebook
                            </div>
                        </div>
                        <div class="LandingContentHolder">
                            <img src="ConnectImages/GirlWithFlag.png" class="LandingImg" />
                        </div>
                    </div>

                </asp:Panel>
                <asp:Panel runat="server" ID="Panel_FBEng" Visible="false">
                    <div>
                        Thank you for joining "Israel Likers" system,<br />
                        to share & post through Facebook please join your account Below
                    </div>
                    <div style="border: 1px solid black; border-radius: 5px; background-color: blue; padding: 5px 10px; color: white; width: 150px;"
                        onclick="window.open('<%= siteDefaults.FbRedirectUrl %>', 'fbLogin', 'width=600, height=500'); return false;">
                        FB Connect
                    </div>
                </asp:Panel>

            </div>
        </div>
    </form>
    <script>
        function socialLogin(facebook, fbImage, fbName) {

            $('.ThankYouShareViaFbBtn').text("Thank You " + fbName);
            if (facebook != "") {
                $('.ThankYouShareViaFbBtn').attr("onclick", "return false;");
            }
        }
    </script>
</body>
</html>
