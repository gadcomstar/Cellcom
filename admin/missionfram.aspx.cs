using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
public partial class admin_missionfram : System.Web.UI.Page
{
    int mission = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["mission"] != null && int.TryParse(Request.QueryString["mission"], out mission) && mission > 0)
        {
            using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr ))
            {
                conn.Open();
                string sql = String.Format("Select pagecontent From tblpages where idtblpages={0}", mission);
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    PageContent.InnerHtml = dr["pagecontent"].ToString();
                }
                dr.Close();
                
            }

        }
        else
        { 
        
        }

    }
}