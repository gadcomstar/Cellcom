using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for facebookclass
/// </summary>
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
        public DateTime birthday { get; set; }
        public location location { get; set; }
    }
    #endregion

    #region Google  Classes
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
        public string birthday { get; set; }
    }
   
    public class location
    { 
        public string id { get; set; }
        public string name { get; set; }
    }
    #endregion
