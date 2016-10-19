using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Web.UI.HtmlControls;

public partial class pages : System.Web.UI.Page
{
    int pageid = 0;
    string mytitle = "";
    string mydescription = "";
    string mykeyword = "";

    protected void Page_Init(object sender, EventArgs e)
    {
        ((Panel)Master.FindControl("LeftSideMaster")).Visible = false;
        ((Panel)Master.FindControl("headerholder")).Visible = false;
        if (cmstrDefualts.CheckQueryString("page", out pageid))
        {
           
            using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
            {

                string sql = String.Format("Select pagecontent,pageseotitle,pageseodesc,pagekeyword,pageinsite from tblpages where idtblpages={0}", pageid);
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                conn.Open();
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {

                    PageContent.Text = dr["pagecontent"].ToString();
                 //   Master.IsSitePage = !bool.Parse(dr["pageinsite"].ToString());
                    mytitle = dr["pageseotitle"].ToString();
                    mydescription = dr["pageseodesc"].ToString();
                    mykeyword = dr["pagekeyword"].ToString();

                
                }

                conn.Close();

            }
        }
    }
  
    protected void Page_Load(object sender, EventArgs e)
    {


    }
    protected void Page_PreRender(object sender, EventArgs e)
    {

        Page.Title = mytitle;
        ((HtmlMeta)Master.FindControl("description")).Content = mydescription;
        ((HtmlMeta)Master.FindControl("keywords")).Content = mykeyword;

    }
}