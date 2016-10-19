<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" ValidateRequest="false"
    AutoEventWireup="true" CodeFile="editsitegentext.aspx.cs" Inherits="admin_editsitegentext2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript" src="ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div style="margin:10px;float:left;">
    <asp:HyperLink CssClass="LoadImagesClass" runat="server" ID="GoBack">back</asp:HyperLink>
    </div>
    <div style="width:100%;height:40px;margin:10px 0px;">
        <div style="float:left;width:40px;text-decoration:none;margin-top:10px;">
                <a  class="mstatuspageclass"  href='<%= "editsitegentext.aspx?page="+Request.QueryString["page"]+"&cat="+Request.QueryString["cat"]+"&sub="+Request.QueryString["cat"]+"&sitelang="+Request.QueryString["sitelang"] %>' >All</a>
                    </div>
      <asp:Repeater runat="server" ID="StatusRepeater">
            <ItemTemplate>
                <div style="float:left;width:40px;text-decoration:none;margin-top:10px;">
                <a class='<%# Request.QueryString["status"] != null && Request.QueryString["status"].ToString()== Eval("PageStatus").ToString()  ?"mstatuspageclass mstatuspageclass2":"mstatuspageclass"  %>' "mstatuspageclass"  href='<%# "editsitegentext.aspx?page="+Eval("mypage")+"&cat="+Request.QueryString["cat"]+"&sub="+Request.QueryString["cat"]+"&sitelang="+Request.QueryString["sitelang"] +"&status="+Eval("PageStatus") %>' ><%# Eval("PageStatus")  %></a>
                    </div>
            </ItemTemplate>
          </asp:Repeater>
        </div>
    <div class="Header" ><asp:Label runat="server" ID="pageHeader" ></asp:Label></div>
    <div class="editgentextholderclas" style="position: relative;">
    <div class="editgentextholderclas2" >
        <asp:Repeater runat="server" ID="EditTextRepeater">
            <ItemTemplate>
                <div style="float: left; width: 800px; padding: 3px;">
                    <div class="langnameclass">
                        <div ><%# Eval("TextName")%></div><div style="color:#666666;font-size:12px;line-height:22px;"><%# Eval("TextComment").ToString()!=""? "[ "+Eval("TextComment")+" ]":""%></div></div>
                    <div style="width:550px;float:left;">
                        <asp:HiddenField runat="server" ID="MyIdHiddenField" Value='<%# Eval("LangTextID") %>' />
                        <div onclick='<%# SelectTextMode(Eval("TextType").ToString()) ? "opencke("+Eval("LangTextID")+");" : "" %>'>
                            <cmsr:MyTextBox CssClass='<%# SelectTextMode(Eval("TextType").ToString()) ? "MultTextbox setnone textbox"+ Eval("LangTextID").ToString() : "MultTextbox" %>'
                                runat="server" ID="GeneralMyTextBox" Text='<%# Eval("myText") %>' TextMode="MultiLine" />
                            <div style="cursor: pointer; float: left; width: 300px;" class='<%# SelectTextMode(Eval("TextType").ToString()) ? "" : "setnone" %>'>
                                <img src="images/pencil.png" /></div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
       </div>
            <asp:LinkButton CssClass="SaveLAngbtnclass" runat="server" ID="saveText" OnClick="SaveText"
                Text="Save"></asp:LinkButton>
      
    </div>
    <div class="CkeHoldrclass">
        <asp:HiddenField OnPreRender="MyTextBox_PreRender" runat="server" ID="longtxtboxHidden" />
        <div style="margin: auto; width: 620px;">
            <div onclick="closecke()" class="closeckeditor">
            </div>
            <asp:TextBox CssClass="cketextboxclass" runat="server" ID="MyTextBox" TextMode="MultiLine">                        
            </asp:TextBox>
        </div>
    </div>
    <script type="text/javascript">
    var myid = 0;
        function opencke(myid2) {
       
          myid = myid2;
          $('.CkeHoldrclass').css('display','block');
            CKEDITOR.instances.<%= MyTextBox.ClientID  %>.setData( $('.textbox'+myid).children().next().next().children().val());
                 
        }    
        function closecke()
        {
         $('.CkeHoldrclass').css('display','none');
        $('.textbox'+myid).children().next().next().children().focus();
        
        }
    </script>
</asp:Content>
