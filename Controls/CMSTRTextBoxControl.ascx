<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CMSTRTextBoxControl.ascx.cs" Inherits="CMSTRTextBoxControl" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<div runat="server" id="TextBoxHolderDiv">
    <div class="TextLabelClass"><%= FieldName %></div>
    <div class="validationHolderClass">
        <asp:RequiredFieldValidator Display="Dynamic" CssClass="ValidetorClass" ID="Validator1" SetFocusOnError="True" ControlToValidate="MyTextBox" runat="server"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator Display="Dynamic" ControlToValidate="MyTextBox" SetFocusOnError="true" CssClass="ValidetorClass" ID="Validator2" runat="server"></asp:RegularExpressionValidator>
        <asp:CompareValidator Display="Dynamic" ControlToValidate="Password2" SetFocusOnError="true" ErrorMessage="" CssClass="ValidetorClass" ID="Validator3" runat="server" ControlToCompare="CompareTextBox"></asp:CompareValidator>
    </div>
    <div class="TextBoxHolderClass">
        <asp:TextBox CssClass="MyTextBoxClass" AutoCompleteType="Email" runat="server" ID="MyTextBox"></asp:TextBox>
        <asp:TextBox CssClass="MyTextBoxClass" AutoCompleteType="Disabled" runat="server" ID="Password2"></asp:TextBox>
        <asp:HiddenField runat="server" ID="PasswordHiddenField" />
        <asp:HiddenField OnPreRender="MyTextBox_PreRender" runat="server" ID="TextBoxMessge" />
        <cc1:TextBoxWatermarkExtender runat="server" ID="MyTextBoxWatermarkExtender" TargetControlID="MyTextBox" WatermarkCssClass="TextBoxWatermarkCssClass"></cc1:TextBoxWatermarkExtender>
    </div>
</div>
<div runat="server" id="CompareHolderDiv">
    <div class="TextLabelClass"><%= CompareFieldName%></div>
    <div class="validationHolderClass">
    </div>
    <div class="TextBoxHolderClass">
        <asp:TextBox CssClass="MyTextBoxClass" AutoCompleteType="Disabled" TextMode="Password" runat="server" ID="CompareTextBox"></asp:TextBox>
    </div>
</div>
