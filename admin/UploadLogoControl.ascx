<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UploadLogoControl.ascx.cs" Inherits="admin_UploadLogoControl" %>
	<table cellpadding="0" cellspacing="0">
		<tr>
			<td>העלה תמונת מוצר : </td>
			<td colspan="2" style="text-align:right">
			<asp:FileUpload ID="picUpload" runat="server" />
			</td>
			<td><asp:Button runat="server" Text="העלה" ID="UploadBtn" OnClick="UploadBtn_Click" /></td>
			<td><asp:Literal ID="errMsg" runat="server"></asp:Literal></td>
		</tr>
	</table>