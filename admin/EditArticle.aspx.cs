using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class admin_EditArticle : System.Web.UI.Page
{

    private string ConnStr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
	protected void Page_Load(object sender, EventArgs e)
    {

        int parentID = -1;
        parentID =int.Parse( Request.QueryString["Maincat"]);

        CatFormView.ReturnURL = "ManageArticles.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&MaincatID=" + Request.QueryString["Maincat"];
        backLink.NavigateUrl = "ManageArticles.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&MaincatID=" + Request.QueryString["Maincat"];
		if (Request.QueryString["id"] != null)
		{

            using (MySqlConnection conn = new MySqlConnection(ConnStr))
            {
                string sql = "Select `ArticleHeader` From articles Where ArticleID=" + Request.QueryString["id"];
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                conn.Open();
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    TitleLabel.Text = "ערוך מאמר - " + dr["ArticleHeader"];
                
                }
                conn.Close();           
            
            }

			CatFormView.IdValue = Request.QueryString["id"];
			CatFormView.FormViewAction = FormViewControl13.FormViewActionTypes.Edit;
            
		}
		else
		{
			
			int MaxOrder = 1;
            CatFormView.FormViewAction = FormViewControl13.FormViewActionTypes.Insert;

			
			if (parentID != -1)
			{

                using (MySqlConnection con = new MySqlConnection(ConnStr))
				{
					con.Open();
                    MySqlCommand cmd = new MySqlCommand();
					cmd.Connection = con;
                    cmd.CommandText = "SELECT Max(ArticleOrder) as MaxOrder FROM articles ";
                    MySqlDataReader MyReader = cmd.ExecuteReader();
					if (MyReader.Read())
					{
						int.TryParse(MyReader["MaxOrder"].ToString(), out MaxOrder);

					}
					con.Close();
				}

                CatFormView.SqlFieldNames += ",ArticleOrder";
				CatFormView.ReplaceField += "," + (MaxOrder+1);
				CatFormView.TblHeaderNames += ",";
				CatFormView.SqlFieldType += ",12";
                
			}
			else
			{
				Response.Redirect("./");
			}
		}
    }
}
