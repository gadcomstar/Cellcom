<%@ Control Language="C#" AutoEventWireup="true" CodeFile="tableControl.ascx.cs" Inherits="tableControl" EnableViewState="false" %>
	<asp:Literal runat="server" Text="" ID="CheckImg"></asp:Literal>
	<script language="javascript" type="text/javascript">
	    var focusSearch = false;
	    function checkAll(tableControl) {
	        var AllHiddens = document.getElementById(tableControl + '_MainUP').getElementsByTagName("input");
	        document.getElementById('checkAllBtn' + tableControl).style.display = 'none';
	        document.getElementById('uncheckAllBtn' + tableControl).style.display = '';
	        for (i = 0; i < AllHiddens.length; i++) {
	            if (AllHiddens[i].id != null) {
	                if (AllHiddens[i].id.indexOf('$Check') != -1) {
	                    AllHiddens[i].value = 1;
	                    document.getElementById(AllHiddens[i].id + "_img").src = eval('CheckAllImg' + tableControl);
	                }
	            }
	        }
	        showSelAllPages(tableControl);
	    }
	    var t;

	    function key(e) { return e ? e.which : event.keyCode; }

	    function uncheckAll(tableControl) {
	        var AllHiddens = document.getElementById(tableControl + '_MainUP').getElementsByTagName("input");
	        document.getElementById('checkAllBtn' + tableControl).style.display = '';
	        document.getElementById('uncheckAllBtn' + tableControl).style.display = 'none';
	        for (i = 0; i < AllHiddens.length; i++) {
	            if (AllHiddens[i].id != null) {
	                if (AllHiddens[i].id.indexOf('$Check') != -1) {
	                    AllHiddens[i].value = 0;
	                    document.getElementById(AllHiddens[i].id + "_img").src = "images/SelectOff.png";
	                }
	            }
	        }

	        hideSelAllPages(tableControl)
	    }

	    function ShowHide(what, sender) {
	        var AllTables = document.getElementsByTagName('table');
	        for (var i = 0; i < AllTables.length; i++) {
	            var table = AllTables[i];
	            if (table.id.indexOf('tblUserCats') != -1) {
	                table.style.display = 'none'
	            }
	        }
	        document.getElementById(what).style.display = 'block'

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


	    function opendiv(sender) {
	        $('.cleartable').css('display', 'block');
	        $('.iframeClass')[0].contentWindow.$('#editiframediv').css('display', 'none');
	        $('.iframeClass')[0].contentWindow.$('.MisionsLiteraldiv').css('display', 'block');
	        if ($(sender).next().css('height') == '0px') {
	            $('.framopen').css('height', '0px');
	            $(sender).next().css('height', 'auto');
	        } else {
	            $(sender).next().css('height', '0px');
	        }
	    }

	    //Sys.WebForms.PageRequestManager.getInstance().add_beginRequest(BeginRequestHandler);
	    //Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);

	    function BeginRequestHandler(sender, args) {
	        window.onbeforeunload = function (e) {
	            e = e || window.event;

	            // For IE and Firefox prior to version 4
	            if (e) {
	                e.returnValue = "The page is still processing your request, Are you sure you want to leave?";
	            }

	            // For Safari
	            return "The page is still processing your request, Are you sure you want to leave?";
	        }

	    }

	    function EndRequestHandler(sender, args) {
	        window.onbeforeunload = function () { }
	        args.errorHandled = true;
	    }

	</script>
	<div style="position:relative;">
	<asp:Panel  ID="SearchPanel" runat="server" DefaultButton="SearchBtn">
						<table cellpadding="0" cellspacing="0"><tr>
							<td>&nbsp;<asp:Literal ID="Literal4" runat="server" Text="<%$ Languages2:General_Filtering %>"></asp:Literal>:&nbsp;&nbsp;&nbsp;</td>
							<td class="textbox"><asp:TextBox runat="server" CssClass="textbox" ID="SrchBox"></asp:TextBox><img src="images/clearTextBtn.png" class="ClearSrch" style="display:none" id="ClearSrch" alt="<%$ Languages2:General_Clear Filter_נקה סינון %>" title="<%$ Languages2:General_Clear Filter_נקה סינון %>" runat="server" /><div class="AdvSerachIndicator" style="display:none">&nbsp;&nbsp;** <asp:Literal ID="Literal1" runat="server" Text="<%$ Languages2:General_Advanced Filtering%>"></asp:Literal> **</div></td>
							<td>
							<asp:HiddenField runat="server" ID="isSerahching" Value="0" />
								&nbsp; <span runat="server" class="bannerSelected ltrLeft" id="SearchBtnNew" ><asp:Literal ID="Literal2" runat="server" Text="<%$ Languages2:General_Filter %>" ></asp:Literal></span>
								<asp:UpdatePanel RenderMode="Inline" runat="server" ID="AdvSearchPanel">
									<ContentTemplate>
										<asp:Literal runat="server" ID="AdvSearchOpenLit"> / </asp:Literal><asp:LinkButton runat="server" ID="AdvSearchOpen" OnCommand="AdvSearchOpen_Click" CssClass="bannerSelected ltrLeft"><asp:Literal ID="Literal5" runat="server" Text="<%$ Languages2:General_Advanced Filtering%>"></asp:Literal></asp:LinkButton>
									</ContentTemplate>
								</asp:UpdatePanel>
							</td>
						</tr></table>
						</asp:Panel>
	<asp:UpdatePanel  runat="server" ID="MainUP">
		<ContentTemplate>
        <asp:LinkButton style="display:none;" runat="server" CssClass="bannerSelected ltrLeft" ID="SearchBtn" OnClick="SearchBtn_Click" Text="<%$ Languages2:General_Filter %>"></asp:LinkButton>
			<asp:HiddenField runat="server" ID="AdvSearchOpenHid" />
			<asp:Label ID="ErrorMsg" runat="server"></asp:Label>
			<table class="ltrLeft" style="margin:auto" cellpadding="0" cellspacing="0">
				<tr>
					<td colspan="4" style="text-align:center">
						<span class="titleSpan"><asp:Literal ID="TableTitleLit" runat="server"></asp:Literal></span>
					</td>
				</tr>
				<tr>
					<td class="ltrLeft" >
						<div  runat="server" id="AddButtonRightdiv" class="AddButtonRightclass">
                            <div class="AddButtonLeftclass">
                                <asp:HyperLink Text="<%$ Languages2:General_Add %>" runat="server" CssClass="AddButtonClass" ID="AddHyperLink">
							        <%--<asp:Image ID="Img1" ImageUrl="<%$ Languages2:General_Add Image%>" AlternateText="<%$ Languages2:General_Add %>" runat="server" />--%>
						        </asp:HyperLink>&nbsp;
                            
                            </div>
                        
                        
                        </div>
					</td>
					<td class="ltrLeft">
						<div id="MaxResDiv" runat="server">
						<asp:Label ID="Label1" runat="server" Text="<%$ Languages2:General_Show %>"></asp:Label>:
						<asp:DropDownList runat="server" ID="MaxResText" EnableViewState="true" OnSelectedIndexChanged="MaxResText_SelectedIndexChanged" AutoPostBack="true">
							<asp:ListItem Value="5">5</asp:ListItem>
							<asp:ListItem Value="10">10</asp:ListItem>
							<asp:ListItem Value="20">20</asp:ListItem>
							<asp:ListItem Value="50">50</asp:ListItem>
						</asp:DropDownList>
						</div>
					</td>
					<td style="width:480px;height:40px;">
						<table cellpadding="0" cellspacing="0"><tr>
                        </tr></table>
					</td>
					<td style="text-align:left">
						<asp:LinkButton OnClick="exportToXls" ID="exportToXlsBtn" runat="server"><img src="images/ExportXls.gif" alt="" style="border:none" onmouseover="this.src='images/ExportXlsOver.gif'" onmouseout="this.src='images/ExportXls.gif'" /></asp:LinkButton>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<asp:HiddenField runat="server" ID="SelAllHid" Value="false" />
							<div style="margin:auto; width:500px; background-color:#f2f2f2 ;font-weight:bold;display:<% =SelAllHid.Value =="half" ? "block" : "none" %>" id="SelAllPagesDiv<%= controlID %>"><asp:Literal ID="Literal3"  runat="server" Text="<%$ Languages2:General_All the lines in this page were selected%>"></asp:Literal>. <a href="javascript:void(0)" onclick="MarkAllPages('<%= controlID %>')" class="bannerSelected ltrLeft"><asp:Literal ID="Literal6" runat="server" Text="<%$ Languages2:General_Click Here %>"></asp:Literal></a> <asp:Literal ID="Literal7" runat="server" Text="<%$ Languages2:General_to select everything in all the pages %>"></asp:Literal>.</div>
							<div style="margin:auto; width:500px; background-color:#f2f2f2 ;font-weight:bold;display:<% =SelAllHid.Value =="true" ? "block" : "none" %>" id="SelAllChecked<%= controlID %>"><asp:Literal ID="Literal8"  runat="server" Text="<%$ Languages2:General_All lines have ben selected. To unmark them %>"></asp:Literal>, <a href="javascript:void(0)" onclick="unMarkAllPages('<%= controlID %>');uncheckAll('<% = controlID %>');" class="bannerSelected ltrLeft"><asp:Literal ID="Literal9"  runat="server" Text="<%$ Languages2:General_Click Here%>"></asp:Literal></a></div>
					</td>
				</tr>
				<tr>
					<td colspan="4">
						<asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout="true" AssociatedUpdatePanelID="MainUP" DisplayAfter="0">
							<ProgressTemplate>
								<div style="position:fixed; margin:250px auto auto auto; text-align:center; width:100%; left:0px">
									<div style="width:280px; height:60px; margin:auto; padding-top:30px; border:solid 1px #0e67a5; background-color:#ffffff;">
										<img id="Img1" runat="server" src="images/ajax-long.gif" alt="<%$ Languages2:General_Loading...%>" style="position:relative; z-index:1000;margin:auto; text-align:center" />
									</div>
								</div>
							</ProgressTemplate>
						</asp:UpdateProgress>
						<table id="AdvSearchTable" class="ltrLeft" cellpadding="0" cellspacing="0" style="margin:auto; width:700px; position:absolute; z-index:100; position:absolute; margin:-50px 50px" visible="false" runat="server">
							<tr>
								<td class="longLTCell"><div></div></td>
								<td style="height:7px;font-size:1px; background-image:url('images/longTopCell.gif'); background-repeat:repeat-x">&nbsp;</td>
								<td class="longRTCell"><div></div></td>
							</tr>
							<tr>
								<td class="longLeft"></td>
								<td style="background-color:#ffffff;height:500px;vertical-align:top; padding:5px">
									<div class="ltrLeft" style="width:100%;">
										<asp:LinkButton runat="server" OnCommand="HideAdvSearchBtn_Click" ID="HidePreviewBtn" CssClass="right"><asp:Image ID="Image2" ImageUrl="images/delete.gif" AlternateText="<%$ Languages2:General_Close %>" runat="server" /></asp:LinkButton>
									</div>
									<div style="width:100%; text-align:center"><span class="titleSpan"><asp:Literal ID="pageTitle" runat="server" Text="<%$ Languages2:General_Advanced Filtering%>"></asp:Literal></span></div><br />
									<asp:Table ID="Table2" runat="server" style="margin:auto; vertical-align:top" CellPadding="0" CellSpacing="0" Width="600px" Height="400px" >
										<asp:TableRow>
											<asp:TableCell>
												<asp:Table ID="Table3" runat="server" style="margin:auto; vertical-align:top" CellPadding="0" CellSpacing="0" Width="600px" Height="400px">
													<asp:TableRow ID="TableRow1" runat="server" CssClass="EnterTH">
														<asp:TableCell CssClass="EnterTableTopLeft"><div></div></asp:TableCell>
														<asp:TableCell VerticalAlign="Top">
															<asp:Table ID="TabsTable" runat="server" style="margin-left:auto; margin-right:auto;" CellPadding="0" CellSpacing="0">
																<asp:TableRow ID="TabsRow">
																	<asp:TableCell CssClass="EnterTableTopSelected" onclick="ShowHide('ctl00_main_ManageTable_tblUserCats1', this)"><div>&nbsp;&nbsp;<asp:Literal ID="Literal10" runat="server" Text="<%$ Languages2:General_General%>"></asp:Literal>&nbsp;&nbsp;</div></asp:TableCell>
																</asp:TableRow>
															</asp:Table>
														</asp:TableCell>
														<asp:TableCell CssClass="EnterTableTopRight"><div></div></asp:TableCell>
													</asp:TableRow>
													<asp:TableRow>
														<asp:TableCell CssClass="EnterTableRight"></asp:TableCell>
														<asp:TableCell VerticalAlign="Top">
															<asp:Table ID="tblUserCats1" runat="server" style="margin:10px auto; vertical-align:top" EnableViewState="true" CellPadding="5">
															</asp:Table>
														</asp:TableCell>
														<asp:TableCell CssClass="EnterTableLeft"></asp:TableCell>
													</asp:TableRow>
													<asp:TableRow ID="TableRow2" runat="server" CssClass="EnterTableBottomRow">
														<asp:TableCell CssClass="EnterTableBL"><div></div></asp:TableCell>
														<asp:TableCell style="font-size:1px;" CssClass="EnterTableBottomRow">&nbsp;</asp:TableCell>
														<asp:TableCell CssClass="EnterTableBL"><div></div></asp:TableCell>
													</asp:TableRow>
												</asp:Table>
												<asp:Button ID="FormViewBtn" runat="server" Text="<%$ Languages2:General_Filter %>" OnCommand="AdvSearch_Click" />
											</asp:TableCell>
										</asp:TableRow>
									</asp:Table>
								</td>
								<td class="longRight"></td>
							</tr>
							<tr>
								<td class="longLBCell"><div></div></td>
								<td style="height:7px;font-size:1px; background-image:url('images/longBottomCell.gif'); background-repeat:repeat-x">&nbsp;</td>
								<td class="longRBCell"><div></div></td>
							</tr>
						</table>
					</td>
				</tr>
				<tr>
					<td colspan="4">
								<asp:Panel runat="server" ID="mainpanel" style="overflow:auto;" width="850">
									<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
										ConnectionString='<%$ ConnectionStrings:ConnectionString1 %>'
										ProviderName='<%$ ConnectionStrings:ConnectionString1.providerName %>'
										OnSelected="SqlDataSource1_Selected"
										></asp:SqlDataSource>
									<asp:GridView runat="server" OnDataBinding="GridView1_DataBinding1" OnPreRender="GridView1_PreRender" OnDataBound="GridView1_DataBinding" DataSourceID="SqlDataSource1" PageSize="3" ID="GridView1" CssClass="ltrLeft" style="margin:auto auto auto auto" AllowSorting="true">
									</asp:GridView>
									
										<table id="PagingTable" style="width:100%;" dir="<%$ Languages2:General_DirectionLtr %>" cellpadding="0" cellspacing="0" runat="server">
											<tr style="background-image:url('images/foundBack.gif'); background-repeat:repeat-x">
												<td style="width:12px; height:39px"><img id="Img2" runat="server" src="<%$ Languages2:General_images/foundLeft.gif_images/foundRight.gif%>" /></td>
												<td style="min-width:50px" class="ltrLeft">
													<asp:LinkButton ID="PrevBtn" CssClass="bannerSelected ltrLeft" runat="server" CommandArgument="Prev" OnCommand="NextPrev_Command"><img id="Img3" runat="server" src="<%$ Languages2:general_Button Fwd %>" alt="" style="border:none" />&nbsp;<asp:Literal ID="Literal11" runat="server" Text="<%$ Languages2:General_Previous%>"></asp:Literal></asp:LinkButton>
												</td>
												<td>
													 <span style="color:#595959;">
														<asp:Literal ID="Literal12" runat="server" Text="<%$ Languages2:General_Page %>"></asp:Literal> 
                                                       
														<%--<asp:DropDownList runat="server" ID="PageNumDrop" EnableViewState="true" OnPreRender="PageNumDrop_PreRender" OnSelectedIndexChanged="PageNumDrop_SelectedIndexChaned" AutoPostBack="true"></asp:DropDownList> --%>
														<select onchange="PageChanged<%= guid.ToString() %>(this)">
															<%
																
																

																for (int i = 0; i < pageCont; i++)
																{
																	if (i == currentPageNum)
																	{%><option value="<% =i %>" selected="selected"><%=(i + 1)%></option><%}
																	else
																	{%><option value="<% =i %>"><%=(i + 1)%></option><%}
																}
															%>
														</select>
														<asp:Literal ID="Literal13" runat="server" Text="<%$ Languages2:general_Out Of %>"></asp:Literal> <%= pageCont%>
													</span>
												</td>
												<td style="min-width:50px" class="ltrRight">
													<asp:LinkButton ID="NextBtn" runat="server" CssClass="bannerSelected ltrLeft" CommandArgument="Next" OnCommand="NextPrev_Command"><asp:Literal ID="Literal14" runat="server" Text="<%$ Languages2:general_Next %>"></asp:Literal>&nbsp;<img id="Img4" runat="server" src="<%$ Languages2:general_Button Bwd %>" alt="" style="border:none" /></asp:LinkButton>
												</td>
												<td style="width:12px; height:39px"><img id="Img5" runat="server" src="<%$ Languages2:General_images/foundRight.gif_images/foundLeft.gif%>" /></td>
											</tr>
										</table>
									<div style="width:100%; text-align:center; font-size:14px;" class="titleSpan" runat="server" visible="false" id="NotFoundDiv">
										<asp:Literal runat="server" ID="NotFoundLit" Text="<%$ Languages2:general_No results were found %>"></asp:Literal>
									</div>
									<asp:HiddenField ID="SearchHid" Value="" runat="server" EnableViewState="true" />
									<asp:HiddenField ID="SortByHid" Value="" runat="server" EnableViewState="true" />
									<asp:HiddenField runat="server" ID="SelectedValsHid" />
									<asp:HiddenField runat="server" ID="AllValsHid" />
									<asp:HiddenField runat="server" ID="NewPageNumHid" />
									<asp:HiddenField runat="server" ID="NewerPageNumHid" />
									<asp:Button runat="server" ID="RePost" OnClick="RePost_Click" style="display:none" />
								</asp:Panel>
								
					</td>
				</tr>
			</table>
			 <br /><br /><br /><br />
			<div style="width:700px">
				<asp:Label runat="server" Visible="false" ID="ErrMsg" ></asp:Label>
			</div>
		</ContentTemplate>
	</asp:UpdatePanel>
	</div>
   
	
	
	