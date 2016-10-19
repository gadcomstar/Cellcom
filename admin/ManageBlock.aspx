<%@ Page Title="" Language="C#" MasterPageFile="~/admin/admin.master" AutoEventWireup="true" ValidateRequest="false" CodeFile="ManageBlock.aspx.cs" Inherits="ManageBlock" %>
<%@ Register Src="tableControl.ascx" TagName="TableControl" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="main" Runat="Server">

<asp:ScriptManager runat="server"></asp:ScriptManager>
		<br /><br />
	<div style="width:100%;position:relative;">
   <div style="position:absolute;left:-140px;width:140px;">
       <div class="selectmenutext setselected" onclick="showtable('block1',this);" >user blocks</div>
       <div class="selectmenutext"  onclick="showtable('block2',this);" >users who block</div>
       <div class="selectmenutext"  onclick="showtable('block3',this);" >user reports</div>
       <div class="selectmenutext"  onclick="showtable('block4',this);" >users who report</div>
   </div>
         <div style="width:100%;height:20px;">
        <a class="backLinkClass" runat="server" id="backhref" href="" >back</a>
        </div>
       <div  class="Header" runat="server" id="userHeader" ></div>
    <br />
    <div style="display:block" id="block1">
   <cc1:TableControl ID="LangTableControl" SortBy="blockpublish desc" DisplayWidth="800"  IsDelField="false" TableTitle="User Blocked table"   runat="server" IsExcelExportable="false"  TblName="blockmembers" SqlFieldNames="userfirstname,userlastname, isblocked,isHide,isUnfavorite,isreported,blockpublish" FieldsToShow="1,1,1,1,1,1,1" TblHeaderNames="First name,Last name,Blocked,Hide,Unfavourite,Report Abused,Update Date " SqlFieldType="1,1,2,2,2,2,1" CustomField=",,,,,," IdField="memberid"   MaxResPerPage="10"  />	
    <br />
        </div>
    <div style="display:none" id="block2">
     <cc1:TableControl ID="ReportMeTableControl" SortBy="blockpublish desc" DisplayWidth="800"  IsDelField="false" TableTitle="Users who blocked user"   runat="server" IsExcelExportable="false"  TblName="blockmembers" SqlFieldNames="userfirstname,userlastname, isblocked,isHide,isUnfavorite,isreported,blockpublish,blockmembers.userid as myid" FieldsToShow="1,1,1,1,1,1,1,1" TblHeaderNames="First name,Last name,Blocked,Hide,Unfavourite,Report Abused,Update Date, " SqlFieldType="1,1,2,2,2,2,1,1" CustomField=",,,,,,,<a>" IdField="blockmemberid"   MaxResPerPage="10"  />	
      <br />
        </div>
     <div style="display:none" id="block3">
      <cc1:TableControl ID="ReportAbusedTableControl" SortBy="blockpublish desc" DisplayWidth="800"  IsDelField="false" TableTitle="User report abused table"   runat="server" IsExcelExportable="false"  TblName="blockmembers" SqlFieldNames="userfirstname,userlastname,reportext,blockpublish" FieldsToShow="1,1,1,1" TblHeaderNames="First name,Last name,Reprot abused content,Update Date " SqlFieldType="1,1,1,1" CustomField=",,," IdField="memberid"   MaxResPerPage="10"  />	
    <br />
         </div>

     <div style="display:none" id="block4">
     <cc1:TableControl ID="ReportAbusedMeTableControl" SortBy="blockpublish desc" DisplayWidth="800"  IsDelField="false" TableTitle="Users who report abused user"   runat="server" IsExcelExportable="false"  TblName="blockmembers" SqlFieldNames="userfirstname,userlastname,reportext,blockpublish,blockmembers.userid as myid" FieldsToShow="1,1,1,1,1" TblHeaderNames="First name,Last name,Reprot abused content,Update Date, " SqlFieldType="1,1,1,1,1" CustomField=",,,,,,,<a>" IdField="blockmemberid"   MaxResPerPage="10"  />	
      <br />
         </div>
        </div>
    <script type="text/javascript">
        function showtable(block,sender)
        {
            $('#block1').css('display', 'none');            
            $('#block2').css('display', 'none');
            $('#block3').css('display', 'none');
            $('#block4').css('display', 'none');
            $('.selectmenutext').removeClass('setselected');

            $('#' + block).css('display', 'block');
            $( sender).addClass('setselected');

        }

    </script>
</asp:Content>

