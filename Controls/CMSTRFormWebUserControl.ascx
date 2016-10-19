<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CMSTRFormWebUserControl.ascx.cs" Inherits="CMSTRFormWebUserControl" %>
<%@ Register TagPrefix="cmsr" Src="~/Controls/CMSTRFileUploadrControl.ascx" TagName="MyUpload" %>
<div runat="server" id="FormHolder" class="formplaceholderclass" >
<div class="Header"><%= Header %></div>
 <asp:Panel runat="server" ID="BackButton" ><a class="BackURLClass" href='<%= BackURL %>' ><%= BackButtonText %></a></asp:Panel>
<asp:Placeholder runat="server" ID="PlaceHolder1" />
<div runat="server" id="butonholder" class="savebuttonclasstop"  ><div class="savebuttonclassbotton"><asp:LinkButton runat="server" ID="mybuttton" CssClass="savebuttonclass" OnClick="doClick" >שמור</asp:LinkButton></div></div>
<div runat="server" id="buttonbackholder" class="savebuttonclasstop"  ><div class="savebuttonclassbotton"><asp:LinkButton runat="server" ID="SaveRetunLinkButton" CssClass="saveandbackbuttonclass" OnClick="SaveAndBack" ><%= SaveReturnText %></asp:LinkButton></div></div>
<asp:Label runat="server" CssClass="MymsgLabelClass" ID="MymsgLabel" ></asp:Label>
</div>