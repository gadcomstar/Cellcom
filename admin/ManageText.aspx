<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="ManageText.aspx.cs" Inherits="Admin_ManageText" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
		<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">


	<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
	<div style="width:100%;">
			<span class="titleSpan">ניהול איזורי טקסט</span>
			<br />
					
			<asp:AccessDataSource ID="PlaceHolderDataSource" runat="server" 
						DataFile='<%$ connectionStrings:ConnectionString1.connectionString %>' 
						SelectCommand="SELECT * FROM placeholders" 
						UpdateCommand="UPDATE placeholders SET PlaceHolderText=? WHERE PlaceHolderID=?"
						>
						<UpdateParameters>
							<asp:Parameter Name="PlaceHolderText" Type="String" />
							<asp:Parameter Name="PlaceHolderID" Type="Int32" />
						</UpdateParameters>
						<DeleteParameters>
							<asp:Parameter Name="PlaceHolderID" Type="Int32" />
						</DeleteParameters>
						</asp:AccessDataSource>
		
		<asp:GridView ID="ContactGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="PlaceHolderID"
			EnableViewState="true"
			CellPadding="0"
			GridLines="None"
			ShowFooter="True"
			DataSourceID="PlaceHolderDataSource"
			CssClass="Product2CatGrid" Width="800px">
			<HeaderStyle CssClass="resTH" BorderStyle="None" />
			<FooterStyle CssClass="resTF" />
			<AlternatingRowStyle CssClass="resTDuneven" />
			<RowStyle CssClass="resTDeven" />
			<Columns>
				<asp:TemplateField ItemStyle-CssClass="tableRight" HeaderStyle-HorizontalAlign="Right"><FooterTemplate><img src="images/tableButtomRight.gif" alt="" style="border:none" /></FooterTemplate><FooterStyle HorizontalAlign="Right" />
					<HeaderTemplate><img src="./images/tableTopRight.gif" alt="" style="border:none" /></HeaderTemplate>
					<ItemStyle CssClass="tableRight"></ItemStyle>
				</asp:TemplateField>
				
				<asp:TemplateField>
					<ItemTemplate>
						<asp:Label runat="server" Font-Bold="true" Text='<%# Eval("PlaceHolderName").ToString().Length>60? Eval("PlaceHolderName").ToString().Remove(60)+"..." : Eval("PlaceHolderName").ToString() %>'></asp:Label>
					</ItemTemplate>
					<ItemStyle HorizontalAlign="Right" Width="170" />
				</asp:TemplateField>
				<asp:TemplateField>
					<ItemTemplate>
						<asp:Label ID="Label1" runat="server" Text="ערוך בכדי לצפות"></asp:Label>
					</ItemTemplate>
					<EditItemTemplate>
						<asp:TextBox TextMode="MultiLine" Width="500" Height="300" OnPreRender="TextBox_PreRender" ID="PlaceHolderText" runat="server" Text='<%# Bind("PlaceHolderText")%>'></asp:TextBox>
					</EditItemTemplate>
				</asp:TemplateField>
				<asp:TemplateField>
					<ItemTemplate>
						<asp:ImageButton runat="server" CommandName="Edit" ToolTip="ערוך" ImageUrl="~/Admin/images/EditOff.gif" />
					</ItemTemplate>
					<EditItemTemplate>
						<asp:ImageButton runat="server" CommandName="Update" ToolTip="שמור" ImageUrl="~/Admin/images/SelectOn.gif" />
						<asp:ImageButton runat="server" CommandName="Cancel" ToolTip="בטל" ImageUrl="~/Admin/images/DelOn.gif" />
					</EditItemTemplate>
				</asp:TemplateField>
				
				
				<asp:TemplateField ItemStyle-CssClass="tableLeft" HeaderStyle-HorizontalAlign="Left" HeaderImageUrl="~/admin/images/tableTopLeft.gif">
					<FooterTemplate><img src="images/tableButtomLeft.gif" alt="" style="border:none" /></FooterTemplate><FooterStyle HorizontalAlign="Left" />
					<ItemStyle CssClass="tableLeft"></ItemStyle>
				</asp:TemplateField>
			</Columns>
		</asp:GridView>
		
	</div>

</asp:Content>

