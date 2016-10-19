<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/admin.master" AutoEventWireup="true" CodeFile="ManageParameters.aspx.cs" ValidateRequest="false" Inherits="Admin_ManageParameters" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">

	<asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
	<div style="width:100%;">
        <br />
		<span class="titleSpan">SEO Data</span>
		<br />
		<asp:UpdatePanel ID="updatePanel1" runat="server">
			<ContentTemplate>
				<div style="width:800px; margin:auto">
				<asp:SqlDataSource ID="GenParametersDataSource" runat="server" 
					ConnectionString='<%$ connectionStrings:ConnectionString1.connectionString %>' 
                    ProviderName='<%$ ConnectionStrings:ConnectionString1.providerName %>'
					SelectCommand="SELECT * FROM genparameters" 
					UpdateCommand="UPDATE genparameters SET ParameterValue=@ParameterValue WHERE ParameterID=@ParameterID">

					<UpdateParameters>
						<asp:Parameter Name="ParameterValue" Type="String" />
						<asp:Parameter Name="ParameterID" Type="Int32" />
					</UpdateParameters>
				</asp:SqlDataSource>
								
				<asp:GridView ID="GenParametersGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="ParameterID"
					EnableViewState="true"
					CellPadding="0"
					GridLines="none"
					ShowFooter="True"
					DataSourceID="GenParametersDataSource"
					CssClass="Product2CatGrid" Width="800px">
					<HeaderStyle CssClass="resTH" BorderStyle="None" />
					<FooterStyle CssClass="resTF" />
					<AlternatingRowStyle CssClass="resTDuneven" />
					<RowStyle CssClass="resTDeven" />
					<Columns>
						<asp:TemplateField ItemStyle-CssClass="tableLeft" HeaderStyle-HorizontalAlign="Left"><FooterTemplate><img src="images/tableButtomLeft.gif" alt="" style="border:none" /></FooterTemplate><FooterStyle HorizontalAlign="Left" />
							<HeaderTemplate><img src="./images/tableTopLeft.gif" alt="" style="border:none" /></HeaderTemplate>
							<HeaderStyle HorizontalAlign="Left" />
							<ItemStyle CssClass="tableLeft"></ItemStyle>
						</asp:TemplateField>
						
						<asp:TemplateField HeaderText="שם הפרמטר" >
							<ItemTemplate>
								<asp:Label ID="ParameterNameLbl" runat="server" CssClass="right" Text='<%# Eval("ParameterName").ToString().Length>60? Eval("ParameterName").ToString().Remove(60)+"..." : Eval("ParameterName").ToString() %>'></asp:Label>
							</ItemTemplate>
						</asp:TemplateField>
						
						<asp:TemplateField HeaderText="ערך">
							<ItemTemplate>
								<asp:Label ID="ParameterValueLbl" runat="server" CssClass="right" Text='<%# Eval("ParameterValue").ToString().Contains("<")? "לחץ לעריכה" :  (Eval("ParameterValue").ToString().Length>60? Eval("ParameterValue").ToString().Remove(60)+"..." : Eval("ParameterValue").ToString()) %>'></asp:Label>
							</ItemTemplate>
							<ItemStyle HorizontalAlign="Center" Width="200px" />
							<EditItemTemplate>
								<asp:TextBox ID="ParameterValue" Columns="48" Rows="8" TextMode="MultiLine"  runat="server" Text='<%# Bind("ParameterValue") %>'></asp:TextBox>
							</EditItemTemplate>
						</asp:TemplateField>
						
						<asp:TemplateField>
							<HeaderStyle CssClass="resTH" />
							<ItemTemplate>
								<asp:LinkButton ID="EditBtn" runat="server" CausesValidation="false" 
								 CommandName="Edit" 
								 ><img src="images/EditOff.gif" alt="ערוך" style="border:none" /></asp:LinkButton>
							</ItemTemplate>
							<ItemStyle Width="60px" />
							<EditItemTemplate>
								<asp:LinkButton ID="EditBtn" runat="server"
								 CommandName="Update" 
								 ><img src="images/SelectOn.gif" alt="שמור" style="border:none" /></asp:LinkButton>
								 <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="false" 
								 CommandName="Cancel" 
								 ><img src="images/DelOn.gif" alt="בטל" style="border:none" /></asp:LinkButton>
							</EditItemTemplate>
							<ItemStyle HorizontalAlign="Right" />
						</asp:TemplateField>
						
						<asp:TemplateField ItemStyle-CssClass="tableLeft" HeaderStyle-HorizontalAlign="Right" HeaderImageUrl="~/admin/images/tableTopRight.gif">
							<FooterTemplate><img src="images/tableButtomRight.gif" alt="" style="border:none" /></FooterTemplate><FooterStyle HorizontalAlign="Right" />
							<HeaderStyle HorizontalAlign="Right" />
							<ItemStyle CssClass="tableRight"></ItemStyle>
						</asp:TemplateField>
					</Columns>
				</asp:GridView>
			</div>
			</ContentTemplate>
		</asp:UpdatePanel>
	</div>
	<asp:Label runat="server" ID="ErrMsg"></asp:Label>
	

</asp:Content>

