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

        using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
        {
            string sql = "Select PageHeader,PageContent From privacypolicycontent Where EntryID =1";

            MySqlCommand cmd = new MySqlCommand(sql, conn);
            conn.Open();
            MySqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
               Content.Text= dr["PageContent"].ToString();
               PrivacyPolicyHeader.InnerText = dr["PageHeader"].ToString();
            }

            dr.Close();
            conn.Close();
        }
    }
}