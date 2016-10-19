using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;

public partial class facebooktest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Request.QueryString["code"] == null)
            {

              Response.Redirect("https://www.facebook.com/dialog/oauth?client_id=160129107466512&redirect_uri=http://spindate.comstar.co.il/facebooktest.aspx?cat=137&scope=user_hometown,email,user_likes&state=1256");
               
            }
            else
            {
                //Response.Write(Request.QueryString["code"]);
                HttpWebRequest webRequest = (HttpWebRequest)System.Net.WebRequest.Create("https://graph.facebook.com/oauth/access_token?client_id=160129107466512&redirect_uri=http://spindate.comstar.co.il/facebooktest.aspx?cat=137&client_secret=f83a2c843db75f659bd70f9e43d5595b&code=" + Request.QueryString["code"]); //setting an httpWebRequest with the URL of the API
                webRequest.Method = "GET";//the type of method the API returns
                webRequest.Timeout = 20000;//sets the timeout for thew request
                webRequest.ContentType = "application/x-www-form-urlencoded";//the content type. most of the times it will be application/x-www-form-urlencoded
                StreamReader MyStream = new StreamReader(webRequest.GetResponse().GetResponseStream());//creating a stream reader to read the results from the API
                string responseData = MyStream.ReadToEnd();//reading the result from the API into a string

                string accessToken = responseData.Replace("access_token=", "");


                webRequest = (HttpWebRequest)System.Net.WebRequest.Create("https://graph.facebook.com/me?access_token=" + accessToken); //setting an httpWebRequest with the URL of the API
                webRequest.Method = "GET";//the type of method the API returns
                webRequest.Timeout = 20000;//sets the timeout for thew request
                webRequest.ContentType = "application/x-www-form-urlencoded";//the content type. most of the times it will be application/x-www-form-urlencoded
                MyStream = new StreamReader(webRequest.GetResponse().GetResponseStream());//creating a stream reader to read the results from the API
                responseData = MyStream.ReadToEnd();//reading the result from the API into a string


                System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();//creating a JSON deserializer JSON.
                FacebookUser FriendsArr = serializer.Deserialize<FacebookUser>(responseData);//De-serealization of the string into an array of pre-defined objects

                bla.Text += "<br />" + FriendsArr.first_name + "<img src=\"https://graph.facebook.com/" + FriendsArr.id + "/picture\" />";               



            }

        }
        catch (Exception ex)
        {
            bla.Text = ex.Message;
        }
    }


    class Friends
    {
        public List<friend> data = new List<friend>();
    }

    class friend
    {
        public string name;
        public string id;
    }

    #region Facebook 'Me' Classes
    public class Employer
    {
        public string id { get; set; }
        public string name { get; set; }
    }

    public class Position
    {
        public string id { get; set; }
        public string name { get; set; }
    }

    public class From
    {
        public string id { get; set; }
        public string name { get; set; }
    }

    public class Work
    {
        public Employer employer { get; set; }
        public Position position { get; set; }
        public string start_date { get; set; }
        public string end_date { get; set; }
        public From from { get; set; }
    }

    public class School
    {
        public string id { get; set; }
        public string name { get; set; }
    }

    public class Degree
    {
        public string id { get; set; }
        public string name { get; set; }
    }

    public class Education
    {
        public School school { get; set; }
        public Degree degree { get; set; }
        public string type { get; set; }
    }

    public class Language
    {
        public string id { get; set; }
        public string name { get; set; }
    }

    public class FacebookUser
    {
        public string id { get; set; }
        public string name { get; set; }
        public string first_name { get; set; }
        public string last_name { get; set; }
        public string link { get; set; }
        public string email { get; set; }
        public string username { get; set; }
        public string bio { get; set; }
        public List<Work> work { get; set; }
        public List<Education> education { get; set; }
        public string gender { get; set; }
        public int timezone { get; set; }
        public string locale { get; set; }
        public List<Language> languages { get; set; }
        public bool verified { get; set; }
        public string updated_time { get; set; }
    }
    #endregion
}