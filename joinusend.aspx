<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="joinusend.aspx.cs" Inherits="joinusend" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderHeader" runat="Server">
    <asp:Label Text="text" ID="mylog" runat="server" />
    <div class="joinusholder">

        <div class="joinuspageholder">
            <div class="ContainerDiv">
                <asp:Panel runat="server" Visible="false" ID="Panel_Error">
                    <div>אירעה שגיאה</div>
                    <div>An Error occured</div>
                </asp:Panel>
                <div class="joinussectionholder">
                    <a href="./" style="width: 100%; float: left">
                        <img src="images/ConnectImages/IsraelLikersLogo.png" alt="Welcome to Israel Likers" class="TopLogo" /></a>
                    <div class="joinustextholder">
                        The system was created to allow you to be a   
                        <br />
                        leading force on the worldwide information front with   
                        <br />
                        minimal effort on your part.
                    </div>
                    <div class="FormHolder">
                        <div class="TbocHeader">Verify your Email adderss</div>
                        <div class="TboxThankYouText">Before you can log in you must verify your email address. A verification link was sent to <div style="font-weight:bold;"> <%=Request.QueryString["mail"] %></div></div>
                        <div class="TboxThankYouTextResend" id="TboxThankYouTextResend" runat="server">Don't see the email?<br /></div>
                        <asp:LinkButton OnClick="TboxThankYouTextResend2_Click" class="ResendEmail" id="TboxThankYouTextResend2" runat="server">Resend the verification email.</asp:LinkButton>
                        <div class="TboxThankYouText1" id="TboxThankYouTextResend3" runat="server"><a href="./" class="BackToLogin">OK</a></div>

                        

                        <asp:Label CssClass="loginstatusclass" ForeColor="White" ID="lblRegisterStatus" runat="server" />
                    </div>
                </div>
            </div>
        </div>
        <div class="LandingImgContentHolder">
        </div>
    </div>

</asp:Content>

