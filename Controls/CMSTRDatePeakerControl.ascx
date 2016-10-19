<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CMSTRDatePeakerControl.ascx.cs" Inherits="CMSTRDatePeakerControl" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<div runat="server" id="DatePeakerHolderDiv" >
    <div class="DateLabelClass"><%= FieldName %></div>
    <div class="validationHolderClass">
    <asp:RequiredFieldValidator Display="Dynamic"   CssClass="ValidetorClass" ID="Validator1" SetFocusOnError="true" ControlToValidate="DateTextBox" runat="server"  ></asp:RequiredFieldValidator>   
    </div>
    <asp:TextBox CssClass="DateTextBoxClass" runat="server" ID="DateTextBox" ></asp:TextBox>
 </div>