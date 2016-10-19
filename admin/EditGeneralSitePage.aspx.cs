using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Text;

public partial class admin_EditGeneralSitePage : System.Web.UI.Page
{

    private string ConnStr = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
    int parentID = 1;
    string PageURL = "";
    string IsPageOnMainMenu = "true";
    string IsChild = "false";
    string query = "";
    protected void Page_Load(object sender, EventArgs e)
    {

        CatFormView.ReturnURL = "ManageGeneralSitePage.aspx?type=2&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "";
        backLink.NavigateUrl = "ManageGeneralSitePage.aspx?type=2&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "";
        query = "IsChild=false"; 
        #region if has parent get parent url
        if (!String.IsNullOrEmpty(Request.QueryString["Parent"]) && int.TryParse(Request.QueryString["Parent"] , out parentID))
        {
            query = "PageParent=" + parentID + " AND IsChild=true"; 
            CatFormView.ReturnURL = "ManageGeneralSitePage.aspx?type=2&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&Parent=" + Request.QueryString["Parent"];
            backLink.NavigateUrl = "ManageGeneralSitePage.aspx?type=2&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&Parent=" + Request.QueryString["Parent"];
     
            IsPageOnMainMenu = "false";
            IsChild = "true";
            using (MySqlConnection conn = new MySqlConnection(ConnStr))
            {
                string sql = "Select * From sietpages Where pageID="+parentID;
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                conn.Open();
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    PageURL = dr["PageURL"].ToString();                
                }
                conn.Close();
            }
        }
        #endregion

          #region Edit
        if (Request.QueryString["id"] != null)
		{
            using (MySqlConnection conn = new MySqlConnection(ConnStr))
            {
                string sql = "Select `PageName` From sitepages Where PageID=" + Request.QueryString["id"];
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                conn.Open();
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    TitleLabel.Text = "ערוך דף - " + dr["PageName"];

                }
                conn.Close();
            }
            if (Session["secLevel"].ToString() == "1")
            {

                CatFormView.SqlFieldNames = "PageURL," + CatFormView.SqlFieldNames;
                CatFormView.ReplaceField = "," + CatFormView.ReplaceField;
                CatFormView.TblHeaderNames = "קישור הדף," + CatFormView.TblHeaderNames;
                CatFormView.SqlFieldType = "1," + CatFormView.SqlFieldType;

                CatFormView.SqlFieldNames += ",PageID";
                CatFormView.ReplaceField += ",";
                CatFormView.TblHeaderNames += ",הגדרות";
                CatFormView.SqlFieldType += ",5";

                CatFormView.SqlFieldNames += ",PageIsDel";
                CatFormView.ReplaceField += ",false_NOT_STRING";
                CatFormView.TblHeaderNames += ",האם מחיק";
                CatFormView.SqlFieldType += ",2";

                CatFormView.SqlFieldNames += ",IsPageOnMainMenu";
                CatFormView.ReplaceField += ",false_NOT_STRING";
                CatFormView.TblHeaderNames += ",האם בתפריט ראשי";
                CatFormView.SqlFieldType += ",2";

                CatFormView.SqlFieldNames += ",IsChild";
                CatFormView.ReplaceField += ",";
                CatFormView.TblHeaderNames += ",האם נמצא תת-תפריט";
                CatFormView.SqlFieldType += ",2";

                CatFormView.SqlFieldNames += ",PageParent";
                CatFormView.ReplaceField += ",";
                CatFormView.TblHeaderNames += ",מספר אב";
                CatFormView.SqlFieldType += ",1";
            }

			CatFormView.IdValue = Request.QueryString["id"];
            CatFormView.FormViewAction = FormViewControl13.FormViewActionTypes.Edit;
        }
        #endregion
        #region Insert
        else
		{
            int MaxOrder = 1;
            CatFormView.FormViewAction = FormViewControl13.FormViewActionTypes.Insert;
            using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
            {
                con.Open();
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = con;
                cmd.CommandText = "SELECT Max(PageOrder) as MaxOrder FROM sitepages where " + query;
                MySqlDataReader MyReader = cmd.ExecuteReader();
                if (MyReader.Read())
                {
                    int.TryParse(MyReader["MaxOrder"].ToString(), out MaxOrder);

                }
                con.Close();
            }
            CatFormView.SqlFieldNames += ",PageOrder";
            CatFormView.ReplaceField += "," + (MaxOrder + 1);
            CatFormView.TblHeaderNames += ",";
            CatFormView.SqlFieldType += ",12";

            CatFormView.SqlFieldNames += ",lang";
            CatFormView.ReplaceField += ","+ Session["langcode"];
            CatFormView.TblHeaderNames += ",";
            CatFormView.SqlFieldType += ",12";

            if (Session["secLevel"].ToString() == "1")
            {

                CatFormView.SqlFieldNames = "PageURL," + CatFormView.SqlFieldNames;
                CatFormView.ReplaceField = "," + CatFormView.ReplaceField;
                CatFormView.TblHeaderNames = "קישור הדף," + CatFormView.TblHeaderNames;
                CatFormView.SqlFieldType = "1," + CatFormView.SqlFieldType;
            }
            else
            {              

                CatFormView.SqlFieldNames += ",PageURL";
                CatFormView.ReplaceField += ",emptyfile";
                CatFormView.TblHeaderNames += ",";
                CatFormView.SqlFieldType += ",12";                
            }
            CatFormView.SqlFieldNames += ",PageIsDel";
            CatFormView.ReplaceField += ",false_NOT_STRING";
            CatFormView.TblHeaderNames += ",";
            CatFormView.SqlFieldType += ",12";

            CatFormView.SqlFieldNames += ",PageParent";
            CatFormView.ReplaceField += ","+parentID+"_NOT_STRING";
            CatFormView.TblHeaderNames += ",";
            CatFormView.SqlFieldType += ",12";

            CatFormView.SqlFieldNames += ",IsPageOnMainMenu";
            CatFormView.ReplaceField += "," + IsPageOnMainMenu + "_NOT_STRING";
            CatFormView.TblHeaderNames += ",";
            CatFormView.SqlFieldType += ",12";

            CatFormView.SqlFieldNames += ",IsChild";
            CatFormView.ReplaceField += "," + IsChild + "_NOT_STRING";
            CatFormView.TblHeaderNames += ",";
            CatFormView.SqlFieldType += ",12";

        }
        #endregion
    }
    protected void CatFormView_ItemInserted(string id)
    {    
        bool UpdateUrl = false;
        using (MySqlConnection conn = new MySqlConnection(ConnStr))
        {
            string sql = "Select * From sitepages Where PageID="+id ;
            conn.Open();
            MySqlCommand cmd = new MySqlCommand(sql,conn);
            MySqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                if (dr["PageURL"].ToString().ToLower().Contains("emptyfile") || dr["PageURL"].ToString()=="")
                {
                    UpdateUrl = true;                
                }            
            }
            dr.Close();
            if (UpdateUrl)
            {
                cmd.CommandText = "Update sitepages Set PageURL=\"" + (PageURL.Contains("?IntPage") ? "" : PageURL) + "?IntPage=" + id + "\",PageIsDel=true  Where PageID=" + id;
                cmd.ExecuteNonQuery();
            
            }
            conn.Close();
        }   
    
    }   
}
