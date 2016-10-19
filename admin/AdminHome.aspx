<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="AdminHome.aspx.cs" Inherits="admin_AdminHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">

    <asp:Repeater runat="server" ID="MyAdminHeaderRepeater" >
        <ItemTemplate>
            <div style="float:right;width:270px;">
             <div class="DragCatBoxSurround"> 
                 <a  href='<%# cmstrDefualts.AddQueryFieldToUrl(Eval("catLink").ToString(),"cat", Eval("catID").ToString()) %>' class="DragCategoriesBoxHolder"><%# Eval("catText") %></a>
                 <asp:HiddenField runat="server" ID="CatIdHiddenField" Value='<%# Eval("catID") %>' />
                 <div style="width:100%;height:160px;overflow-x:hidden;overflow-y:auto;">
             <asp:Repeater OnPreRender="MyAdminHeaderRepeater_PreRender"  runat="server" ID="MyAdminHeaderRepeater" >
                <ItemTemplate>
                    <a  href='<%# cmstrDefualts.AddQueryFieldToUrl(  cmstrDefualts.AddQueryFieldToUrl(Eval("catLink").ToString(),"cat", Eval("catParentToShow").ToString()),"sub",Eval("CatID").ToString())   %>' class="DragSubegoriesBoxHolder"><%# Eval("catText") %></a>
                </ItemTemplate>
            </asp:Repeater>
                     </div>
             </div>
                </div>
        </ItemTemplate>
    </asp:Repeater>
     <asp:Repeater runat="server" ID="MyAdminHeaderRepeater2" >
        <ItemTemplate>
              <div class="DragCatBoxSurround" style="width:240px;height:80px;">  <a  href='<%# cmstrDefualts.AddQueryFieldToUrl(  cmstrDefualts.AddQueryFieldToUrl(Eval("catLink").ToString(),"cat", Eval("catParentToShow").ToString()),"sub",Eval("CatID").ToString()) %>' class="DragCategoriesBoxHolder"><%# Eval("catText") %></a></div>
            </ItemTemplate>
    </asp:Repeater>



</asp:Content>

