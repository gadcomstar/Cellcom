<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="FacebookAdmin.aspx.cs" Inherits="admin_FacebookAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">
    <asp:ScriptManager runat="server" />
    <asp:Panel runat="server" ID="Panel_FB">
        <div style="border: 1px solid black; border-radius: 5px; background-color: blue; padding: 5px 10px; color: white; width: 150px;"
            onclick="window.open('<%= siteDefaults.FbRedirectUrlAdmin%>', 'fbLogin', 'width=600, height=500'); return false;">
            FB Connect
        </div>

        <%--<asp:TextBox runat="server" ID="TokenTBox" CssClass="TokenLabel" />--%>
        <%--<asp:Button Text="ClickToGetPages" runat="server" ID="ClickToGetPages" OnClick="ClickToGetPages_Click" />--%>
        <br />

        <%--<asp:TextBox runat="server" ID="TextToPost" TextMode="MultiLine" />--%>


        <asp:UpdatePanel runat="server" ID="PagesList">
            <ContentTemplate>
                <asp:RadioButtonList runat="server" ID="FacebookPagesList">
                </asp:RadioButtonList>
                <asp:Button Text="" runat="server" CssClass="UPBtn" OnClick="ClickToGetPages_Click" Style="display: none" />
            </ContentTemplate>
        </asp:UpdatePanel>
        <asp:Button Text="Save Page" runat="server" ID="PublishPost" OnClick="PublishPost_Click" CssClass="PublishPost" />
    </asp:Panel>
    <asp:Panel runat="server">
        <asp:Label Text="" ID="lbl_status" runat="server" ForeColor="red" />
    </asp:Panel>
    <script type="text/javascript">
        function socialLoginAdmin(userToken) {
            //$('.TokenLabel').val(userToken);
            $('.UPBtn').click();

        }
    </script>
</asp:Content>

