using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class instruction : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        using (MySqlConnection conn = new MySqlConnection(cmstrDefualts.ConnStr))
        {
            conn.Open();
            string sql = "Select PageName,PageTitle,PageSEODesc,PageDescription from sitepages where PageID=33";
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            MySqlDataReader dr = cmd.ExecuteReader();
            if(dr.Read())
            {
                pagecontent.InnerHtml = dr["PageDescription"].ToString();
            }
            
        }
    }
}