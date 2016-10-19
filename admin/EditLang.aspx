<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="EditLang.aspx.cs" Inherits="admin_EditLang" ValidateRequest="false" %>
<%@ Register Src="~/admin/FormViewControl3.ascx" TagName="FormViewControl" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">


<asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
  <cmsr:MyForm runat="server" DataKeyField="langid"  OnItemInserted="AddLang"  HasOrder="true" OrderField="langOrder"   TableName="langsite" Header="ניהול שפות" CssClass="FromViowHolder"  ID="MyForm1"   >
    <MessageTemplate>
       
        <cmsr:MyTextBox CssClass="ManageTextBoxHolderDivClass" DataFieldType="String" RequiredFielderrorMessage="הכנס שם" IsRequiredFieldValidator="true"   runat="server" ID="LangNameTextBox" DataFieldName="langname" FieldName="שם שפה" />
        <cmsr:MyTextBox CssClass="ManageTextBoxHolderDivClassLeft" RegularExpressionErrorMessage="הקוד באנגלית 3-5 אותיות" ValidationExpression="[a-z]{3,5}"  RequiredFielderrorMessage="ההכנס קוד" DataFieldType="String"   runat="server" ID="CodeTextBox" DataFieldName="langcode" FieldName="קוד באנגלית" />
         <cmsr:MyDropDown FieldName="כיוון"  DataFieldName="langdir" DataFieldType="String" runat="server" ID="DirMyDropDown1" >
            <ListItems>
                <asp:ListItem Value="RTL"  Text="RTL" ></asp:ListItem>
               <asp:ListItem Value="LTR"  Text="LTR" ></asp:ListItem>
            </ListItems>
         </cmsr:MyDropDown> 
         <div class="linedivclass"><div style="float:right;width:200px;">הצג שפה:</div>      
     <cmsr:MyRadioButton CssClass="RadioButtonHolderObjClass"  ID="MyRadioButton5" DataFieldType="Bool" DataFieldName="showlang" FieldName="כן|true,לא|false" runat="server" />
     </div>
       <cmsr:MyHiddenField ID="SiteIDMyHiddenField"  runat="server" DataFieldType="Number" DataFieldName="ISDel" Value="True"  />
            
    </MessageTemplate>
</cmsr:MyForm>   

</asp:Content>

