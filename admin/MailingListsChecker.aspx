<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" CodeFile="MailingListsChecker.aspx.cs" Inherits="admin_MailingListsChecker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">
    <div style="direction: rtl; margin-top: 15px;">
        <div style="text-align: center;">
            <table style="margin: auto;">
                <tr>
                    <td>קוד רשימת תפוצה - מקור:</td>
                    <td>
                        <%-- <asp:TextBox AutoComplete="off" runat="server" ID="txtOriginMailingListID" /><asp:RequiredFieldValidator Display="None" ErrorMessage="יש להזין קוד רשימת תפוצה - מקור" ControlToValidate="txtOriginMailingListID" runat="server" />--%>
                        <asp:DropDownList runat="server" ID="DDL_OriginalList">
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td>קוד רשימת תפוצה - יעד:</td>
                    <td>
                        <%--<asp:TextBox AutoComplete="off" runat="server" ID="txtDestinationMailingListID" /><asp:RequiredFieldValidator Display="None" ErrorMessage="יש להזין קוד רשימת תפוצה - יעד" ControlToValidate="txtDestinationMailingListID" runat="server" />--%>
                        <asp:DropDownList runat="server" ID="DDL_DestinationList">
                        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Button Text="בדוק רשימת תפוצה" runat="server" ID="btnStartProcedure" OnClick="btnStartProcedure_Click" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:CustomValidator Display="None" ErrorMessage="יש להכניס ערכים מספריים בלבד" OnServerValidate="Unnamed_ServerValidate" runat="server" />
                        <asp:ValidationSummary runat="server" ID="ValidatorsSummerizer" />
                    </td>
                </tr>
                <tr><td colspan="2">
                    <asp:Label Text="" ID="lblStatus" ForeColor="Red" runat="server" /></td></tr>
            </table>
            <asp:Panel runat="server" ID="Panel_FoundUsers" Visible="false">
                <div>
                    <h1>משתמשים שנמצאו:</h1>
                    <div>
                        <table style="margin: auto;" border="1">
                            <tr>
                                <td style="width:30px;"></td>
                                <td style="font-weight: bold;">שם לקוח</td>
                                <td style="font-weight: bold;">מייל לקוח</td>

                            </tr>

                            <asp:Repeater runat="server" ID="Repeater_FoundUsers">
                                <ItemTemplate>
                                    <tr style='background-color: <%# (Container.ItemIndex +1) % 2 == 0? "#D0D0D0 ;":"white;"%>'>
                                        <td><%#Container.ItemIndex+1 %></td>
                                        <td><%#Eval("UserSystemFields[0].Value") %></td>
                                        <td><%#Eval("EmailAddress") %></td>

                                    </tr>


                                </ItemTemplate>
                            </asp:Repeater>
                            <tr>
                                
                                <td colspan="2" style="font-weight: bold;">סך הכול תוצאות:</td>
                                <td style="font-weight: bold;"><%=TotalResults %></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </asp:Panel>
        </div>

    </div>
</asp:Content>

