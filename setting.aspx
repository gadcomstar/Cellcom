<%@ Page Title=""  Language="C#" MasterPageFile="~/IFram2.master" AutoEventWireup="true"
    CodeFile="setting.aspx.cs" Inherits="setting" %>
<%@ MasterType VirtualPath="~/IFram2.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="winwholder w725class h760class winwholder_settings" >
        <div class="lefttopwinw">
        </div>
        <div class="topwinw w691class">
        </div>
        <div class="righttopwinw">
        </div>
        <div class="leftwinw">
            <div class="rightwinw">
                <div class="centerwinw w693class centerwinw_settings">
                    <div class="topbluebgleft topbluebgleft_settings">
                        <div class="topbluebgright">
                            <div class="topbluebgcenter w696class">
                                
                                <div class="conheaderclass w600class">
                                    <img alt='<%=  Languages.MyText("Account Settings_setting") %>' src="images/SiteImages/wheelwhite.png" />&nbsp;&nbsp;<%= Languages.MyText("Account Settings_setting")%>
                                </div>
                                <div onclick="CloseFrom()" class="closewhiteclass">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="lbholder">
                        <div class="lefttoplb">
                        </div>
                        <div class="toplb">
                        </div>
                        <div class="righttoplb">
                        </div>
                        <div class="leftlb">
                            <div class="rightlb">
                                <div class="centerlb">
                                    <%-- <span > account info Tab </span>--%>
                                    <div id="accountinfo1" class="settingintabholder displayblock">

                                        <cmsr:MyForm HideSaveButton="false" OnItemUpdated="CheckEmail" CssClass="MyFormFormClass" ValidationGroup="ProfileGroup"
                                            DataKeyField="userid" runat="server" TableName="tblusers" FormStatus="Update"
                                            ID="AcountInfoMyForm" VisibleBackButton="false" VisibleSaveAndBackButton="false">
                                            <MessageTemplate>
                                                <cmsr:MyHiddenField OnPreRender="DataMyHiddenField_PreRender" runat="server" ID="DataMyHiddenField"
                                                    DataFieldType="String" DataFieldName="userfileddata" />
                                                <%-- <asp:ValidationSummary ForeColor="White" DisplayMode="List" ShowSummary="true" CssClass="SetValidationSummary2Class"
                                                    ValidationGroup="ProfileGroup" ID="ValidationSummary2" runat="server" />--%>
                                                <div class="settingFormleft">
                                                    <div class="setinginfolefttitle">
                                                        <%= Languages.MyText("General Info_setting")%></div>
                                                    <cmsr:MyTextBox CssClass="SettingTextBox" Display="None" IsRequiredFieldValidator="true"
                                                        ValidationGroup="ProfileGroup" runat="server" ID="FirstNameTextBox" MaxLength="200"
                                                        DataFieldType="String" DataFieldName="userfirstname" />
                                                    <cmsr:MyTextBox CssClass="SettingTextBox" Display="None" IsRequiredFieldValidator="true"
                                                        ValidationGroup="ProfileGroup" runat="server" ID="LastNameTextBox" MaxLength="200"
                                                        DataFieldType="String" DataFieldName="userlastname" FieldName="Last Name :" />
                                                    <cmsr:MyTextBox CssClass="SettingTextBox156" Display="None" IsRequiredFieldValidator="true"
                                                        ValidationGroup="ProfileGroup" runat="server" ID="EmailTextBox" SelectExpresion="Email"
                                                        DataFieldType="String" DataFieldName="useremail" MaxLength="200" />
                                                    <div class="SettingBirthdayHolder">
                                                        <div class="Settingbirhday">
                                                            <%= Languages.MyText("Birthday:_setting")%></div>
                                                        <cmsr:MyDatePeaker2 CssClass="BirthdayHolder3" DataFieldType="DateTime" DataFieldName="userbirthday"
                                                            HasFirstField="false" YearCssClass="YearDropDownClass3" MonthCssClass="MonthDropDownClass3"
                                                            DayCssClass="DayDropDownClass3" runat="server" ID="mypeaker" />
                                                    </div>
                                                    <div class="registerchoosegender registerchoosegenderset">
                                                        <div class="Settingbirhday">
                                                            <%= Languages.MyText("Gender:_setting")%></div>
                                                        <cmsr:MyCheckBox ID="GenderMyDropDown" CssClass="settingcheckbox" runat="server"
                                                            ImageOff="../images/SiteImages/mansel3.png" ImageOn="../images/SiteImages/womansel3.png"
                                                            FieldName="" DataFieldType="Bool" DataFieldName="usergendor" />
                                                        <div class="lookingfor2">
                                                            <%= Languages.MyText("looking for_setting")%>
                                                        </div>
                                                        <cmsr:MyTrippleSel ID="SeekingMyDropDown" FieldName="" CssClass="settingcheckbox"
                                                            Checked="true" runat="server" Image1="../images/SiteImages/mansel3.png" Image2="../images/SiteImages/womansel3.png"
                                                            Image3="../images/SiteImages/manwomensel3.png" DataFieldType="Number" DataFieldName="userseeking" />
                                                    </div>
                                                    <cmsr:MyDropDown2 OnPreRender="Country_PreRender" OnClientSelectedChanged="setstate(value);"
                                                        AppendDataBoundItems="true" DataFieldType="Number" DataFieldName="usercountry"
                                                        runat="server" CssClass="CountrysettingDropDownClass" ID="CountriesMyDropDown">
                                                    </cmsr:MyDropDown2>
                                                    <div runat="server" id="statedrop">
                                                        <cmsr:MyDropDown2 AppendDataBoundItems="true" DataFieldType="Number" DataFieldName="userstate"
                                                            runat="server" CssClass="CountrysettingDropDownClass" ID="StateMyDropDown">
                                                        </cmsr:MyDropDown2>
                                                    </div>
                                                    <cmsr:MyDropDown2 AppendDataBoundItems="true" DataFieldType="Number" DataFieldName="userLang"
                                                        runat="server" CssClass="CountrysettingDropDownClass" ID="LangMyDropDown">
                                                    </cmsr:MyDropDown2>
                                                    <div id="showlangid" onclick="showlang()" class="settingaddmoreClass"><%= Languages.MyText("+ Add more_setting")%></div>
                                                    <div id="secondlang">    
                                                       <div id="hidelangid" onclick="hidelang()" class="settingaddmoreClass"><%= Languages.MyText("- Hide_setting")%></div>
                                                                                                   
                                                    <cmsr:MyDropDown2 AppendDataBoundItems="true" DataFieldType="Number" DataFieldName="userLang2"
                                                        runat="server" CssClass="CountrysettingDropDownClass" ID="LangMyDropDown2">                                                       
                                                    </cmsr:MyDropDown2>
                                                    </div>
                                                    <div class="unsubscribclass" onclick='<%= "parent.openMyprofile(\""+siteDefaults.GetLink( "registermsg.aspx?status=12")+"\" , \"480\", \"470\")" %>'><%= Languages.MyText("Unsubscribe me_setting") %></div>
                                                </div>
                                                <div class="settingsidesep">
                                                </div>
                                                <div class="settingFormRight">
                                                  <div class="mcs_containerClassSetting" id="mcs_containerset">
                                                        <div class="customScrollBox">
                                                            <div class="container">
                                                                <div class="content">

                                                 <div class="setinginfolefttitle2">
                                                        <%= Languages.MyText("Importent Facts_setting")%></div>
                                                    <cmsr:MyDropDown2 AppendDataBoundItems="true" DataFieldType="Number" DataFieldName="userdata1"
                                                        runat="server" CssClass="settingDropDown3Class" ID="RelationMyDropDown">                                                       
                                                    </cmsr:MyDropDown2>
                                                      <cmsr:MyDropDown2 AppendDataBoundItems="true" DataFieldType="Number" DataFieldName="userdata2"
                                                        runat="server" CssClass="settingDropDown3Class" ID="MyDropDown2">                                                       
                                                    </cmsr:MyDropDown2>
                                                        <div class="setinginfolefttitle2">
                                                        <%= Languages.MyText("About your looks_setting")%></div>

                                                    <cmsr:MyDropDown2 AppendDataBoundItems="true" DataFieldType="Number" DataFieldName="userdata3"
                                                        runat="server" CssClass="settingDropDown3Class" ID="MyDropDown3">                                                       
                                                    </cmsr:MyDropDown2>                                                   
                                                    <cmsr:MyDropDown2 AppendDataBoundItems="true" DataFieldType="Number" DataFieldName="userdata4"
                                                        runat="server" CssClass="settingDropDown3Class" ID="MyDropDown4">                                                       
                                                    </cmsr:MyDropDown2>
                                                    <cmsr:MyDropDown2 AppendDataBoundItems="true" DataFieldType="Number" DataFieldName="userdata5"
                                                        runat="server" CssClass="settingDropDown3Class" ID="MyDropDown5">                                                       
                                                    </cmsr:MyDropDown2>
                                                    <cmsr:MyDropDown2 AppendDataBoundItems="true" DataFieldType="Number" DataFieldName="userdata6"
                                                        runat="server" CssClass="settingDropDown3Class" ID="MyDropDown6">                                                       
                                                    </cmsr:MyDropDown2>

                                                      <div class="setinginfolefttitle2">
                                                        <%= Languages.MyText("About your background_setting")%></div>

                                                    <cmsr:MyDropDown2 AppendDataBoundItems="true" DataFieldType="Number" DataFieldName="userdata7"
                                                        runat="server" CssClass="settingDropDown3Class" ID="MyDropDown7">                                                       
                                                    </cmsr:MyDropDown2>
                                                    <cmsr:MyDropDown2 AppendDataBoundItems="true" DataFieldType="Number" DataFieldName="userdata8"
                                                        runat="server" CssClass="settingDropDown3Class" ID="MyDropDown8">                                                       
                                                    </cmsr:MyDropDown2>
                                                    <cmsr:MyDropDown2 AppendDataBoundItems="true" DataFieldType="Number" DataFieldName="userdata9"
                                                        runat="server" CssClass="settingDropDown3Class" ID="MyDropDown9">                                                       
                                                    </cmsr:MyDropDown2>
                                                    <cmsr:MyDropDown2 AppendDataBoundItems="true" DataFieldType="Number" DataFieldName="userdata10"
                                                        runat="server" CssClass="settingDropDown3Class" ID="MyDropDown10">                                                       
                                                    </cmsr:MyDropDown2>
                                                      <div class="setinginfolefttitle2">
                                                        <%= Languages.MyText("About your lifestyle_setting")%></div>

                                                    <cmsr:MyDropDown2 AppendDataBoundItems="true" DataFieldType="Number" DataFieldName="userdata11"
                                                        runat="server" CssClass="settingDropDown3Class" ID="MyDropDown11">                                                       
                                                    </cmsr:MyDropDown2>
                                                    <cmsr:MyDropDown2 AppendDataBoundItems="true" DataFieldType="Number" DataFieldName="userdata12"
                                                        runat="server" CssClass="settingDropDown3Class" ID="MyDropDown12">                                                       
                                                    </cmsr:MyDropDown2>
                                                 <div class="setinginfolefttitle2">
                                                        <%= Languages.MyText("About Me_setting")%></div>
                                                        <asp:Repeater runat="server" ID="FieldRepeater">
                                                            <ItemTemplate>
                                                                <asp:HiddenField runat="server" ID="MyID" Value='<%# Eval("idtbluserfield") %>' />
                                                                <cmsr:MyTextBox CssClass="SettingTextBox3" runat="server" ID="StatusMyTextBox" MaxLength="200"
                                                                    DataFieldType="String" FieldName='<%# Eval("myText") %>' Text='<%# Eval("fieldtext") %>' />
                                                            </ItemTemplate>
                                                        </asp:Repeater>                                                                
                                                  
                                                    <cmsr:MyTextBox CssClass="SettingMulTextBox" DataFieldType="String" DataFieldName="userAbout"
                                                        TextMode="MultiLine" runat="server" ID="AboutMeMyTextBox" MaxLength="800"  />
                                                    <cmsr:MyTextBox CssClass="SettingMulTextBox" DataFieldType="String" DataFieldName="lookingforcontent"
                                                        TextMode="MultiLine" runat="server" ID="lookingforMyTextBox" MaxLength="800"  />


                                                        </div>
                                                            </div>
                                                            <div class="dragger_container_holder">
                                                                <div class="dragger_container displayblock">
                                                                    <div class="dragger">
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </MessageTemplate>
                                        </cmsr:MyForm>
                                    </div>
                                    <%-- <span > mail notification Tab </span>--%>
                                    <div id="mailnotifi" class="settingintabholder">
                                        <div class="settingintabheader settingintabheader2">
                                            <%= Languages.MyText("Email Notifications_setting")%>
                                        </div>
                                        <div class="settingintabcomment2">
                                            <%= Languages.MyText("Choose which email notifications you would like to recieve._setting")%>
                                        </div>
                                        <div class="blueholder">
                                            <div class="lefttopblue">
                                            </div>
                                            <div class="topblue">
                                            </div>
                                            <div class="righttopblue">
                                            </div>
                                            <div class="leftblue">
                                                <div class="rightblue">
                                                    <div class="centerblue">
                                                        <div class="settingmailnotcontent">
                                                            <%= Languages.MyText("To help you have the best experience,_setting_3")%></div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="leftbottomblue">
                                            </div>
                                            <div class="bottomblue">
                                            </div>
                                            <div class="rightbottomblue">
                                            </div>
                                        </div>
                                        <cmsr:MyForm HideSaveButton="false" CssClass="MyFormFormClass" TableName="emailnotification"
                                            runat="server" ID="EmailNotMyForm" VisibleBackButton="false" VisibleSaveAndBackButton="false"
                                            FormStatus="Update">
                                            <MessageTemplate>
                                                <div class="settingmailnotholder settingmailnotholder_settings">
                                                    <div class="settingintabheader">
                                                        <%= Languages.MyText("Send me email notifications:_setting")%>
                                                    </div>
                                                    <cmsr:MyCheckBox CssClass="checkboxReportclass" DataFieldType="Bool" DataFieldName="whenmembersend"
                                                        runat="server" ID="membersendmsg" ImageOn="../images/SiteImages/checkboxtrue2.png"
                                                        ImageOff="../images/SiteImages/checkboxfalse2.png" />
                                                    <cmsr:MyCheckBox CssClass="checkboxReportclass" DataFieldType="Bool" DataFieldName="whenmemberfavorite"
                                                        runat="server" ID="FavouriteCBMyCheckBox" ImageOn="../images/SiteImages/checkboxtrue2.png"
                                                        ImageOff="../images/SiteImages/checkboxfalse2.png" />
                                                    <cmsr:MyCheckBox CssClass="checkboxReportclass" DataFieldType="Bool" DataFieldName="whennewthing"
                                                        runat="server" ID="NewFeatureMyCheckBox" ImageOn="../images/SiteImages/checkboxtrue2.png"
                                                        ImageOff="../images/SiteImages/checkboxfalse2.png" />
                                                </div>
                                            </MessageTemplate>
                                        </cmsr:MyForm>
                                    </div>
                                    <%-- <span > Account Status Tab </span>--%>
                                    <div  id="accountstatus" class="settingintabholder">
                                        <div class="SettingFormHolder">
                                            <div class="settingaccostatholder">
                                                <div runat="server" id="PremiumAccDiv" class="blueholder">
                                                    <div class="lefttopblue">
                                                    </div>
                                                    <div class="topblue">
                                                    </div>
                                                    <div class="righttopblue">
                                                    </div>
                                                    <div class="leftblue">
                                                        <div class="rightblue">
                                                            <div class="centerblue">
                                                                <div class="regacccontentclass2">
                                                                    <div class="regacccontenttextclass regacccontenttextclassblue">
                                                                        <%= Languages.MyText("You have a Premium Membership membership._setting_3")%>
                                                                    </div>
                                                                    <asp:Panel runat="server" ID="showhistory2Panel">
                                                                        <div id="showhistory" class="whitebtnleft whitebtnleft_settings">
                                                                            <div class="whitebtnright">
                                                                                <div onclick="openaccounthistory()" class="whitebtncenter upgradebtnclass2">
                                                                                    <%= Languages.MyText("Payment history_setting")%></div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="hidehistory" class="whitebtnleft displaynone whitebtnleft_settings">
                                                                            <div class="whitebtnright">
                                                                                <div onclick="closeaccounthistory()" class="whitebtncenter upgradebtnclass2">
                                                                                    <%= Languages.MyText("close_setting")%></div>
                                                                            </div>
                                                                        </div>                                                                  
                                                                    </asp:Panel>
                                                                </div>
                                                                <div class="regacccontentclass3">
                                                                    <asp:Repeater runat="server" ID="AccountPaymentRepeater">
                                                                        <HeaderTemplate>
                                                                            <div class="accounttableholderclass accountheaderbg">
                                                                                <div class="accountdateclass">
                                                                                    <%= Languages.MyText("Payment Date_setting")%></div>
                                                                                <div class="accountpaymentclass">
                                                                                    <%= Languages.MyText("Total Payment_setting")%></div>
                                                                                <div class="accountperiodclass">
                                                                                    <%= Languages.MyText("Premium Period_setting")%></div>
                                                                            </div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <div class="accounttableholderclass">
                                                                                <div class="accountdateclass">
                                                                                    <%# ((DateTime)Eval("accountdate")).ToString("dd/MM/yy") %></div>
                                                                                <div class="accountpaymentclass">
                                                                                    <%# Eval("accountpayment") + "$"%></div>
                                                                                <div class="accountperiodclass">
                                                                                    <%# Eval("accountperiod")+ " Months"%></div>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:Repeater>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="leftbottomblue">
                                                    </div>
                                                    <div class="bottomblue">
                                                    </div>
                                                    <div class="rightbottomblue">
                                                    </div>
                                                </div>
                                                <div runat="server" id="RegularAccDiv" class="tablebrownholder w670class">
                                                    <div class="lefttoptablebrown">
                                                    </div>
                                                    <div class="toptablebrown w658class">
                                                    </div>
                                                    <div class="righttoptablebrown">
                                                    </div>
                                                    <div class="lefttablebrown">
                                                        <div class="righttablebrown">
                                                            <div class="centertablebrown w638class">
                                                                <div class="regacccontentclass">
                                                                    <div class="regacccontenttextclass">
                                                                        <%= Languages.MyText("You have a Free Basic membership._setting")%>
                                                                    </div>
                                                                    <asp:Panel runat="server" ID="showhistoryPanel">
                                                                        <div id="showhistory" class="whitebtnleft whitebtnleft_settings">
                                                                            <div class="whitebtnright">
                                                                                <div onclick="openaccounthistory()" class="whitebtncenter upgradebtnclass2">
                                                                                    <%= Languages.MyText("Payment history_setting")%></div>
                                                                            </div>
                                                                        </div>
                                                                        <div id="hidehistory" class="whitebtnleft whitebtnleft_settings displaynone">
                                                                            <div class="whitebtnright">
                                                                                <div onclick="closeaccounthistory()" class="whitebtncenter upgradebtnclass2">
                                                                                    <%= Languages.MyText("close_setting")%></div>
                                                                            </div>
                                                                        </div>                                                                  
                                                                    </asp:Panel>
                                                                </div>
                                                                <div class="regacccontentclass3 ">
                                                                    <asp:Repeater runat="server" ID="AccountPaymentRepeater2">
                                                                        <HeaderTemplate>
                                                                            <div class="accounttableholderclass accountheaderbg2">
                                                                                <div class="accountdateclass">
                                                                                    <%= Languages.MyText("Payment Date_setting")%></div>
                                                                                <div class="accountpaymentclass">
                                                                                    <%= Languages.MyText("Total Payment_setting")%></div>
                                                                                <div class="accountperiodclass">
                                                                                    <%= Languages.MyText("Premium Period_setting")%></div>
                                                                            </div>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <div class="accounttableholderclass">
                                                                                <div class="accountdateclass">
                                                                                    <%# ((DateTime)Eval("accountdate")).ToString("dd/MM/yy") %></div>
                                                                                <div class="accountpaymentclass">
                                                                                    <%# Eval("accountpayment") + "$"%></div>
                                                                                <div class="accountperiodclass">
                                                                                    <%# Eval("accountperiod")+ " Months"%></div>
                                                                            </div>
                                                                        </ItemTemplate>
                                                                    </asp:Repeater>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="leftbottomtablebrown">
                                                    </div>
                                                    <div class="bottomtablebrown w658class">
                                                    </div>
                                                    <div class="rightbottomtablebrown">
                                                    </div>
                                                </div>
                                                <div class="settingintabcomment">
                                                    <asp:Literal runat="server" ID="settingaccstatdaysLiteral"></asp:Literal></div>
                                                <div class="Extendbtnclass">
                                                    <div class="Extendtextclass">
                                                      <%--  <asp:Literal runat="server" ID="OnTopBTNText"></asp:Literal>--%>
                                                    </div>
                                                    <div runat="server" id="Subcribebtn" class="yellowbtn39leftib">
                                                        <div class="yellowbtn39rightib">
                                                            <div runat="server" id="subscribebutton"  
                                                                class="yellowbtn39centerib yellowbtn39centertext">
                                                                <%= Languages.MyText("Subcribe _setting")%></div>
                                                        </div>
                                                    </div>
                                                    <div runat="server" id="Extendbtn" class="redbtn39left redbtn39left_settings">
                                                        <div class="redbtn39right redbtn39right_settings">
                                                            <div onclick='<%= "CloseFrom();window.parent.openMyprofile(\""+siteDefaults.GetLink("subscribe.aspx?status=2")+"\", \"680\", \"750\");" %>'
                                                                class="redbtn39center redbtn39center_settings redbtn39text">
                                                                <%= Languages.MyText("Extend_setting")%></div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="subscribbluebg subscribbluebgset">
                                                    <div class="subscribimg subscribimg1">
                                                    </div>
                                                    <div class="subscribtitle">
                                                        <%= Languages.MyText("Video Technology_setting")%>
                                                    </div>
                                                    <div class="subscribcontent">
                                                        <%= Languages.MyText("Spindate specialized in video technology_setting")%>
                                                    </div>
                                                    <div class="subscribvi">
                                                    </div>
                                                </div>
                                                <div class="subscribbluebg subscribbluebgset">
                                                    <div class="subscribimg subscribimg2">
                                                    </div>
                                                    <div class="subscribtitle">
                                                        <%= Languages.MyText("Unlimited Dates_setting")%></div>
                                                    <div class="subscribcontent">
                                                        <%= Languages.MyText("Get unlimited dates and make deeper connections_setting")%></div>
                                                    <div class="subscribvi">
                                                    </div>
                                                </div>
                                                <div class="subscribbluebg subscribbluebgset">
                                                    <div class="subscribimg subscribimg3">
                                                    </div>
                                                    <div class="subscribtitle">
                                                        <%= Languages.MyText("Meet People Fast_setting")%></div>
                                                    <div class="subscribcontent">
                                                        <%= Languages.MyText("Get unlimited dates and make deeper connections_setting")%></div>
                                                    <div class="subscribvi">
                                                    </div>
                                                </div>
                                                <div class="subscribbluebg subscribbluebgset">
                                                    <div class="subscribimg subscribimg4">
                                                    </div>
                                                    <div class="subscribtitle">
                                                        <%= Languages.MyText("Privacy_setting")%></div>
                                                    <div class="subscribcontent">
                                                        <%= Languages.MyText("Get unlimited dates and make deeper connections_setting")%></div>
                                                    <div class="subscribvi">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <%-- <span > Change Password Tab </span>--%>
                                    <div id="changepassword" class="settingintabholder">
                                        <div class="settingintabheader">
                                            <%= Languages.MyText("Change Password_setting")%></div>
                                        <div class="settingintabcomment2">
                                            <%= Languages.MyText("Change the password which you use to log in to Spindate_setting")%></div>
                                        <div class="SettingFormHolder settingpasswordholder">
                                            <asp:CustomValidator Display="None" ValidationGroup="ProfileGroup" runat="server"
                                                ID="CustomValidator2" ClientValidationFunction="checkpassword" ErrorMessage="eee"></asp:CustomValidator>
                                           
                                            <cmsr:MyTextBox Display="none" CssClass="SettingTextBox226" ValidationGroup="ProfileGroup"
                                                TextMode="Password"  runat="server" ID="OldPasswordTextBox" MaxLength="200" />
                                            <div class="passbold">
                                            <cmsr:MyTextBox Display="none" SelectExpresion="Password" CssClass="SettingTextBox226" ValidationGroup="ProfileGroup"
                                                    TextMode="Password" HasCompareTextBox="true" runat="server" ID="NewPassWordTextBox"
                                                    MaxLength="200" />
                                            </div>
                                        </div>
                                    </div>
                                    <%-- <span > Block Member Tab </span>--%>
                                    <div id="blockmem"  class="settingintabholder">
                                        <div class="mcs_containerClassblock" id="mcs_container">
                                            <div class="customScrollBox">
                                                <div class="container">
                                                    <div class="content">
                                                        <div class="content_inner_settings">
                                                            <asp:Repeater runat="server" ID="BlockMemberRepeater">
                                                                <ItemTemplate>
                                                                    <div class='<%# Eval("myuserid").ToString()==Session["memberid"].ToString()?"settingblockmemberholder":"settingblockmemberholder settingblockmemberholder2"   %>'>
                                                                        <div class="myimgframlbclass">
                                                                            <img onload='<%# "setimgposnew(this,"+  ( Eval("xvalue").ToString()==""?"0":Eval("xvalue").ToString() ) +","+( Eval("yvalue").ToString()==""?"0":Eval("yvalue").ToString() )+");"  %>'  src='<%# Eval("mymember").ToString()=="0" ? siteDefaults.SiteUrl+"/"+ Eval("imagelink").ToString().Replace("../","").Replace("spindateimages","blindateimages"):  methods.SetImage(Eval("imagelink").ToString().Replace("../","").Replace("_size0","_size1") , Eval("usergendor").ToString() ) %>'
                                                                                alt="Alternate Text" />
                                                                        </div>
                                                                        <div title='<%# Eval("userfirstname")+"("+ siteDefaults.GetRealAge( DateTime.Parse(Eval("userbirthday").ToString()))+")" %>'
                                                                            class='<%# Eval("myuserid").ToString()==Session["memberid"].ToString()?"myimgframgrayclass":"myimgframgrayclass myimgframgrayclass2"  %>'>
                                                                        </div>
                                                                        <div class="settingblockcontentholder">
                                                                            <div class="settingtitle">
                                                                                <img class="lobbyimg" src='<%# Eval("usergendor").ToString().ToLower()=="false"? "images/SiteImages/male.png":"images/SiteImages/female.png" %>' />
                                                                                <%#  "&nbsp;<span  class=\"blueclass fontbold\">" + (Eval("userfirstname").ToString().Length > 7 ? Eval("userfirstname").ToString().Remove(7) : Eval("userfirstname").ToString()) + "</span>" + (Eval("myuserid").ToString() == Session["memberid"].ToString() && CheckifChange(Eval("mymember").ToString()) ? ("&nbsp;<span class=\"redclass\"><span class=\"setitalic\">" + Languages.MyText(",Blocked _setting") + "</span>&nbsp;<span class=\"fontbold\">" + methods.GetDaysBetween2Dates(DateTime.Now, (DateTime)Eval("blockpublish")) + " " + Languages.MyText(" Days ago_setting") + "</span></span>") : "")%>
                                                                            </div>
                                                                            <div class="settingtitle">
                                                                                <%# "<span class=\"font11\">"+ Languages.MyText("Age:_setting")+"</span>" + "&nbsp;<span class=\"fontbold\" >" +  siteDefaults.GetRealAge( DateTime.Parse(Eval("userbirthday").ToString())) + "</span>"%>
                                                                                ,
                                                                                <%# "<span class=\"font11\">"+  Languages.MyText("From:_setting") + "</span>" + "&nbsp;<span class=\"fontbold\" >" + (methods.CheckIfImgExists(Eval("countryflage").ToString().Replace("../", "")) ? "&nbsp;<img title=\"" + Eval("mycountry") + "\" alt=\"" + Eval("mycountry") + "\" src=\"" + Eval("countryflage").ToString().Replace("../", "") + "\" />&nbsp;" : Eval("mycountry").ToString()) + " " + (Eval("countryid").ToString() == "230" ? Eval("mystate").ToString() : "") + "</span>"%>
                                                                            </div>
                                                                            <div id="Div2" runat="server" visible='<%#  !(Eval("myuserid").ToString() == Session["memberid"].ToString()) || !CheckifChange( Eval("mymember").ToString() ) %>'
                                                                                class="settingchangeblockclass">
                                                                                <%#  Eval("myuserid").ToString() == Session["memberid"].ToString() ? Languages.MyText("Block options changed_setting") : Languages.MyText("Block Removed_setting")%></div>
                                                                            <div runat="server" visible='<%#  Eval("myuserid").ToString() == Session["memberid"].ToString() &&  CheckifChange( Eval("mymember").ToString() ) %>'
                                                                                class="whitebtnleft setblockbtnholder">
                                                                                <div class="whitebtnright">
                                                                                    <div onclick='<%#   "window.parent.openMyprofile(\""+ siteDefaults.GetLink( "spindatereport.aspx?status=2&member="+ Eval("mymember").ToString()+"&back=" + (Request.QueryString["back"] != null?Request.QueryString["back"] :"setting"))+"\", \"640\", \"570\");"  %>'
                                                                                        class="whitebtncenter setbtnblocktext" >
                                                                                        <%# Languages.MyText("Remove Block_setting")%>
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="dragger_container_holder">
                                                    <div class="dragger_container displayblock">
                                                        <div class="dragger">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="leftbottomlb">
                        </div>
                        <div class="bottomlb">
                        </div>
                        <div class="rightbottomlb">
                        </div>
                        <%--  setting tabs menu--%>
                        <div class="SettingTabsHolderclass">
                            <div onclick="sowtab(this,'accountinfo1','block');" id="tab1" class="settingtabclass  settingtabclassinfo">
                                <%= Languages.MyText("Account Info_setting")%><%--<asp:Literal runat="server" ID="TabLiteral1"  ></asp:Literal>--%>
                            </div>
                            <div onclick="sowtab(this,'mailnotifi','block');" id="tab2" class="settingtabclass settingtabclasscenter settingtabresetclass">
                                <%= Languages.MyText("Email Notifications_setting")%><%--<asp:Literal runat="server" ID="TabLiteral2"></asp:Literal>--%>
                            </div>
                            <div onclick="sowtab(this,'accountstatus','none');" id="tab3" class="settingtabclass settingtabclasscenter settingtabresetclass">
                                <%= Languages.MyText("Account Status_setting")%><%--<asp:Literal runat="server" ID="TabLiteral3"></asp:Literal>--%>
                            </div>
                            <div onclick="sowtab(this,'changepassword','block');" id="tab4" class="settingtabclass settingtabclasscenter settingtabresetclass">
                                <%= Languages.MyText("Change Password_setting")%><%--<asp:Literal runat="server" ID="TabLiteral4"></asp:Literal>--%>
                            </div>
                            <div id="blockmemid" onclick="sowtab(this,'blockmem','none');" class="settingtabclass settingtabclassright settingtabresetclass">
                                <%= Languages.MyText("Blocked Members_setting")%><%--<asp:Literal runat="server" ID="TabLiteral5"></asp:Literal>--%>
                            </div>
                        </div>
                    </div>
                    <asp:HiddenField runat="server" ID="MyStatusHiddenField" />
                    <%--save button--%>
                    <div class="SettingBtnHolder">
                        <div class="whitebtnleft">
                            <div class="whitebtnright">
                                <asp:LinkButton runat="server" ID="SaveChanges" OnClientClick="checkpassword2();showsummarybox();"
                                    OnClick="SaveChanges_Click" ValidationGroup="ProfileGroup" CssClass="whitebtncenter settingsavebtnclass"><div class="settingsavebtnclass2"><%= Languages.MyText("Save changes_setting")%></div>
                                </asp:LinkButton>
                            </div>
                        </div>
                        <div id="settingsummary" class="tablebrownholder tablebrownholder_settings w430class">
                            <div class="lefttoptablebrown">
                            </div>
                            <div class="toptablebrown w418class">
                            </div>
                            <div class="righttoptablebrown">
                            </div>
                            <div class="lefttablebrown">
                                <div class="righttablebrown">
                                    <div class="centertablebrown w398class">
                                        <div class="regacccontentclass w330class">
                                            <asp:ValidationSummary DisplayMode="BulletList" CssClass="SetValidationSummaryClass"
                                                ValidationGroup="ProfileGroup" ID="ValidationSummary1" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="leftbottomtablebrown">
                            </div>
                            <div class="bottomtablebrown w418class">
                            </div>
                            <div class="rightbottomtablebrown">
                            </div>
                        </div>
                        <div class="blueholder settingblueholder">
                            <div class="lefttopblue">
                            </div>
                            <div class="topblue w418class">
                            </div>
                            <div class="righttopblue">
                            </div>
                            <div class="leftblue">
                                <div class="rightblue">
                                    <div class="centerblue w418class">
                                        <div class="giftalerttext">
                                            <%= Languages.MyText("Data saved succefully_setting")%></div>
                                    </div>
                                </div>
                            </div>
                            <div class="leftbottomblue">
                            </div>
                            <div class="bottomblue w418class">
                            </div>
                            <div class="rightbottomblue">
                            </div>
                        </div>
                        <div onclick="CloseFrom()" class="closeFormblue floatRight">
                            <%= Languages.MyText("Cancel_setting")%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="leftbottomwinw">
        </div>
        <div class="bottomwinw w691class">
        </div>
        <div class="rightbottomwinw">
        </div>
    </div>
    <script type="text/javascript">
        $(window).load(function () {
            mCustomScrollbars();
        });

        if (GetQueryStringParams('back') != '0') {
            sowtab($('#blockmemid'), 'blockmem','none');
        }

        var ispasswordcorrect = 'false';
        
        var password = $('#<%= OldPasswordTextBox.ClientID %>').val();                  
        
        var showcount = 0;       
        $('html').click(function () {
            showcount = showcount + 1;
            $('.settingblueholder').css('display', 'none');
            if (showcount > 1) {
                $('#settingsummary').css('display', 'none');
            }

        });
        function mCustomScrollbars() {
            $("#mcs_container").mCustomScrollbar("vertical", 200, "easeOutCirc", 1.25, "fixed", "yes", "no", 0);
            $("#mcs_containerset").mCustomScrollbar("vertical", 200, "easeOutCirc", 1.25, "fixed", "yes", "no", 0);
        }
        var MyStatusHiddenFieldid = '<%= MyStatusHiddenField.ClientID %>';

        var statedropid = '<%= ((HtmlGenericControl)AcountInfoMyForm.FindControl("statedrop")).ClientID %>';
    </script>
 
</asp:Content>
