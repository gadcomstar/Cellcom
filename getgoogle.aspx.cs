using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using System.Text;

public partial class getgoogle : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {        

        string url = "https://accounts.google.com/o/oauth2/auth?response_type=code&client_id=757082555011.apps.googleusercontent.com&redirect_uri=http://spindate.comstar.co.il/getgoogle.aspx&scope=profile";
        
        try
        {
            if (Request.QueryString["code"] == null)
            {

                Response.Redirect("https://accounts.google.com/o/oauth2/auth?response_type=code&client_id=757082555011.apps.googleusercontent.com&redirect_uri=http://spindate.comstar.co.il/getgoogle.aspx&scope=https://www.googleapis.com/auth/userinfo.email");

            }
            else
            {


                string myurl = "https://accounts.google.com/o/oauth2/token";

                string postData = "code=" + Request.QueryString["code"] + "&client_id=757082555011.apps.googleusercontent.com&client_secret=DNPSpf5EGaDWMUQw9uK4i4m2&redirect_uri=" +Server.UrlEncode("http://spindate.comstar.co.il/getgoogle.aspx")+"&grant_type=authorization_code";

                HttpWebRequest webRequest = (HttpWebRequest)WebRequest.Create(myurl);
                webRequest.Method = "POST";
                webRequest.ContentType = "application/x-www-form-urlencoded";
                webRequest.ContentLength = postData.Length;
                
                using (StreamWriter requestWriter2 = new StreamWriter(webRequest.GetRequestStream()))
                {                    
                    requestWriter2.Write(postData);
                   
                }

                //  This actually does the request and gets the response back
                               
                HttpWebResponse resp = (HttpWebResponse)webRequest.GetResponse();

                string responseData = string.Empty;

                using (StreamReader responseReader = new StreamReader(webRequest.GetResponse().GetResponseStream()))
                {
                    // dumps the HTML from the response into a string variable
                    responseData = responseReader.ReadToEnd();
                }

                //  Now, find the index of some word on the page that would be 
                //     displayed if the login was successful

                System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();//creating a JSON deserializer JSON.
                myToken myToken1 = serializer.Deserialize<myToken>(responseData);

                //string accessToken = responseData.Replace("access_token=", "");
                bla.Text += myToken1.access_token;
                string accessToken = myToken1.access_token;
                StreamReader MyStream;
                webRequest = (HttpWebRequest)System.Net.WebRequest.Create("https://www.googleapis.com/oauth2/v1/userinfo?access_token=" + accessToken); //setting an httpWebRequest with the URL of the API
                webRequest.Method = "GET";//the type of method the API returns
                webRequest.Timeout = 20000;//sets the timeout for thew request
                webRequest.ContentType = "application/x-www-form-urlencoded";//the content type. most of the times it will be application/x-www-form-urlencoded
                MyStream = new StreamReader(webRequest.GetResponse().GetResponseStream());//creating a stream reader to read the results from the API
                responseData = MyStream.ReadToEnd();//reading the result from the API into a string


                 serializer = new System.Web.Script.Serialization.JavaScriptSerializer();//creating a JSON deserializer JSON.
                userinfo FriendsArr = serializer.Deserialize<userinfo>(responseData);//De-serealization of the string into an array of pre-defined objects

                bla.Text += "<br />" + FriendsArr.email + " " + FriendsArr.name + " " + FriendsArr.verified_email + " " + FriendsArr.gender; 

            }

        }
        catch (Exception ex)
        {
            bla.Text = ex.Message;
        }


    }
    public class myToken
    {

        public string access_token { get; set; }
        public string token_type { get; set; }
        public string expires_in { get; set; }
        public string id_token { get; set; }
    }
    public class userinfo
    {
        public string id { get; set; }
        public string email { get; set; }
        public string verified_email { get; set; }
        public string name { get; set; }
        public string given_name { get; set; }
        public string family_name { get; set; }
        public string picture { get; set; }
        public string locale { get; set; }
        public string gender { get; set; }
        public int timezone { get; set; }
        
    }
}