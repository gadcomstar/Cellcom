<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="JoinUsCheck.aspx.cs" Inherits="JoinUsCheck" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderHeader" runat="Server">
    <asp:LinkButton runat="server" CssClass="fbLogin jU_ConnectViaFbBtn Test" ID="RegisterFBLinkButton" OnClick="RegisterFBLinkButton_Click">Connect</asp:LinkButton>
    <span ID="Address" runat="server" class="Address"></span>
    <br />
    <span ID="Group" runat="server" class="Address" style="display:none;"></span>

</asp:Content>

