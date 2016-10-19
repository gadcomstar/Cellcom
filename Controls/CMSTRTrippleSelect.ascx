<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CMSTRTrippleSelect.ascx.cs" Inherits="Controls_CMSTRTrippleSelect" %>

<div  class='<%= CssClass %>' >
<div runat="server"   class="MyCheckBox" id="MyCheckBox"  ><img class="Myimg" runat="server" id="checkboxImage" alt="בחר"  src=""/></div>
<div class="checkboxfieldclass" ><%= FieldName%></div>
<asp:HiddenField runat="server" ID="CheckBoxHiddenField" Value="false" />
</div>
<asp:CustomValidator  Display="Dynamic" ValidationGroup="RegisterGroup" runat="server"
            ID="CustomValidator1" ClientValidationFunction="validateCheckbox" ErrorMessage="eee"></asp:CustomValidator>
