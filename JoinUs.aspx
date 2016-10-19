<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="JoinUs.aspx.cs" Inherits="JoinUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="Script/jquery.cycle.all.js"></script>
    <script type="text/javascript">
        $('.CycleIndex').cycle({
            fx: 'fade', // choose your transition type, ex: fade, scrollUp, shuffle, etc...
            timeout: 5000,
            speed: 'fast',
            pause: false,
            next: '.CycleRightSide',
            prev: '.CycleLeftSide',
            pager: '.joinusbullet'
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderHeader" runat="Server">
    <div class="jU_PageHolder">
        <div class="jU_General100P jU_blue jU_bottomPadding">
            <div class="jU_ResponsiveHolder">
                <div class="jU_General100P">
                    <div class="jU_LogoHolder">
                        <a href="./">
                            <img alt="join israel likers" src="images/joinus/Form_Header.png" /></a>
                    </div>
                </div>
                <h1 class="jU_General100P jU_TopHeader" runat="server" id="MyTitle">Make your voice heard!</h1>
                <div class="jU_General100P">
                    <div class="jU_joinFormPlaceHolder">
                        <div class="jU_joinFormHolder">
                            <div class="jU_joinFormTitle jU_tabsBlue firstStep jU_stepNumber">
                                Join us
                            </div>
                            <div class="jU_joinFormContent">
                                <cmsr:MyForm ID="MyFormHeb" runat="server" TableName="tblusers" FormStatus="Insert" OnItemInserted="MyFormHeb_ItemInserted" BackButtonText="" ValidationGroup="AddUserGrp">
                                    <MessageTemplate>
                                        <asp:LinkButton runat="server" CssClass="fbLogin jU_ConnectViaFbBtn" ID="RegisterFBLinkButton" OnClick="RegisterFBLinkButton_Click">Connect</asp:LinkButton>
                                        <div class="jU_orSepHolder" id="Header">
                                            <span>or</span>
                                        </div>
                                        <cmsr:MyTextBox Display="None" SetFocusOnError="false" ID="txtFullName" DataFieldType="String" CssClass="joinusTboxInputname" IsRequiredFieldValidator="true" RequiredFielderrorMessage="Please enter name" ValidationGroup="AddUserGrp" runat="server" DataFieldName="FullName" WatermarkText="*Full Name:" HasWatermark="true" />
                                        <cmsr:MyTextBox Display="None" SetFocusOnError="false" ID="txtMail" DataFieldType="String" CssClass="joinusTboxInputname" runat="server" IsRequiredFieldValidator="true" RequiredFielderrorMessage="Please enter mail address" RegularExpressionErrorMessage="mail format invalid" SelectExpresion="Email" ValidationGroup="AddUserGrp" DataFieldName="EmailAddress" HasWatermark="true" WatermarkText="*Email:" />
                                        <cmsr:MyTextBox Display="None" SetFocusOnError="false" ID="txtPassword" TextMode="Password" CssClass="joinusTboxInputname" DataFieldType="String" IsRequiredFieldValidator="true" RequiredFielderrorMessage="please select a password" ValidationGroup="AddUserGrp" runat="server" HasWatermark="true" WatermarkText="*Password:" DataFieldName="Password" />
                                        <cmsr:MyHiddenField runat="server" ID="GuidMyHiddenField" DataFieldType="String" DataFieldName="Guid" />
                                        <cmsr:MyHiddenField runat="server" ID="SignByMailMyHiddenField" DataFieldType="Bool" DataFieldName="SignInByMail" />
                                        <div class="joinusRequieredFileds">* Required field</div>
                                         <div>
                                            <asp:ValidationSummary CssClass="joinusvalsummerynew" runat="server" ID="MyValidationSummary" ValidationGroup="AddUserGrp" ShowSummary="true" EnableViewState="true" />
                                        </div>
                                <asp:Label CssClass="loginstatusclass" ID="lblRegisterStatus" runat="server" />

                                        <div class="joinusbtnholder">
                                            <asp:LinkButton CssClass="joinusbtnLoginClass" ID="btn_Login" Text="Join now" runat="server" OnClientClick="window.location='#Header';return Page_ClientValidate('AddUserGrp');" OnClick="Login_Click" />
                                        </div>
                                        <asp:Panel runat="server" ID="Panel_HebExists" Visible="false">
                                            <div style="text-align: center;">
                                                <div>משתמש קיים כבר במערכת להמשך להתחברות בעזרת הפייסבוק לחץ <a id="ProceedLinkHeb" runat="server" href="#">כאן</a></div>
                                            </div>
                                        </asp:Panel>
                                    </MessageTemplate>
                                </cmsr:MyForm>
                            </div>
                        </div>
                        <%--<a href="uploads/PDF/privacy_policy_IsraeLikers.pdf" target="_blank" class="jU_privacyPolicy">privacy policy</a>--%>
                        <a href="privacypolicy.aspx" target="_blank" class="jU_privacyPolicy">privacy policy</a>


                    </div>
                    <div class="jU_stepTabsHolder">
                        <div class="jU_stepTab jU_stepNumber jU_tabsBlue jU_tabBgGet">
                            Get
                            <span class="jU_tabRunText">a weekly call for action</span>
                        </div>
                        <div class="jU_stepTab jU_stepNumber jU_tabsBlue jU_tabBgShare">
                            Share
                            <span class="jU_tabRunText">via e-mail / facebook</span>
                        </div>
                        <div class="jU_stepTab jU_stepNumber jU_tabsBlue jU_tabBgChange">
                            Change
                            <span class="jU_tabRunText">world public opinion</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="jU_General100P jU_gradientCyan jU_whiteSep">
            <div class="jU_ResponsiveHolder">
                <div class="jU_General100P">
                    <div class="jU_topRibbon">
                        Powered by you -
                        <br class="jU_showOnResponsive" />
                        The ISRAELikers project
                    </div>
                    <div class="jU_freeTextHolder jU_freeTextFirst">
                        <h2 class="jU_freeTextHeader" runat="server" id="ContentTitle1">Don't stand aloof.
                            <br />
                            Not this time!</h2>
                        <div class="jU_freeTextContent" runat="server" id="ContentText1">
                        </div>
                    </div>
                    <div class="jU_cycleHolder jU_hideOnResponsive">
                        <div class="joinussliderholder">
                            <div class="CycleLeftSide"></div>
                            <div class="joinussliderimageholder">
                                <div class="CycleIndex">
                                    <asp:Repeater runat="server" ID="SliderRepeater">
                                        <ItemTemplate>
                                            <div class="CyclerIMGHolder" style="background: url('<%# Eval("sliderimage").ToString().Replace("../","")%>') no-repeat;">
                                                <div class="joinusslidertext"><%# Eval("slidertext") %></div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>

                                </div>
                            </div>
                            <div class="CycleRightSide">
                            </div>
                            <div class="joinusbullet"></div>
                        </div>
                    </div>
                    <div class="jU_freeTextHolder">
                        <h2 class="jU_freeTextHeader" runat="server" id="ContentTitle2">We're calling you for action</h2>
                        <div class="jU_freeTextContent" runat="server" id="ContentText2">
                        </div>
                    </div>
                    <div class="jU_freeTextHolder jU_noBg jU_hideOnResponsive">
                        <div class="jU_freeTextContent" runat="server" id="ContentText3">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="jU_General100P jU_orange jU_whiteSep">
            <div class="jU_ResponsiveHolder">
                <div class="jU_General100P">
                    <div class="jU_topRibbon">
                        Each post you share
                        <br class="jU_showOnResponsive" />
                        can reach:
                    </div>
                    <img id="Img1" class="jU_bottomGif" alt="why join?" src="images/joinus/28031-gif_biz_v1.gif" />
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        window.scrollTo = function () { };
        function clickSave() {
            $('.savebuttonclass').attr("href");
            alert("");

        }
        $(document).ready(function () {
            $('.ValidetorClass').css("color", "white");
        });


    </script>
</asp:Content>

