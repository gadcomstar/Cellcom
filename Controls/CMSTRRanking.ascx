<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CMSTRRanking.ascx.cs" Inherits="Controls_CMSTRRanking" %>
<div class='<%= CssClass %>'>
<div class="rankingFieldNameClass"><asp:Literal runat="server" ID="FieldNameLiteral" ></asp:Literal> </div>
<asp:Repeater runat="server" ID="RankingRepeater" >
<ItemTemplate>
    <div id='<%# "mynum"+rankingHiddenField.ClientID+Eval("Number").ToString() %>'onmouseout='<%# "mouseunmarkit"+rankingHiddenField.ClientID+"()"  %>'  onmouseover='<%# "mousemarkit"+rankingHiddenField.ClientID+"("+ Eval("Number").ToString() +")" %>' onclick='<%# "markit"+rankingHiddenField.ClientID+"("+ Eval("Number").ToString() +")" %>'  class='<%# SelectedValue>= int.Parse(Eval("Number").ToString()) ?"RankingNumClass RankingNumClassSel":"RankingNumClass"  %>' ><%# Eval("Number") %></div>
</ItemTemplate>
</asp:Repeater>
<asp:HiddenField runat="server" ID="rankingHiddenField"  />
</div>