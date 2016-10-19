<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MailError.aspx.cs" Inherits="MailError" %>
<%@ Register TagPrefix="cmstr" Src="~/Controls/CMSTRMenuControll.ascx" TagName="MenuControl" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>תקלה בשליחת מייל</title>
      <meta name="description" id="description" runat="server" content="" />
      <meta runat="server" name="keywords" id="keywords" content="" />
    <link href="Style/ErrorStyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="ErrorPalceHolderClass">
        <div class="ErrorPalceHolderClass2">
          <cmstr:MenuControl MenuMode="SEO"  runat="server" ID="MainMenu" />
          <asp:Literal runat="server" ID="PageText" ></asp:Literal>
          
        </div>
    </div>
    </form>
</body>
</html>
