<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ConfirmControl.ascx.cs" Inherits="ConfirmControl" %>
<div class="ConfirmControlBg">
    <div class="ConfirmHolder">
        <asp:LinkButton runat="server" OnClick="NoClick"  CssClass="Closebtnabsclass confirmClosebtn"></asp:LinkButton>
    
        <div runat="server" id="ConfirmTitle" class="ConfirmTitle"></div>
        <div class="ConfirmContentHolder">
            <div class="confirmRed">Importent :</div>
            <div runat="server" id="MyContent" class="confirmText">Your date with this person will stop immediately after you decide to report this preson. </div>    
        </div>
        <div class="ConfirmButtonHolder" >
            <div class="greybtnleft"><div  class="greybtnright"><asp:LinkButton CssClass="greybtncenter" OnClick="NoClick" runat="server" ID="NoButton" Text="No" ></asp:LinkButton></div></div>
            <div class="greybtnleft"><div  class="greybtnright"><asp:LinkButton CssClass="greybtncenter"  OnClick="YesClick" runat="server" ID="YesButton" Text="Yes" ></asp:LinkButton></div></div>
        </div>
        <asp:HiddenField runat="server" ID="controlHiddenField" />  
    </div>
</div>
