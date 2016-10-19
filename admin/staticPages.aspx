<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="staticPages.aspx.cs" Inherits="Admin_staticPages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">
<form id="Form1" runat="server">
	<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
	<div style="width:100%;">
		<asp:UpdatePanel ID="updatePanel1" runat="server">
			<ContentTemplate>
				<div><span class="titleSpan">ניהול דפי מידע</span></div>
				
				<asp:AccessDataSource ID="StaticPagesDataSource" runat="server" 
						DataFile='<%$ connectionStrings:ConnectionString1.connectionString %>' 
						SelectCommand="SELECT * FROM textpages ORDER BY TextPageOrder" 
						>
						</asp:AccessDataSource>
						
				<div style="width:95%; direction:rtl; text-align:right">
				<asp:GridView ID="PagesGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="TextPageID"
			EnableViewState="true"
			CellPadding="0"
			GridLines="None"
			ShowFooter="True"
			DataSourceID="StaticPagesDataSource"
			CssClass="Product2CatGrid" Width="500px">
			<HeaderStyle CssClass="resTH" BorderStyle="None" />
			<FooterStyle CssClass="resTF" />
			<AlternatingRowStyle CssClass="resTDuneven" />
			<RowStyle CssClass="resTDeven" />
			<Columns>
				<asp:TemplateField ItemStyle-CssClass="tableRight" HeaderStyle-HorizontalAlign="Right"><FooterTemplate><img src="images/tableButtomRight.gif" alt="" style="border:none" /></FooterTemplate><FooterStyle HorizontalAlign="Right" />
					
					<HeaderTemplate><img src="./images/tableTopRight.gif" alt="" style="border:none" /></HeaderTemplate>
					<ItemStyle CssClass="tableRight"></ItemStyle>
				</asp:TemplateField>
				
				<asp:TemplateField HeaderText="שם הדף">
					<ItemTemplate>
						<asp:Label ID="Label1" runat="server" Font-Bold="true" Text='<%# Eval("TextPageName").ToString().Length>60? Eval("TextPageName").ToString().Remove(60)+"..." : Eval("TextPageName").ToString() %>'></asp:Label>
					</ItemTemplate>					
				</asp:TemplateField>

				<asp:TemplateField HeaderText="ערוך">
					<ItemTemplate>
						<div style="text-align:left"><asp:HyperLink ID="ImageButton1" runat="server" ToolTip="ערוך" ImageUrl="~/Admin/images/EditOff.gif" NavigateUrl='<%# string.Format("EditStatic.aspx?PageID={0}&cat={1}&sub={2}",Eval("TextPageID"), Request["cat"],Request["sub"]) %>' /></div>
					</ItemTemplate>
				</asp:TemplateField>
				
				<asp:TemplateField ItemStyle-CssClass="tableLeft" HeaderStyle-HorizontalAlign="Left" HeaderImageUrl="~/admin/images/tableTopLeft.gif">
					<FooterTemplate><img src="images/tableButtomLeft.gif" alt="" style="border:none" /></FooterTemplate><FooterStyle HorizontalAlign="Left" />
					<ItemStyle CssClass="tableLeft"></ItemStyle>
				</asp:TemplateField>
			</Columns>
		</asp:GridView>
				
			</ContentTemplate>
		</asp:UpdatePanel>
	</div>
</form>
</asp:Content>

