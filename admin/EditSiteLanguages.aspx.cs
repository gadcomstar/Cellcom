using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Globalization;
using System.Threading;

public partial class admin_EditSiteLanguages : System.Web.UI.Page
{

    int blogid = 0;
  
    protected void Page_Load(object sender, EventArgs e)
    {
        LangMyForm.BackURL = "ManageSiteLang.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];
        if (Request.QueryString["id"] != null && int.TryParse(Request.QueryString["id"], out blogid))
        {

            using (MySqlConnection conn =new MySqlConnection(siteDefaults.ConnStr))
            {

                string sql = String.Format("Select LangName From languages where LangID={0}", blogid);
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                conn.Open();
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {

                    TitleLabel.Text = "Update Data for " + dr["LangName"] + " language";
                
                }

                conn.Close();
                
            }
            LangMyForm.FormStatus = CMSTRFormWebUserControl.Status.Update;
            LangMyForm.DataKeyFieldValue = blogid;

        }
        else
        { 
         LangMyForm.DataKeyFieldValue = blogid;
         LangMyForm.FormStatus = CMSTRFormWebUserControl.Status.Insert;
        
        }

        foreach (CultureInfo myCultureInfo in CultureInfo.GetCultures(CultureTypes.InstalledWin32Cultures))
        {
            ListItem myItem;
            if (myCultureInfo.Name.ToLower() == "en-us")
            {
                 myItem = new ListItem(myCultureInfo.EnglishName, myCultureInfo.ToString(),true);
            }
            else
            {
                 myItem = new ListItem(myCultureInfo.EnglishName, myCultureInfo.ToString());
            }
          
            ((ASP.controls_cmstrdropdowncontrol_ascx)LangMyForm.FindControl("CultureMyDropDown")).ListItems.Add(myItem);
        
        }
        
    }
    protected void BuildLang(string myid)
    {

        // add columns to tables
        using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
        {
            string sql = String.Format("ALTER TABLE `spindate`.`langtext2` ADD COLUMN `{0}` TEXT NULL ;", myid);
            conn.Open();
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            cmd.ExecuteNonQuery();
            // add to langtext2 
            cmd.CommandText = String.Format("Update langtext2 Set `{0}`=`1`;", myid);
            cmd.ExecuteNonQuery();
            // add to tblevents (3 headers)
            cmd.CommandText = String.Format("Insert Into tblevents (helpheader,helpParent,showHelp,helpOrder,helpimg,eventLang) Values ('Spindate News',0,true,1,'../images/siteuserImages/ca9604c6-6024-47f5-b46b-b198df2ed2ef_icon.png',{0}) ", myid);
            cmd.ExecuteNonQuery();            
            cmd.CommandText = String.Format("Insert Into tblevents (helpheader,helpParent,showHelp,helpOrder,helpimg,eventLang) Values ('Articles',0,true,2,'../images/siteuserImages/ca9604c6-6024-47f5-b46b-b198df2ed2ef_icon.png',{0}) ", myid);
            cmd.ExecuteNonQuery();
            cmd.CommandText = String.Format("Insert Into tblevents (helpheader,helpParent,showHelp,helpOrder,helpimg,eventLang) Values ('Events',0,true,3,'../images/siteuserImages/7c0a757c-96c3-4cd4-b8e7-fca54dd89b12_icon.png',{0}) ", myid);
            cmd.ExecuteNonQuery();
            // add to countries 
            cmd.CommandText = String.Format("ALTER TABLE `spindate`.`countries` ADD COLUMN `{0}` VARCHAR(90) NULL   ;", myid);
            cmd.ExecuteNonQuery();           
            cmd.CommandText = String.Format("Update countries Set `{0}`=`CountryNameeng` ;", myid);
            cmd.ExecuteNonQuery();
            // add to states 
            cmd.CommandText = String.Format("ALTER TABLE `spindate`.`states` ADD COLUMN `{0}` VARCHAR(90) NULL   ;", myid);
            cmd.ExecuteNonQuery();
            cmd.CommandText = String.Format("Update states Set `{0}`=`stateNameeng` ;", myid);
            cmd.ExecuteNonQuery();
            // add to gifts 
            cmd.CommandText = String.Format("ALTER TABLE `spindate`.`gifts` ADD COLUMN `{0}` VARCHAR(255) NULL   ;", myid);
            cmd.ExecuteNonQuery();
            cmd.CommandText = String.Format("Update gifts Set `{0}`=`giftnameeng` ;", myid);
            cmd.ExecuteNonQuery();
            // add to mydropdownvalues 
            cmd.CommandText = String.Format("ALTER TABLE `spindate`.`mydropdownvalues` ADD COLUMN `{0}` VARCHAR(90) NULL   ;", myid);
            cmd.ExecuteNonQuery();
            cmd.CommandText = String.Format("Update mydropdownvalues Set `{0}`=`dropfieldValue` ;", myid);
            cmd.ExecuteNonQuery();
            // add to programs 
            cmd.CommandText = String.Format("ALTER TABLE `spindate`.`programs` ADD COLUMN `{0}` VARCHAR(255) NULL   , ADD COLUMN `comment{0}` VARCHAR(255) NULL;", myid);
            cmd.ExecuteNonQuery();
            cmd.CommandText = String.Format("Update `programs` Set `{0}`=`progSaveText`, `comment{0}`=`progComment` ;", myid);
            cmd.ExecuteNonQuery();

            // add to tbllang 
            cmd.CommandText = String.Format("ALTER TABLE `spindate`.`tbllang` ADD COLUMN `{0}` VARCHAR(255) NULL   , ADD COLUMN `comment{0}` VARCHAR(255) NULL;", myid);
            cmd.ExecuteNonQuery();
            cmd.CommandText = String.Format("Update `tbllang` Set `{0}`=`langname` ;", myid);
            cmd.ExecuteNonQuery();
            //add enviroment 
            cmd.CommandText = String.Format("ALTER TABLE `spindate`.`roomenvi` ADD COLUMN `{0}` VARCHAR(90) NULL  ;", myid);
            cmd.ExecuteNonQuery();
            cmd.CommandText = String.Format("Update `roomenvi` Set `{0}`=`environame` ;", myid);
            cmd.ExecuteNonQuery();

            // add to tbluserfield 
            cmd.CommandText = String.Format("ALTER TABLE `spindate`.`tbluserfield` ADD COLUMN `{0}` VARCHAR(85) NULL  ;", myid);
            cmd.ExecuteNonQuery();
            cmd.CommandText = String.Format("Update  tbluserfield Set `{0}`=fieldname;", myid);
            cmd.ExecuteNonQuery();
            conn.Close();

            // add to tblwaitingroomalert 
            cmd.CommandText = String.Format("ALTER TABLE `spindate`.`tblwaitingroomalert` ADD COLUMN `{0}` TEXT NULL   ;", myid);
            cmd.ExecuteNonQuery();
            cmd.CommandText = String.Format("Update `tblwaitingroomalert` Set `{0}`=`1` ;", myid);
            cmd.ExecuteNonQuery();

            // add to tblchatalert 
            cmd.CommandText = String.Format("ALTER TABLE `spindate`.`tblchatalert` ADD COLUMN `{0}` TEXT NULL   ;", myid);
            cmd.ExecuteNonQuery();
            cmd.CommandText = String.Format("Update `tblchatalert` Set `{0}`=`1` ;", myid);
            cmd.ExecuteNonQuery();
            // add to cities 
            cmd.CommandText = String.Format("ALTER TABLE `spindate`.`cities` ADD COLUMN `{0}` VARCHAR(45) NULL   ;", myid);
            cmd.ExecuteNonQuery();
            cmd.CommandText = String.Format("Update `cities` Set `{0}`=`1` ;", myid);
            cmd.ExecuteNonQuery();
        
        }
        
    
    }
}
