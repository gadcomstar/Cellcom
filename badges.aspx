<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="badges.aspx.cs" Inherits="page_badges" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderHeader" runat="Server">

    <div style="position: relative;">


        <%--MainPanel--%>
        <div class="topgraysection">
            <div class="topgraysectionauto">
                <div class="topgraysectionfloat">
                    <div class="logoimgholderclass">
                        <a href="./">
                            <img src="images/HomeImages/LoginLogo.png" /></a>
                    </div>
                    <div class="rightlogoclass">
                        <img src="images/HomeImages/rightlogo.png" />
                    </div>
                    <%-- <asp:LinkButton ID="Button1" CssClass="LogOutBtn" Text="Log Out" OnClick="Unnamed_Click" runat="server" />--%>
                </div>
            </div>
        </div>
        <%-- <div class="OuterHolder" style="min-height: 500px; background: url('images/HomeImages/background.png'); background-size: 100% 100%;">--%>
        <div class="defaultcenterclass">
            <div class="defaultcenterclass2">
                <div class="ControlpanelDivBadges">
                    <asp:HyperLink NavigateUrl="./" CssClass="bagespageheader" Text="text" ID="FullNameLabel" Style="color: inherit; text-decoration: none" runat="server"></asp:HyperLink>

                </div>

                <div class="MissionWaitingHolder">
                    <div class="badgesheaderclass">Badges Earned</div>
                    <a href="./" class="badgeseeall" style="margin-right: 20px; margin-top: 20px">Back</a>
                    <div class="badgelinstholder">
                        <asp:Repeater ID="BadgeRepeater" runat="server">
                            <ItemTemplate>



                                <div class="badgepagelistitemclass" onmouseout="HideShare()" onmouseover="ShowShare(this.id)" runat="server" id="MyBadgeSharerCaller">

                                                    <a target="_blank" href='<%# "https://www.facebook.com/sharer/sharer.php?u="+siteDefaults.SiteUrl.Replace("http://","https://")+"/joinus.aspx?Badgeid="+ Eval("badgeid")+"&display=popup" %>' id="MyBadgeSharer" runat="server" class="ShareBadges"></a>



                                    <div class="badgespageimageclass">
                           <%--             <table cellpadding="0" cellspacing="0">
                                            <tr>
                                                <div class="tdbadgespageimageclass">--%>
                                                    <img class="tdbadgeimageclassimg" src='<%# Eval("badgeImage").ToString().Replace("../","").Replace("_size0","_size1") %>' title='<%# Eval("badgedescription") %>' alt='<%# Eval("badgename") %>' />
                                        
<%--                                                </td>
                                            </tr>
                                        </table>--%>
                                    </div>

                                    <div class="badgenameclass" style="font-family: Tahoma; text-align: center"><%# Eval("badgename") %></div>
                                    <div class="badgedateclass"><%# ((DateTime)Eval("badgedate")).ToString("MMMM dd,yyyy") %></div>
                                </div>
                                <div style="width: 100%; float: left; height: 1px;" runat="server" visible="<%# (Container.ItemIndex+1) % 4  ==0? true:false %>"></div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>



                </div>


            </div>
        </div>


    </div>
    <script type="text/javascript">
        function ShowShare(who) {
            $('#' + who.replace('Caller', '')).show();
        }
        function HideShare() {
            $('.ShareBadges').hide();
        }
    </script>
</asp:Content>

