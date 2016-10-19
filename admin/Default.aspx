<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" EnableViewStateMac="false"
    Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>מערכת ניהול תוכן - Movement4u</title>
    <link href="Style/ltr.css" type="text/css" rel="Stylesheet" />
       <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>     
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/jquery-ui.min.js"></script> 
 
    <script language="javascript" type="text/javascript">
        function clickButton(e, buttonid) {

            var evt = e ? e : window.event;

            var bt = document.getElementById(buttonid);

            if (bt) {

                if (evt.keyCode == 13) {
                    bt.click();
                    return false;
                }
            }
        }
        function showDiv(num) {
            divs = document.getElementsByTagName('div');
            for (i = 0; i <= divs.length - 1; i++) {
                if (divs(i).id.indexOf('div') != -1) {
                    if (divs(i).id.indexOf('div' + num) == -1) {
                        divs(i).style.display = 'none';
                    }
                    else {
                        divs(i).style.display = 'block';
                    }
                }
            }

            tds = document.getElementsByTagName('td');
            for (i = 0; i <= tds.length - 1; i++) {
                if (tds(i).id.indexOf('tab') != -1) {
                    if (tds(i).id.indexOf('tab' + num) == -1) {
                        tds(i).className = 'EnterTableTop';
                    }
                    else {
                        tds(i).className = 'EnterTableTopSelected';
                    }
                }
            }

        }
	
    </script>
