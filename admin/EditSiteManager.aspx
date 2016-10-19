<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="EditSiteManager.aspx.cs" Inherits="admin_EditSiteManager" ValidateRequest="false" %>
<%@ Register Src="~/admin/FormViewControl3.ascx" TagName="FormViewControl" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">

<asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
  <cmsr:MyForm runat="server" DataKeyField="ManID"  BackButtonText="back" SaveButtonText="save" SaveReturnText="Save & Close"  TableName="adminmanagers" Header="Edit Admin manager" CssClass="AdminMyForm"  ID="MyForm1"   >
    <MessageTemplate>
        <div class="minititleclass">Manager details</div>
        <cmsr:MyTextBox CssClass="ManageTextBoxHolderDivClassLeft" DataFieldType="String" RequiredFielderrorMessage="enter name" IsRequiredFieldValidator="true"   runat="server" ID="UserNameMyTextBox" DataFieldName="ManUN" FieldName="User name" />
        <cmsr:MyTextBox CssClass="ManageTextBoxHolderDivClassLeft" OnLoad="PasswordMyTextBox1_PreRender"  RequiredFielderrorMessage="enter password" DataFieldType="String"  TextMode="Password"  runat="server" ID="PasswordMyTextBox1" DataFieldName="ManPass" FieldName="Password" />
         <cmsr:MyTextBox CssClass="ManageTextBoxHolderDivClassLeft" DataFieldType="String"  runat="server" ID="EmailMyTextBox" DataFieldName="manageremail" FieldName="e-mail" />
      
        <%--<cmsr:MyHiddenField  DataFieldType="Number" runat="server" ID="SecMyHiddenField" DataFieldName="secLevel" Value="4" />--%>
       <cmsr:MyDropDown FieldName="Manger Type"  DataFieldType="Number" DataFieldName="secLevel" runat="server" ID="SecMyDropDown"></cmsr:MyDropDown>
            
             
    </MessageTemplate>
</cmsr:MyForm>   


</asp:Content>

