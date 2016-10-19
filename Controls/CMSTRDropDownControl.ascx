<%@ Control Language="C#" AutoEventWireup="true" CodeFile="CMSTRDropDownControl.ascx.cs" Inherits="CMSTRDropDownControl" %>
<div runat="server" id="TextBoxHolderDiv" >
    <div runat="server" id="DropText" class="LabelTextClass" ></div>
    <div class="DropDownCoverClass">
        <span  runat="server" class="UperBlockText" id="myspan"  ></span>
        <asp:HiddenField runat="server" ID="MyHiddenField"   />
        <asp:HiddenField runat="server" ID="MyHiddenFieldVlaue"   />
        <asp:DropDownList CssClass="MyDropDownClass"    OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"    runat="server" ID="MyDropDown" >       
        </asp:DropDownList>
    </div>
 </div>