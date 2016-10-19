using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class admin_EditEventArticle : System.Web.UI.Page
{

    private string ConnStr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
	protected void Page_Load(object sender, EventArgs e)
    {

        int parentID = -1;
        parentID =int.Parse( Request.QueryString["MyParent"]);

        CatFormView.ReturnURL = "ManageEventArticle.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&MyParent=" + Request.QueryString["MyParent"];
        backLink.NavigateUrl = "ManageEventArticle.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&MyParent=" + Request.QueryString["MyParent"];
		if (Request.QueryString["id"] != null)
		{

            using (MySqlConnection conn = new MySqlConnection(ConnStr))
            {
                string sql = "Select `helpheader` From tblevents Where idtblhelpcenter=" + Request.QueryString["id"];
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                conn.Open();
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    TitleLabel.Text = "ערוך קטגוריה - " + dr["helpheader"];
                
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
                    cmd.CommandText = "SELECT Max(helpOrder) as MaxOrder FROM tblevents  Where helpParent="+parentID;
                    MySqlDataReader MyReader = cmd.ExecuteReader();
					if (MyReader.Read())
					{
						int.TryParse(MyReader["MaxOrder"].ToString(), out MaxOrder);

					}
					con.Close();
				}

                CatFormView.SqlFieldNames += ",helpOrder";
				CatFormView.ReplaceField += "," + (MaxOrder+1);
				CatFormView.TblHeaderNames += ",";
				CatFormView.SqlFieldType += ",12";

                CatFormView.SqlFieldNames += ",helpParent";
                CatFormView.ReplaceField += "," + parentID;
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
