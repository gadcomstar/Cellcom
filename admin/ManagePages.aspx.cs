using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class ManagePages : System.Web.UI.Page
{
    int contatctid = 0;
    List<string> myTagsArray;
    //    int siteLang = 0;
    protected void Page_Load(object sender, EventArgs e)
    {


        //  CatsTable.SqlWhereQuery = String.Format("gamelang={0}", siteLang);

        if (Request.QueryString["contact"] != null && int.TryParse(Request.QueryString["contact"], out contatctid))
        {
            BlogTypeMyForm.BackURL = "ManagePages.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];

            if (contatctid == 0)
            {
                BlogTypeMyForm.FormStatus = CMSTRFormWebUserControl.Status.Insert;
                ((ASP.controls_cmstrhiddenfield_ascx)BlogTypeMyForm.FindControl("hid_Guid")).Value = Guid.NewGuid().ToString();
                // ((ASP.controls_cmstrhiddenfield_ascx)BlogTypeMyForm.FindControl("LangMyHiddenField")).Value = siteLang.ToString();
            }
            else
            {

                using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
                {
                    string sql = String.Format("Select pagename From tblpages where idtblpages={0}", contatctid);
                    MySqlCommand cmd = new MySqlCommand(sql, conn);
                    conn.Open();
                    MySqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        BlogTypeMyForm.Header = string.Format("עריכת דף: {0}", dr["pagename"].ToString());
                    }
                    dr.Close();
                    sql = "select tagid from tbltagsforMissions where missionid=" + contatctid;
                    myTagsArray = new List<string>();
                    cmd.CommandText = sql;
                    dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        myTagsArray.Add(dr["tagid"].ToString());
                    }
                    if (!IsPostBack)
                    {
                        ((tableControl)BlogTypeMyForm.FindControl("TagsTable")).SelectedValsHidVal = String.Join(",", myTagsArray.ToArray());
                    }
                }
                BlogTypeMyForm.FormStatus = CMSTRFormWebUserControl.Status.Update;
                BlogTypeMyForm.DataKeyFieldValue = contatctid;






            }
        }
        else
        {

            BlogTypeMyForm.Visible = false;
        }

        CatsTable.AddLink = "ManagePages.aspx?sitelang=" + Request.QueryString["sitelang"] + "&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&contact=0";
        CatsTable.EditUrl = "ManagePages.aspx?sitelang=" + Request.QueryString["sitelang"] + "&contact={field}&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];
        CatsTable.CustomField = ",,,<a target=\"blank \"href=\"" + siteDefaults.SiteUrl + "/Mission.aspx?name={0}" + "\"  ><img alt=\"view\" title=\"View\" src=\"images/preview.png\"  /></a>,<textarea style=\"height:50px;width:400px;text-align:left;\"  onmouseup=\"selectonfocus(this)\" >" + siteDefaults.SiteUrl + "/Mission.aspx?name={0}&mail=[[email]]</textarea>,<a href=\"MissionStats.aspx?MissionID={0}&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "\"><img title=\"הצג סטטיסטיקות למשימה\" src=\"images/pie-3d.png\" style=\"width:20px; height:20px;\" /></a>";



        // CatsTable.CustomField = ",,<a href=\"ManageHelpArticle.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&MyParent={0}\" >נהל</a>";
        //   CatsTable.SqlWhereQuery = "helpParent=0";


    }

    protected void btnPost_Click(object sender, EventArgs e) //מתודת שליחת פוסט לקיר של הדף בפייסבוק
    {
        FacebookPagePost _post = new FacebookPagePost();
        string _postResponse = "";
        _post.message = ((ASP.controls_cmstrtextboxcontrol_ascx)BlogTypeMyForm.FindControl("txt_PostText")).Text;
        using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
        {
            con.Open();
            MySqlCommand _cmd = new MySqlCommand();
            _cmd.Connection = con;
            _cmd.CommandText = "select * from facebookpages where FacebookPagesID = 1";
            MySqlDataReader _dr = _cmd.ExecuteReader();
            if (_dr.Read())
            {
                _post.id = _dr["PageID"].ToString();
                _post.access_token = _dr["AccessToken"].ToString();
            }
            _dr.Close();
            con.Close();

        }
        _post.link = ((ASP.controls_cmstrtextboxcontrol_ascx)BlogTypeMyForm.FindControl("Post_Link")).Text;

        if (_post.access_token != "" && _post.access_token != null) //בדיקה האם יש טוקן במערכת והאם יש קבוצה שניתן "לפרסם" בה
        {
            _postResponse = FacebookCode.PostOnFacebookPage(_post); //ביצוע פוסט + קבלת מספר פוסט בכתשובה
            if (_postResponse != "") //בדיקה האם חזר מספר פוסט כתשובה מפייסבוק
            {
                using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
                {
                    con.Open();
                    MySqlCommand _cmd = new MySqlCommand();
                    _cmd.Connection = con;
                    _cmd.CommandText = "UPDATE tblpages set FB_PostID='" + _postResponse + "' where idtblpages =" + contatctid;
                    _cmd.ExecuteNonQuery();
                    con.Close();
                }

                ((Label)BlogTypeMyForm.FindControl("lblStatus")).Text = "פוסט נשלח בהצלחה!";
            }
            else
            {
                ((Label)BlogTypeMyForm.FindControl("lblStatus")).Text = "הייתה בעיה בשליחת הפוסט";
            }
        }
        else
        {
            ((Label)BlogTypeMyForm.FindControl("lblStatus")).Text = "לא בוצע התחברות לדף פייסבוק עדיין, אנא התחבר לדף";
        }

        //((Label)BlogTypeMyForm.FindControl("lblStatus")).Text = "פוסט נשלח בהצלחה - אנא לחץ שמור לשמירת הנתונים!";
        //((Label)BlogTypeMyForm.FindControl("lblStatus")).Text = _postResponse;

        hid_PostID.Value = _postResponse;

        //((Button)BlogTypeMyForm.FindControl("btnSavePost")).Visible = true;

    }
    protected void Unnamed_Click(object sender, EventArgs e)
    {
        using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
        {
            con.Open();
            MySqlCommand _cmd = new MySqlCommand();
            _cmd.Connection = con;
            _cmd.CommandText = "UPDATE tblpages set FB_PostID='" + hid_PostID.Value + "' where idtblpages =" + contatctid;
            _cmd.ExecuteNonQuery();
            con.Close();
            ((Label)BlogTypeMyForm.FindControl("lblStatus")).Text = "";
            ((Button)sender).Visible = false;

        }
    }
    protected void BlogTypeMyForm_ItemInserted(string NewUserID)
    {
        using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
        {
            con.Open();
            MySqlCommand _cmd = new MySqlCommand();
            _cmd.Connection = con;
            _cmd.CommandText = "UPDATE tblpages set CreationDate=now() where idtblpages =" + NewUserID;
            _cmd.ExecuteNonQuery();
            con.Close();



        }
    }
    protected void UpdateTags_Click(object sender, EventArgs e)
    {
        string myTagsVals = ((tableControl)BlogTypeMyForm.FindControl("TagsTable")).SelectedValsHidVal;
        string[] myTagsValsArray = { };
        myTagsValsArray = myTagsVals.Split(',');

        using (MySqlConnection conn = new MySqlConnection(cmstrDefualts.ConnStr))
        {
            conn.Open();
            string sql = String.Format("Delete From tbltagsforMissions where missionID={0}", contatctid);
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            cmd.ExecuteNonQuery();
            foreach (string Tag in myTagsValsArray)
            {
                int TagNumber = 0;
                if (int.TryParse(Tag, out TagNumber))
                {
                    cmd.CommandText = String.Format("Insert Into tbltagsforMissions (TagID,MissionID) Values ({0},{1})", Tag, contatctid);
                    cmd.ExecuteNonQuery();
                }

            }
            conn.Close();
        }
    }
}
