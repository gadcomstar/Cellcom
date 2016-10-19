<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PrivacyPolicy.aspx.cs" Inherits="instruction" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server"></asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderHeader" runat="Server">

    <div class="PrivacyPolicyHeader" runat="server" id="PrivacyPolicyHeader">Privacy Policy</div>
    <div class="PricavyPolicyPlaceHolder">
        <asp:Literal Text="" ID="Content" runat="server" />
    </div>
    <a href="uploads/PDF/privacy_policy_IsraeLikers.pdf" class="PrivacyPolicyLink">Privacy Policy in PDF</a>

</asp:Content>

