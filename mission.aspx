<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="mission.aspx.cs" Inherits="mission" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <script type="text/javascript" src="fancybox/jquery.fancybox-1.3.2.pack.js"></script>
    <link href="fancybox/jquery.fancybox-1.3.2.css" rel="stylesheet" />
    <%--  <script type="text/javascript">
        (function (i, s, o, g, r, a, m) {
            i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
                (i[r].q = i[r].q || []).push(arguments)
            }, i[r].l = 1 * new Date(); a = s.createElement(o),
            m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
        })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

        ga('create', 'UA-46208718-1', 'israelikers.org');
        ga('send', 'pageview');

    </script>--%>
    <script type="text/javascript">

        $(document).ready(function () {
            //AjaxGivePts("111_222");
            //AjaxGiveMailPts();
        });
        function getUrlVars() {
            var vars = [], hash;
            var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
            for (var i = 0; i < hashes.length; i++) {
                hash = hashes[i].split('=');
                vars.push(hash[0]);
                vars[hash[0]] = hash[1];
            }
            return vars;
        }
        function AjaxGivePts(FB_data) //pts and badges by FB
        {
            $.ajax({
                type: "POST",
                url: "mission.aspx/AddPts",
                data: "{'FB_Response':'" + FB_data + "','mail':'" + getUrlVars()["mail"] + "','MissionName':'" + getUrlVars()["name"] + "','fb_source':'" + getUrlVars()["fb_source"] + "'}",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (msg) {
                    //alert(msg.d);
                    var NewBadgeAccepted = msg.d.split("|");
                    if (NewBadgeAccepted[0] != "error") {
                        if (NewBadgeAccepted[0] != "") {
                            $('.BadgeEarnedHolder').attr('style', 'display:block');
                            $('.NewBadgeClass').attr('src', NewBadgeAccepted[0]);
                            $('.NewBadgeClass').attr('alt', NewBadgeAccepted[1]);
                            SendNotificationToFacebook(NewBadgeAccepted);
                            badgeid = NewBadgeAccepted[2];
                            var mylink = "https://www.facebook.com/sharer/sharer.php?u=" + "<%= siteDefaults.SiteUrl.Replace("http://","https://") %>" + "/joinus.aspx?Badgeid=" + badgeid + "&display=popup";
                            $('.ShareHolder').attr('href', mylink);
                        }
                    }
                },
                error: function (msg) {
                    //alert(msg.status + " " + msg.text);
                }
            });
        }
    </script>
    <script type="text/javascript">(function (d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
    fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderHeader" runat="Server">
    <div class="missionholderouter">
        <div class="missionholderinner">
            <div id="fb-root"></div>

            <script type="text/javascript">
                FB.init({
                    appId: '<%= siteDefaults.FbClientId %>',
                    status: true,
                    cookie: true,
                    xfbml: true
                });

                function share_prompt() {
                    FB.ui(
                    {
                        method: 'feed',
                        name: '<%= PostHeader %>',
                        link: '<%= _newMission.FullArticle %>',
                        picture: '<%=JoinIMG %>',
                        caption: '<%= PostTitle %>',
                        description: '<%= PostText %>',
                        message: '',
                        actions: [{ name: '<%= JoinTEXT %>', link: '<%= JoinURL %>' }]
                    },
                    function (response) {
                        //alert(response.post_id);
                        //if (response && response.post_id) {
                        //    alert('Post ID: ');
                        //} else {
                        //    alert('Post was not published.');
                        //}
                        if (response && response.post_id) {
                            AjaxGivePts(response.post_id);
                            MailShare1();
                            nextFB();
                        }
                    });
                }
            </script>
            <asp:Panel ID="Panel_Mission" Visible="false" runat="server">

                <asp:HiddenField runat="server" ID="HID_Pts" Value="0" />
                <div style="width: 100px; height: 100px; background-color: black; border-radius: 5px; color: white; overflow: hidden; display: none;" onclick="share_prompt()">share</div>

                <div class="ContainerDiv">
                    <div class="MissionHolder">
                        <div class="RightHolder2">
                            <%--<img src='<%#Eval("Img") %>' style="max-width: 100%;" alt="img" />--%>
                            <img src="images/Mission_Images/Boy_Image.png" class="Boy_Imageclass" />
                        </div>
                        <div class="LeftHolder">
                            <div style="margin-bottom: 20px;">
                                <a href="./">
                                    <img src="images/Mission_Images/Form_Header.png" class="missionlogoclass" /></a>
                            </div>

                            <div class="missionbuttonholderclass">
                                <div runat="server" id="MailBtn" class="sharebymailclass">
                                <%--<a runat="server" class="HiddenAShare" id="HiddenAShare" >gfff</a>--%>
                                </div>


                                <div class="missionlineholder">
                                    <div class="missionline"></div>
                                    <div class="missionorclass" id="orText" runat="server">or</div>
                                    <div class="missionline"></div>
                                </div>
                                <div runat="server" id="facebookbtn" class="ButtonClass sharebyfacebookclass" data-type="button" onclick="share_prompt()" style="cursor: pointer;">
                                    <%--Share via Facebook--%> <%--<img class="FB_Img" src="images/Mission_Images/Facebook_Share_Send.png" style="width: 157px; height: 76px;" />--%>
                                </div>
                            </div>

                            <div id="Div1" runat="server" class="ArticleHolder"><%= _newMission.ArticleContent %></div>

                            <div class="BadgeEarnedHolder" id="BadgeEarnedHolder" runat="server">
                                <hr style="margin-bottom: 40px;" />
                                <div class="expiredtopline">
                                    <span>You have just earned a<br />
                                        new badge!<br />
                                    </span>

                                </div>

                                <img id="MyNewBadge" runat="server" class="NewBadgeClass" />
                                <a target="_blank" href='' class="ShareHolder"></a>
                                <hr style="margin-top: 40px;" />

                            </div>

                            <div class="ThanksHolder">
                                <img src="images/Mission_Images/like.btn.png" class="missionthumbsubclass" />
                                <br />
                                <div class="expiredtopline">
                                    <span>Thanks for your cooperation</span><br />
                                    <span>See you on the next post</span>
                                </div>

                            </div>
                            <div class="">
                                <a href='<%= _newMission.FullArticle %>' target="_blank" class='<%= _newMission.FullArticle.ToString().IndexOf("https")>-1?"fancyButton readFullHolder":"fancyButton2 readFullHolder"  %>'>
                                    <span runat="server" id="lbl_ReadFull" class="readfullclass" style="color: white;"></span>
                                </a>
                            </div>


                            <div visible="false" runat="server" id="fblogin" class="ThankYouShareViaFbBtn">
                                Connect with Facebook
                            </div>
                            <div class="Clearer"></div>
                        </div>
                    </div>
                </div>
                <div class="ThanksHolder" style="display: none;">
                    <div class="missionbottomclass" id="missionbottomholder">
                        <img src="images/Mission_Images/babymobile.png" style="width: 100%;" />
                    </div>
                </div>
            </asp:Panel>
            <asp:Panel ID="Panel_Error" Visible="false" runat="server">
            </asp:Panel>
            <asp:Panel ID="Panel_Expired" Visible="false" runat="server">
                <div class="ContainerDiv">
                    <div class="MissionHolder">
                        <div class="RightHolder2">
                            <img src="images/Mission_Images/Boy_Image.png" class="Boy_Imageclass" />
                        </div>
                        <div class="LeftHolder">
                            <div style="margin-bottom: 20px; text-align: center;">
                                <a href="./">
                                    <img src="images/Mission_Images/Form_Header.png" class="missionlogoclass" /></a>
                                <br />

                            </div>
                            <div style="margin-bottom: 20px; text-align: center;">
                                <img src="images/Mission_Images/expirelogo.png" />
                            </div>
                            <div class="expiredtopline">The mission has expired.</div>
                            <div class="expiredbottomline">See you soon on the next mission</div>

                        </div>

                    </div>

                </div>
                <div class="missionbottomclass">
                    <img src="images/Mission_Images/babymobile.png" style="width: 100%;" />
                </div>
            </asp:Panel>
            <asp:Panel ID="Panel_MissionNotStarted" Visible="false" runat="server">
                <div style="color: white;">משימה לא החלה!</div>
            </asp:Panel>
        </div>
    </div>
    <script type="text/javascript">
        
       
        function ShowShare() {
            FB.ui({
                method: 'feed',
                link: 'https://developers.facebook.com/docs/dialogs/',
                caption: 'An example caption',
            },
            function (response) {
                alert(response);
            });
        }
        $(document).ready(function () {
            editUserFancy();
        });
        function editUserFancy() {

            $('.fancyButton').fancybox({
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
        function OpenShare(site) {
            window.open('https://www.facebook.com/sharer/sharer.php?u=' + site, 'facebook-share-dialog', 'width=626,height=436');
            MailShare1();
            nextFB();
            return false;
        }
        function MailShare(URL) {

            //eval($('.HiddenAShare').attr('href'));
            var x = window.open(URL);
            setTimeout(function () {
                x.close();
            }, 150);
            MailShare1();
            AjaxGiveMailPts(URL);


        }
        function MailShare1() {
            //alert(URL);
            $('.ArticleHolder').css("display", "none");
            $('.readFullHolder').css("display", "none");
            $('.readFullHolder').css("display", "none");
            $('.ThanksHolder').css("display", "block");



        }
        function nextFB() {
            $('.FB_Img').attr("src", "images/Mission_Images/Share_Button_Sent.png");
            $('.FB_Img').css("height", "76px").css("width", "76px").css("margin-left", "13px");

        }

        function socialLogin(facebook, fbImage, fbName) {

            $('.ThankYouShareViaFbBtn').text("Thank You " + fbName);
            if (facebook != "") {
                $('.ThankYouShareViaFbBtn').attr("onclick", "return false;");
            }

            window.location = window.location;
        }
        function AjaxGiveMailPts(URL) //pts and badges by mail
        {

            $.ajax({
                type: "POST",
                url: "mission.aspx/AddPtsMail",
                data: "{'mail':'" + getUrlVars()["mail"] + "','MissionName':'" + getUrlVars()["name"] + "'}",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (msg) {
                    //alert(msg.d);
                    var NewBadgeAccepted = msg.d.split("|");
                    if (NewBadgeAccepted[0] != "error") {
                        if (NewBadgeAccepted[0] != "") {
                            $('.BadgeEarnedHolder').attr('style', 'display:block');
                            $('.NewBadgeClass').attr('src', NewBadgeAccepted[0]);
                            $('.NewBadgeClass').attr('alt', NewBadgeAccepted[1]);
                            SendNotificationToFacebook(NewBadgeAccepted);
                            badgeid = NewBadgeAccepted[2];
                            var mylink = "https://www.facebook.com/sharer/sharer.php?u=" + "<%= siteDefaults.SiteUrl.Replace("http://","https://") %>" + "/joinus.aspx?Badgeid=" + badgeid + "&display=popup";
                            $('.ShareHolder').attr('href', mylink);
                        }
                    }
                },
                error: function (msg) {
                    console.log(msg);
                }
            });
        }
        function SendNotificationToFacebook(badge) {
            $.get('<%= "notify.aspx?&email=" + Request.QueryString["mail"] + "&link=http://www.google.com&msg=You_recieved_a_new_badge:_"   %>' + badge[1] + '!' + '&BadgeID=' + badge[2], function (data) { console.log("Badge Added!"); });

        }
    	$('.masterbgclass').height($(document).height()+'px');
    	
    </script>
</asp:Content>

