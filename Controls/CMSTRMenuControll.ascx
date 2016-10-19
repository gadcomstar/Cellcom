<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CMSTRMenuControll.ascx.cs" Inherits="Controls_CMSTRMenuControll" %>
<div id="menuHolder" runat="server" class="menuholderClass">

<asp:Repeater runat="server" ID="PageREpeater" >
    <ItemTemplate>
        <div runat="server" id="topLinkholder" onmouseover="menumouseover(this);" onmouseout="menumouseOut(this);" class='<%# GetPageUrl().ToString()== Eval("pageid").ToString() || IsPageParent(Eval("pageid").ToString())? "topselLinkholderclass":"topLinkholderclass" %>'  >
            <div class="MainMenuRightClass">
			    <div class="MainMenuLeftClass">
			        <div class="MainMenuCenterClass" >
			            <div class="MainMenuCenter2Class" >
			                <a class="mainmenulinkclass" href='<%# Eval("PageURL").ToString()=="" ?"./": "./"+ Eval("PageURL").ToString() %>'  ><%# Eval("pagename") %></a>
			            </div>
			        </div>
			    </div>
			</div>
            <div runat="server" visible='<%# CheckHasChildren(Eval("pageid").ToString()) %>' class="subcatholderclass">
                <div  class="subcatholderinside1class">
                    <div class="subcatholderinside2class">
                        <asp:Repeater runat="server" ID="SubMenuControlRepeater" DataSource='<%# GetData(Eval("pageid").ToString()) %>' >
                    <ItemTemplate>
                          <div class="SubMenuRightClass">
			                <div class="SubMenuLeftClass">
			                    <div class="SubMenuCenterClass" >
			                        <div class="SubMenuCenter2Class" >
			                            <a href='<%# "./"+Eval("PageURL").ToString() %>'  ><%# Eval("pagename") %></a>
			                        </div>
			                    </div>
			                </div>
			            </div>                        
                    </ItemTemplate>    
                    <SeparatorTemplate>
                        <div class="subsepclass" ></div>
                    </SeparatorTemplate>            
                </asp:Repeater> 
                    </div>  
                </div>         
            </div>        
        </div>       
    </ItemTemplate>
    <SeparatorTemplate>
        <div class="MainSepclass"></div>
    </SeparatorTemplate>
</asp:Repeater>
</div>
<script type="text/javascript" >
    onloadmenu();
</script>