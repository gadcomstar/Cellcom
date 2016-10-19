<%@ Page Language="C#" AutoEventWireup="true" CodeFile="twitter.aspx.cs" Inherits="twitter" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div id="apiResponse" runat="server">
    
    </div>
    <asp:LinkButton runat="server" ID="gettwiter" OnClick="gettwiter_Click" >get twitter</asp:LinkButton>
        <asp:Label runat="server" ID="result" ></asp:Label>
    </div>
    </form>
</body>
</html>
