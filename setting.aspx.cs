using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Globalization;
using System.Threading;

public partial class setting : System.Web.UI.Page
{
    DataSet ds = new DataSet();
    DataView dv;  
    int memberid;
    string mydays = "27 days";
    string userdata = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        
        if (Session["memberid"] != null)
        {
            int.TryParse(Session["memberid"].ToString(), out memberid);
            Repeater myAccountRepeater = new Repeater();
            if (methods.MemberList[memberid].AccountStatus != 2)
            {
                RegularAccDiv.Visible = true;
                PremiumAccDiv.Visible = false;
                settingaccstatdaysLiteral.Text = Languages.MyText("Members who subscribe get Unlimited Features. Subscribe now and get:_setting"); // siteDefaults.GetGeneralText("mydays").Replace("mydays", "<span style=\"font-weight:bold\">" + mydays + "</span>"); ;
                // OnTopBTNText.Text = Languages.MyText("Subscribe Now_setting");
                Subcribebtn.Visible = true;
                Extendbtn.Visible = false;
                myAccountRepeater = AccountPaymentRepeater2;
                subscribebutton.Attributes["onclick"] = "CloseFrom();window.parent.openMyprofile(\"" + siteDefaults.GetLink("subscribe.aspx?status=1") + "\", \"680\", \"750\");";
            }
            else if (methods.MemberList[memberid].AccountStatus == 2)
            {
                RegularAccDiv.Visible = false;
                PremiumAccDiv.Visible = true;
                settingaccstatdaysLiteral.Text = siteDefaults.GetGeneralText("mydays").Replace("mydays", "<span style=\"font-weight:bold\">" + mydays + "</span>"); ;
                // OnTopBTNText.Text = Languages.MyText("Extend your account now!");
                Subcribebtn.Visible = false;
                Extendbtn.Visible = true;
                myAccountRepeater = AccountPaymentRepeater;

            }
            EmailNotMyForm.DataKeyField = "memberid";
            EmailNotMyForm.DataKeyFieldValue = int.Parse(Session["memberid"].ToString());


            ((ASP.controls_cmstrcheckbox_ascx)EmailNotMyForm.FindControl("membersendmsg")).FieldName = Languages.MyText("When a member send me a message_setting");
            ((ASP.controls_cmstrcheckbox_ascx)EmailNotMyForm.FindControl("FavouriteCBMyCheckBox")).FieldName = Languages.MyText("When a member favourites me_setting");
            ((ASP.controls_cmstrcheckbox_ascx)EmailNotMyForm.FindControl("NewFeatureMyCheckBox")).FieldName = Languages.MyText("When Spindate offers new features_setting");
            AcountInfoMyForm.DataKeyFieldValue = int.Parse(Session["memberid"].ToString());

            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("CountriesMyDropDown")).DataTextField = "myCountry";
            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("CountriesMyDropDown")).DataValueField = "countryid";
            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("StateMyDropDown")).DataTextField = "stateText";
            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("StateMyDropDown")).DataValueField = "stateid";
            // ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("StateMyDropDown")).SelectedValue = "1";
            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("LangMyDropDown")).DataTextField = "langText";
            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("LangMyDropDown")).DataValueField = "idtbllang";

            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("LangMyDropDown2")).DataTextField = "langText";
            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("LangMyDropDown2")).DataValueField = "idtbllang";

            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("RelationMyDropDown")).DataTextField = "FieldText";
            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("RelationMyDropDown")).DataValueField = "idmydropdownvalues";
            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown2")).DataTextField = "FieldText";
            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown2")).DataValueField = "idmydropdownvalues";
            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown3")).DataTextField = "FieldText";
            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown3")).DataValueField = "idmydropdownvalues";

            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown4")).DataTextField = "FieldText";
            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown4")).DataValueField = "idmydropdownvalues";

            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown5")).DataTextField = "FieldText";
            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown5")).DataValueField = "idmydropdownvalues";

            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown6")).DataTextField = "FieldText";
            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown6")).DataValueField = "idmydropdownvalues";

            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown7")).DataTextField = "FieldText";
            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown7")).DataValueField = "idmydropdownvalues";

            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown8")).DataTextField = "FieldText";
            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown8")).DataValueField = "idmydropdownvalues";

            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown9")).DataTextField = "FieldText";
            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown9")).DataValueField = "idmydropdownvalues";

            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown10")).DataTextField = "FieldText";
            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown10")).DataValueField = "idmydropdownvalues";

            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown11")).DataTextField = "FieldText";
            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown11")).DataValueField = "idmydropdownvalues";

            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown12")).DataTextField = "FieldText";
            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown12")).DataValueField = "idmydropdownvalues";




            CustomValidator2.ErrorMessage = Languages.MyText("Password isn't correct_setting");
            OldPasswordTextBox.FieldName = Languages.MyText("Old Password:_setting");
            NewPassWordTextBox.FieldName = Languages.MyText("New Password:_setting");
            NewPassWordTextBox.CompareFieldName = Languages.MyText("Confirm:_setting");
            NewPassWordTextBox.CompareValidationMessage = Languages.MyText("the password confirm text is not valid_setting");
            NewPassWordTextBox.RegularExpressionErrorMessage = Languages.MyText("Enter Password at least 6 chars (numbers and english chars)_setting");
            #region setting info text info
            ((ASP.controls_cmstrtextboxcontrol_ascx)AcountInfoMyForm.FindControl("FirstNameTextBox")).FieldName = Languages.MyText("First Name:_setting");
            ((ASP.controls_cmstrtextboxcontrol_ascx)AcountInfoMyForm.FindControl("FirstNameTextBox")).RequiredFielderrorMessage = Languages.MyText("First Name is requird_setting");
            ((ASP.controls_cmstrtextboxcontrol_ascx)AcountInfoMyForm.FindControl("LastNameTextBox")).FieldName = Languages.MyText("Last Name:_setting");
            ((ASP.controls_cmstrtextboxcontrol_ascx)AcountInfoMyForm.FindControl("LastNameTextBox")).RequiredFielderrorMessage = Languages.MyText("Last Name is requird_setting");
            ((ASP.controls_cmstrtextboxcontrol_ascx)AcountInfoMyForm.FindControl("EmailTextBox")).FieldName = Languages.MyText("Email Address:_setting");
            ((ASP.controls_cmstrtextboxcontrol_ascx)AcountInfoMyForm.FindControl("EmailTextBox")).RequiredFielderrorMessage = Languages.MyText("Email is requird_setting");
            ((ASP.controls_cmstrtextboxcontrol_ascx)AcountInfoMyForm.FindControl("EmailTextBox")).RegularExpressionErrorMessage = Languages.MyText("Email is not Valid_setting");
            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("CountriesMyDropDown")).FieldName = Languages.MyText("Country:_setting");
            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("StateMyDropDown")).FieldName = Languages.MyText("State:_setting");
            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("LangMyDropDown")).FieldName = Languages.MyText("Your Language:_setting");
            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("LangMyDropDown2")).FieldName = Languages.MyText("Second Language:_setting");
            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("RelationMyDropDown")).FieldName = Languages.MyText("Relationship:_setting");
            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown2")).FieldName = Languages.MyText("Sexuality:_setting");
            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown3")).FieldName = Languages.MyText("Hair color:_setting");
            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown4")).FieldName = Languages.MyText("Eye color:_setting");
            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown5")).FieldName = Languages.MyText("Height(cm):_setting");
            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown6")).FieldName = Languages.MyText("Body type:_setting");
            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown7")).FieldName = Languages.MyText("Living :_setting");
            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown8")).FieldName = Languages.MyText("Children :_setting");
            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown9")).FieldName = Languages.MyText("Smoking:_setting");
            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown10")).FieldName = Languages.MyText("Do you drink?_setting");
            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown11")).FieldName = Languages.MyText("Ethnicity:_setting");
            ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown12")).FieldName = Languages.MyText("Education:_setting");



            ((ASP.controls_cmstrtextboxcontrol_ascx)AcountInfoMyForm.FindControl("AboutMeMyTextBox")).FieldName = Languages.MyText("About Me:_setting");
            ((ASP.controls_cmstrtextboxcontrol_ascx)AcountInfoMyForm.FindControl("lookingforMyTextBox")).FieldName = Languages.MyText("Looking for:_setting");


            ((ASP.controls_cmstrdatepeaker2webusercontrol_ascx)AcountInfoMyForm.FindControl("mypeaker")).DayText = Languages.MyText("Day_Default");
            ((ASP.controls_cmstrdatepeaker2webusercontrol_ascx)AcountInfoMyForm.FindControl("mypeaker")).MonthText = Languages.MyText("Month_Default");
            ((ASP.controls_cmstrdatepeaker2webusercontrol_ascx)AcountInfoMyForm.FindControl("mypeaker")).YearText = Languages.MyText("Year_Default");
            ((ASP.controls_cmstrdatepeaker2webusercontrol_ascx)AcountInfoMyForm.FindControl("mypeaker")).Culture = Master.Culture;
            ((ASP.controls_cmstrcheckbox_ascx)AcountInfoMyForm.FindControl("GenderMyDropDown")).ImageOffAlt = Languages.MyText("male_setting");
            ((ASP.controls_cmstrcheckbox_ascx)AcountInfoMyForm.FindControl("GenderMyDropDown")).ImageOnAlt = Languages.MyText("female_setting");
            ((ASP.controls_cmstrcheckbox_ascx)AcountInfoMyForm.FindControl("GenderMyDropDown")).HasToolTip = true;
            ((ASP.controls_cmstrtrippleselect_ascx)AcountInfoMyForm.FindControl("SeekingMyDropDown")).ImageAlt1 = Languages.MyText("male_setting");
            ((ASP.controls_cmstrtrippleselect_ascx)AcountInfoMyForm.FindControl("SeekingMyDropDown")).ImageAlt2 = Languages.MyText("female_setting");
            ((ASP.controls_cmstrtrippleselect_ascx)AcountInfoMyForm.FindControl("SeekingMyDropDown")).ImageAlt3 = Languages.MyText("male&female_setting");
            ((ASP.controls_cmstrtrippleselect_ascx)AcountInfoMyForm.FindControl("SeekingMyDropDown")).HasToolTip = true;

            #endregion

            using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
            {
                string sql = "Select idtbllang,`" + Master.MyLangauge + "` as langText From tbllang where showlang=true ";
                MySqlDataAdapter da = new MySqlDataAdapter(sql, conn);
                da.Fill(ds, "lang");
                dv = ds.Tables["lang"].DefaultView;
                ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("LangMyDropDown")).DataSource = dv;
                ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("LangMyDropDown2")).DataSource = dv;

                sql = "Select listid,idmydropdownvalues,`" + Master.MyLangauge + "` as FieldText From mydropdownvalues ";
                da = new MySqlDataAdapter(sql, conn);
                da.Fill(ds, "relationship");
                dv = ds.Tables["relationship"].DefaultView;
                dv.RowFilter = "listid=1";
                ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("RelationMyDropDown")).DataSource = dv;
                DataView dv2 = new DataView(dv.Table);
                dv2.RowFilter = "listid=2";
                ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown2")).DataSource = dv2;
                DataView dv3 = new DataView(dv.Table);
                dv3.RowFilter = "listid=3";
                ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown3")).DataSource = dv3;
                DataView dv4 = new DataView(dv.Table);
                dv4.RowFilter = "listid=4";
                ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown4")).DataSource = dv4;
                DataView dv5 = new DataView(dv.Table);
                dv5.RowFilter = "listid=5";
                ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown5")).DataSource = dv5;
                DataView dv6 = new DataView(dv.Table);
                dv6.RowFilter = "listid=6";
                ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown6")).DataSource = dv6;
                DataView dv7 = new DataView(dv.Table);
                dv7.RowFilter = "listid=7";
                ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown7")).DataSource = dv7;
                DataView dv8 = new DataView(dv.Table);
                dv8.RowFilter = "listid=8";
                ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown8")).DataSource = dv8;
                DataView dv9 = new DataView(dv.Table);
                dv9.RowFilter = "listid=9";
                ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown9")).DataSource = dv9;
                DataView dv10 = new DataView(dv.Table);
                dv10.RowFilter = "listid=10";
                ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown10")).DataSource = dv10;
                DataView dv11 = new DataView(dv.Table);
                dv11.RowFilter = "listid=11";
                ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown11")).DataSource = dv11;
                DataView dv12 = new DataView(dv.Table);
                
                dv12.RowFilter = "listid=12";
                ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("MyDropDown12")).DataSource = dv12;


              

                sql = "Select  `" + Master.MyLangauge + "` as myCountry,countryid,countryflage From countries Where countryshow=1";
                da = new MySqlDataAdapter(sql, conn);
                da.Fill(ds, "countries");
                dv = ds.Tables["countries"].DefaultView;
                ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("CountriesMyDropDown")).DataSource = dv;

                sql = "Select stateid,`" + Master.MyLangauge + "` as stateText From states where ShowState=true ";
                da = new MySqlDataAdapter(sql, conn);
                da.Fill(ds, "states");
                dv = ds.Tables["states"].DefaultView;
                ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("StateMyDropDown")).DataSource = dv;

                string oraddremoved = "";
                if (Request.QueryString["back"] != null)
                {
                    string[] myids = Request.QueryString["back"].ToString().Split('_');
                    foreach (string checkid in myids)
                    {
                        oraddremoved += " OR tblusers.userid=" + checkid;
                    }
                }
                sql = String.Format("Select  xvalue,yvalue, countries.{3} as mycountry,states.{3} as mystate, imagelink,usergendor,userfirstname,blockpublish,userbirthday,countryid,countryflage,blockmembers.memberid as mymember,blockmembers.userid as myuserid From (((tblusers Left join blockmembers On blockmembers.memberid=tblusers.userid) left join userimages On  userimages.iduserimages=tblusers.userprofileimage {2} )   left join countries  On countries.countryid=tblusers.usercountry) left join states On  states.stateid=tblusers.userstate  Where blockmembers.userid={0} {1} order by blockmembers.memberid", Session["memberid"], oraddremoved, siteDefaults.GetConfirmQuery(), Master.MyLangauge);
                conn.Open();
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                MySqlDataReader dr = cmd.ExecuteReader();
                BlockMemberRepeater.DataSource = dr;
                BlockMemberRepeater.DataBind();

                dr.Close();
                cmd.CommandText = "Select accountdate,accountpayment,accountperiod From tblaccount Where ispaid=true AND memberid=" + memberid;
                dr = cmd.ExecuteReader();
                myAccountRepeater.DataSource = dr;
                myAccountRepeater.DataBind();
                if (myAccountRepeater.Items.Count == 0)
                {
                    showhistoryPanel.Visible = false;
                    myAccountRepeater.Visible = false;
                    showhistory2Panel.Visible = false;
                
                }

                dr.Close();
                cmd.CommandText = "Select `" + Master.MyLangauge + "` as myText,+fieldname,fieldtext,idtbluserfield From tbluserfield order by fieldorder";
                dr = cmd.ExecuteReader();
                ((Repeater)AcountInfoMyForm.FindControl("FieldRepeater")).DataSource = dr;
                ((Repeater)AcountInfoMyForm.FindControl("FieldRepeater")).DataBind();

               
                conn.Close();
            }

            for (int i = 100; i < 210; i++)
            {
                ListItem LI = new ListItem();
                LI.Text = i.ToString();
                LI.Value = i.ToString();
            }
        }
    }
   

    protected void DataMyHiddenField_PreRender(object sender, EventArgs e)
    {

        userdata = ((ASP.controls_cmstrhiddenfield_ascx)AcountInfoMyForm.FindControl("DataMyHiddenField")).Value;
        Dictionary<int, string> userDataDictionary = new Dictionary<int, string>();
        string[] userDataArray = userdata.Split(']');
        foreach (string myString in userDataArray)
        {
            string[] userDataKeyValue = myString.Split('[');
            if (userDataKeyValue.Length == 2)
            {
                int myKey = int.Parse( userDataKeyValue[0]);
                string myValue = userDataKeyValue[1];
                userDataDictionary.Add(myKey, myValue);            
            }
        }
        for (int i = 0; i < ((Repeater)AcountInfoMyForm.FindControl("FieldRepeater")).Items.Count; i++)
        {
            if (userDataDictionary.ContainsKey(int.Parse(((HiddenField)((Repeater)AcountInfoMyForm.FindControl("FieldRepeater")).Items[i].FindControl("MyID")).Value)))
            {
                ((ASP.controls_cmstrtextboxcontrol_ascx)((Repeater)AcountInfoMyForm.FindControl("FieldRepeater")).Items[i].FindControl("StatusMyTextBox")).Text = userDataDictionary[int.Parse(((HiddenField)((Repeater)AcountInfoMyForm.FindControl("FieldRepeater")).Items[i].FindControl("MyID")).Value)];
            }
        }
     
    }
    protected void Country_PreRender(object sender, EventArgs e)
    {

        string a = ((ASP.controls_cmstrdropdowncontrol2_ascx)AcountInfoMyForm.FindControl("CountriesMyDropDown")).SelectedValue;
        if (a=="230")
        {
            ((HtmlGenericControl)AcountInfoMyForm.FindControl("statedrop")).Style["display"] = "block";
        }
        else
        {

            ((HtmlGenericControl)AcountInfoMyForm.FindControl("statedrop")).Style["display"] = "none";
        }
    }
    protected void SavePassword(object sender, EventArgs e)
    {
        if (OldPasswordTextBox.Text.Trim() != "")
        {
            string mypassword = OldPasswordTextBox.Text.Replace(",", "''");
            bool validpass = false;
            using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
            {
                string sql = String.Format("Select userpassword From tblusers where userid={0} AND userpassword='{1}' ", Session["memberid"], mypassword);
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                conn.Open();

                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    validpass = true;
                }
                dr.Close();
                if (!validpass)
                {
                    //CustomValidator1.IsValid = false;
                    //CustomValidator1.ErrorMessage = "password is incorect";
                }
                else
                {
                  
                    string newpassword = NewPassWordTextBox.Text.Replace("'", "''").Trim();
                    if (newpassword != "")
                    {
                        cmd.CommandText = String.Format("Update tblusers Set userpassword='{0}' where userid={1}", newpassword, Session["memberid"]);
                        cmd.ExecuteNonQuery();
                    }

                }

                conn.Close();
            }
        }

    }
    protected void SaveChanges_Click(object sender, EventArgs e)
    {
       // Session["blockChangeid"] = null;
        string myFieldData = "";
        for (int i = 0; i < ((Repeater)AcountInfoMyForm.FindControl("FieldRepeater")).Items.Count; i++)
        {
            myFieldData += ((HiddenField)((Repeater)AcountInfoMyForm.FindControl("FieldRepeater")).Items[i].FindControl("MyID")).Value + "[" + ((ASP.controls_cmstrtextboxcontrol_ascx)((Repeater)AcountInfoMyForm.FindControl("FieldRepeater")).Items[i].FindControl("StatusMyTextBox")).Text.Replace("[", "{").Replace("]", "}").Replace("'", "''") + "]";
        }
        ((ASP.controls_cmstrhiddenfield_ascx)AcountInfoMyForm.FindControl("DataMyHiddenField")).Value = myFieldData;
        AcountInfoMyForm.CalldoClick();       
        EmailNotMyForm.CalldoClick();
        if (OldPasswordTextBox.Text != "")
        {
            SavePassword(sender, e);
        }

        if (IsPostBack)
        {
            if (!string.IsNullOrEmpty(MyStatusHiddenField.Value))
            {

                string _startjs = MyStatusHiddenField.Value.Replace("\"", "'");
                Page.ClientScript.RegisterStartupScript(GetType(), "MyStatus", _startjs, true);
            }
        }
        string _js = "$('.settingblueholder').css('display','block');";
        Page.ClientScript.RegisterStartupScript(GetType(), "savedata", _js, true);
    }
    protected bool CheckifChange( string myid)
    {
        bool isChange = true;
      
        if (Request.QueryString["back"] != null)
        {
            string[] myids = Request.QueryString["back"].ToString().Split('_');
            foreach(string checkid in myids)
            {

                if (myid.Trim() == checkid.Trim())
                {
                    isChange = false;
                
                }            
            }        
        }

        return isChange;       
    
    }

    protected void CheckEmail(string myid)
    {

        bool isUpdated =  methods.AddMember(memberid);
        bool changeEmail = false;
        string mycode = "";
        string myname = "";
        string mymail = "";
        using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
        {
            string sql = String.Format("Select userfirstname,useremail,useremail2 From tblusers where userid={0} ", myid);
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            conn.Open();
            MySqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                mymail = dr["useremail"].ToString();
                myname = dr["userfirstname"].ToString();
                if (dr["useremail2"].ToString() != dr["useremail"].ToString())
                {                  
                    changeEmail = true;
                    mycode = Guid.NewGuid().ToString();
                }
                dr.Close();
                if (changeEmail)
                {
                    cmd.CommandText = String.Format("Update tblusers Set IsPassSecondPage=false,confirmcode='{1}' where userid={0}", myid, mycode);
                    cmd.ExecuteNonQuery();
                }
            }
        }
        if (changeEmail)
        {

            methods.MemberList[memberid].IsPassFirstStage = false;
           
            string golink = siteDefaults.SiteUrl + "/lobby.aspx" + "?mycode=" + mycode;
            string gobutton = "<a href=\"" + golink + "\" style=\"font-weight:bold;\" >" + Languages.MyText("Press Here_setting") + "</a>";
            string body = Languages.MyText("Confirm Letter [[mylink]],[[myname]],[[mybutton]]_setting_3").Replace("[[mylink]]", "{" + golink + "}").Replace("[[myname]]", myname).Replace("[[mybutton]]", gobutton);
            string messagetitle = Languages.MyText("email confermation, Spindate_setting");
            string tomail = mymail;
            bool ispass = siteDefaults.SendMail(body, messagetitle, tomail,false);
            bool ispass2 = siteDefaults.SendMail(body, messagetitle);
            if (ispass)
            {
               // Session["memberid"] = Session["userid"];
                Session["verified"] = false;
            }
            string _js = "window.parent.openMyprofile('" + siteDefaults.GetLink("registermsg.aspx?status=10") + "', '750', '760');";
            ClientScript.RegisterStartupScript(GetType(), "verif", _js, true);
        
        }
    
    
    
    }

    [System.Web.Services.WebMethod]
    public static string CheckPassword(string password)
    {
        if (methods.CheckSeesion())
        {
            string back = "true";

            using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
            {
                string sql = String.Format("Select userid From tblusers Where userpassword='{0}' AND userid={1}", password.Replace("'", "''").Trim(), HttpContext.Current.Session["memberid"]);
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                conn.Open();
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {

                }
                else
                {
                    back = "false";

                }
            }
            return back;
        }
        else
        {
            return "1error1";
        }
    }
    
}