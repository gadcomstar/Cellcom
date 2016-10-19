<%@ Master Language="C#" AutoEventWireup="true"  EnableViewState="false" CodeFile="MasterPage.master.cs"
    Inherits="MasterPage" %>
<%@ Register TagPrefix="cmstr" Src="~/Controls/CMSTRMenuControll.ascx" TagName="MenuControl" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <meta name="description"  id="description" runat="server" content="" />
    <meta runat="server" name="keywords" id="keywords" content="" />
    <meta name="robots" content="noindex,nofollow" />
    <meta name="googlebot" content="noindex,nofollow" />

    <link href="Style/StyleSheet.css" runat="server" id="mystyle" rel="stylesheet" type="text/css" />
    <link rel="icon" type="image/x-icon" href="images/favicon.png" />   
   <!--[if !IE]><!-->
        <%--	<link rel="stylesheet" type="text/css" href="Style/StyleSheet2.css" />--%>
  <!--<![endif]-->
   <%-- <script src="Script/Jquerymin.js" type="text/javascript"></script>
    <script src="Script/jquery-ui.min.js" type="text/javascript"></script>--%>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.23/jquery-ui.min.js"></script>
    <script src="Tiny/jquery.easing.1.3.js" type="text/javascript"></script>  
    <script src="Script/jquery.mousewheel.min.js" type="text/javascript"></script>
    <asp:ContentPlaceHolder ID="head" runat="server">
    </asp:ContentPlaceHolder>
      <script type="text/javascript" src="Tiny/jquery.mCustomScrollbar.js"></script>
    <script type="text/javascript" src="Script/cmsScript.js"></script>
    <script type="text/javascript" src="Script/master.js"></script>
    <script type="text/javascript" >
        var isinbox = 0;
        var sound = '0';
       
    </script>
    <asp:Literal runat="server" ID="HeadContentSystem" ></asp:Literal>
    <asp:Literal runat="server" ID="HeadContentSite" ></asp:Literal>
</head>
<body >
    <form id="form1" runat="server">
    <asp:ScriptManager ScriptMode="Release" ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
        <div runat="server" id="testdiv" visible="false" style="position:fixed;top:20px;left:20px;" ></div>
        <div runat="server" id="MyToopLine" class="tooplineclass">
            <div class="topelineholder">
                <div runat="server" id="TopeLineData"  class="topelinecontent"></div>

            </div>
            <asp:Literal runat="server" ID="MyCodeLiteral" ></asp:Literal>
            <div onclick="closetopline()" class="closetoplineclass"></div>

        </div>
    <div class="SiteTopCover">
        <div class="SitePlaceHolderClass">
            <div runat="server" id="homemiddletop" visible="false" class="homemiddletopclass">
            </div>
            <div runat="server" id="spindatelogoholder" class="SitePlaceHolderClass2">
                <div class="SitePlaceHolderClass3">
                    <a runat="server" id="sitelogo" class="sitelogoclass" href="./">
                        <img alt="" runat="server" id="LogoImage"  src="images/siteImages/logo.png" /></a>
                    <div runat="server" id="MasterRightSide" class="rightsideclass">
                        <div class="pageheaderclass">
                            <asp:Panel runat="server"  ID="headerholder">                                  
                                <h1 runat="server" class="MasterPageHeaderClass" id="PageTitle"></h1>
                            </asp:Panel>
                        </div>
                        <asp:ContentPlaceHolder ID="ContentPlaceHolderHeader" runat="server">
                        </asp:ContentPlaceHolder>
                                 
                    </div>
                  <asp:ContentPlaceHolder ID="ContentPlaceHolderleft" runat="server">
                            </asp:ContentPlaceHolder>
                    <asp:ContentPlaceHolder ID="ContentPlaceHolderright" runat="server">
                    </asp:ContentPlaceHolder>                
                    <asp:Label runat="server" ID="check"></asp:Label>
                </div>
            </div>
        </div>
    </div>
 
   
     
      
    <%--jump pages ifram--%>
    <div runat="server" id="mainIframHolder" class="RemoveBlockAlert">
        <div id="aaaa" class="iframholder11" >
            <div id="bbb" class="iframholder22" ></div>
          <iframe frameborder="0" allowtransparency="true"  runat="server" class="mainiframeclass"
            id="mainiframe"></iframe>
            </div>
   
        <div  class="RemoveBlockAlert2"></div>
        <div id="ajaxid" class="ajaxidclass" >           
            <img alt="load" width="16" src="images/SiteImages/spindate-loader.gif" />
        </div>     
    </div>
        <asp:Panel runat="server" ID="donothing" >
            <script type="text/javascript">
                function dobuildconv() {
                }
            </script>
        </asp:Panel>
         <asp:Panel runat="server" Visible="false" ID="ChatScriptPanel" >
            
   
    </asp:Panel>
     
    <asp:Literal runat="server" ID="SiteBottomLiteral" ></asp:Literal>
    <asp:Literal runat="server" ID="SystemBottomLiteral" ></asp:Literal>
    </form>
</body>
</html>
