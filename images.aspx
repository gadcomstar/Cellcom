<%@ Page Title="" Language="C#" MasterPageFile="~/IFram2.master" AutoEventWireup="true"
    CodeFile="images.aspx.cs" Inherits="images" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="Uploadify/jquery.uploadify.js"></script>
    <link rel="Stylesheet" type="text/css" href="Uploadify/uploadify.css" />
    <link href="Cropjs/css/jquery.Jcrop.css" rel="stylesheet" type="text/css" />
    <script src="Cropjs/js/jquery.Jcrop.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<div runat="server" id="imageHolder" class="w740class">
    <div  class="winholder w290class">
        <div class="lefttopwin">
        </div>
        <div  class="topwin w261class">
        </div>
        <div class="righttopwin">
        </div>
        <div class="leftwin">
            <div class="rightwin">
                <div class="centerwin imgcenterwin">
                    <div class="conhelpclass2">
                        <%-- <%= Languages.MyText("help?_images")%>--%></div>
                    <div class="closeimgholder" >
                    <div runat="server" id="myCloseFrom" onclick="CloseFrom()" class="closeclass closeclassimg">
                    </div>
                        </div>
                    <div class="loadimageleftside">

                  <div class="imageleftsideholder" >
                    <div class="MyLoadFileimg">  <%= Languages.MyText("Upload photo file_images")%></div>
                      <asp:LinkButton runat="server" ID="fbbutton" OnClick="FaceBookLogin" CssClass="fbloadimg"><%= Languages.MyText("Import from Facebook_images")%></asp:LinkButton>
                      </div>
                        <cmsr:MyUpload CssClass="EditLoadFile" OnSelected="saveimage(response);" SaveDirectory="usersImages"
                            ButtonText="Upload Your Photo" UploadImage="images/SiteImages/blank.gif"
                            Width="86" Height="35" runat="server" ID="LoadProfile" ImageUrl="../images/SiteImages/uploadimgedit.png"
                            Dimension="200x200,100x100,410x410" ShowImage="false" Types="Image" AlternativeText="Profile Image" />
                        <div class="EditLoadFileImageholderclass">
                            <div class="EditLoadFileImageholderclass2">
                                <img runat="server" id="MyProfileImage" alt="" /></div>
                        </div>
                        <div class="loadimgmyphoto">
                            <%= Languages.MyText("My Photo_images")%>
                            <span class="loadimgcount">
                                <asp:Literal runat="server" ID="imgcount"></asp:Literal>
                            </span>
                        </div>
                        <div class="loadimgmyimageHolder">
                            <asp:Button runat="server" ID="ReloadImagesRepeater" CssClass="ReloadImagesRepeaterClass displaynone"
                                OnClick="LoadImagesRepeater"></asp:Button>
                            <asp:Repeater runat="server" ID="imagesRepeater">
                                <ItemTemplate>
                                <div class="myimgloadholder">                            
                                <div runat="server" visible='<%#   siteDefaults.SiteParam["hasConfirmPicture"].ToLower()=="true" && Eval("isConfirm").ToString().Trim()=="0" ? true:false %>' class="awaitingconfsmall"></div>
                                    <div  class="loadimgmyimage">
                                        <img onload='<%#  "setimgposnew(this,"+Eval("xvalue").ToString()+","+Eval("yvalue").ToString()+");" %>'    alt='<%# Languages.MyText("Image number_images") + DataBinder.Eval(Container, "itemindex").ToString() %>' class='<%#  Eval("userprofileimage").ToString()==Eval("iduserimages").ToString()? ("selloadimagesmallclass imagesclass"+ DataBinder.Eval(Container, "itemindex").ToString()):("loadimagesmallclass imagesclass"+ DataBinder.Eval(Container, "itemindex").ToString()) %>'
                                            src='<%#  siteDefaults.SiteUrl+"/"+ Eval("imagelink").ToString().Replace("../","").Replace("_size0", (Eval("userprofileimage").ToString()==Eval("iduserimages").ToString()?"_size1": "_gray")) %>' />
                                        <asp:HiddenField runat="server" ID="MyIDHiddenField" Value='<%# Eval("iduserimages") %>' />
                                        <input type="hidden" id="myxvalue" value='<%# Eval("xvalue").ToString() %>' />
                                        <input type="hidden" id="myyvalue" value='<%# Eval("yvalue").ToString() %>' />

                                    </div>
                                    <div onclick="showimages($(this).prev().children()); " onmouseover="colormouseover($(this).prev().children());" onmouseout="colormouseout($(this).prev().children());" class="imgframlbclass"></div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                            <asp:HiddenField runat="server" ID="imageselected" />
                            <input id="MyIdSelectedHiddenField" type="hidden" />
                             <input id="MyXHidden" type="hidden" />
                             <input id="MyYHidden" type="hidden" />
                        
                        </div>
                    </div>

                    <div class="loadimagerightside">
                        <div  id="awaaitingConf" class="awaaitingConf awaaitingConf2"> <%= Languages.MyText("Awaiting Confirmation_images")%></div>
                        <div class="loadimgmyimage2">
                            <img  onload="setimgposnew(this,$('#MyXHidden').val(),$('#MyYHidden').val());"  id="bigimage" alt="" /></div>
                        <div class="loadimgonimgholder">
                            <div onclick="slideright();" class="loadimgleft">
                            </div>
                            <div onclick="slideleft();" class="loadimgright">
                            </div>
                           
                            <div class="loadimgonimgbottom">
                                <div class="loadimgmyphoto2">
                                    <span class="loadimggray"><span id="shownum"><%= (imagenumber+1).ToString() %></span> <%= Languages.MyText("of_images")%> <span runat="server" id="allnum">
                                        3</span></span></div>
                                        <asp:Panel runat="server" ID="ProfileButtons" >
                                <div id="MakeProfile" class="whitebtnleft displaynone" >
                                    <div class="whitebtnright">
                                        <div onclick="changeprofile();" class="whitebtncenter" > <%= Languages.MyText("Make Profile Picture_images")%>
                                            </div>
                                    </div>
                                </div>
                                           
                                <div id="Profile" class="imgmyprofileimgclass">
                                    <%= Languages.MyText("Profile Picture_images")%>
                                </div>
                                </asp:Panel>
                                <asp:Panel runat="server" ID="EditImage" >
                                  <div onclick='<%=  "parent.window.openMyprofile( \"editimage.aspx?image=\"+ $(\"#MyIdSelectedHiddenField\").val() ,  \"760\", \"650\");" %>' title='<%= Languages.MyText("Edit picture_images")  %>' class="editimageclass" ></div>
                                    </asp:Panel>
                                <div runat="server" id="deletebutton" onclick="deleteimage();"  class="closeFormblue">
                                    <%= Languages.MyText("Delete_images")%></div>
                                <div class="whitebtnleft closeprevclass"  >
                                    <div class="whitebtnright">
                                        <div runat="server" id="deletediv"  onclick="hideimages();"
                                            class="whitebtncenter">
                                              <%= Languages.MyText("Close Preview_images")%></div>
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
        <div  class="bottomwin w261class">
        </div>
        <div class="rightbottomwin">
        </div>
    </div>
    <asp:HiddenField runat="server" ID="MyprofileImgHiddenField" />
    <asp:Literal runat="server" ID="GenderLiteral" ></asp:Literal>
    </div>
    <script type="text/javascript">       
        var imagenumber = '<%= imagenumber %>';
        var imageselectedid = '<%= imageselected.ClientID %>';
        var imagecount = parseInt('<%= imagecount %>') - 1;
        var MyprofileImgHiddenFieldid = '<%= MyprofileImgHiddenField.ClientID %>';
        var MyProfileImageid = '<%=  MyProfileImage.ClientID %>';
        
    </script>
</asp:Content>
