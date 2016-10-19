<%@ Control Language="C#" AutoEventWireup="true" CodeFile="~/admin/FormViewControl3.ascx.cs" Inherits="FormViewControl13" %>
	
	<script type="text/javascript" >

	    function ShowHide(what, sender) {
			var AllTables = document.getElementsByTagName('table');
			for (var i = 0; i < AllTables.length; i++) {
				var table = AllTables[i];
				if (table.id.indexOf('tblUserCats') != -1) {
					table.style.display = 'none'
				}
			}
			document.getElementById(what).style.display = 'block';
			
			var AllTds = document.getElementsByTagName('td');
			for (var i = 0; i < AllTds.length; i++) {
				var td = AllTds[i];
				if (td.className != null) {
					if (td.className.indexOf('EnterTableTopSelected') != -1) {
						td.className = 'EnterTableTop'
					}
				}
			}   
			sender.className = 'EnterTableTopSelected';
}


	</script>
     <script type="text/javascript">
//         function storeCoords(c) {
//             $('.xclass').val(c.x);
//             $('.yclass').val(c.y);
//             $('.wclass').val(c.w);
//             $('.hclass').val(c.h);
//         };
 
</script>
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
	<%--<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>--%>
	<script type="text/javascript" src="js/jquery.uploadify.js"></script> 
	<link rel="Stylesheet" type="text/css" href="js/uploadify.css" />
     <link href="Cropjs/css/jquery.Jcrop.css" rel="stylesheet" type="text/css" />
<script src="Cropjs/js/jquery.Jcrop.js" type="text/javascript"></script>
    <div>
     <input type="hidden" class="xclass" id="X" runat="server" />
      <input type="hidden" class="yclass" id="Y" runat="server" />
      <input type="hidden" class="wclass" id="W" runat="server" />
       <input type="hidden" class="hclass" id="H" runat="server" />   
			<asp:Panel runat="server" Direction="RightToLeft" style="margin:auto; width:100%; clear:both;">
				<span class="titleSpan"><asp:Literal ID="FormTitleLit" runat="server"></asp:Literal></span>
			<asp:Table runat="server" style="margin:auto" CellPadding="0" CellSpacing="0">
				<asp:TableRow>
					<asp:TableCell>
						<asp:Table runat="server" style="margin:auto;" CellPadding="0" CellSpacing="0">
							<asp:TableRow runat="server" CssClass="EnterTH">
								<asp:TableCell CssClass="EnterTableTopLeft"><div></div></asp:TableCell>
								<asp:TableCell>
									<asp:Table ID="TabsTable" runat="server" style="margin-left:auto; margin-right:auto;" CellPadding="0" CellSpacing="0">
										<asp:TableRow ID="TabsRow">
											<asp:TableCell CssClass="EnterTableTopSelected" ID="tblUserCats1Cell" runat="server"><div>&nbsp;&nbsp;<asp:Literal runat="server" Text="כללי"></asp:Literal>&nbsp;&nbsp;</div></asp:TableCell>
										</asp:TableRow>
									</asp:Table>
								</asp:TableCell>
								<asp:TableCell  CssClass="EnterTableTopRight"><div></div></asp:TableCell>
							</asp:TableRow>
							<asp:TableRow>
								<asp:TableCell CssClass="EnterTableRight"></asp:TableCell>
								<asp:TableCell>
									<asp:Table ID="tblUserCats1" runat="server" style="margin:auto">
									</asp:Table>
								</asp:TableCell>
								<asp:TableCell CssClass="EnterTableLeft"></asp:TableCell>
							</asp:TableRow>
							<asp:TableRow>
								<asp:TableCell CssClass="EnterTableRight"></asp:TableCell>
								<asp:TableCell>	
									<asp:Label runat="server" ForeColor="#ff0000" Font-Size="12px" Font-Bold="true" ID="ErrMsg"></asp:Label>
									<div style="width:280px; height:20px; margin:auto; margin-top:-24px; border:solid 1px #0e67a5; background-color:#ffffff; position:absolute; padding-top:3px; display:none; " id="progressBar">
										<img src="images/ajax-long.gif" alt="Loading..." style="position:relative; z-index:1000;margin:auto; text-align:center" />
									</div>
								</asp:TableCell>
								<asp:TableCell CssClass="EnterTableLeft"></asp:TableCell>
							</asp:TableRow>
							<asp:TableRow runat="server" CssClass="EnterTableBottomRow">
								<asp:TableCell CssClass="EnterTableBL"><div></div></asp:TableCell>
								<asp:TableCell style="font-size:1px;">&nbsp;</asp:TableCell>
								<asp:TableCell CssClass="EnterTableBR"><div></div></asp:TableCell>
							</asp:TableRow>
						</asp:Table>
					</asp:TableCell>
				</asp:TableRow>
			</asp:Table>
			
			
			
		</asp:Panel>
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		<asp:SqlDataSource ID="FormDataSource1" runat="server" 
		ConnectionString='<%$ ConnectionStrings:ConnectionString1 %>'
		ProviderName='<%$ ConnectionStrings:ConnectionString1.providerName %>'
		>
		</asp:SqlDataSource>
		
		
		<asp:FormView runat="server" ID="FormView1" DataSourceID="FormDataSource1" DefaultMode="Insert">
			
		</asp:FormView>
		
	
	
	
	
	
	
	
	
	
    </div>
