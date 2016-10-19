<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ErrorPage.aspx.cs" Inherits="ErrorPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Error Page</title>
    <link href="Style/StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 1018px; margin: auto">
            <div class="tabelholder">
                <div class="lefttoptable">
                </div>
                <div class="toptable">
                </div>
                <div class="righttoptable">
                </div>
                <div class="lefttable">
                    <div class="righttable">
                        <div class="centertable">
                            <div>
                                <%= Languages.MyText("Error Page_ErrorPage_3")%>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="leftbottomable">
                </div>
                <div class="bottomtable">
                </div>
                <div class="rightbottomtable">
                </div>
            </div>
        </div>
    </form>
</body>
</html>
