<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="ManageGeneralText.aspx.cs" ValidateRequest="false" Inherits="admin_ManageGeneralText" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<%--<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>--%>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">

<asp:ScriptManager runat="server"></asp:ScriptManager>

    <br />
	  <asp:HyperLink CssClass="backLinkClass"  runat="server" ID="backLink" >חזור</asp:HyperLink>
	<div runat="server" id="titleDiv" class="titleSpan">
		טקסטים\כותרות
	</div>
    <div class="RemarkHolder" >הערה:השינויים ישפיעו על כל הדפים. </div>
    <div class="tableTabDivHolder">
    <div runat="server" id="pageName" class="tableTabDiv tableTabDivSel" onclick="showpage(this)" >page 1</div>
    <div class="tableTabDiv" onclick="showgeneral(this)" >כללי</div>
    </div>
	 <div id="pagediv" style="width:100%;">
		
		<br />
		<asp:UpdatePanel ID="updatePanel1" runat="server">
			<ContentTemplate>
				<div style="width:840px; margin:auto">
				<asp:SqlDataSource ID="GenParametersDataSource" runat="server" 
					ConnectionString='<%$ connectionStrings:ConnectionString1.connectionString %>' 
                    ProviderName='<%$ ConnectionStrings:ConnectionString1.providerName %>'
					SelectCommand="SELECT * FROM generaltexts" 
					UpdateCommand="UPDATE generaltexts SET genContent=@genContent WHERE genID=@genID">
					<UpdateParameters>
						<asp:Parameter Name="genContent" Type="String" />
						<asp:Parameter Name="genID" Type="Int32" />
					</UpdateParameters>
				</asp:SqlDataSource>
								
				<asp:GridView ID="GenParametersGrid" runat="server" AutoGenerateColumns="False" DataKeyNames="genID"
					EnableViewState="true"
					CellPadding="0"
					GridLines="none"
					ShowFooter="True"
					DataSourceID="GenParametersDataSource"
					CssClass="Product2CatGrid" Width="840px">
					<HeaderStyle CssClass="resTH" BorderStyle="None" />
					<FooterStyle CssClass="resTF" />
					<AlternatingRowStyle CssClass="resTDuneven" />
					<RowStyle CssClass="resTDeven" />
					<Columns>
						<asp:TemplateField ItemStyle-CssClass="tableRight" HeaderStyle-HorizontalAlign="Right"><FooterTemplate><img src="images/tableButtomRight.gif" alt="" style="border:none" /></FooterTemplate><FooterStyle HorizontalAlign="Right" />
							<HeaderTemplate><img src="./images/tableTopRight.gif" alt="" style="border:none" /></HeaderTemplate>
							<HeaderStyle HorizontalAlign="Right" />
							<ItemStyle CssClass="tableRight"></ItemStyle>
						</asp:TemplateField>
						
						<asp:TemplateField HeaderText="שם הפרמטר" ItemStyle-Width="200"  >
							<ItemTemplate>
								<asp:Label ID="ParameterNameLbl" runat="server" CssClass="right" style="width:200px;" Text='<%# Eval("genName").ToString().Length>60? Eval("genName").ToString().Remove(60)+"..." : Eval("genName").ToString() %>'></asp:Label>
							</ItemTemplate>

						</asp:TemplateField>
						<asp:TemplateField HeaderText="ערך">
							<ItemTemplate>
								<%--<asp:Label ID="ParameterValueLbl" runat="server" CssClass="right" Text='<%# Eval("genContent").ToString().Contains("<")? "לחץ לעריכה" :  (Eval("genContent").ToString().Length>60? Eval("genContent").ToString().Remove(60)+"..." : Eval("genContent").ToString()) %>'></asp:Label>--%>
							</ItemTemplate>
							<ItemStyle HorizontalAlign="Center" Width="620px" />
							<EditItemTemplate>     
                            <asp:HiddenField runat="server" ID="typeHidden" Value='<%# Eval("genType").ToString()=="2" %>'   />                    
								<asp:TextBox ID="ParameterValuetext11"   Width="600" Height='<%# Eval("genType").ToString()=="3"? 30:400  %>' TextMode='<%# Eval("genType").ToString()=="3"? TextBoxMode.SingleLine:TextBoxMode.MultiLine  %>'    runat="server" ></asp:TextBox>
                               <asp:HiddenField runat="server"  OnPreRender="TextBox_PreRender" ID="ParameterValue" Value='<%# Bind("genContent") %>' />
							</EditItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField>
							<HeaderStyle CssClass="resTH" />
							<ItemTemplate>
								<asp:LinkButton ID="EditBtn" runat="server" CausesValidation="false" 
								 CommandName="Edit" 
								 ><img src="images/EditOff.gif" alt="ערוך" style="border:none" /></asp:LinkButton>
							</ItemTemplate>
							<ItemStyle Width="30px" />
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
						<asp:TemplateField ItemStyle-CssClass="tableLeft" HeaderStyle-HorizontalAlign="Left" HeaderImageUrl="~/admin/images/tableTopLeft.gif">
							<FooterTemplate><img src="images/tableButtomLeft.gif" alt="" style="border:none" /></FooterTemplate><FooterStyle HorizontalAlign="Left" />
							<HeaderStyle HorizontalAlign="Left" />
							<ItemStyle CssClass="tableLeft"></ItemStyle>
						</asp:TemplateField>
					</Columns>
                    <EmptyDataTemplate>
                        <div class="TopleftTable"><div class="TopRightTable"><div class="TopCenterTable"></div></div></div>
                        <div class="CenterleftTable"><div class="CenterRightTable"><div class="CenterCenterTable">אין הגדרות לדף זה</div></div></div>
                        <div class="BottomleftTable"><div class="BottomRightTable"><div class="BottomCenterTable"></div></div></div>
                    </EmptyDataTemplate>
				</asp:GridView>
			</div>
			</ContentTemplate>
		</asp:UpdatePanel>
	</div>




     <div  id="generaldiv" style="width:100%;display:none;">
		
		<br />
		<asp:UpdatePanel ID="updatePanel2" runat="server">
			<ContentTemplate>
				<div style="width:840px; margin:auto">
				<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
					ConnectionString='<%$ connectionStrings:ConnectionString1.connectionString %>' 
                    ProviderName='<%$ ConnectionStrings:ConnectionString1.providerName %>'
					SelectCommand="SELECT * FROM generaltexts where genPage=0"
					UpdateCommand="UPDATE generaltexts SET genContent=@genContent WHERE genID=@genID">
					<UpdateParameters>
						<asp:Parameter Name="genContent" Type="String" />
						<asp:Parameter Name="genID" Type="Int32" />
					</UpdateParameters>
				</asp:SqlDataSource>
								
				<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="genID"
					EnableViewState="true"
					CellPadding="0"
					GridLines="none"
					ShowFooter="True"
					DataSourceID="SqlDataSource1"
					CssClass="Product2CatGrid" Width="840px">
					<HeaderStyle CssClass="resTH" BorderStyle="None" />
					<FooterStyle CssClass="resTF" />
					<AlternatingRowStyle CssClass="resTDuneven" />
					<RowStyle CssClass="resTDeven" />
					<Columns>
						<asp:TemplateField ItemStyle-CssClass="tableRight" HeaderStyle-HorizontalAlign="Right"><FooterTemplate><img src="images/tableButtomRight.gif" alt="" style="border:none" /></FooterTemplate><FooterStyle HorizontalAlign="Right" />
							<HeaderTemplate><img src="./images/tableTopRight.gif" alt="" style="border:none" /></HeaderTemplate>
							<HeaderStyle HorizontalAlign="Right" />
							<ItemStyle CssClass="tableRight"></ItemStyle>
						</asp:TemplateField>
						
						<asp:TemplateField HeaderText="שם הפרמטר" ItemStyle-Width="200"  >
							<ItemTemplate>
								<asp:Label ID="ParameterNameLbl" runat="server" CssClass="right" style="width:200px;" Text='<%# Eval("genName").ToString().Length>60? Eval("genName").ToString().Remove(60)+"..." : Eval("genName").ToString() %>'></asp:Label>
							</ItemTemplate>

						</asp:TemplateField>
						<asp:TemplateField HeaderText="ערך">
							<ItemTemplate>
								<%--<asp:Label ID="ParameterValueLbl" runat="server" CssClass="right" Text='<%# Eval("genContent").ToString().Contains("<")? "לחץ לעריכה" :  (Eval("genContent").ToString().Length>60? Eval("genContent").ToString().Remove(60)+"..." : Eval("genContent").ToString()) %>'></asp:Label>--%>
							</ItemTemplate>
							<ItemStyle HorizontalAlign="Center" Width="620px" />
							<EditItemTemplate>     
                            <asp:HiddenField runat="server" ID="typeHidden" Value='<%# Eval("genType").ToString()=="2" %>'   />                    
								<asp:TextBox ID="ParameterValuetext11"   Width="600" Height='<%# Eval("genType").ToString()=="3"? 30:400  %>' TextMode='<%# Eval("genType").ToString()=="3"? TextBoxMode.SingleLine:TextBoxMode.MultiLine  %>'    runat="server" ></asp:TextBox>
                               <asp:HiddenField runat="server"  OnPreRender="TextBox_PreRender" ID="ParameterValue" Value='<%# Bind("genContent") %>' />
							</EditItemTemplate>
						</asp:TemplateField>
						<asp:TemplateField>
							<HeaderStyle CssClass="resTH" />
							<ItemTemplate>
								<asp:LinkButton ID="EditBtn" runat="server" CausesValidation="false" 
								 CommandName="Edit" 
								 ><img src="images/EditOff.gif" alt="ערוך" style="border:none" /></asp:LinkButton>
							</ItemTemplate>
							<ItemStyle Width="30px" />
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
						<asp:TemplateField ItemStyle-CssClass="tableLeft" HeaderStyle-HorizontalAlign="Left" HeaderImageUrl="~/admin/images/tableTopLeft.gif">
							<FooterTemplate><img src="images/tableButtomLeft.gif" alt="" style="border:none" /></FooterTemplate><FooterStyle HorizontalAlign="Left" />
							<HeaderStyle HorizontalAlign="Left" />
							<ItemStyle CssClass="tableLeft"></ItemStyle>
						</asp:TemplateField>
					</Columns>
				</asp:GridView>
			</div>
			</ContentTemplate>
		</asp:UpdatePanel>
	</div>

    <script type="text/javascript">
       function showpage(sender) {
           $('.tableTabDiv').removeClass('tableTabDivSel');
           $(sender).addClass('tableTabDivSel');        
            $('#generaldiv').hide();
            $('#pagediv').show();
            $('.RemarkHolder').css('color', '#ffffff')

        }
        function showgeneral(sender) {
            $('.tableTabDiv').removeClass('tableTabDivSel');
            $(sender).addClass('tableTabDivSel');       
            $('#generaldiv').show();
            $('#pagediv').hide();
            $('.RemarkHolder').css('color','red')
          

        }
        
    </script>
</asp:Content>

