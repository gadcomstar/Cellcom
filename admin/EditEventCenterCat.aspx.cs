using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class admin_EditEventCenterCat : System.Web.UI.Page
{
    int blogid = 0;
    int articleid = 0;
    int myLang = 1;
   protected void Page_Load(object sender, EventArgs e)
    {

        if (siteDefaults.CheckQueryString("sitelang",out myLang) )
        {       
        }
        string sql="";
        if (Request.QueryString["id"] != null && int.TryParse(Request.QueryString["id"],out blogid))
        {
            // check if edit article (else category)
            if (Request.QueryString["article"] != null && int.TryParse(Request.QueryString["article"], out articleid))
            {
                CatsTable.Visible = false;
                if (articleid == 0)
                {
                    BlogTypeMyForm.FormStatus = CMSTRFormWebUserControl.Status.Insert;
                    sql = String.Format("Select helpheader, 'New Article' as parentheder From tblevents Where idtblhelpcenter={0}", blogid);
                    BlogTypeMyForm.OrderQuery = string.Format(" where helpParent={0}  AND eventLang={1}", blogid, myLang);
                }
                else
                {
                    BlogTypeMyForm.DataKeyFieldValue = articleid;
                    sql = String.Format("Select event1.helpheader, (select helpheader From tblevents where idtblhelpcenter=event1.helpParent) as parentheder From tblevents as event1 Where event1.idtblhelpcenter={0}", articleid);           
                }
                ((ASP.controls_cmstrhiddenfield_ascx)BlogTypeMyForm.FindControl("ParentMyHiddenField")).Value = blogid.ToString();
                 ((ASP.controls_cmstrhiddenfield_ascx)BlogTypeMyForm.FindControl("LangMyHiddenField")).Value = myLang.ToString();
                BlogTypeMyForm.BackURL = "EditEventCenterCat.aspx?id=" + Request.QueryString["id"] + "&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&sitelang=" + Request.QueryString["sitelang"];                   
            }
            else
            {
                BlogTypeMyForm.DataKeyFieldValue = blogid;
                ((Panel)BlogTypeMyForm.FindControl("ArticleFields")).Visible = false;
                BlogTypeMyForm.BackURL = "ManageEventCenter.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];
                sql = String.Format("Select helpheader, (select helpheader From tblevents where idtblhelpcenter=helpParent) as parentheder From tblevents Where idtblhelpcenter={0}", blogid);                
            }
            BlogTypeMyForm.SaveButtonText = "Save";          
            BlogTypeMyForm.DataKeyField = "idtblhelpcenter";          
            BlogTypeMyForm.BackButtonText = "Back";
            BlogTypeMyForm.SaveReturnText = "Save&Back";
            using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
            {
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                conn.Open();
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    TitleLabel.Text = String.Format("Blog:  {1} - {0}", dr["helpheader"], dr["parentheder"]);
                }
                CatsTable.SqlWhereQuery = string.Format("helpParent={0} AND  eventLang={1}", blogid, myLang);
                CatsTable.AddLink = "EditEventCenterCat.aspx?article=0&id=" + Request.QueryString["id"] + "&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&sitelang=" + Request.QueryString["sitelang"];
                CatsTable.EditUrl = "EditEventCenterCat.aspx?article={field}&id=" + Request.QueryString["id"] + "&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&sitelang=" + Request.QueryString["sitelang"];
            }
        }
    }
}
