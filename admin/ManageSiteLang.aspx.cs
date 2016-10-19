using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ManageSiteLang : System.Web.UI.Page
{

	protected void Page_Load(object sender, EventArgs e)
	{	
			//	int ParentID = 1;
        CatsTable.AddLink = "EditSiteLanguages.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];
        CatsTable.EditUrl = "EditSiteLanguages.aspx?id={field}&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];
               // CatsTable.CustomField = ",,<a href=\"ManageHelpArticle.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&MyParent={0}\" >נהל</a>";
               // CatsTable.SqlWhereQuery = "helpParent=0";
        ((GridView)CatsTable.FindControl("GridView1")).PreRender += ManageTable_PreRender;
	}

    protected void CatsTable_ItemDeleted(string[] deletedIDs)
    {
        for (int i = 0; i < deletedIDs.Length; i++)
        {
            string myid = deletedIDs[i];

            using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
            {
                // remove from langtext2 
                string sql = String.Format("ALTER TABLE `spindate`.`langtext2` DROP COLUMN `{0}` ;", myid);
                conn.Open();
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                cmd.ExecuteNonQuery();

                // remove from tblevents 
                cmd.CommandText = String.Format("Delete From tblevents Where eventLang={0}", myid);
                cmd.ExecuteNonQuery();

                // remove from tblhelpcenter 
                cmd.CommandText = String.Format("Delete From tblhelpcenter Where eventLang={0}", myid);
                cmd.ExecuteNonQuery();
                    
                // remove from countries 
                cmd.CommandText = String.Format("ALTER TABLE `spindate`.`countries` DROP COLUMN `{0}` ;", myid);
                cmd.ExecuteNonQuery();
                // remove from states 
                cmd.CommandText = String.Format("ALTER TABLE `spindate`.`states` DROP COLUMN `{0}` ;", myid);
                cmd.ExecuteNonQuery();

                // remove from gifts 
                cmd.CommandText = String.Format("ALTER TABLE `spindate`.`gifts` DROP COLUMN `{0}` ;", myid);
                cmd.ExecuteNonQuery();
                // remove from mydropdownvalues 
                cmd.CommandText = String.Format("ALTER TABLE `spindate`.`mydropdownvalues` DROP COLUMN `{0}` ;", myid);
                cmd.ExecuteNonQuery();

                // remove from programs 
                cmd.CommandText = String.Format("ALTER TABLE `spindate`.`programs` DROP COLUMN `{0}` ,DROP COLUMN `comment{0}`;", myid);
                cmd.ExecuteNonQuery();

                // remove from tbllang 
                cmd.CommandText = String.Format("ALTER TABLE `spindate`.`tbllang` DROP COLUMN `{0}` ,DROP COLUMN `comment{0}` ;", myid);
                cmd.ExecuteNonQuery();            

                //add enviroment 
                cmd.CommandText = String.Format("ALTER TABLE `spindate`.`roomenvi` DROP COLUMN `{0}` ;", myid);
                cmd.ExecuteNonQuery();
             

                // remove from tbluserfield 
                cmd.CommandText = String.Format("ALTER TABLE `spindate`.`tbluserfield` DROP COLUMN `{0}` ;", myid);
                cmd.ExecuteNonQuery();

                // remove from tblwaitingroomalert 
                cmd.CommandText = String.Format("ALTER TABLE `spindate`.`tblwaitingroomalert` DROP COLUMN `{0}` ;", myid);
                cmd.ExecuteNonQuery();

                // remove from tblchatalert 
                cmd.CommandText = String.Format("ALTER TABLE `spindate`.`tblchatalert` DROP COLUMN `{0}` ;", myid);
                cmd.ExecuteNonQuery();

                // remove from cities 
                cmd.CommandText = String.Format("ALTER TABLE `spindate`.`cities` DROP COLUMN `{0}` ;", myid);
                cmd.ExecuteNonQuery(); 
          


                conn.Close();


            }
            
        }
    }


    protected void ManageTable_PreRender(object sender, EventArgs e)
    {
        GridViewRow row = ((GridView)(CatsTable).FindControl("GridView1")).Rows[0];
        row.Cells[1].Text = "<img src=\"images/DelOff.png\" title=\"" + "לא למחיקה" + "\" alt=\"" + "לא למחיקה" + "\" style=\"cursor:url('images/delete.gif')\" />";
        

      
    }
}
