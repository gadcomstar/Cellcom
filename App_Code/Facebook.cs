using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Xml;
using System.Xml.Serialization;

/// <summary>
/// Summary description for Facebook
/// </summary>
public class FacebookCode
{
    private string clientId = "";
    private string clientSecret = "";
    private string fields = "id,name,picture,first_name,last_name,hometown,location,email,feed.fields(shares)";
    private string redirectUri = "";
    private string accessToken = "";
    public FbUser fbUser { get; set; }


    public FacebookCode(string clientId, string clientSecret)
    {
        FacebookConstructorMethod(clientId, clientSecret, "", "", "");
    }
    public FacebookCode(string clientId, string clientSecret, string redirectUri)
    {
        FacebookConstructorMethod(clientId, clientSecret, redirectUri, "", "");
    }
    public FacebookCode(string clientId, string clientSecret, string redirectUri, string fields)
    {
        FacebookConstructorMethod(clientId, clientSecret, redirectUri, fields, "");
    }
    public FacebookCode(string clientId, string clientSecret, string redirectUri, string fields, string accessToken)
    {
        FacebookConstructorMethod(clientId, clientSecret, redirectUri, fields, accessToken);
    }

    private void FacebookConstructorMethod(string clientId, string clientSecret, string redirectUri, string fields, string accessToken)
    {
        this.clientId = clientId;
        this.clientSecret = clientSecret;
        this.accessToken = accessToken;
        if (!String.IsNullOrEmpty(fields))
        {
            this.fields = fields;
        }
        if (redirectUri == "")
        {
            redirectUri = siteDefaults.SiteUrl;
        }
        this.redirectUri = redirectUri;

        if (HttpContext.Current.Request.QueryString != null && HttpContext.Current.Request.QueryString["code"] != "")
        {
            fbUser = GetFbUser();
        }
        else if (HttpContext.Current.Session["login"] != null && HttpContext.Current.Session["id"] != null)
        {
            //fbUser = GetFbUser();
        }
    }

    public void LoginClick()
    {
        LoginClick("", "user_hometown,email,user_photos,user_location,publish_stream,photo_upload,publish_actions,user_work_history");
    }
    public void LoginClick(string url)
    {
        LoginClick(url, "user_hometown,email,user_photos,user_location,publish_stream,photo_upload,publish_actions,user_work_history");
    }
    public void LoginClick(string url, string scope)
    {
        string connectQuery = "&";
        // HttpContext.Current.Response.Redirect("http://comstar.co/?aa=aaa" + url);
        #region Url fix
        if (url == "")
        {
            url = siteDefaults.SiteUrl + "/";
        }

        //if (url.Contains('?'))
        //{
        //    connectQuery = "&";
        //}
        //else
        //{
        //    connectQuery = "?";
        //}
        #endregion
        url = HttpContext.Current.Server.UrlEncode(url);

        try
        {
            HttpContext.Current.Session["login"] = "fb";
            //HttpContext.Current.Response.Redirect("https://www.facebook.com/dialog/oauth?client_id=" + clientId + "&redirect_uri=" + url + connectQuery + "scope=" + scope + "&display=popup", false);
            HttpContext.Current.Response.Redirect("https://www.facebook.com/dialog/oauth?client_id=" + clientId + "&redirect_uri=" + url + connectQuery + "scope=" + scope + "", false);
        }
        catch (Exception err)
        {
            HttpContext.Current.Session["login"] = null;
            HttpContext.Current.Response.Redirect("http://comstar.co.il");
        }
    }

