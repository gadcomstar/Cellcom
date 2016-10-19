using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net;
using System.IO;
using FbNS;
using MySql.Data.MySqlClient;
using System.Threading;
using System.Timers;


public static class Processes
{

    /// <summary>
    /// Sets timer for proccess- the interval sets for 6 hours
    /// </summary>
    public static void StartTimer() 
    {
        System.Timers.Timer timer = new System.Timers.Timer();
        timer.Elapsed += new ElapsedEventHandler(timer_Tick);
        timer.Interval = (1000) * (60)*(60)*(6); //Every 6 hours
        timer.Enabled = true;
        timer.Start();
    }

    static void timer_Tick(object sender, EventArgs e)
    {
        Thread thread = new Thread(new ThreadStart(processMissions));
        thread.IsBackground = true;
        thread.Start();
    }

    /// <summary>
    /// The proccess itself, gets likes and comments from Facebook
    /// </summary>
    public static void processMissions()
    {
        MySqlDataReader dr;
        MySqlCommand CMD= new MySqlCommand();
        int proccessID = 0;
        List<ThreadingMissionPost> List_Posts = new List<ThreadingMissionPost>();
        using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
        {
            con.Open();
            CMD.Connection = con;

            //INSERTS NEW PROCCESS TIMESTAMP
            CMD.CommandText = string.Format("INSERT into ThreadsRecord (ThreadStartedAt) VALUES ('{0}');", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"));
            CMD.ExecuteNonQuery();
            CMD.CommandText = "SELECT @@identity AS myID";
            dr = CMD.ExecuteReader();
            if (dr.Read())
            {
                proccessID = int.Parse(dr["myID"].ToString());
            }
            dr.Close();

            CMD.CommandText = "SELECT tblposts2missions.*, tblusers.LoginTypeToken as UserTokenAccess FROM israelikedb.tblposts2missions left join tblusers on tblusers.EmailAddress= tblposts2missions.UserMail where Platform = 'FB' AND FBResponsePostID is not null and (UserMail is not null AND usermail != '');";
            dr = CMD.ExecuteReader();
            while (dr.Read())
            {
                ThreadingMissionPost TmpPost = new ThreadingMissionPost();
                TmpPost.MissionPostID = dr["MissionPostID"].ToString();
                TmpPost.UserMail = dr["UserMail"].ToString();
                TmpPost.MissionID = int.Parse(dr["MissionID"].ToString());
                TmpPost.MissionGUID = dr["MissionName"].ToString();
                TmpPost.FBUserID = dr["FBResponseID"].ToString();
                TmpPost.FB_ShareID = dr["FBResponsePostID"].ToString();
                TmpPost.ShareLikes = int.Parse(dr["TotalpostLikes"].ToString());
                TmpPost.ShareComments = int.Parse(dr["TotlaPostComments"].ToString());
                TmpPost.UserTokenAccess = dr["UserTokenAccess"].ToString();
                List_Posts.Add(TmpPost);
            }
            dr.Close();
            con.Close();
            
        }
        try
        {
            foreach (var item in List_Posts)
            {
                //GET NUMBER OF LIKES!
                HttpWebRequest webRequest = (HttpWebRequest)System.Net.WebRequest.Create("https://graph.facebook.com/" + item.FB_ShareID + "/likes?access_token=" + siteDefaults.MyAppToken + "&summary=true"); //setting an httpWebRequest with the URL of the API
                webRequest.Method = "GET";//the type of method the API returns
                webRequest.Timeout = 70000;//sets the timeout for thew request
                webRequest.ContentType = "application/x-www-form-urlencoded";//the content type. most of the times it will be application/x-www-form-urlencoded
                StreamReader MyStream = new StreamReader(webRequest.GetResponse().GetResponseStream());//creating a stream reader to read the results from the API
                string responseData = MyStream.ReadToEnd();//reading the result from the API into a string
                System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();//creating a JSON deserializer JSON.
                PostLikes TmpPostInfo = serializer.Deserialize<PostLikes>(responseData);//De-serealization of the string into an array of pre-defined objects
                if (TmpPostInfo != null && TmpPostInfo.summary != null)
                {
                    item.ShareLikes = TmpPostInfo.summary.total_count;
                }

                //GET NUMBER OF COMMENTS!
                webRequest = (HttpWebRequest)System.Net.WebRequest.Create("https://graph.facebook.com/" + item.FB_ShareID + "/comments?access_token=" + siteDefaults.MyAppToken + "&summary=true"); //setting an httpWebRequest with the URL of the API
                MyStream = new StreamReader(webRequest.GetResponse().GetResponseStream());//creating a stream reader to read the results from the API
                responseData = MyStream.ReadToEnd();//reading the result from the API into a string
                serializer = new System.Web.Script.Serialization.JavaScriptSerializer();//creating a JSON deserializer JSON.
                TmpPostInfo = serializer.Deserialize<PostLikes>(responseData);//De-serealization of the string into an array of pre-defined objects
                if (TmpPostInfo != null && TmpPostInfo.summary != null)
                {
                    item.ShareComments = TmpPostInfo.summary.total_count;
                }
            }
        }
        catch (Exception ex)
        {
            using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
            {
                CMD.Connection = con;
                con.Open();
                CMD.CommandText = string.Format("update ThreadsRecord SET ExceptionDetails='{0}' where idthreadsrecord='{1}'", ex.Message, proccessID);
                CMD.ExecuteNonQuery();
                con.Close();
            }
            
        }
        using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
        {
            CMD.Connection = con;
            con.Open();

            //UPDATE DATABASE WITH RESULTS!
            List_Posts.ForEach(p =>
            {
                CMD.CommandText = string.Format("UPDATE tblposts2missions set TotalpostLikes={0},TotlaPostComments={1},LastprocessUpdate=now() where MissionPostID = {2}", p.ShareLikes, p.ShareComments, p.MissionPostID);
                CMD.ExecuteNonQuery();
            });

            // UPDATES PROCCESS ENDING TIMESTAMP
            CMD.CommandText = string.Format("update ThreadsRecord SET ThreadEndedAt='{0}' where idthreadsrecord={1};", DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss"), proccessID);
            CMD.ExecuteNonQuery();

            con.Close();
        }
    }
}




public class ThreadingMissionPost
{
    public string MissionPostID { get; set; }
    public string UserMail { get; set; }
    public int MissionID { get; set; }
    public string MissionGUID { get; set; }
    public string FBUserID { get; set; }
    public string FB_ShareID { get; set; }
    public int ShareLikes { get; set; }
    public int ShareComments { get; set; }
    public string UserTokenAccess { get; set; }
}
//{
//  "data": [
//    {
//      "id": "100006993759910", 
//      "name": "Comstar Dev"
//    }
//  ], 
//  "paging": {
//    "cursors": {
//      "after": "MTAwMDA2OTkzNzU5OTEw", 
//      "before": "MTAwMDA2OTkzNzU5OTEw"
//    }
//  }, 
//  "summary": {
//    "total_count": 1
//  }
//}
namespace FbNS
{
    public class PostLikes
    {
        public Datum[] data { get; set; }
        public Paging paging { get; set; }
        public Summary summary { get; set; }
    }

    public class Paging
    {
        public Cursors cursors { get; set; }
    }

    public class Cursors
    {
        public string after { get; set; }
        public string before { get; set; }
    }

    public class Summary
    {
        public int total_count { get; set; }
    }

    public class Datum
    {
        public string id { get; set; }
        public string name { get; set; }
    }


}
