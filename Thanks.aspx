<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Thanks.aspx.cs" Inherits="Thanks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
                 <div>   <img src="images/thanks/isreallogo.png" alt="Welcome to Israel Likers" class="TopLogo" /></div>
                 <div class="thanksWelcomeclass" >Welcome to ISRAELikers</div>
                  <div style="float:left;">
                    <asp:LinkButton CssClass="thanksbtnLoginClass "  ValidationGroup="AddUserGrp" style="background-color: #f7921e" ID="btn_Login" Text="Receive your first mission via E-mail" runat="server"  />
                            <div style="width:100%;height:40px;"><div class="thanksorline" ></div><div class="thanksorclass" >or</div><div class="thanksorline" ></div></div>
                        <asp:LinkButton runat="server" CssClass="fbLogin btnthanksFacebookClass" ID="RegisterFBLinkButton" >Receive your first mission via Facebook
                            </asp:LinkButton>
                        </div>

              
                  
             </div>
           
        </div>
   </div>
</asp:Content>