</head>
<body style="background: #ffffff; margin: 0px auto 0px auto;font-size:14px;font-family:Tahoma">
    <form id="form1" action="Default.aspx" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="pageDiv">
        <table class="devider" cellspacing="0" cellpadding="0">
            <%--devider table--%>
            <tr>
                <td colspan="3" class="banner">
                    <%--banner--%>
                    <table cellpadding="0" cellspacing="0" style="width: 100%;">
                        <tr>
                            <td style="vertical-align: top">
                                <table cellpadding="0" cellspacing="0" style="margin: 0px auto auto auto; vertical-align: top;
                                    width: 100%;">
                                    <tr>
                                        <td style="width: 20px; height: 102px;">
                                            &nbsp
                                        </td>
                                        <%--spacer--%>
                                        <td style="width: 265px; vertical-align: top">
                                            &nbsp
                                        </td>
                                        <td style="width: 6px">
                                            &nbsp
                                        </td>
                                        <%--<td class="Help">&nbsp;</td>
									<td class="OnThisPage">&nbsp;</td>--%>
                                        <td style="height: 101px; text-align: center; color: White; font-size: 40px;">
                                            <asp:Label runat="server" ID="TitleLabel"></asp:Label>
                                        </td>
                                        <td style="width: 150px">
                                            <a target="_blank" href="http://www.comstar.co.il">
                                                <img src="images/Logo.png" style="border: none;" alt="דף הבית" /></a>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Table ID="bannerTable" runat="server" Width="100%" CellPadding="0" CellSpacing="0"
                                    BorderStyle="None">
                                    <asp:TableRow CssClass="bannerRow">
                                        <asp:TableCell CssClass="bannerRowRight">&nbsp</asp:TableCell>
                                        <asp:TableCell>&nbsp</asp:TableCell>
                                        <asp:TableCell CssClass="bannerRowLeft"></asp:TableCell>
                                    </asp:TableRow>
                                </asp:Table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td class="faderRight">
                    &nbsp
                </td>
                <%--right fader--%>
                <td colspan="1" class="Defaultmain" id="defaultMain" runat="server" style="text-align: center;
                    background-repeat: no-repeat">
                    <%--main--%>
                    <div style="margin-top: 150px">
                        &nbsp;</div>
                    <%--spacer--%>
                    <span class="titleSpan">Welcome To Manger System Spindate</span>
                    <br />
                    <br />
                    <asp:Table CellSpacing="0" CellPadding="0" runat="server" Style="margin: auto auto auto auto">
                        <asp:TableRow CssClass="EnterTH">
                            <asp:TableCell HorizontalAlign="Right"><img src="images/EnterTableTopLeft.gif" style="border:none" alt=""/></asp:TableCell>
                            <asp:TableCell HorizontalAlign="Center" Width="103" Font-Size="10" CssClass="EnterTableTopSelected"
                                ID="tab1" onclick="javascript:showDiv('1')">Admin Login</asp:TableCell>
                            <asp:TableCell Width="5"><img src="images/EnterTableTopLine.gif" style="border:none" alt="" /></asp:TableCell>
                            <asp:TableCell runat="server" Width="324"></asp:TableCell>
                            <asp:TableCell HorizontalAlign="Left"><img src="images/EnterTableTopRight.gif" style="border:none" alt=""/></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow>
                            <asp:TableCell CssClass="EnterTableRight"></asp:TableCell>
                            <asp:TableCell ColumnSpan="3" Width="427" Height="250">
                                <div id="div1" style="height: 180px;">
                                    <table style="margin: auto auto auto auto" cellpadding="10px">
                                        <tr>
                                            <td style="color: #1071b5; font-family: Arial; font-size: 14px; font-weight: bold;
                                                text-align: right">
                                                User Name
                                            </td>
                                            <td class="textboxHome">
                                                <input type="text" class="textboxHome" id="UserName" runat="server" enableviewstate="true" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="color: #1071b5; font-family: Arial; font-size: 14px; font-weight: bold;
                                                text-align: right">
                                                Password
                                            </td>
                                            <td class="textboxHome">
                                                <input type="password" class="textboxHome" id="UserPass" runat="server" enableviewstate="true" />
                                            </td>
                                            <td style="color: #595959; font-family: Arial; font-size: 12px; text-align: right">
                                                <div  style="position:relative;cursor:pointer;">
                                                <span  onclick="showforgot()"> forgot password?</span>

                                                <div id="forgotdiv" style="display:none;width:300px;height:90px;border:solid 1px #0269b8;text-align:center;padding:40px;position:absolute;left:-260px;top:-80px;background:white;border-radius: 15px;">
                                                    <div onclick="closeforgot()" style="float:right;position:absolute;top:10px;right:10px;cursor:pointer;width:20px;height:20px">X</div>
                                                    <div  style="float:left;font-size:17px;margin-bottom:20px;">Enter e-mail or username</div>
                                                    <asp:TextBox CssClass="forgotTextBox" style="float:left;line-height:24px;width:195px;margin-top:5px;" runat="server" ID="SendMail" />
                                                    <div onclick="sendpassword()"  style="text-align:center;float:right;cursor:pointer;" class="backLinkClass" >Send</div>
                                                    <div style="float:left;width:100%;color:red;text-align:left;" id="forgotmsg" ></div>
                                                    <div style="float:left;position:absolute;z-index:3;top:92px;left:245px;display:none;" id="ajaxforget">
                                                        <img src="images/ajax-long.gif" /></div>
                                                </div>
                                                    </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="direction: ltr; text-align: left">
                                                <asp:CheckBox runat="server" ID="MyCheckBox" /> <span>remember me</span>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td colspan="3" style="color: #ff0000; font-family: Arial; font-size: 14px;">
                                                <asp:Literal ID="denied" runat="server"></asp:Literal>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="direction: ltr; text-align: left">
                                                <table cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td>
                                                            <img src="images/buttonLeft.gif" alt="" style="border: none" />
                                                        </td>
                                                        <td style="background-image: url('images/buttonBackLine.gif')">
                                                            <asp:LinkButton ID="LinkButton1" CssClass="LinkButton" runat="server">Login</asp:LinkButton>
                                                        </td>
                                                        <td>
                                                            <img src="images/buttonRight.gif" alt="" style="border: none" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        
                                    </table>
                                </div>
                                <div id="div2" style="display: none; height: 250px; overflow: auto; text-align: right;
                                    vertical-align: top; padding: 10px 10px 10px 10px">
                                    <asp:Literal ID="join" runat="server" EnableViewState="true"></asp:Literal>
                                </div>
                                <div id="div3" style="display: none; height: 250px; overflow: auto; text-align: right;
                                    vertical-align: top; padding: 10px 10px 10px 10px">
                                    <asp:Literal ID="benefits" runat="server" EnableViewState="true"></asp:Literal>
                                </div>
                                <div id="div4" style="display: none; height: 250px; overflow: auto; text-align: right;
                                    vertical-align: top; padding: 10px 10px 10px 10px">
                                    <asp:Literal ID="rules" runat="server" EnableViewState="true"></asp:Literal>
                                </div>
                            </asp:TableCell>
                            <asp:TableCell CssClass="EnterTableLeft"></asp:TableCell>
                        </asp:TableRow>
                        <asp:TableRow CssClass="EnterTableBottomRow">
                            <asp:TableCell HorizontalAlign="Left"><img src="images/EnterTableBL.gif" alt="" style="border:none" /></asp:TableCell>
                            <asp:TableCell ColumnSpan="7"></asp:TableCell>
                            <asp:TableCell HorizontalAlign="Right"><img src="images/EnterTableBR.gif" alt="" style="border:none" /></asp:TableCell>
                        </asp:TableRow>
                    </asp:Table>
                </td>
                <td class="faderLeft">
                    &nbsp
                </td>
                <%--left fader--%>
            </tr>
            <tr class="PageBottomRow">
                <td>
                    <img src="images/PageBR.gif" alt="" />
                </td>
                <td>
                </td>
                <td>
                    <img src="images/PageBL.gif" alt="" />
                </td>
            </tr>
        </table>
    </div>
        <script type="text/javascript">
            function closeforgot()
            {
                $('#forgotdiv').css('display', 'none');
            }
            function showforgot()
            {
                $('#forgotdiv').css('display', 'block');
            }
            function sendpassword()
            {
             
                var username = $('.forgotTextBox').val();
              
                if (username != '') {
                   
                    $('#ajaxforget').css('display', 'block');
                    $.ajax({
                        type: "POST",
                        url: "default.aspx/forgotpassword",
                        data: "{'username':'" + username + "'}",
                        dataType: "json",
                        contentType: "application/json; charset=utf-8",
                        success: function (msg) {
                           
                            if (msg.d == 'yes') {
                                $('#forgotmsg').html("mail was sent to your mailbox");
                                setTimeout(function () { closeforgot(); }, 3000);

                            } else {

                                $('#forgotmsg').html("The details are not exists or <br/> there is problem with the system!!!");
                            }
                            
                            $('#ajaxforget').css('display', 'none');

                        },
                        async: true,
                        error: function (msg) {
                         //   $('#ajaxforget').css('display', 'none');
                            alert('Failed send password' + 'ERROR3!!!!');
                        }
                    });
                } else {
                    $('#forgotmsg').html("The details are not exists or <br/> there is problem with the system!!!");

                }



            }

        </script>
    </form>
</body>
</html>
