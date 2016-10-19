<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CMSTRRecoWebUserControl.ascx.cs" Inherits="CMSTRRECOWebUserControl" %>

<div runat="server" id="FaqHolderDiv" >
 <asp:Repeater runat="server" ID="FaqRepeater"  >
                <ItemTemplate>
                <div class="FieldItemHolderclass" >
                    <div id="Div1" runat="server"  visible='<%# HasPic  %>' class="RecoImageHolderClass">
                         <asp:Panel runat="server" Visible='<%#  FieldMovie =="" ? false :  (Eval(FieldMovie).ToString()==""? false:true )  %>' ID="playOnReco" CssClass="RecoPlayIconHolder">
                            <a href='<%#  FieldMovie=="" ? "": Eval(FieldMovie).ToString() %>' class="RecoPlayIcon" id="RecoPlay"></a>
                        </asp:Panel>
                        <table cellpadding="0" cellspacing="0">
                            <tr>
                                <td class="RecoPictureTD">
                                  <a href='<%#   FieldMovie=="" ||  Eval(FieldMovie).ToString()=="" ? (  (FieldEnlageImage==""? true :  !(bool)Eval(FieldEnlageImage) ) || FieldImage=="" ||  Eval(FieldImage).ToString()==""  ? "javascript:void(0)" :Eval(FieldImage).ToString().Replace("../","").Replace("_small","_big")  ) :   Eval(FieldMovie).ToString() %>' class='<%#   FieldMovie=="" ||  Eval(FieldMovie).ToString()=="" ? (  (FieldEnlageImage==""? true :  !(bool)Eval(FieldEnlageImage) ) || FieldImage=="" ||  Eval(FieldImage).ToString()==""  ? "imageLinkclass3" :"imageLinkclass2"  ) :   "imageLinkclass" %>'  >  <img alt='<%# Eval(FieldQuestion) %>' src='<%#  FieldImage=="" ? "" : (     Eval(FieldImage).ToString()==""  ?DefaultImage:Eval(FieldImage).ToString().Replace("../","") ) %>' /></a>
                                </td>
                            </tr>
                        </table>  
                        <asp:HyperLink Visible='<%#   FieldEnlageImage=="" ? false : bool.Parse(Eval(FieldEnlageImage).ToString() ) %>' runat="server" ID="ImageEnlargeHyperLink" NavigateUrl='<%#  FieldImage=="" ? "javascript:void(0)" :    Eval(FieldImage).ToString().Replace("_small","_big") %>' CssClass="ImageEnlargeHyperLinkClass" Text='<%# TextEnlageImage %>' ></asp:HyperLink>
                    </div>

                    <div class="FieldPlaceHolderClass" >
                        <a href="javascript:void(0)" id='<%# "FaqQuestion"+Eval(FieldID).ToString() %>' onfocus="blur()" class="FieldQuestionClass"   ><%# Eval(FieldQuestion)%></a>
                        <div class="FieldShortDesc" ><%# Eval(FieldShortText).ToString().Replace("\n", "<br/>")%></div>
                        
                        <div id='<%# "FaqAnswer"+Eval(FieldID) %>' class="FieldAnswerClass" ><%# Eval(FieldAnswer).ToString().Replace("\n", "<br/>")%></div>
                        <div class="FieldOpenAnswerClass" onclick="javascript:$('#<%# "FaqQuestion"+Eval(FieldID).ToString() %>').click()" ><%# TextOpen %></div>
                    </div>
                    </div>
                </ItemTemplate>
                <SeparatorTemplate>
                    <hr class="FieldSeperator" />                    
                </SeparatorTemplate>
 </asp:Repeater>
   <div runat="server" id="NumberMenu" class="NumberMenuClass">
        <table class="numTableclass"><tr><td class="numberTDclass">
					<div class="Nuberholderclass" >
						<asp:HyperLink runat="server" ID="cmdPrev5" CssClass="navigateprevclass" Text='<%= RightButtonText %>'></asp:HyperLink>
						<asp:Literal runat="server" ID="NavigationNumbers5"></asp:Literal>
						<asp:HyperLink runat="server" id="cmdNext5" CssClass="navigatenextclass" Text='<%= LeftButtonText %>' ></asp:HyperLink>
					</div>
			</td></tr></table>
	</div>
 </div>

 <script type="text/javascript" language="javascript" >

     doFieldToggle('<%= TextClose %>', '<%= TextOpen %>');
     DoFancyVideo('RecoPlayIcon');
     DoFancyVideo('imageLinkclass');
     DoFancyImage('imageLinkclass2');
     DoFancyImage('ImageEnlargeHyperLinkClass');

    </script>