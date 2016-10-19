<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderHeader" runat="Server">

    <div class="OuterHolder loginOuterHolder">
    </div>
    <div class="logincontentholder">
        <div class="logincontentholder2">
            <asp:Panel ID="Panel_login" runat="server" Style="height: 100%;" DefaultButton="btn_Login">

                <div class="InnerHolder">
                    <div class="loginInnerHolder">
                        <a class="LogoImageclass" href="./"><%--<img src="images/HomeImages/LoginLogo.png" class="LogoImageclass"  />--%></a>
                    </div>
                    <div class="LoginHeaderDiv">
                        <div class="logintexttitleclass">Welcome to ISRAELikers</div>
                        <div class="logintextcontentclass">the place that allows you to be a leading force on the worldwide Israeli information front.</div>
                    </div>
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true">
                        <ContentTemplate>
                            <div class="LoginFormDiv">
                                <div class="FieldsDiv">
                                    <div class="loginuserclass">
                                        <div class="FormItemFieldholder">
                                            <asp:TextBox placeholder="E-mail:" CssClass="FormItemField" ID="txtUsername" runat="server" />
                                        </div>
                                    </div>
                                    <asp:RequiredFieldValidator Display="None" runat="server" ID="emailvalidator" ErrorMessage="*enter email" ValidationGroup="logingroup" ControlToValidate="txtUsername"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator Display="None" runat="server" ID="EmailFormatValidator" ValidationGroup="logingroup" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="*enter valid email" ControlToValidate="txtUsername"></asp:RegularExpressionValidator>
                                    <asp:RequiredFieldValidator Display="None" runat="server" ID="RequiredFieldValidator1" ErrorMessage="*enter email" ValidationGroup="forgotgroup" ControlToValidate="txtUsername"></asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator Display="None" runat="server" ID="RegularExpressionValidator1" ValidationGroup="forgotgroup" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ErrorMessage="*enter valid email" ControlToValidate="txtUsername"></asp:RegularExpressionValidator>

                                    <asp:RequiredFieldValidator Display="None" runat="server" ID="PasswordRequiredFieldValidator" ErrorMessage="*enter password" ValidationGroup="logingroup" ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
                                    <div class="loginuserclass2">
                                        <div class="FormItemFieldholder">
                                            <asp:TextBox placeholder="Password:" CssClass="FormItemField" ID="txtPassword" runat="server" TextMode="Password" />
                                        </div>
                                    </div>
                                    <asp:Label CssClass="lblLoginStatusClass" Text="" ForeColor="#d2232a" Font-Names="Tahoma,Arial" ID="lblLoginStatus" runat="server" />
                                    <div class="logincentertext">
                                        <%--<div class="Requiredfieldclass">*Required field</div>--%>
                                        <asp:LinkButton CssClass="ForgotBtnClass" ID="btn_ForgotPassword" runat="server" ValidationGroup="forgotgroup" OnClick="btn_ForgotPassword_Click">Forgot password?</asp:LinkButton>
                                        <asp:ValidationSummary Style="clear: both; float: right; margin-right: 50px;" DisplayMode="List" ForeColor="WhiteSmoke" runat="server" ID="LoginValidationSummary" ValidationGroup="logingroup" />
                                        <asp:ValidationSummary Style="clear: both; float: right; margin-right: 50px;" DisplayMode="List" ForeColor="WhiteSmoke" runat="server" ID="ValidationSummary1" ValidationGroup="forgotgroup" />
                                    </div>

                                    <asp:LinkButton CssClass="btnLoginClass" ID="btn_Login" ValidationGroup="logingroup" Text="Login" runat="server" OnClick="btn_Login_Click" />

                                    <div style="width: 100%; height: 40px;">
                                        <div class="loginorline"></div>
                                        <div class="Requiredfieldclass" style="margin: 10px">or</div>
                                        <div class="loginorline"></div>
                                    </div>
                                    <div class="fbLogin btnLoginFacebookClass" onclick="LoginWithFB()">
                                        Connect
                                    </div>
                                </div>

                                <div class="GirlDiv">
                                    <div class="GirlDivclass">
                                        <img alt="" src="images/HomeImages/GirlWIthFlag.png" class="GirlWIthFlagclass" />
                                    </div>
                                </div>
                            </div>

                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </asp:Panel>
        </div>
    </div>
    <script type="text/javascript">
        window.fbAsyncInit = function () {
            FB.init({
                appId: '<%=siteDefaults.FbClientId.ToString()%>',
                status: true,
                cookie: true,
                xfbml: true
            });
        }
                        (function (d) {
                            var js, id = 'facebook-jssdk', ref = d.getElementsByTagName('script')[0];
                            if (d.getElementById(id)) { return; }
                            js = d.createElement('script'); js.id = id; js.async = true;
                            js.src = "//connect.facebook.net/en_US/all.js";
                            ref.parentNode.insertBefore(js, ref);
                        }(document));
        function GetUserDeatilsWeb() {

            FB.api('/me', function (response) {
                AjaxLoginUserFromWebsite(response.id);
                console.log(response.status);
            });
        }
        function AjaxLoginUserFromWebsite(ID) {




            $.ajax({
                type: "POST",
                url: "login.aspx/LogUserWithWebsite",
                data: "{'ID':'" + ID + "'}",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                success: function (msg) {
                    if (msg.d == "JustLogged") {

                        window.location = './';
                    }
                    else if (msg.d == "AlreadyLogged") {
                    }

                    else if (msg.d == "UserNotFound") {
                        var check = confirm("The user you are trying to login with is not known to us\r\nDo you want to Join us by opening a new account?");
                        if (check) {
                            window.location.href = "joinus.aspx";
                        }
                    }
                    else {
                        alert("An Error Occured");
                    }
                },
                error: function (msg) {
                    //alert(msg.status + " " + msg.text);
                }
            });
        }
        function LoginWithFB() {

            FB.getLoginStatus(function (response) {
                if (response.status === 'connected') {
                    console.log(response.status);
                    GetUserDeatilsWeb();
                }
                else {
                    console.log(response.status);

                    //alert("Facebook ID/User was not found on the server");
                    FB.login(function (response) {
                        //alert(response);
                        // Handle the response object, like in statusChangeCallback() in our demo
                        // code.
                        LoginWithFBManual();
                    });


                }

            });
        }
        function LoginWithFBManual() {
            //alert('');
            FB.getLoginStatus(function (response) {
                if (response.status === 'connected') {
                    GetUserDeatilsWeb();
                }
                else {
                    alert("Facebook ID/User was not found on the server");

                }

            });
        }



    </script>


</asp:Content>


