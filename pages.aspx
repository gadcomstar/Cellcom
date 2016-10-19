<%@ Page Title="" Language="C#"  MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="pages.aspx.cs" Inherits="pages" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderright" Runat="Server">

<div class="tabelholder">
    <div class="lefttoptable"></div>
    <div class="toptable"></div>
    <div class="righttoptable"></div>
    <div class="lefttable">
        <div class="righttable">
            <div class="centertable">
                <div class="mcs_containerClassPage termsofserviceScrollclass" id="mcs_container">
                        <div class="customScrollBox">
                            <div class="container">
                                <div class="content">
                                    <asp:Literal runat="server" ID="PageContent" ></asp:Literal>
                                </div>
                            </div>
                            <div class="dragger_container_holder">
                                <div class="dragger_container displayblock" >
                                    <div class="dragger">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
            </div>
        </div>
    </div>    
    <div class="leftbottomable"></div>
    <div class="bottomtable"></div>
    <div class="rightbottomtable"></div>
</div>
 <script type="text/javascript">
     $(window).load(function () {
         mCustomScrollbars();
     });
    </script>
  

</asp:Content>

