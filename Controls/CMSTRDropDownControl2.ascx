<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CMSTRDropDownControl2.ascx.cs" Inherits="CMSTRDropDownControl2" %>

<div runat="server" visible="false" id="TextBoxHolderDiv2" >  
    <div class="DropDownCoverClass">
        <span  runat="server" class="UperBlockText" id="myspan"  ></span>        
        <asp:DropDownList Visible="false" CssClass="MyDropDownClass"    OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"    runat="server" ID="MyDropDown" >       
        </asp:DropDownList>       
    </div>    
 </div>
 <div runat="server" id="TextBoxHolderDiv" >
   <div runat="server" id="DropText" class="LabelTextClass" ></div>
  <div runat="server" id="MyDropDown2" class="DropDownCoverClass">            
            <div runat="server" id="SelectedVal" onclick="showdropdown(this)" class="UperBlockText" ></div>
            <div runat="server" id="DropDownSelect"   class="DropDownClass" style="display:none;"  ><div class="Dropdownselect"><asp:Literal runat="server" ID="DropDownLiteral"></asp:Literal></div></div>
            <asp:HiddenField runat="server" ID="dotogle" Value="true" />
            <asp:HiddenField runat="server" ID="MyHiddenField"   />
            <asp:HiddenField runat="server" ID="MyHiddenFieldVlaue"   />
    </div>
</div>
<asp:LinkButton runat="server" ID="ClickButton" OnClick="DropDownList1_SelectedIndexChanged" style="background:none;width:0px;border:none;" ></asp:LinkButton>    
    <asp:Panel runat="server" ID="EnableDrop" >
    <script  type="text/javascript">
        function showdropdown(sender) {
            if ($(sender).next().next().val() == "true" && $(sender).next().css('display') != 'none') {
                $(sender).removeClass('UperBlockText2');
                $(sender).next().hide();

          } else
          {
              $(sender).next().show();
              $('.UperBlockText2').removeClass('UperBlockText2');
              $(sender).addClass('UperBlockText2');
            if ($(sender).next().next().val() == 'true') {
                $(sender).next().next().val('false');
            }
            }       
        }        
        $('html').on('click', { dotogle: '<%= dotogle.ClientID %>',dropid: '<%= DropDownSelect.ClientID %>'}, greet);
    </script>
    </asp:Panel>