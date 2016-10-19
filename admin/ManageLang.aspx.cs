using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class admin_ManageLang : System.Web.UI.Page
{
  
    protected void Page_Load(object sender, EventArgs e)
    {
        CatTable.CustomField = "<span id=\"{0}\"></span>,,,,";
        CatTable.AddLink = "EditLang.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];
        CatTable.EditUrl = "EditLang.aspx?id={field}&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];
     
    }

    protected void ManageTable_PreRender(object sender, EventArgs e)
    {
        foreach (GridViewRow row in ((GridView)(CatTable).FindControl("GridView1")).Rows)
        {
            if (((Label)row.Cells[2].Controls[0]).Text.Contains("False"))
            {
                row.Cells[1].Text = "<img src=\"images/DelOff.png\" title=\"" + "לא למחיקה" + "\" alt=\"" + "לא למחיקה" + "\" style=\"cursor:url('images/delete.gif')\" />";
            }

        }
    }

    protected void DeleteTables(string[] myids, ref bool canceled)
    {

        using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
        { 
        
            foreach (string langid in myids)
            {
                string langcode = "";
                string sql = " SELECT *  FROM langsite where langid=" + langid;
                conn.Open();
                MySqlCommand cmd = new MySqlCommand(sql,conn);
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    langcode = dr["langcode"].ToString();
                }
                dr.Close();
                if(langcode!="" && langcode.ToString()!="heb" )
                {
                    cmd.CommandText = "Delete From pages Where lang='" + langcode+"'";
                    cmd.ExecuteNonQuery();
                    cmd.CommandText = "Delete From generaltexts Where lang='" + langcode+"'";
                    cmd.ExecuteNonQuery();
                }


                conn.Close();

            
            }
              
        
        }

    
    }
}
