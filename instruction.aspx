<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="instruction.aspx.cs" Inherits="instruction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderHeader" Runat="Server">
    <div class="LandingImgContentHolder">
      <%--  <img alt="" src="images/RegisterImages/GirlWithFlag.png" class="LandingImg" />--%>
    </div>
    <div class="joinuspageholder">
         <div class="ContainerDiv">
        <asp:Panel runat="server" Visible="false" ID="Panel_Error">
                    <div>אירעה שגיאה</div>
                    <div>An Error occured</div>
        </asp:Panel>   
             <div style="width:570px;float:left;">
                 <div>   <img src="images/thanks/isreallogo.png" alt="Welcome to Israel Likers" class="TopLogo" /></div>
                 <div class="pagecontentclass" runat="server" id="pagecontent" ></div>
                  

              
                  
             </div>
           
        </div>
   </div>
</asp:Content>

