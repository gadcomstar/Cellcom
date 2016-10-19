<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Joinustemp.aspx.cs" Inherits="Joinustemp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
       <div class="LandingImgContentHolder">
        <img alt="" src="images/RegisterImages/GirlWithFlag.png" class="LandingImg" />
    </div>
    <div class="joinuspageholder">
         <div class="ContainerDiv">
        <asp:Panel runat="server" Visible="false" ID="Panel_Error">
                    <div>אירעה שגיאה</div>
                    <div>An Error occured</div>
        </asp:Panel>   
             <div style="width:570px;float:left;">
                 <div>   <img src="images/RegisterImages/IsraelLikersLogo.png" alt="Welcome to Israel Likers" class="TopLogo" /></div>
                 <div class="joinustextholder">
                     The system was created to allow you to be a    <br />
                    leading force on the worldwide information front with    <br />
                    minimal effort on your part.
                 </div>
                  <div class="FormHolder">
                           <div class="TboxTitle">To join now fill in the following information:</div>
                      <cmsr:MyForm ID="MyFormHeb" runat="server" TableName="tblusers" FormStatus="Insert" OnItemInserted="MyFormHeb_ItemInserted" BackButtonText="" ValidationGroup="AddUserGrp">
                        <MessageTemplate>
                             <cmsr:MyTextBox Display="None" ID="txtFullName" DataFieldType="String" CssClass="TboxInputname" ValidationGroup="AddUserGrp" IsRequiredFieldValidator="true" RequiredFielderrorMessage="Please supply full name" runat="server" DataFieldName="FullName" WatermarkText="*Full Name:" HasWatermark="true" />
                             <cmsr:MyTextBox Display="None" ID="txtMail" DataFieldType="String" CssClass="TboxInput" ValidationGroup="AddUserGrp" runat="server" DataFieldName="EmailAddress" HasWatermark="true" WatermarkText="*Email Address:" IsRequiredFieldValidator="true" RequiredFielderrorMessage="Please enter email address" SelectExpresion="Email" RegularExpressionErrorMessage="mail not valid!" />
                              <cmsr:MyTextBox Display="None" ID="txtPassword" CssClass="TboxInputpassword" DataFieldType="String" ValidationGroup="AddUserGrp" TextMode="Password" runat="server" IsRequiredFieldValidator="true" RequiredFielderrorMessage="Please select a password" HasWatermark="true" WatermarkText="*Password:" DataFieldName="Password" />
                           <%-- <div class="LandingPageHolder">
                                <div class="LandingContentHolder">
                                 
                                 
                                    <div class="BoxHolderBG">
                                   
                                       
                                        <div class="TboxHolder Name">
                                           
                                        </div>
                                       
                                        <div class="TboxHolder Email">
                                           
                                        </div>
                                    
                                        <div class="TboxHolder Password">
                                          


                                        </div>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="TboxBtn" OnClick="LinkButton1_Click" ValidationGroup="AddUserGrp">Join us!</asp:LinkButton>
                                      
                                    </div>
                                </div>                               
                            </div>--%>
                            <div style="float:left;">
                            <asp:LinkButton CssClass="btnLoginClass"  ValidationGroup="AddUserGrp" style="background-color: #f7921e" ID="btn_Login" Text="Join us!" runat="server" OnClick="LinkButton1_Click" />
                                    <div style="width:100%;height:40px;"><div class="loginorline" ></div><div class="Requiredfieldclass" style="margin:10px">or</div><div class="loginorline" ></div></div>
                                <asp:LinkButton runat="server" CssClass="fbLogin btnLoginFacebookClass" ID="RegisterFBLinkButton" OnClick="RegisterFBLinkButton_Click">Connect
                                    </asp:LinkButton>
                                </div>
                            <div>
                                <asp:ValidationSummary CssClass="joinusvalsummery" runat="server" ID="MyValidationSummary" ValidationGroup="AddUserGrp" />

                            </div>
                           <%-- </div>--%>
                                         
                            <%--<div class="GirlDiv">
                                <div class="GirlDivclass">  <img alt="" src="images/HomeImages/GirlWIthFlag.png" class="GirlWIthFlagclass"  /></div></div>
                            </div>--%>

                             
               
              
                <asp:Panel runat="server" ID="Panel_HebExists" Visible="false">
                    <div style="text-align: center;">

                        <div>משתמש קיים כבר במערכת להמשך להתחברות בעזרת הפייסבוק לחץ <a id="ProceedLinkHeb" runat="server" href="#">כאן</a></div>
                    </div>
                </asp:Panel>
                        </MessageTemplate>
                    </cmsr:MyForm>
                       <asp:Label Text="" ForeColor="White" ID="lblRegisterStatus" runat="server" />
                </div>
             </div>
           
        </div>
   </div>
    <script type="text/javascript">
        function socialLogin(facebook, fbImage, fbName) {
            alert('');
           
        }
        function clickSave() {
            $('.savebuttonclass').attr("href");
            alert("");

        }
        $(document).ready(function () {
            $('.ValidetorClass').css("color", "white");
        });
        </script>
</asp:Content>



