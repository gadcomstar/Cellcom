using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using oAuthExample;


public partial class twitter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string url = "";
        string xml = "";
        oAuthTwitter oAuth = new oAuthTwitter();
        result.Text = DateTime.UtcNow.ToString();
        if (Request["oauth_token"] == null)
        {
            //Redirect the user to Twitter for authorization.
            //Using oauth_callback for local testing.
            oAuth.CallBackUrl = "http://spindate.comstar.co.il/twitter.aspx";
            Response.Redirect(oAuth.AuthorizationLinkGet());
        }
        else
        {
            //Get the access token and secret.
            oAuth.AccessTokenGet(Request["oauth_token"], Request["oauth_verifier"]);
            if (oAuth.TokenSecret.Length > 0)
            {
                
                //We now have the credentials, so make a call to the Twitter API.
             //   url = "http://twitter.com/account/verify_credentials.xml";
                url = "https://api.twitter.com/1.1/account/verify_credentials.json";
                string data = String.Empty;
                data = "include_entities=false&skip_status=true";

                xml = oAuth.oAuthWebRequest(oAuthTwitter.Method.GET, url, data);
                //apiResponse.InnerHtml = Server.HtmlEncode(xml);
                string responseData = Server.HtmlEncode(xml);

                 System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();//creating a JSON deserializer JSON.
                 Rootobject myToken1 = serializer.Deserialize<Rootobject>(xml);
                 apiResponse.InnerHtml = myToken1.name;

                //POST Test
                //url = "http://twitter.com/statuses/update.xml";
                //xml = oAuth.oAuthWebRequest(oAuthTwitter.Method.POST, url, "status=" + oAuth.UrlEncode("Hello @swhitley - Testing the .NET oAuth API"));
                //apiResponse.InnerHtml = Server.HtmlEncode(xml);
            }
        }
       
    }
    protected void gettwiter_Click(object sender, EventArgs e)
    {

      
        TimeSpan myspan = DateTime.Now-DateTime.MinValue;
        string myurl = "https://api.twitter.com/oauth/request_token";

        string oauth_nonce = "kYjzVBB8Y0ZFabxSWbWovY3uYSQ2pTgmZeNu2VS4cr";
        string oauth_callback = "http://spindate.comstar.co.il/twitter.aspx";
        string oauth_signature_method = "HMAC-SHA1";
        string oauth_timestamp = myspan.TotalSeconds.ToString();
        string oauth_consumer_key = "1hJQD7kwuzaTvREBjKeFg";
        string oauth_signature = "Pc%2BMLdv028fxCErFyi8KXFM%2BddU%3D";
        string oauth_version = "1.0";

        string postData = string.Format("oauth_nonce={0}&oauth_callback={1}&oauth_signature_method={2}&oauth_timestamp={3}&oauth_consumer_key={4}&oauth_signature={5}&oauth_version={6}", oauth_nonce, oauth_callback, oauth_signature_method, oauth_timestamp, oauth_consumer_key, oauth_signature, oauth_version);
        HttpWebRequest webRequest = (HttpWebRequest)WebRequest.Create(myurl);
        webRequest.Method = "POST";
        webRequest.ContentType = "application/x-www-form-urlencoded";
        webRequest.ContentLength = postData.Length;
        using (StreamWriter requestWriter2 = new StreamWriter(webRequest.GetRequestStream()))
        {
            requestWriter2.Write(postData);
        }
        HttpWebResponse resp = (HttpWebResponse)webRequest.GetResponse();
        string responseData = string.Empty;
        using (StreamReader responseReader = new StreamReader(webRequest.GetResponse().GetResponseStream()))
        {
            // dumps the HTML from the response into a string variable
            responseData = responseReader.ReadToEnd();
        }
        result.Text = responseData;
    }
}