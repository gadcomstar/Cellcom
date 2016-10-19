<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CMSTRArticlesWebUserControl.ascx.cs" Inherits="Controls_CMSTRFAQWebUserControl" %>

<div runat="server" id="ArticleHolderDiv" >
<asp:Panel runat="server" ID="ArticleListHolderPanel" >
 <asp:Repeater runat="server" ID="ArticleRepeater"  >
        <ItemTemplate>
            <div class="ArticlePlaceHolderClass" >
                <div id="Div1" class="ArticleImageHolderClass" runat="server"  >
                    <table cellpadding="0" cellspacing="0"  ><tr><td class="ArticleTdClass" ><a  href='<%# PageURL.IndexOf("?") > 0 ?PageURL+ "&article="+ Eval(FieldID): PageURL+ "?article="+ Eval(FieldID) %>' ><img alt='<%# FieldName %>' src='<%# Eval( FieldImage).ToString()=="" ? DefaultImage:  Eval( FieldImage).ToString().Replace("../","") %>' /></a></td></tr></table>
                </div>
                <div class="ContentHolderClass" >
                    <a id="Div2" visible='<%# ShowName %>' runat="server" class="ArticleNameClass"  href='<%# PageURL.IndexOf("?") > 0 ?PageURL+ "&article="+ Eval(FieldID): PageURL+ "?article="+ Eval(FieldID) %>' ><%# Eval(FieldName)%></a>
                    <div id="Div3" visible='<%# ShowSubTitle %>'   runat="server"  class="ArticleSubtitleClass" ><%# Eval(FieldSubtitle)%></div>
                    <div id="Div4" visible='<%# ShowDate %>'   runat="server"  class="ArticleDateClass"><%# ((DateTime) Eval(FieldDate) ).ToString(DateFormat)%></div>
                    <div id="Div5" visible='<%# ShowShortContent %>'    runat="server"  class="ArticleShortContentClass"><%# Eval(FieldShortContent)%></div>    
                        
                </div>
               <div class="GoToArticleViv"> <a class="GoToArticleClass" href='<%# PageURL.ToString().IndexOf("?") > 0 ?PageURL+ "&article="+ Eval(FieldID): PageURL+ "?article="+ Eval(FieldID) %>'><%# LinkText %> </a></div>
              
            </div>
        </ItemTemplate>
        <SeparatorTemplate>
            <hr class="ArticleSeperator" />                    
        </SeparatorTemplate>
 </asp:Repeater>
   <div runat="server" id="NumberMenu" class="NumberMenuClass">
        <table class="numTableclass"><tr><td class="numberTDclass">
					<div class="Nuberholderclass" >
						<asp:HyperLink runat="server" ID="cmdPrev5" CssClass="navigateprevclass" Text='<%# RightButtonText %>'></asp:HyperLink>
						<asp:Literal runat="server" ID="NavigationNumbers5"></asp:Literal>
						<asp:HyperLink runat="server" id="cmdNext5" CssClass="navigatenextclass" Text='<%# LeftButtonText %>' ></asp:HyperLink>
					</div>
			</td></tr></table>
	</div>
    </asp:Panel>
    <asp:Panel runat="server" ID="ArticleHolderPanel" Visible="false" >
    <div class="SelectedArticleHolderClass" >
      <a class="ArtilceGoBack1Class"  href='<%= PageURL.ToString().Replace( "&article="+Request.QueryString["article"],"").Replace( "?article="+Request.QueryString["article"],"") %>' ><%= GoBackLinkText %></a>
        <div id="SelectedArticleImageHolder" class="SelectedArticleImageHolderClass" runat="server"  >
            <table cellpadding="0" cellspacing="0"  ><tr><td class="SelectedArticleTdClass"><a ><img runat="server" id="articleimage"  /></a></td></tr></table>
        </div>
        <div  runat="server" class="SelectedArticleNameClass" id="ArticleNameDiv" ></div>
        <div runat="server" class="SelectedArticleSubTitleClass" id="ArticleSubTitleDiv" ></div>
        <div  runat="server" class="SelectedArticleDateClass" id="ArticleDateDiv" ></div>
        <div  runat="server" class="SelectedArticleContentClass" id="ArticleContentDiv" ></div>
         <a class="ArtilceGoBack2Class" href='<%= PageURL.ToString().Replace( "&article="+Request.QueryString["article"],"").Replace( "?article="+Request.QueryString["article"],"") %>' ><%= GoBackLinkText %></a>
    </div>
    
    </asp:Panel>
 </div>

 