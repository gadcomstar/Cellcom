using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class ManageCountries : System.Web.UI.Page
{
    int blogid = 0; 
    int myLang = 1;
   protected void Page_Load(object sender, EventArgs e)
    {
        if (siteDefaults.CheckQueryString("sitelang",out myLang) )
        {

        if (Request.QueryString["country"] != null && int.TryParse(Request.QueryString["country"],out blogid))
        {

            using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
            {
                string sql = String.Format("Select CountryNameeng From countries where countryid={0}", blogid);
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                conn.Open();
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    BlogTypeMyForm.Header = string.Format("Country: {0}", dr["CountryNameeng"].ToString());
                }
                
            }

            ((ASP.controls_cmstrtextboxcontrol_ascx)BlogTypeMyForm.FindControl("BlogTypeName")).DataFieldName = myLang.ToString();
            BlogTypeMyForm.DataKeyFieldValue = blogid;
            BlogTypeMyForm.SaveButtonText = "Save";
            BlogTypeMyForm.DataKeyField = "countryid";          
            BlogTypeMyForm.BackButtonText = "Back";
            BlogTypeMyForm.SaveReturnText = "Save&Back";
            BlogTypeMyForm.BackURL = "ManageCountries.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&sitelang=" + Request.QueryString["sitelang"];


        } else
        {
            BlogTypeMyForm.Visible =false;
        
        }
        CatsTable.SqlFieldNames = String.Format("CountryNameeng,`{0}`", myLang);
        CatsTable.EditUrl = "ManageCountries.aspx?country={field}&id=" + Request.QueryString["id"] + "&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&sitelang=" + Request.QueryString["sitelang"];
      
        }
    }

   protected void CheckData(string myid)
   {
       using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
       {
           string sql = String.Format("Select * From countries where countryid={0}", myid);
           MySqlCommand cmd = new MySqlCommand(sql, conn);
           conn.Open();
           MySqlDataReader dr = cmd.ExecuteReader();
           if (dr.Read())
           {
               if (dr["countryshow"].ToString().ToLower() == "false")
               {
                   sql = "Update tblusers Set usercountry=(Select countryid From countries Where countryshow=true order by countryid  limit 1 ) Where usercountry=" + myid;
               }
           }
           else
           {
               sql = "Update tblusers Set usercountry=(Select countryid From countries Where countryshow=true order by countryid  limit 1 ) Where usercountry=" + myid;
            
           }
           dr.Close();
           cmd.CommandText = sql;
           cmd.ExecuteNonQuery();
           conn.Close();
       }
   }
}
