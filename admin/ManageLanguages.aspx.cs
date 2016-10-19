using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class ManageLanguages : System.Web.UI.Page
{
    int blogid = 0;
//    int articleid = 0;
    int myLang = 1;
   protected void Page_Load(object sender, EventArgs e)
    {


        if (cmstrDefualts.CheckQueryString("sitelang", out myLang))
        {

            if (Request.QueryString["country"] != null && int.TryParse(Request.QueryString["country"], out blogid))
            {
                if (blogid == 0)
                {
                    BlogTypeMyForm.FormStatus = CMSTRFormWebUserControl.Status.Insert;
                    ((ASP.controls_cmstrtextboxcontrol_ascx)BlogTypeMyForm.FindControl("NameMyTextBox")).Visible = true;
                }
                else
                {
                    //((ASP.controls_cmstrtextboxcontrol_ascx)BlogTypeMyForm.FindControl("NameMyTextBox")).Visible = false;
                    BlogTypeMyForm.DataKeyFieldValue = blogid;
                }
                ((ASP.controls_cmstrtextboxcontrol_ascx)BlogTypeMyForm.FindControl("BlogTypeName")).DataFieldName = myLang.ToString();
                BlogTypeMyForm.SaveButtonText = "Save";
                BlogTypeMyForm.DataKeyField = "idtbllang";
                BlogTypeMyForm.BackButtonText = "Back";
                BlogTypeMyForm.SaveReturnText = "Save&Back";
                BlogTypeMyForm.BackURL = "ManageLanguages.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&sitelang=" + Request.QueryString["sitelang"];
            
            }
            else
            {
                BlogTypeMyForm.Visible = false;

            }
            CatsTable.SqlFieldNames = String.Format("langname,`{0}`", myLang);
            CatsTable.EditUrl = "ManageLanguages.aspx?country={field}&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&sitelang=" + Request.QueryString["sitelang"];
            CatsTable.AddLink = "ManageLanguages.aspx?country=0&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&sitelang=" + Request.QueryString["sitelang"];

        }
    }
   protected void CheckData(string[] myid)
   {

       foreach (string id in myid)
       { 
        CheckData(id);
       }
   }
   protected void CheckData(string myid)
   {
       using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
       {
           string sql = String.Format("Select * From tbllang where idtbllang={0}",myid);
           MySqlCommand cmd = new MySqlCommand(sql, conn);
           conn.Open();
           MySqlDataReader dr = cmd.ExecuteReader();
           if (dr.Read())
           {
               if (dr["showlang"].ToString().ToLower() == "false")
               {
                   sql = "Update tblusers Set userLang=(Select idtbllang From tbllang Where showlang=true order by idtbllang  limit 1 ) Where userLang=" + myid;
               }

           }
           else
           {
               sql = "Update tblusers Set userLang=(Select idtbllang From tbllang Where showlang=true order by idtbllang  limit 1 ) Where userLang=" + myid;        
           
           }
           dr.Close();
           cmd.CommandText = sql;
           cmd.ExecuteNonQuery();
           conn.Close();
       }
   
   
   }
}
