<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CMSTRLabel.ascx.cs" Inherits="Controls_CMSTRLabel" %>
<span id="Labeldiv"  runat="server"  >
<span class="labelfieldameClass" id="labelfieldame"><%= FieldName %></span>
<asp:Label CssClass="MyLabelClass" runat="server" ID="MyLabel" ></asp:Label>
</span>