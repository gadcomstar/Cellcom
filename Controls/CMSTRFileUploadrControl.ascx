<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CMSTRFileUploadrControl.ascx.cs" Inherits="Controls_CMSTRFileUploadrControl" %>

<div runat="server" id="FileUploadHolder" >
<asp:HiddenField ID="X" runat="server" />        
<asp:HiddenField ID="Y" runat="server" />        
<asp:HiddenField ID="W" runat="server" />        
<asp:HiddenField ID="H" runat="server" />  
    <div runat="server" id="Imageholder" class="Imageholderclass"><table class="imgtable"><tr><td class="ImageTDclass"> <asp:Image CssClass="ImageClass" runat="server"    ID="MyImage" /></td></tr></table></div>
    <div><asp:LinkButton  ID="CropButton" runat="server" OnClick="Submit_Click" >Crop</asp:LinkButton> </div>
    <div class="UplouadButtonHolderClass">
        <div class="UploadTextClass"><%= Text %></div>
        <div runat="server" id="MyTextBoxHolderClass"  class="TextHolderBoxClass"><asp:TextBox ID="MyTextBoxClass" ReadOnly="true" runat="server"  CssClass="TextBoxClass" ></asp:TextBox></div>
        <div class="FileUploadClass" >
            <asp:FileUpload  OnPreRender="fileup_PreRender" runat="server"       ID="FileUpload1" />
        </div>
        <div onclick='<%= "if(confirm(\"delete image?\")){$(\"#"+MyImageHiddenField.ClientID+"\").val(\"\");$(\"#"+MyImage.ClientID+"\").attr(\"src\",\"none\");}" %>' class="DeleteImageclass"></div>
        <asp:HiddenField runat="server" ID="MyImageHiddenField" /> 
        <asp:HiddenField runat="server" ID="CreateInstance" Value="true" />
    </div>
</div> 