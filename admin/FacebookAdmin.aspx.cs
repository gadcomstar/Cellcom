using Facebook;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_FacebookAdmin : System.Web.UI.Page
{
    FacebookPages fbPages_test = new FacebookPages();

    protected void Page_Load(object sender, EventArgs e)
    {

        //if (Session["token"] != null)
        //{
        //    string userId = Session["userId"].ToString();
        //    string token = Session["token"].ToString();

        //    FacebookPages fbPages = FacebookCode.GetFacebookPages(token);
        //    foreach (FacebookPage page in fbPages.data)
        //    {
        //        FacebookPagesList.Items.Add(new ListItem(page.name, page.id));
        //    }
        //}


    }
    protected void ClickToGetPages_Click(object sender, EventArgs e)
    {
        if (Session["token"] != null)
        {
            string userId = Session["userId"].ToString();
            string token = Session["token"].ToString();

            FacebookPages fbPages = FacebookCode.GetFacebookPages(token);
            foreach (FacebookPage page in fbPages.data)
            {
                FacebookPagesList.Items.Add(new ListItem(page.name, page.id));
            }
        }

    }
    protected void PublishPost_Click(object sender, EventArgs e)
    {
        string token_test = Session["token"].ToString();
        bool itemSelected = false;
        fbPages_test = FacebookCode.GetFacebookPages(token_test);
        //FacebookApp app = new FacebookApp();
        string album_id = "";
        string access_Token = "";
        string _pageName = "";
        FacebookPagePost myPost = new FacebookPagePost();
        bool sendingSucceed = false;

        foreach (ListItem item in FacebookPagesList.Items)
        {
            if (item.Selected)
            {
                foreach (FacebookPage page in fbPages_test.data)
                {
                    if (item.Value == page.id)
                    {
                        itemSelected = true;
                        //myPost.id = page.id;
                        //myPost.access_token = page.access_token;
                        access_Token = page.access_token;
                        album_id = page.id;
                        _pageName = page.name;

                        break;
                    }
                }

                //myPost.message = TextToPost.Text.ToString().Replace("\n", "").Replace("\r", "").Replace("\"", "''");

                //string fbMsgID = FacebookCode.PostOnFacebookPage(myPost);                

                sendingSucceed = true;
            }

        }
        if (itemSelected)
        {


            using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
            {
                con.Open();
                MySqlCommand _cmd = new MySqlCommand();
                _cmd.Connection = con;
                _cmd.CommandText = string.Format("UPDATE facebookpages set PageName='{0}', PageID='{1}', AccessToken='{2}' where FacebookPagesID=1", _pageName, album_id, access_Token);
                _cmd.ExecuteNonQuery();
                con.Close();
            }
            lbl_status.Text = "דף נשמר בהצלחה";
        }
    }
}