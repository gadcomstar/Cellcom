<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--<script type="text/javascript">
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
        .masterbgclass {
            top: 135px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderHeader" runat="Server">
    <div style="position: relative;">
        <asp:Panel runat="server" ID="Panel_WebSiteView" Visible="false">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <asp:Panel runat="server" ID="Panel_LoggedUser" Visible="false">
                        <%--MainPanel--%>
                        <div runat="server" id="OrangeStrap" class="orangestrap displaynone">
                            <div class="orangestrapholder">
                                <div class="orangestraptext">Thank you for signing up for ISRAELikers!</div>
                                <div onclick="closestrap()" class="orangestrapclose"></div>
                            </div>
                        </div>
                        <div class="topgraysection">
                            <div class="topgraysectionauto">
                                <asp:LinkButton ID="Button1" CssClass="LogOutBtn" Text="Log Out" OnClick="Unnamed_Click" runat="server" />
                                <div class="topgraysectionfloat">
                                    <a href="./" class="logoimgholderclass">
                                        <img src="images/HomeImages/LoginLogo.png" />
                                    </a>
                                    <div class="rightlogoclass">
                                        <img src="images/HomeImages/rightlogo.png" />
                                    </div>

                                </div>
                            </div>
                        </div>
                        <div class="defaultcenterclass">
                            <div class="defaultcenterclass2">
                                <div class="ControlpanelDiv">
                                    <div class="CPele marginCPele">
                                        <%--picture div--%>
                                        <div style="margin-bottom: 5px;">
                                            <asp:Label CssClass="lbl_User_Nameclass"
                                                ID="lbl_User_Name" Text="" runat="server" /><br />
                                            <span class="personalzoneclass">Welcome to your personal zone</span>
                                        </div>
                                        <div class="ImgDiv">
                                            <img runat="server" id="UserIMG" class="UserIMG" />
                                        </div>
                                        <div class="SharesStats">
                                            <img src="images/HomeImages/LoginFaceBook_icon.png" style="width: 20px; height: 20px; margin-right: 5px; vertical-align: text-bottom;" /><span style="color: #446FB6; font-size: 12.6px; font-family: Arial;">Facebook Shares</span><br />
                                            <div runat="server" id="FacePointHolder" class="statsBackDiv" style="margin-bottom: 3px; margin-top: 3px;">
                                                <asp:Label ID="lbl_User_FBShares" Text="" runat="server" />
                                            </div>
                                            <div runat="server" id="SignByFaceButton" onclick="openSigninbyface()" class="SignByFacebookclass">Sign up via Facebook</div>
                                            <img src="images/Mission_Images/Share_mail_Button.png" style="width: 20px; height: 20px; margin-right: 5px; vertical-align: text-bottom;" /><span style="color: #446FB6; font-size: 12.6px; font-family: Arial;">Mail Shares</span><br />
                                            <div runat="server" id="MailPointsHolder" class="statsBackDiv" style="margin-bottom: 3px; margin-top: 3px;">
                                                <asp:Label ID="lbl_User_MailShares" Text="" runat="server" />
                                            </div>
                                            <div runat="server" id="SignByMailButton" onclick="openSigninbymail()" class="SignBymailclass">Sign up via Email</div>
                                            <span style="color: #446FB6; font-size: 12.6px; font-family: Arial;">Points you have collected</span><br />
                                            <div class="statsBackDiv" style="margin-top: 1px;">
                                                <asp:Label ID="lbl_User_TotalPoints" Text="" runat="server" />
                                            </div>
                                        </div>

                                    </div>

                                    <div class="CPele tempatureHolderClass">
                                        <%--thermometer div--%>

                                        <div class="blueclass"></div>
                                        <div runat="server" id="mygrayclass" class="grayclass"></div>
                                        <div class="tempatureClass"></div>

                                    </div>
                                    <div class="badgeareaclass">
                                        <div class="badgelistheader">Badges Earned</div>
                                        <a href="badges.aspx" id="TopSeeAllBadge" runat="server" class="badgeseeall">see all</a>
                                        <div class="badgelinstholder">
                                            <asp:Repeater ID="BadgeRepeater" runat="server">
                                                <ItemTemplate>
                                                    <div class="badgelistitemclass">
                                                        <div class="badgeimageclass">
                                                            <div class="tdbadgeimageclass" onmouseout="HideShare()" onmouseover="ShowShare(this.id)" runat="server" id="MyBadgeSharerCaller">
                                                                <a target="_blank" href='<%# "https://www.facebook.com/sharer/sharer.php?u="+siteDefaults.SiteUrl.Replace("http://","https://")+"/joinus.aspx?Badgeid="+ Eval("badgeid")+"&display=popup" %>' id="MyBadgeSharer" runat="server" class="ShareBadge"></a>
                                                                <img class="tdbadgeimageclassimg" src='<%# Eval("badgeImage").ToString().Replace("../","") %>' title='<%# Eval("badgedescription") %>' alt='<%# Eval("badgename") %>' />
                                                                <div class="NewBadgeRibbon" style="display: <%# Eval("AlreadyWatched").ToString().ToLower()=="true"?"block":"none"%>"></div>
                                                            </div>
                                                        </div>

                                                            <div class="DefaultBadgeText" title='<%# Eval("badgename") %>'><%# Eval("badgename") %></div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                        <a href="badges.aspx" id="BottomSeeAllBadge" runat="server" class="badgeseeall2">see all</a>
                                    </div>
                                    <div style="float: none; clear: both;"></div>
                                </div>
                                <img src="images/HomeImages/shadow.png" style="margin: auto; height: 50px; width: 100%; font-size: 0;" />
                                <div class="MissionWaitingHolder">
                                    <div class="MissionsAppendclass">Missions still standing</div>

                                    <asp:Repeater runat="server" ID="RepaterMissionsToDo">
                                        <ItemTemplate>
                                            <div class="WaitingMissionContent">
                                                <div class="defmissionimageholder">
                                                    <img src='<%# Eval("JoinIMG")  != ""? Eval("JoinIMG"):"images/HomeImages/LoginLogo.png"%>' class="missionimagedefclass" />
                                                </div>
                                                <a class="missiontitleclass" target="_blank" href='<%# "Mission.aspx?name="+Eval("PageGuid")+"&mail="+_usermail %>'><%# Eval("missionheader").ToString()==""? "Share this  "+ Eval("MissionType") +"  Now":Eval("missionheader").ToString()   %> </a>
                                                <a class="goforitclass" target="_blank" href='<%# "Mission.aspx?name="+Eval("PageGuid")+"&mail="+_usermail %>'><span class="font45">GO</span><span class="SpanBreak"><br />
                                                </span><span>For it!</span></a>
                                                <div class="missioncontentclass"><%#Eval("PostText") %></div>
                                                <div class="datemissionholderclass">
                                                    <div class="missiondateclass">
                                                        Exp Date: <%# ((DateTime)Eval("EndingDate")).ToString("dd.MM.yyyy") %>
                                                    </div>
                                                    <div class="missiondateclass2">
                                                        <%#    (((DateTime)Eval("EndingDate")) - DateTime.Now).Days + " Days left"  %>
                                                    </div>
                                                </div>


                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                </div>
                                <div class="MissionDoneHolder">
                                    <div class="missionaccomplished">Accomplished Missions</div>


                                    <asp:Repeater ID="missionsDoneRepeater" runat="server">
                                        <ItemTemplate>
                                            <div class="MissionDoneholderclass">
                                                <div class="defmissionimageholder2">
                                                    <img src='<%# Eval("JoinIMG")  != ""? Eval("JoinIMG"):"images/HomeImages/LoginLogo.png"%>' class="missionimagedefclass" />
                                                </div>
                                                
                                                <a class="missiontitleclassa" target="_blank" href='<%# "Mission.aspx?name="+Eval("PageGuid")+"&mail="+_usermail %>'><%# Eval("missionheader").ToString()==""? "Share this  "+ Eval("MissionType") +"  Now":Eval("missionheader").ToString()   %></a>
                                                <div class="MissionDoneclass">
                                                    <img src="images/HomeImages/MissionDoneIcon.png" style="width: 79px; height: 84px;" />
                                                </div>
                                                <a href="<%#"?tag="+Eval("tagName").ToString()%>" class="MissionTag" style="display:<%#Eval("tagName").ToString()==""?"none":"table" %>" ><%#Eval("tagName")%></a>

                                                <div class="missionShortDesc"><a class="missionShortDesc" target="_blank" href='<%# "Mission.aspx?name="+Eval("PageGuid")+"&mail="+_usermail %>'><%# Eval("PostTitle").ToString()%></a></div>

                                                <div class="accomplishdateclass">Accomplished on: <%# ((DateTime)Eval("DatePosted")).ToString("dd.MM.yyyy") %><a runat="server" visible='<%# ((DateTime)Eval("EndingDate")).Date > DateTime.Now.Date?true:false %>' target="_blank" href='<%# "Mission.aspx?name="+Eval("PageGuid")+"&mail="+_usermail %>' class="GoForItAgainButton">Go for it again</a></div>

                                            </div>


                                        </ItemTemplate>
                                    </asp:Repeater>

                                </div>

                            </div>
                        </div>
                        <%--  </div>--%>
                    </asp:Panel>
                    <%--Login Panel--%>
                </ContentTemplate>
            </asp:UpdatePanel>


        </asp:Panel>
        <asp:Panel runat="server" ID="Panel_FacebookView" Visible="false">
            <div class="HeaderDiv">
                <img src="images/RegisterImages/IsraelLikersLogo.png" alt="logo" style="width: 331px; height: 76px;" />
            </div>
            <div class="BodyDiv">
                <script type="text/javascript">

                    window.fbAsyncInit = function () {
                        FB.init({
                            appId: '<%=siteDefaults.FbClientId.ToString()%>',
                            status: true, // check login status
                            cookie: true, // enable cookies to allow the server to access the session
                            xfbml: true  // parse XFBML
                        });
                        FB.Event.subscribe('auth.authResponseChange', function (response) {

                            if (response.status === 'connected') {
                                GetUserDeatilsFacebook();
                            }
                        });
                    };
                    // Load the SDK asynchronously
                    (function (d) {
                        var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
                        if (d.getElementById(id)) { return; }
                        js = d.createElement('script'); js.id = id; js.async = true;
                        js.src = "//connect.facebook.net/en_US/all.js";
                        ref.parentNode.insertBefore(js, ref);
                    }(document));


                    function GetUserDeatilsFacebook() {
                        FB.api('/me', function (response) {

                            AjaxLoginUserFromFacebook(response.id);
                        });
                    }
                    function AjaxLoginUserFromFacebook(ID) {
                        //alert("hello " + ID);
                        $.ajax({
                            type: "POST",
                            url: "Default.aspx/LogUserWithFB",
                            data: "{'ID':'" + ID + "'}",
                            dataType: "json",
                            contentType: "application/json; charset=utf-8",
                            success: function (msg) {
                                //alert(msg.d);
                                if (msg.d == "JustLogged") {

                                    
                                }
                                else if (msg.d == "AlreadyLogged") {

                                }
                                else {
                                    //alert("An Error Occured");
                                    window.location = 'joinus.aspx';
                                }

                            },
                            error: function (msg) {
                                //alert(msg.status + " " + msg.text);
                            }
                        });
                    }
                </script>
                <div>

                    <asp:Label ID="lblName" Text="" runat="server" />
                    <asp:Label ID="lblMail" Text="" runat="server" />
                    <img runat="server" id="MinPictureImg" />
                </div>
            </div>
        </asp:Panel>
    </div>

    <%--    Reregister pop ups--%>

    <div runat="server" id="popupholder" class="popupholderclass">
        <div class="popupholderinnerclass">
            <%-- mail pop up--%>
            <div runat="server" id="mailpopupholder" class="mailpopupholderclass">
                <div class="CloseIconFacebook" onclick=""></div>
                  <div class="popupmailtopclass">
                    <div>Thank you</div>
                    <div>for joining</div>
                    <div style="font-size: 43px;">ISRAELikers</div>
                </div>
                <div class="popupmailsubclass">From now on the missions will be sent to your Facebook account</div>
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <div class="popupmailbottomholder">
                            <div style="margin: auto; width: 380px;">
                                <div style="float: left;">
                                    <div class="popupmailontextboxclass">To receive missions via E-mail</div>
                                    <div class="popupmailemailholderclass">
                                        <div class="popupmailemailtextclass">Email:</div>
                                        <asp:RequiredFieldValidator Display="None" ValidationGroup="addmail" ErrorMessage="Enter mail" ControlToValidate="SendByMailTextBox" runat="server" />
                                        <asp:RegularExpressionValidator Display="None" ValidationGroup="addmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="mail format is not valid" ControlToValidate="SendByMailTextBox" runat="server" />
                                        <asp:TextBox CssClass="SendByMailTextBoxclass" runat="server" ID="SendByMailTextBox"></asp:TextBox>
                                    </div>
                                    <div style="margin: auto; width: 165px;">
                                        <div class="popupmailmailiconclass">
                                        </div>
                                        <asp:LinkButton runat="server" ID="SignByMailLinkButton" ValidationGroup="addmail" OnClick="SignByMailLinkButton_Click" CssClass="SignByMailLinkButtonClass" Text="Send"></asp:LinkButton>
                                    </div>
                                    <div style="margin-left: 10px; float: left;">
                                        <asp:Label CssClass="mailerrortext" runat="server" ID="maillerror"></asp:Label>
                                        <asp:ValidationSummary runat="server" ID="MailValidationSummary" ForeColor="White" DisplayMode="List" Font-Size="Small" ValidationGroup="addmail" />

                                    </div>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>

            <%--  face book pop up--%>
            <div runat="server" id="facepopupholder" class="facepopupholderclass">
                <div class="CloseIconMail" onclick=""></div>
                <div class="popupmailtopclass">
                    <div>Thank you</div>
                    <div>for joining</div>
                    <div style="font-size: 43px;">ISRAELikers</div>
                </div>
                <div class="popupmailsubclass">From now on the missions will be sent to your mail box</div>
                <div class="popupfacebottomholder">
                    <div style="margin: auto; width: 400px;">
                        <div style="float: left;">
                            <div class="popupmailontextboxclass">To receive missions via Facebook</div>
                            <div style="margin: auto; width: 165px;">
                            <div class="fbExistsMessage">The facebook account currently logged in is already in use by a different israelikers user.<br />Please log out from facebook and log in again with a different facebook account.</div>
                                <div class="popupfaceficonclass">
                                </div>
                                <asp:LinkButton runat="server" ID="SignByFaceLinkButton" OnClick="SignByFaceLinkButton_Click" CssClass="SignByFaceLinkButtonClass" Text="connect"></asp:LinkButton>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <script type="text/javascript">
        var closevar = 1;
        function openSigninbyface() {
            closevar = 0;
            if ($('.popupholderclass').length > 0) {
                $('.fbExistsMessage').hide();
                $('.popupholderclass').show();
                $('.facepopupholderclass').show();
                $('.popupfaceficonclass').show();
                $('.SignByFaceLinkButtonClass').show();

            }
        }

        function FaceBookExists() {
            $('.fbExistsMessage').show();
            $('.popupfaceficonclass').hide();
            $('.SignByFaceLinkButtonClass').hide();

        }

        function openSigninbymail() {
            closevar = 0;
            if ($('.popupholderclass').length > 0) {
                $('.popupholderclass').show();
                $('.mailpopupholderclass').show();
            }

        }

        if ($('.popupholderclass').length > 0) {
            $('.facepopupholderclass').on('click', function () {
                closevar = 0;
            })
            $('.mailpopupholderclass').on('click', function () {
                closevar = 0;
            })
            $('body').on('click', function () {

                if (closevar > 0) {
                    $('.popupholderclass').hide();
                    $('.facepopupholderclass').hide();
                    $('.mailpopupholderclass').hide();
                }
                closevar++;
            });
            $('.CloseIconMail').on('click', function () {

                if (closevar > 0) {
                    $('.popupholderclass').hide();
                    $('.facepopupholderclass').hide();
                    $('.mailpopupholderclass').hide();
                }
                closevar++;
            });
            $('.CloseIconFacebook').on('click', function () {

                if (closevar > 0) {
                    $('.popupholderclass').hide();
                    $('.facepopupholderclass').hide();
                    $('.mailpopupholderclass').hide();
                }
                closevar++;
            });
        }
        function closestrap() {
            $('.orangestrap').hide();
        }
        window.onbeforeunload = function () {
            $.ajax(
                {
                    type: "POST",
                    url: "default.aspx/UpdateBadgeToOld",
                    data: "",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    success: function (msg) {
                        //alert(msg.d + "Success");
                    },
                    error: function (msg) {
                        // alert(msg.status + " " + msg.text + "ERROR");
                    }
                })
        };


        function ShowShare(who) {
            $('#' + who.replace('Caller', '')).show();
        }
        function HideShare() {
            $('.ShareBadge').hide();
        }
    </script>
</asp:Content>

