using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class ManageProgram : System.Web.UI.Page
{
    int contatctid = 0;
    int siteLang = 0;
	protected void Page_Load(object sender, EventArgs e)
	{
        LangTableControl.EditUrl = "ManageProgram.aspx?sitelang={field}&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];

        if (siteDefaults.CheckQueryString("sitelang", out siteLang))
        {
            LangTableControl.Visible = false;
            CatsTable.Visible = true;
          //  CatsTable.SqlWhereQuery = String.Format("gamelang={0}", siteLang);

            if (Request.QueryString["contact"] != null && int.TryParse(Request.QueryString["contact"], out contatctid))
            {
                BlogTypeMyForm.BackURL = "ManageProgram.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];
                ((ASP.controls_cmstrtextboxcontrol_ascx)BlogTypeMyForm.FindControl("SpecialMyTextBox")).DataFieldName = siteLang.ToString();
                ((ASP.controls_cmstrtextboxcontrol_ascx)BlogTypeMyForm.FindControl("CommentMyTextBox")).DataFieldName = "Comment" + siteLang ;


                if (contatctid == 0)
                {
                    BlogTypeMyForm.FormStatus = CMSTRFormWebUserControl.Status.Insert;
                    // ((ASP.controls_cmstrhiddenfield_ascx)BlogTypeMyForm.FindControl("LangMyHiddenField")).Value = siteLang.ToString();
                }
                else
                {
                    BlogTypeMyForm.FormStatus = CMSTRFormWebUserControl.Status.Update;
                    BlogTypeMyForm.DataKeyFieldValue = contatctid;
                }
            }
            else
            {

                BlogTypeMyForm.Visible = false;
            }
          
        }
        else
        {
            LangTableControl.Visible = true;
            CatsTable.Visible = false;
            BlogTypeMyForm.Visible = false;
        }
        CatsTable.AddLink = "ManageProgram.aspx?sitelang=" + Request.QueryString["sitelang"] + "&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&contact=0";
        CatsTable.EditUrl = "ManageProgram.aspx?sitelang=" + Request.QueryString["sitelang"] + "&contact={field}&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];

        

       
               // CatsTable.CustomField = ",,<a href=\"ManageHelpArticle.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&MyParent={0}\" >נהל</a>";
             //   CatsTable.SqlWhereQuery = "helpParent=0";

        
	}

    protected void CheckBest(string myid)
    {
        bool isbest = false;
        using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
        {
            string sql = "Select IsBest From programs Where progid=" + myid;
            MySqlCommand cmd = new MySqlCommand(sql,conn);
            conn.Open();
            MySqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                if (dr["IsBest"].ToString().ToLower() == "true")
                {
                    isbest = true;
                }
            
            }
            dr.Close();
            if (isbest)
            {
                cmd.CommandText = "Update programs Set IsBest=false Where progid<>" + myid;
                cmd.ExecuteNonQuery();
            }
            conn.Close();
            
        }
    
    }



}
