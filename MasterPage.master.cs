using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using MySql.Data.MySqlClient;
using System.Web.UI.HtmlControls;
using System.IO;
//using System.Web.UI.MobileControls;


public partial class MasterPage : System.Web.UI.MasterPage
{
    string title = "IsraeLikers";
    string SeoDesc= "IsraeLikers";
    protected void Page_Load(object sender, EventArgs e)
    {
        using (MySqlConnection conn = new MySqlConnection(cmstrDefualts.ConnStr))
        {
            conn.Open();
            string page = Request.Url.AbsolutePath.Remove(0, Request.Url.AbsolutePath.LastIndexOf("/") + 1).ToLower();
            string sql = String.Format("Select PageTitle,PageSEODesc From sitepages where LCASE( PageURL)='{0}'", page);
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            MySqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                title = dr["PageTitle"].ToString();
                SeoDesc = dr["PageSEODesc"].ToString();
            }
            dr.Close();            
        }       
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        Page.Title = title;
        description.Content = SeoDesc;
    }
   
}