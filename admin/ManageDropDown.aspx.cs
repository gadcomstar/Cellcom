using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class ManageDropDown : System.Web.UI.Page
{
    int blogid = 0;
 
    int myLang = 1;
    int dropid = 0;
   protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["drop"] != null && int.TryParse(Request.QueryString["drop"], out dropid))
        {
            using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
            {
                string sql = String.Format("Select * From mysitedropdown Where idmysitedropdown={0}", dropid);
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                conn.Open();
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    CatsTable.TableTitle = "Manage " + dr["dropdownname"];
                    CatsTable.SqlWhereQuery = "listid=" + dropid;
                    ((ASP.controls_cmstrhiddenfield_ascx)BlogTypeMyForm.FindControl("ListMyHiddenField")).Value = dropid.ToString();
                    ((ASP.controls_cmstrtextboxcontrol_ascx)BlogTypeMyForm.FindControl("NameMyTextBox")).FieldName = dr["dropdownname"] + " General Name";
                    ((ASP.controls_cmstrtextboxcontrol_ascx)BlogTypeMyForm.FindControl("BlogTypeName")).FieldName = dr["dropdownname"] + " Name";
                }
                else
                {
                    Response.Redirect("./");
                }
                dr.Close();

                //for (int i = 140; i < 220; i++)
                //{
                //    string sql2 = String.Format("Insert Into `mydropdownvalues` (dropfieldValue,showfield,`1`,`3`,listid) Values ('{0}',true,'{0}','{0}',5);", i);
                //    cmd.CommandText = sql2;
                //    cmd.ExecuteNonQuery();
                    
                //}

                conn.Close();



            }
        }
        else
        {

            Response.Redirect("./");
        }
    
        if (siteDefaults.CheckQueryString("sitelang", out myLang))
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
                    ((ASP.controls_cmstrtextboxcontrol_ascx)BlogTypeMyForm.FindControl("NameMyTextBox")).Visible = false;
                    BlogTypeMyForm.DataKeyFieldValue = blogid;
                }
                ((ASP.controls_cmstrtextboxcontrol_ascx)BlogTypeMyForm.FindControl("BlogTypeName")).DataFieldName = myLang.ToString();
                BlogTypeMyForm.SaveButtonText = "Save";
                BlogTypeMyForm.DataKeyField = "idmydropdownvalues";
                BlogTypeMyForm.BackButtonText = "Back";
                BlogTypeMyForm.SaveReturnText = "Save&Back";
                BlogTypeMyForm.BackURL = "ManageDropDown.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&sitelang=" + Request.QueryString["sitelang"] + "&drop=" + Request.QueryString["drop"];
            
            }
            else
            {
                BlogTypeMyForm.Visible = false;

            }
            // CatsTable.SqlFieldNames = String.Format("`{0}`", myLang);
            CatsTable.EditUrl = "ManageDropDown.aspx?country={field}&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&sitelang=" + Request.QueryString["sitelang"] + "&drop=" + Request.QueryString["drop"];
            CatsTable.AddLink = "ManageDropDown.aspx?country=0&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&sitelang=" + Request.QueryString["sitelang"] + "&drop=" + Request.QueryString["drop"];
            CatsTable.SqlFieldNames = "dropfieldValue,`" + myLang.ToString() + "`";
            CatsTable.SortBy = "`"+myLang.ToString()+"`";
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
           string sql = String.Format("Select * From mydropdownvalues where idmydropdownvalues={0}", myid);
           MySqlCommand cmd = new MySqlCommand(sql, conn);
           conn.Open();
           MySqlDataReader dr = cmd.ExecuteReader();
           if (dr.Read())
           {
               if (dr["showfield"].ToString().ToLower() == "false")
               {
                   sql = string.Format("Update tblusers Set userdata{0}=0 Where userdata{0}={1}" , dropid,myid);
               }

           }
           else
           {
               sql = String.Format("Update tblusers Set userdata{0}=0 Where userdata{0}={1}",dropid,myid);
           
           }
           dr.Close();
           cmd.CommandText = sql;
           cmd.ExecuteNonQuery();
           conn.Close();
       }
   
   
   }
}
