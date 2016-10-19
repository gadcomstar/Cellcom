<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="ManageSystemParam.aspx.cs" Inherits="ManageSystemParam" %>
<%@ Register Src="tableControl.ascx" TagName="TableControl" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">

<asp:ScriptManager runat="server"></asp:ScriptManager>
		<br /><br />
	
     <cmsr:MyForm FormStatus="Update"  OnItemUpdated="SetParams"   BackButtonText="Back"  DataKeyField="idsystemparam" DataKeyFieldValue="1" VisibleSaveAndBackButton="false" SaveButtonText="Save" TableName="systemparam"  CssClass="AdminMyForm" runat="server" ID="BlogTypeMyForm" >
        <MessageTemplate>
            <div style="width:100%;height:500px;overflow-x:hidden;overflow-y:auto;margin-top:20px;float:left;">
                <div class="titlediv" >General Parameterss</div>
            <cmsr:MyCheckBox runat="server" CssClass="admincheckbox" ImageOff="../admin/images/SelectOff.png" ImageOn="../admin/images/SelectOn.png" ID="MyCheckBox1" DataFieldType="Bool" FieldName="Is has Date a Day" DataFieldName="hasDateFroDay" />            
                  <div class="commentdiv" >IF sign, Every user who join have fix number of date a day</div>
            <cmsr:MyTextBox DataFieldType="Number" CssClass="ManageTextBoxHolderDivClassLeft"   IsRequiredFieldValidator="true" RequiredFielderrorMessage="Date a day" SelectExpresion="Numeric" RegularExpressionErrorMessage="enter number"  DataFieldName="DateaDay" runat="server" ID="MyTextBox1" FieldName="Number Of Days" />                
            <div class="commentdiv" >Number of dates a day</div>
            <cmsr:MyCheckBox runat="server" CssClass="admincheckbox" ImageOff="../admin/images/SelectOff.png" ImageOn="../admin/images/SelectOn.png" ID="MyCheckBox2" DataFieldType="Bool" FieldName="Has Confirm Images" DataFieldName="hasConfirmPicture" />            
            <div class="commentdiv" >IF sign, Every image has to be confirm for apearing in the system</div>
            <cmsr:MyTextBox DataFieldType="String"   CssClass="ManageTextBoxHolderDivClassLeft" runat="server" DataFieldName="PayPalEmailAddress" ID="MyTextBox4" FieldName="PayPal account email:" />               
            <cmsr:MyTextBox DataFieldType="String"   CssClass="ManageTextBoxHolderDivClassLeft" runat="server" DataFieldName="idletime" ID="MyTextBox27" FieldName="Idle time:" />
            <div class="commentdiv" >Automatic logout,when there is no activity (10-59 minutes)</div>
                <cmsr:MyTextBox DataFieldType="String"   CssClass="ManageTextBoxHolderDivClassLeft" runat="server" DataFieldName="facebookAppID" ID="MyTextBox7" FieldName="Facebook AppID:" />
                  <div class="commentdiv" >AppID from facebook aplication (for login and load image function)</div>
            <cmsr:MyTextBox DataFieldType="String"   CssClass="ManageTextBoxHolderDivClassLeft" runat="server" DataFieldName="FacebookSecretID" ID="MyTextBox8" FieldName="Facebook Secret:" />                      
            <div class="commentdiv" >Secret from facebook aplication (for login and load image function)</div>

            <cmsr:MyTextBox DataFieldType="String"   CssClass="ManageTextBoxHolderDivClassLeft" runat="server" DataFieldName="twittercode" ID="MyTextBox25" FieldName="Twittet Code:" />
            <div class="commentdiv" >Code from Twitter aplication (for login and load image function)</div>
            <cmsr:MyTextBox DataFieldType="String"   CssClass="ManageTextBoxHolderDivClassLeft" runat="server" DataFieldName="twittersecret" ID="MyTextBox26" FieldName="Twitter Secret:" />                      
            <div class="commentdiv" >Secret from Twitter aplication (for login and load image function)</div>
            
                
                <div class="titlediv" >Lobby page Parameterss</div>
            <cmsr:MyTextBox DataFieldType="Number" SelectExpresion="Numeric" RegularExpressionErrorMessage="Only numbers"  CssClass="ManageTextBoxHolderDivClassLeft" runat="server" DataFieldName="showbdinLobbyminRooms" ID="MyTextBox2" FieldName="Number of rooms:" />                      
            <div class="commentdiv" >Minimum rooms in lobby when blinddate rooms won't be visible</div>
            <cmsr:MyTextBox DataFieldType="Number" SelectExpresion="Numeric" RegularExpressionErrorMessage="Only numbers"  CssClass="ManageTextBoxHolderDivClassLeft" runat="server" DataFieldName="joinroommax" ID="MyTextBox3" FieldName="Minimum joined rooms:" />                      
            <div class="commentdiv" >Minimum rooms a user can join in parallel</div>
            <div style="float:right;width:100%;">
            <cmsr:MyTextBox DataFieldType="Number" SelectExpresion="Numeric" RegularExpressionErrorMessage="Only numbers" IsRequiredFieldValidator="true" RequiredFielderrorMessage="enter field"  CssClass="ShortTextBox" runat="server" DataFieldName="Minutesbeforestartspin" ID="minutebeforeMyTextBox" FieldName="Delay time:" />                      
            <cmsr:MyTextBox DataFieldType="Number" SelectExpresion="Numeric" RegularExpressionErrorMessage="Only numbers" IsRequiredFieldValidator="true" RequiredFielderrorMessage="enter field"   CssClass="ShortTextBox2" runat="server" DataFieldName="Secondsbeforestartspin" ID="MyTextBox5" FieldName=" : " />                                      
            </div>
            <div class="commentdiv" >Time before the date cycle begin.</div>
       <div style="float:right;width:100%;">
            <cmsr:MyTextBox DataFieldType="Number" SelectExpresion="Numeric" RegularExpressionErrorMessage="Only numbers" IsRequiredFieldValidator="true" RequiredFielderrorMessage="enter field"  CssClass="ShortTextBox" runat="server" DataFieldName="SpinDatetime" ID="DateMyTextBox" FieldName="Date Time:" />                      
            <cmsr:MyTextBox DataFieldType="Number" SelectExpresion="Numeric" RegularExpressionErrorMessage="numbers" IsRequiredFieldValidator="true" RequiredFielderrorMessage="enter field"  CssClass="ShortTextBox2" runat="server" DataFieldName="SpinDatetime2" ID="MyTextBox6" FieldName=" : " />                      
           </div>
            <cmsr:MyTextBox DataFieldType="Number" SelectExpresion="Numeric" RegularExpressionErrorMessage="Only numbers"  CssClass="ManageTextBoxHolderDivClassLeft" runat="server" DataFieldName="roomshowleavebtn" ID="MyTextBox22" FieldName="Leave button Time(sec):" />                      
            <div class="commentdiv" >The time in chat the leave button is enable.</div>


            <div class="titlediv" >Blinddate page Parameterss</div>
            <cmsr:MyTextBox DataFieldType="Number" SelectExpresion="Numeric" RegularExpressionErrorMessage="Only numbers"  CssClass="ManageTextBoxHolderDivClassLeft" runat="server" DataFieldName="blindroomtime" ID="BlogTypeName" FieldName="Room Time:" />                      
          <div class="commentdiv" >Room time before its start</div>
        <cmsr:MyTextBox DataFieldType="Number" SelectExpresion="Numeric" RegularExpressionErrorMessage="Only numbers"  CssClass="ManageTextBoxHolderDivClassLeft" runat="server" DataFieldName="blindaddmunutetoroom" ID="MyTextBox24" FieldName="Room New Time:" />                      
          <div class="commentdiv" >Restart room time,if there is one member</div>

             <div style="float:right;width:100%;">
            <cmsr:MyTextBox DataFieldType="Number" SelectExpresion="Numeric" RegularExpressionErrorMessage="Only numbers" IsRequiredFieldValidator="true" RequiredFielderrorMessage="enter field"  CssClass="ShortTextBox" runat="server" DataFieldName="blindbeforemin" ID="MyTextBox13" FieldName="Delay Time:" />                      
            <cmsr:MyTextBox DataFieldType="Number" SelectExpresion="Numeric" RegularExpressionErrorMessage="numbers" IsRequiredFieldValidator="true" RequiredFielderrorMessage="enter field"  CssClass="ShortTextBox2" runat="server" DataFieldName="blindbeforesec" ID="MyTextBox14" FieldName=" : " />                      
           </div>
            <div style="float:right;width:100%;">
            <cmsr:MyTextBox DataFieldType="Number" SelectExpresion="Numeric" RegularExpressionErrorMessage="Only numbers" IsRequiredFieldValidator="true" RequiredFielderrorMessage="enter field"  CssClass="ShortTextBox" runat="server" DataFieldName="blinddatemin" ID="MyTextBox15" FieldName="Date Time:" />                      
            <cmsr:MyTextBox DataFieldType="Number" SelectExpresion="Numeric" RegularExpressionErrorMessage="numbers" IsRequiredFieldValidator="true" RequiredFielderrorMessage="enter field"  CssClass="ShortTextBox2" runat="server" DataFieldName="blinddatesec" ID="MyTextBox16" FieldName=" : " />                      
           </div>
            <cmsr:MyTextBox DataFieldType="Number" SelectExpresion="Numeric" RegularExpressionErrorMessage="Only numbers"  CssClass="ManageTextBoxHolderDivClassLeft" runat="server" DataFieldName="blindshowleavebtn" ID="MyTextBox23" FieldName="Leave button Time(sec):" />                      
            <div class="commentdiv" >The time in chat the leave button is enable.</div>

           <div class="titlediv" >Online page Parameterss</div>
          
                 <div style="float:right;width:100%;">
            <cmsr:MyTextBox DataFieldType="Number" SelectExpresion="Numeric" RegularExpressionErrorMessage="Only numbers" IsRequiredFieldValidator="true" RequiredFielderrorMessage="enter field"  CssClass="ShortTextBox" runat="server" DataFieldName="onlinecycle" ID="OnlineTimeMyTextBox" FieldName="Invitation time(sec):" />                      
                     </div>
             <div style="float:right;width:100%;">
            <cmsr:MyTextBox DataFieldType="Number" SelectExpresion="Numeric" RegularExpressionErrorMessage="Only numbers" IsRequiredFieldValidator="true" RequiredFielderrorMessage="enter field"  CssClass="ShortTextBox" runat="server" DataFieldName="onlinebeforemin" ID="MyTextBox9" FieldName="Delay Time:" />                      
            <cmsr:MyTextBox DataFieldType="Number" SelectExpresion="Numeric" RegularExpressionErrorMessage="numbers" IsRequiredFieldValidator="true" RequiredFielderrorMessage="enter field"  CssClass="ShortTextBox2" runat="server" DataFieldName="onlinebeforesec" ID="MyTextBox10" FieldName=" : " />                      
           </div>
            <div style="float:right;width:100%;">
            <cmsr:MyTextBox DataFieldType="Number" SelectExpresion="Numeric" RegularExpressionErrorMessage="Only numbers" IsRequiredFieldValidator="true" RequiredFielderrorMessage="enter field"  CssClass="ShortTextBox" runat="server" DataFieldName="onlinedatemin" ID="MyTextBox11" FieldName="Date Time:" />                      
            <cmsr:MyTextBox DataFieldType="Number" SelectExpresion="Numeric" RegularExpressionErrorMessage="numbers" IsRequiredFieldValidator="true" RequiredFielderrorMessage="enter field"  CssClass="ShortTextBox2" runat="server" DataFieldName="onlinedatesec" ID="MyTextBox12" FieldName=" : " />                      
           </div>
            <cmsr:MyTextBox DataFieldType="Number" SelectExpresion="Numeric" RegularExpressionErrorMessage="Only numbers"  CssClass="ManageTextBoxHolderDivClassLeft" runat="server" DataFieldName="onlineshowleavebtn" ID="MyTextBox21" FieldName="Leave button Time(sec):" />                      
            <div class="commentdiv" >The time in chat the leave button is enable.</div>

            <div class="titlediv" >Favourites page Parameterss</div>

          
             <div style="float:right;width:100%;">
            <cmsr:MyTextBox DataFieldType="Number" SelectExpresion="Numeric" RegularExpressionErrorMessage="Only numbers" IsRequiredFieldValidator="true" RequiredFielderrorMessage="enter field"  CssClass="ShortTextBox" runat="server" DataFieldName="favobeforemin" ID="MyTextBox17" FieldName="Delay Time:" />                      
            <cmsr:MyTextBox DataFieldType="Number" SelectExpresion="Numeric" RegularExpressionErrorMessage="numbers" IsRequiredFieldValidator="true" RequiredFielderrorMessage="enter field"  CssClass="ShortTextBox2" runat="server" DataFieldName="favobeforesec" ID="MyTextBox18" FieldName=" : " />                      
           </div>
            <div style="float:right;width:100%;">
            <cmsr:MyTextBox DataFieldType="Number" SelectExpresion="Numeric" RegularExpressionErrorMessage="Only numbers" IsRequiredFieldValidator="true" RequiredFielderrorMessage="enter field"  CssClass="ShortTextBox" runat="server" DataFieldName="favodatemin" ID="MyTextBox19" FieldName="Date Time:" />                      
            <cmsr:MyTextBox DataFieldType="Number" SelectExpresion="Numeric" RegularExpressionErrorMessage="numbers" IsRequiredFieldValidator="true" RequiredFielderrorMessage="enter field"  CssClass="ShortTextBox2" runat="server" DataFieldName="favodatesec" ID="MyTextBox20" FieldName=" : " />                      
           </div>

             </div>         
   
        </MessageTemplate>
    </cmsr:MyForm>
  
</asp:Content>