    public FbUser GetFbUser()
    {
        string url = redirectUri;
        string connectQuery = "&";

        #region Url fix
        if (url == "")
        {
            url = siteDefaults.SiteUrl + "/";
        }

        //if (url.Contains('?'))
        //{
        //    connectQuery = "&";
        //}
        //else
        //{
        //    connectQuery = "?";
        //}        
        #endregion
        url = HttpContext.Current.Server.UrlEncode(url);

        FbUser _myFbUser = new FbUser();


        if (!String.IsNullOrEmpty(HttpContext.Current.Request.QueryString["code"]))
        {
            string code = HttpContext.Current.Request.QueryString["code"].ToString();



            if (HttpContext.Current.Request.Cookies["JoinUsLink"] != null)
            {
                HttpCookie cookie = new HttpCookie("JoinUsFBLink");
                cookie.Value = "https://graph.facebook.com/oauth/access_token?client_id=" + clientId + "&redirect_uri=" + url + connectQuery + "client_secret=" + clientSecret + "&code=" + code;
                cookie.Expires = DateTime.Now.AddMinutes(0.5);
                HttpContext.Current.Response.SetCookie(cookie);
                HttpContext.Current.Response.Redirect("Joinuscheck.aspx");
            }




            HttpWebRequest webRequest = (HttpWebRequest)System.Net.WebRequest.Create("https://graph.facebook.com/oauth/access_token?client_id=" + clientId + "&redirect_uri=" + url + connectQuery + "client_secret=" + clientSecret + "&code=" + code); //setting an httpWebRequest with the URL of the API
            try
            {
                //ServicePointManager.SecurityProtocol = SecurityProtocolType.Ssl3;
                webRequest = (HttpWebRequest)System.Net.WebRequest.Create("https://graph.facebook.com/oauth/access_token?client_id=" + clientId + "&redirect_uri=" + url + connectQuery + "client_secret=" + clientSecret + "&code=" + code); //setting an httpWebRequest with the URL of the API
                webRequest.Method = "GET";//the type of method the API returns
                webRequest.Timeout = 20000;//sets the timeout for thew request
                
                webRequest.ContentType = "application/x-www-form-urlencoded; charset=utf-8";//the content type. most of the times it will be application/x-www-form-urlencoded
                //webRequest.UserAgent = "Mozilla/5.0 (Windows NT 6.3; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/37.0.2049.0 Safari/537.36";
                StreamReader MyStream = new StreamReader(webRequest.GetResponse().GetResponseStream());//creating a stream reader to read the results from the API
                string responseData = MyStream.ReadToEnd();//reading the result from the API into a string
                accessToken = responseData.Replace("access_token=", "");
                //HttpContext.Current.Response.Redirect("http://www.comstar.co.il?access="+accessToken);

                webRequest = (HttpWebRequest)System.Net.WebRequest.Create("https://graph.facebook.com/me?access_token=" + accessToken); //setting an httpWebRequest with the URL of the API
                webRequest.Method = "GET";//the type of method the API returns
                webRequest.Timeout = 40000;//sets the timeout for thew request
                webRequest.ContentType = "application/x-www-form-urlencoded";//the content type. most of the times it will be application/x-www-form-urlencoded
                MyStream = new StreamReader(webRequest.GetResponse().GetResponseStream());//creating a stream reader to read the results from the API
                responseData = MyStream.ReadToEnd();//reading the result from the API into a string
                System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();//creating a JSON deserializer JSON.
                _myFbUser = serializer.Deserialize<FbUser>(responseData);//De-serealization of the string into an array of pre-defined objects

                webRequest = (HttpWebRequest)System.Net.WebRequest.Create("https://graph.facebook.com/" + _myFbUser.id + "?fields=" + fields + "&access_token=" + accessToken); //setting an httpWebRequest with the URL of the API
                webRequest.Method = "GET";//the type of method the API returns
                webRequest.Timeout = 50000;//sets the timeout for thew request
                webRequest.ContentType = "application/x-www-form-urlencoded";//the content type. most of the times it will be application/x-www-form-urlencoded
                MyStream = new StreamReader(webRequest.GetResponse().GetResponseStream());//creating a stream reader to read the results from the API
                responseData = MyStream.ReadToEnd();//reading the result from the API into a string
                serializer = new System.Web.Script.Serialization.JavaScriptSerializer();//creating a JSON deserializer JSON.
                _myFbUser = serializer.Deserialize<FbUser>(responseData);//De-serealization of the string into an array of pre-defined objects
                _myFbUser.tmpToken = accessToken;

                HttpContext.Current.Session["id"] = _myFbUser.id;
            }
            catch (Exception err)
            {
                using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
                {
                    MySqlCommand CMD = new MySqlCommand();
                    con.Open();
                    CMD.Connection = con;
                    CMD.CommandText = string.Format("INSERT INTO `israelikedb`.`facebookjoinerrormessages` (`TimeOfError`, `errorMessage`,`RequestLink`) VALUES ('{0}', '{1}','{2}')", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"), err.Message, webRequest.RequestUri.AbsoluteUri);
                    CMD.ExecuteNonQuery();
                    con.Close();
                }
                //HttpContext.Current.Response.Write(err.Message);
            }
        }
        //else if (HttpContext.Current.Session["login"] != null && HttpContext.Current.Session["id"] != null)
        //{
        //    if (HttpContext.Current.Session["login"] == "fb")
        //    {
        //        int loginID = 0;
        //        int.TryParse(HttpContext.Current.Session["id"].ToString(), out loginID);
        //        if (loginID > 0)
        //        {
        //            string fbid = HttpContext.Current.Session["id"].ToString();
        //            HttpWebRequest webRequest = (HttpWebRequest)System.Net.WebRequest.Create("https://graph.facebook.com/" + fbid + "?fields=" + fields + "&access_token=" + accessToken); //setting an httpWebRequest with the URL of the API
        //            webRequest.Method = "GET";//the type of method the API returns
        //            webRequest.Timeout = 20000;//sets the timeout for thew request
        //            webRequest.ContentType = "application/x-www-form-urlencoded";//the content type. most of the times it will be application/x-www-form-urlencoded
        //            StreamReader MyStream = new StreamReader(webRequest.GetResponse().GetResponseStream());//creating a stream reader to read the results from the API
        //            string responseData = MyStream.ReadToEnd();//reading the result from the API into a string
        //            System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();//creating a JSON deserializer JSON.
        //            _myFbUser = serializer.Deserialize<FbUser>(responseData);//De-serealization of the string into an array of pre-defined objects                

        //            _myFbUser.countryName = getCountryName(_myFbUser.location, _myFbUser.hometown);
        //        }
        //    }
        //}

        return _myFbUser;
    }

    public string PublishFbCover(string coverPath, string accessToken)
    {
        string picture_id = "";

        string filename = System.Web.Hosting.HostingEnvironment.MapPath("~/" + coverPath);
        //string filename = HttpContext.Current.Server.MapPath(coverPath);

        byte[] imageBytes = ReadImage(filename, new string[] { ".gif", ".jpg", ".png" });
        //string tmpAcceesToken = "CAAUFJdiRtKYBAD0obxnoSHQd49bYpcgjyhZCL1sdwAQDCILmWBY8M51f7c0p960Vs4PM9ffq1sQPWnWQLNWCjtGE6aXlYZCf1LZCSV6b1rwNZBFhhF1fuhkQGxza0V0YwcJC74w2eKum736HiRlEuJ0coHBZBSfPPHrFIjmHN188VDOSTOkB6TIZC8mehOaeYZD";
        //string tmpAlbumID = "224872487669640";
        string FbNewImageID = UploadPhoto("", "", filename, imageBytes, accessToken);

        string fbMsgID = FbNewImageID.Replace("{\"id\":\"", "");
        picture_id = fbMsgID.Remove(fbMsgID.LastIndexOf("\",\"post_id"));

        return picture_id;
    }

    private static byte[] ReadImage(string p_postedImageFileName, string[] p_fileType)
    {
        bool isValidFileType = false;
        FileInfo file = new FileInfo(p_postedImageFileName);


        foreach (string strExtensionType in p_fileType)
        {
            if (strExtensionType == file.Extension)
            {
                isValidFileType = true;
                break;
            }
        }
        if (isValidFileType)
        {
            FileStream fs = new FileStream(p_postedImageFileName, FileMode.Open, FileAccess.Read);


            BinaryReader br = new BinaryReader(fs);


            byte[] image = br.ReadBytes((int)fs.Length);


            br.Close();


            fs.Close();


            return image;
        }
        return null;
    }
    private static string UploadPhoto(string album_id, string message, string filename, Byte[] bytes, string Token)
    {
        // Create Boundary     
        string boundary = "---------------------------" + DateTime.Now.Ticks.ToString("x");

        // Create Path     
        string Path = @"https://graph.facebook.com/";
        if (!String.IsNullOrEmpty(album_id))
        {
            Path += album_id + "/";
        }

        Path += "photos";

        // Create HttpWebRequest     
        HttpWebRequest uploadRequest;
        uploadRequest = (HttpWebRequest)HttpWebRequest.Create(Path);
        uploadRequest.ServicePoint.Expect100Continue = false;
        uploadRequest.Method = "POST";
        uploadRequest.UserAgent = "Mozilla/4.0 (compatible; Windows NT)";
        uploadRequest.ContentType = "multipart/form-data; boundary=" + boundary;
        uploadRequest.KeepAlive = false;

        // New String Builder     
        StringBuilder sb = new StringBuilder();

        // Add Form Data     
        string formdataTemplate = "--{0}\r\nContent-Disposition: form-data; name=\"{1}\"\r\n\r\n{2}\r\n";

        // Access Token     
        sb.AppendFormat(formdataTemplate, boundary, "access_token", System.Web.HttpUtility.UrlEncode(Token));

        // Message     
        sb.AppendFormat(formdataTemplate, boundary, "message", message);
        // Header     
        string headerTemplate = "--{0}\r\nContent-Disposition: form-data; name=\"{1}\"; filename=\"{2}\"\r\nContent-Type: {3}\r\n\r\n";
        sb.AppendFormat(headerTemplate, boundary, "source", filename, @"application/octet-stream");

        // File     

        string formString = sb.ToString();
        byte[] formBytes = Encoding.UTF8.GetBytes(formString);
        byte[] trailingBytes = Encoding.UTF8.GetBytes("\r\n--" + boundary + "--\r\n");
        byte[] image;

        if (bytes == null)
        {
            image = File.ReadAllBytes(System.Web.Hosting.HostingEnvironment.MapPath(filename));
        }
        else
        {
            image = bytes;
        }

        // Memory Stream     
        MemoryStream imageMemoryStream = new MemoryStream();
        imageMemoryStream.Write(image, 0, image.Length);

        // Set Content Length     
        long imageLength = imageMemoryStream.Length;
        long contentLength = formBytes.Length + imageLength + trailingBytes.Length;
        uploadRequest.ContentLength = contentLength;

        // Get Request Stream     
        uploadRequest.AllowWriteStreamBuffering = false;
        Stream strm_out = uploadRequest.GetRequestStream();

        // Write to Stream     
        strm_out.Write(formBytes, 0, formBytes.Length);
        byte[] buffer = new Byte[checked((uint)Math.Min(4096, (int)imageLength))];
        int bytesRead = 0;
        int bytesTotal = 0;
        imageMemoryStream.Seek(0, SeekOrigin.Begin);
        while ((bytesRead = imageMemoryStream.Read(buffer, 0, buffer.Length)) != 0)
        {
            strm_out.Write(buffer, 0, bytesRead); bytesTotal += bytesRead;
        }
        strm_out.Write(trailingBytes, 0, trailingBytes.Length);

        // Close Stream     
        strm_out.Close();

        // Get Web Response     
        HttpWebResponse response = uploadRequest.GetResponse() as HttpWebResponse;

        // Create Stream Reader     
        StreamReader reader = new StreamReader(response.GetResponseStream());

        // Return     
        return reader.ReadToEnd();
    }
    /// <summary>
    /// This method gets facebook access Token and returns FacebookPages Type with user's list of pages
    /// </summary>
    /// <param name="accessToken">Identifing string produced by facebook when provided a code</param>
    /// <returns>FacebookPages Type with user's list of pages</returns>
    public static FacebookPages GetFacebookPages(string accessToken)
    {
        HttpWebRequest webRequest = (HttpWebRequest)System.Net.WebRequest.Create("https://graph.facebook.com/me/accounts?access_token=" + accessToken); //setting an httpWebRequest with the URL of the API
        webRequest.Method = "GET";//the type of method the API returns
        webRequest.Timeout = 20000;//sets the timeout for thew request
        webRequest.ContentType = "application/x-www-form-urlencoded";//the content type. most of the times it will be application/x-www-form-urlencoded
        StreamReader MyStream = new StreamReader(webRequest.GetResponse().GetResponseStream());//creating a stream reader to read the results from the API
        string responseData = MyStream.ReadToEnd();//reading the result from the API into a string

        System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();//creating a JSON deserializer JSON.
        FacebookPages FbUserPages = serializer.Deserialize<FacebookPages>(responseData);//De-serealization of the string into an array of pre-defined objects

        return FbUserPages;
    }


    public static string PostOnFacebookPage(FacebookPagePost myPost)
    {
        string fbMsgID = "";

        HttpWebRequest webRequest = (HttpWebRequest)System.Net.WebRequest.Create("https://graph.facebook.com/" + myPost.id + "/feed?access_token=" + myPost.access_token + "&message=" + myPost.message + (myPost.link != "" && myPost.link != null ? "&link=" + myPost.link : "")); //setting an httpWebRequest with the URL of the API
        webRequest.Method = "POST";//the type of method the API returns
        webRequest.Timeout = 20000;//sets the timeout for thew request
        webRequest.ContentType = "application/x-www-form-urlencoded";//the content type. most of the times it will be application/x-www-form-urlencoded
        StreamReader MyStream = new StreamReader(webRequest.GetResponse().GetResponseStream());//creating a stream reader to read the results from the API
        string responseData = MyStream.ReadToEnd();//reading the result from the API into a string

        fbMsgID = responseData.Replace("{\"id\":\"", "").Replace("\"}", "").Substring(fbMsgID.LastIndexOf('_') + 1);

        return fbMsgID;
    }
}

#region Facebook User Basic Info
public class Hometown
{
    public string id { get; set; }
    public string name { get; set; }
}

public class Location
{
    public string id { get; set; }
    public string name { get; set; }
}

public class FbPicData
{
    public string url { get; set; }
    public bool is_silhouette { get; set; }
}

public class FbPicture
{
    public FbPicData data { get; set; }
}

public class FbUser
{
    public string id { get; set; }
    public string first_name { get; set; }
    public string last_name { get; set; }
    public string email { get; set; }
    public Hometown hometown { get; set; }
    public Location location { get; set; }
    public FbPicture picture { get; set; }
    public string countryName { get; set; }
    public string tmpToken { get; set; }
}
#endregion


public class CategoryList
{
    public string id { get; set; }
    public string name { get; set; }
}

public class LocationDetails
{
    public string street { get; set; }
    public string zip { get; set; }
    public double latitude { get; set; }
    public double longitude { get; set; }
}

public class LocationBase
{
    public string category { get; set; }
    public List<CategoryList> category_list { get; set; }
    public int checkins { get; set; }
    public string description { get; set; }
    public bool is_community_page { get; set; }
    public bool is_published { get; set; }
    public LocationDetails location { get; set; }
    public int talking_about_count { get; set; }
    public int were_here_count { get; set; }
    public string id { get; set; }
    public string name { get; set; }
    public string link { get; set; }
    public int likes { get; set; }
}

#region Facebook 'Pages'

public class FacebookPage
{
    public string name { get; set; }
    public string access_token { get; set; }
    public string category { get; set; }
    public string id { get; set; }
}

public class Paging
{
    public string previous { get; set; }
    public string next { get; set; }
}

public class FacebookPages
{
    public List<FacebookPage> data { get; set; }
    public Paging paging { get; set; }
}
#endregion

public class FacebookPagePost
{
    public string access_token { get; set; }
    public string message { get; set; }
    public string id { get; set; }
    public string link { get; set; }
}