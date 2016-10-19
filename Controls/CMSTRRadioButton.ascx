<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CMSTRRadioButton.ascx.cs" Inherits="CMSTRRadioButton" %>
<div class='<%= CssClass %>'  >
<asp:Repeater runat="server" ID="RadioRepiter" >
    <ItemTemplate>
    <div class="oneRadioHolderClass" >
        <div runat="server" class="Radioclass" onclick='<%# "SetSelectedRadio"+ (JSKey==""? RadioHiddenField.ClientID : JSKey)+"(this)" %>'  ><img class='<%# ImageClass %>' runat="server" id="RadioImage" src='<%#  Eval("value").ToString()==Selected?ImageOn:ImageOff   %>'  alt="בחר"  /></div>
        <asp:HiddenField runat="server" ID="OneRadioHiddenFeild" Value='<%# Eval("value")  %>' />
        <div class="RadioFieldNameHolder"><asp:Literal runat="server"  ID="FieldNameLiteral" Text='<%# Eval("fieldName")  %>' ></asp:Literal></div>
    </div>
    </ItemTemplate>
</asp:Repeater>
<asp:HiddenField runat="server" ID="RadioHiddenField" />    
</div>

