<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="JoinUs2.aspx.cs" Inherits="JoinUs2" %>

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
    <%--top section --%>
    <div class="joinustopclass">
        <div class="joinustopcontent">


            <div class="joinusheader">
                <div class="joinuslogo">
                    <a href="./">
                        <img class="joinuslogoimage" alt="join israel likers" src="images/joinus/Form_Header.png" /></a>
                </div>
                <div runat="server" id="MyTitle" class="joinustoptitle">Share pro-Israel posts and support Israel!</div>
            </div>
             <div runat="server" id="MyTitleMobile" class="joinustoptitle joinustoptitlemoble">Share pro-Israel posts and support Israel!</div>
            <div id="MyContent" runat="server" class="joinustextclass">
                Israelikers, a new initiative promoted by the foregiegn Ministry of Israel is your means to help strengthen the image of Israel around the globe. 
                <br />
                <br />
                How? Following the registration process on the right, you will recive e-mails containing pro-Israel posts, which you'll be required to share.
            </div>

            
             <%-- sign in form--%>
                <div class="JoinFormHolder">
                    <div class="joinusTboxTitle">fill in the following:</div>
                    <cmsr:MyForm ID="MyFormHeb" runat="server" TableName="tblusers" FormStatus="Insert" OnItemInserted="MyFormHeb_ItemInserted" BackButtonText="" ValidationGroup="AddUserGrp">
                        <MessageTemplate>
                            <cmsr:MyTextBox Display="None" ID="txtFullName" DataFieldType="String" CssClass="joinusTboxInputname" ValidationGroup="AddUserGrp" IsRequiredFieldValidator="true" RequiredFielderrorMessage="Please supply full name" runat="server" DataFieldName="FullName" WatermarkText="*Full Name:" HasWatermark="true" />
                            <cmsr:MyTextBox Display="None" ID="txtMail" DataFieldType="String" CssClass="joinusTboxInputname" ValidationGroup="AddUserGrp" runat="server" DataFieldName="EmailAddress" HasWatermark="true" WatermarkText="*Email Address:" IsRequiredFieldValidator="true" RequiredFielderrorMessage="Please enter email address" SelectExpresion="Email" RegularExpressionErrorMessage="mail not valid!" />
                            <cmsr:MyTextBox Display="None" ID="txtPassword" CssClass="joinusTboxInputname" DataFieldType="String" ValidationGroup="AddUserGrp" TextMode="Password" runat="server" IsRequiredFieldValidator="true" RequiredFielderrorMessage="Please select a password" HasWatermark="true" WatermarkText="*Password:" DataFieldName="Password" />
                            <cmsr:MyHiddenField runat="server" ID="GuidMyHiddenField" DataFieldType="String" DataFieldName="Guid" />
                            <cmsr:MyHiddenField runat="server" ID="SignByMailMyHiddenField" DataFieldType="Bool" DataFieldName="SignInByMail" />
                            <div class="joinusRequieredFileds">* Requiered Fileds</div>
                            <div class="joinusbtnholder">
                                <asp:LinkButton CssClass="joinusbtnLoginClass" ValidationGroup="AddUserGrp"  ID="btn_Login" Text="Join now" runat="server" OnClick="Login_Click" />
                                <div class="joinusorclass" >
                                    <div class="joinusloginorline"></div>
                                    <div class="joinRequiredfieldclass">or</div>
                                    <div class="joinusloginorline"></div>
                                    <div style="clear:both;"></div>
                                </div>
                                <asp:LinkButton runat="server" CssClass="fbLogin joinusbtnLoginFacebookClass" ID="RegisterFBLinkButton" OnClick="RegisterFBLinkButton_Click">Connect
                                </asp:LinkButton>
                            </div>
                            
                            <div>
                                <asp:ValidationSummary CssClass="joinusvalsummerynew" runat="server" ID="MyValidationSummary" ValidationGroup="AddUserGrp" />
                            </div>
                            <asp:Panel runat="server" ID="Panel_HebExists" Visible="false">
                                <div style="text-align: center;">
                                    <div>משתמש קיים כבר במערכת להמשך להתחברות בעזרת הפייסבוק לחץ <a id="ProceedLinkHeb" runat="server" href="#">כאן</a></div>
                                </div>
                            </asp:Panel>
                        </MessageTemplate>
                    </cmsr:MyForm>
                   
                    <asp:Label CssClass="loginstatusclass" ID="lblRegisterStatus" runat="server" />
                </div>
            
                <div class="joinussliderholder">
                    <div class="CycleLeftSide"></div>
                    <div class="joinussliderimageholder">
                        <div class="CycleIndex">
                            <asp:Repeater runat="server" ID="SliderRepeater" >
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
                <a href="uploads/pdf/privacy_policy_IsraeLikers.pdf" target="_blank"  class="joinusprivecy" >privacy policy</a>


            </div>

          
        </div>
    <div class="joinuscenterclass">
         <div class="joinuscentercontent">
             <div runat="server" id="MyBlueTitle" class="joinuscenterheader">How to become an ISRAELiker</div>
             <div class="joinusscenterimage joinussignin">
                 <div class="joinuscentertext1">Sign up</div>
             </div>
             <div class="joinusscenterimage joinusrecive">
                  <div class="joinuscentertext1">Receive e-mails </div>
                 <div class="joinuscentertext1">with posts & videos </div>
                  <div class="joinuscentertext1">that support Israel  </div>
                 <div class="joinuscentertext1" style="font-size:17px;">(an e-mail a week at most) </div>


             </div>
             <div  class="joinusscenterimage joinusshare" >
                  <div class="joinuscentertext1">Share</div>
                  <div class="joinuscentertext1">mail / facebook</div>

             </div>

             </div>
    </div>
     <div class="joinusbottomclass">
     <div class="joinuscentercontent">
         <div runat="server" id="MyOrangeTitle" class="joinuscenterheader">Each post you share can reach:</div>
         <div class="joinusgif">
             <img id="mygif" alt="why join?" src="images/joinus/28031-gif_biz_v1.gif" /></div>
     </div>
         
     </div>
    <div runat="server" id="MyFooter" class="joinusfootertext">And this is how you make a real difference!</div>
     <script type="text/javascript">
         function clickSave() {
             $('.savebuttonclass').attr("href");
             alert("");

         }
         $(document).ready(function () {
             $('.ValidetorClass').css("color", "white");
         });

         
    </script>
</asp:Content>

