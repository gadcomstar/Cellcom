<%@ Page Title="" Language="C#" MasterPageFile="~/IFram2.master" AutoEventWireup="true"
    CodeFile="about.aspx.cs" Inherits="about" %>
<%@ MasterType VirtualPath="~/IFram2.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="winholder">
        <div class="lefttopwin">
        </div>
        <div class="topwin">
        </div>
        <div class="righttopwin">
        </div>
        <div class="leftwin">
            <div class="rightwin">
                <div class="centerwin"  >
                    <div class="topbluebgleft">
                        <div class="topbluebgright">
                            <div class="topbluebgcenter">
                                <div class="conhelpclass">
                                   <%-- <%= Languages.MyText("help?_about")%>--%>
                                </div>
                                <div class="conheaderclass conheaderclass">
                                    <%= Languages.MyText("About spindate_about")%></div>
                                <div onclick="CloseFrom()" title="<%= Languages.MyText("close_about")%>" class="closewhiteclass">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div  class="mcs_containerClassAbout" id="mcs_container">
                        <div class="customScrollBox">
                            <div class="container">
                                <div class="content">                                  
                                        <%= Languages.MyText("about text_about_3")%>                                  
                                </div>
                            </div>
                            <div class="dragger_container_holder">
                                <div class="dragger_container dispalyblock" >
                                    <div class="dragger">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="leftbottomwin">
        </div>
        <div class="bottomwin">
        </div>
        <div class="rightbottomwin">
        </div>
    </div>
    <script type="text/javascript">
        $(window).load(function () {
            mCustomScrollbars();
        });
    </script>  
</asp:Content>
