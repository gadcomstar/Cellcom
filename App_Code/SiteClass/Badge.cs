using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Badge
/// </summary>
public class Badge
{
    public int ID { set; get; }
    public string Name { set; get; }
    public string Image { set; get; }
    public string Description { set; get; }
    public int TagId { set; get; }
    public string Tag { set; get; }
    public int TypeID { set; get; }
    public string Type { set; get; }
    public int Parameter { set; get; }
    public BadgTypeEnum MyType { set; get; }
    public int Channel { set; get; }
    public static List<Badge> BadgeList = new List<Badge>();
    public List<int> MissionList = new List<int>();
    public List<int> AssociatedBadgesList = new List<int>();
    public string ShareLink { get; set; }
    public Badge()
    {
    }
    public static List<Badge> GetBadgeList()
    {
        if (BadgeList.Count == 0)
        {
            using (MySqlConnection conn = new MySqlConnection(cmstrDefualts.ConnStr))
            {
                conn.Open();
                string sql = String.Format("Select (Select group_concat(cast( missionid as char)) from  tblbadgemissions where tblbadgemissions.badgeid=tblbadges.badgid) as mymissions, (Select group_concat(cast(tblcronicalbadges.NeedBadgeID as char)) from  tblcronicalbadges where tblcronicalbadges.badgeid=tblbadges.badgid) as myBadgesTags,badgid,badgename,badgeImage,badgedescription, bagdeassociation,(Select tagName From tbltags where tblTagsid=bagdeassociation) as tagName,badgetype,(Select tblBadgeTypesName from tblbadgetypes where tblBadgeTypesid=badgetype ) as typeName,badgemissintype,badgecount,badgemission, badgechannel From tblbadges where badgedel=0 ");
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    Badge myBadge = new Badge();
                    myBadge.ID = dr.GetInt32("badgid");
                    myBadge.Name = dr.GetString("badgename");
                    myBadge.Image = dr.GetString("badgeImage");
                    myBadge.Description = dr.GetString("badgedescription");
                    myBadge.TagId = dr.GetInt32("bagdeassociation");
                    myBadge.Tag = dr["tagName"].ToString();
                    myBadge.TypeID = dr.GetInt32("badgetype");
                    myBadge.Type = dr["typeName"].ToString();
                    myBadge.MyType = (BadgTypeEnum)myBadge.TypeID;
                    myBadge.Parameter = dr.GetInt32("badgecount");
                    myBadge.Channel = dr.GetInt32("badgechannel");
                    string[] myMissions = dr["mymissions"].ToString().Split(',');
                    string[] myBadgesTags = dr["myBadgesTags"].ToString().Split(',');
                    foreach (string item in myMissions)
                    {
                        int myMission = 0;

                        if (int.TryParse(item, out myMission) && !myBadge.MissionList.Contains(myMission))
                        {
                            myBadge.MissionList.Add(myMission);
                        }
                    }
                    foreach (string item in myBadgesTags)
                    {
                        int myAssociatedBadges = 0;

                        if (int.TryParse(item, out myAssociatedBadges) && !myBadge.MissionList.Contains(myAssociatedBadges))
                        {
                            myBadge.AssociatedBadgesList.Add(myAssociatedBadges);
                        }
                    }
                    if (!BadgeList.Contains(myBadge))
                    {
                        BadgeList.Add(myBadge);
                    }
                }
                dr.Close();
            }
        }
        return BadgeList;
    }
    public static void ClearList()
    {
        BadgeList.Clear();
    }
    public static List<Badge> AddBadge(BadgTypeEnum myBadgeType, MySqlConnection conn, string email)
    {
        return (AddBadge(myBadgeType, conn, email, "0"));
    }
    public static List<Badge> AddBadge(BadgTypeEnum myBadgeType, MySqlConnection conn, string email, string mission)
    {
        int userid = 0;
        int missionTotal = 0;
        int FBmissions = 0;
        int mailMission = 0;
        float shortTime = 0;
        int missionID = 0;
        int points = 0;
        int missionCount = 0;
        Dictionary<int, int> tags = getTags(conn);
        List<int> PostedUsersList = new List<int>();
        List<int> MyBadgesList = new List<int>();
        string minVal = String.Format("(Select  Min( Time_to_sec(  TIMEDIFF(DatePosted,StartingDate))/3600)  From tblposts2missions Left join tblpages On tblposts2missions.MissionID=tblpages.idtblpages  where UserMail='{0}' ) as ShortTime  ", email);
        string pointquery = String.Format("( Select sum(GivenPts) from tblposts2missions where  UserMail='{0}' ) as Mypoints", email);
        string missionCountQuery = String.Format("(Select count(userMail) as myCount From (Select userMail from  tblposts2missions where missionid={0} group by (userMail)) as MyMember ) as missionCount", mission);
        string MissionIDQuery = String.Format("(select idtblpages from tblpages where pageguid='{0}' ) as MissionID", mission);

        string sql = String.Format("Select UserID,(Select count(MissionID) as MyCount From tblposts2missions where UserMail='{0}' ) as countMission,(Select count(MissionID) as MyCount2 From tblposts2missions where UserMail='{0}' AND Platform='Mail' ) as countMailMission,(Select count(MissionID) as MyCount3 From tblposts2missions where UserMail='{0}' AND Platform='FB' ) as countFBMission ,{1},{2},{3},{4}  From tblusers where EmailAddress='{0}'", email, minVal, pointquery, missionCount, MissionIDQuery);
        MySqlCommand cmd = new MySqlCommand(sql, conn);
        MySqlDataReader dr = cmd.ExecuteReader();
        if (dr.Read())
        {
            userid = dr.GetInt32("UserID");
            missionTotal = dr.GetInt32("countMission");
            FBmissions = dr.GetInt32("countFBMission");
            mailMission = dr.GetInt32("countMailMission");
            float.TryParse(dr["ShortTime"].ToString(), out shortTime);
            int.TryParse(dr["Mypoints"].ToString(), out points);
            int.TryParse(dr["countMission"].ToString(), out missionCount);
            int.TryParse(dr["MissionID"].ToString(), out missionID);
        }
        dr.Close();


        if (myBadgeType == BadgTypeEnum.Tags)
        {
            string tagsQuery = String.Format("SELECT tblposts2missions.missionid,tblposts2missions.usermail, tbltagsformissions.tagid FROM tblposts2missions left join tbltagsformissions on tbltagsformissions.MissionID=tblposts2missions.MissionID where usermail='{0}' and tagid is not null group by missionid,tagid;", email);
            cmd.CommandText = tagsQuery;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                if (tags.ContainsKey(dr.GetInt32("TagID")))
                {
                    tags[dr.GetInt32("TagID")]++;
                }
            }
            dr.Close();
        }

        if (myBadgeType == BadgTypeEnum.FirstPeople)
        {
            string FirstPeopleQuery = String.Format("SELECT tblusers.UserID FROM tblposts2missions left join tblusers on tblusers.EmailAddress=tblposts2missions.UserMail where missionName= '{0}' and UserID is not null group by usermail order by dateposted;", mission);
            cmd.CommandText = FirstPeopleQuery;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                PostedUsersList.Add(int.Parse(dr["UserID"].ToString()));
            }
            dr.Close();
        }


        if (myBadgeType == BadgTypeEnum.SeveralBadges)
        {
            string MyBadgesQuery = String.Format("SELECT badgeid FROM tblbadgesofuser where userid={0}", userid);
            cmd.CommandText = MyBadgesQuery;
            dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                MyBadgesList.Add(dr.GetInt32("badgeid"));
            }
            dr.Close();
        }

        if (userid > 0)
        {
            return (AddBadge(myBadgeType, conn, userid, missionTotal, FBmissions, mailMission, shortTime, points, mission, tags, PostedUsersList, missionID, MyBadgesList));
        }
        else
        {
            return null;
        }

    }
    public static List<Badge> AddBadge(BadgTypeEnum myBadgeType, MySqlConnection conn, int userid)
    {
        return (AddBadge(myBadgeType, conn, userid, 0, 0, 0, 0, 0, "0", new Dictionary<int, int>(), new List<int>(), 0, new List<int>()));
    }
    public static List<Badge> AddBadge(BadgTypeEnum myBadgeType, MySqlConnection conn, int userid, float shortTime, string mission)
    {
        return (AddBadge(myBadgeType, conn, userid, 0, 0, 0, shortTime, 0, mission, new Dictionary<int, int>(), new List<int>(), 0, new List<int>()));
    }
    public static List<Badge> AddBadge(BadgTypeEnum myBadgeType, MySqlConnection conn, int userid, int missionTotal, int FBmissions, int mailMission, float shortTime, int points, string mission, Dictionary<int, int> tags, List<int> PostedUsersList, int MissionID, List<int> MyBadgesList)
    {
        List<Badge> myBagesFromType = GetBadgeList().Where(x => x.MyType == myBadgeType).ToList();
        if (myBagesFromType.Count > 0)
        {
            for (int i = 0; i < myBagesFromType.Count; i++)
            {
                bool insertBadge = false;
                // checking if user already has this badge
                string sql = String.Format("Select * From tblbadgesofuser where userid={0} AND badgeid={1}", userid, myBagesFromType[i].ID);
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                MySqlDataReader dr = cmd.ExecuteReader();
                if (!dr.Read())
                {
                    insertBadge = true;
                }
                dr.Close();

                //checking badge
                if (insertBadge)
                {
                    switch (myBadgeType)
                    {
                        case BadgTypeEnum.Join:
                            break;
                        case BadgTypeEnum.NumberOfMission:
                            switch (myBagesFromType[i].Channel)
                            {
                                case 0:
                                    if (myBagesFromType[i].Parameter > missionTotal)
                                    {
                                        insertBadge = false;
                                    }
                                    break;
                                case 1:
                                    if (myBagesFromType[i].Parameter > FBmissions)
                                    {
                                        insertBadge = false;
                                    }
                                    break;
                                case 2:
                                    if (myBagesFromType[i].Parameter > mailMission)
                                    {
                                        insertBadge = false;
                                    }
                                    break;
                                //case 3:
                                //if (myBagesFromType[i].Parameter < shortTime)
                                //{
                                //    insertBadge = false;
                                //}
                                //break;                      
                            }
                            break;
                        case BadgTypeEnum.FastReaction:
                            if (myBagesFromType[i].Parameter < shortTime)
                            {
                                insertBadge = false;
                            }
                            break;
                        case BadgTypeEnum.Points:
                            if (myBagesFromType[i].Parameter > points)
                            {
                                insertBadge = false;
                            }
                            break;
                        case BadgTypeEnum.Mission:
                            if (myBagesFromType[i].MissionList.Contains(MissionID))
                            {
                                if (myBagesFromType[i].Parameter > 0 && myBagesFromType[i].Parameter > missionTotal)
                                {
                                    insertBadge = false;
                                }
                            }
                            else
                            {
                                insertBadge = false;
                            }
                            break;
                        case BadgTypeEnum.Tags:
                            if (tags.ContainsKey(myBagesFromType[i].TagId))
                            {
                                if (myBagesFromType[i].Parameter > tags[myBagesFromType[i].TagId])
                                {
                                    insertBadge = false;
                                }
                            }
                            break;
                        case BadgTypeEnum.FirstPeople:
                            for (int ii = 0; ii < myBagesFromType[i].Parameter; i++)
                            {
                                if (PostedUsersList[ii] == userid)
                                {
                                    insertBadge = true;
                                    break;
                                }
                                else
                                {
                                    insertBadge = false;
                                }
                            }
                            break;
                        case BadgTypeEnum.SeveralBadges:
                            for (int ii = 0; ii < myBagesFromType[i].AssociatedBadgesList.Count; ii++)
                            {
                                if (!MyBadgesList.Contains(myBagesFromType[i].AssociatedBadgesList[ii]))
                                {
                                    insertBadge = false;
                                }
                            }
                            break;
                    }

                    if (insertBadge)
                    {
                        cmd.CommandText = String.Format("Insert Into TblBadgesOfUser (userid,badgeid,badgedate) Values ({0},{1},now())", userid, myBagesFromType[i].ID);
                        cmd.ExecuteNonQuery();
                        return myBagesFromType;
                    }
                }
            }
        }
        return null;
    }

    public static Dictionary<int, int> getTags(MySqlConnection conn)
    {
        Dictionary<int, int> tags = new Dictionary<int, int>();
        string sql = "select tblTagsID from tbltags";

        MySqlCommand cmd = new MySqlCommand(sql, conn);
        MySqlDataReader dr = cmd.ExecuteReader();
        while (dr.Read())
        {
            tags.Add(int.Parse(dr["tblTagsID"].ToString()), 0);
        }
        dr.Close();
        return tags;
    }


    public static void UpdateBadgeToOld(string UserMail)
    {
        int userID = 0;
        using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
        {
            con.Open();
            string sql = "SELECT UserID from tblUsers where EmailAddress='" + UserMail + "' limit 1";
            MySqlCommand cmd = new MySqlCommand(sql, con);
            MySqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                int.TryParse(dr["UserID"].ToString(), out userID);
            }
            dr.Close();
            cmd.CommandText = String.Format("UPDATE tblbadgesofuser set AlreadyWatched=0 where userid={0}", userID);
            cmd.ExecuteNonQuery();
            con.Close();
        }
    }
}
public enum BadgTypeEnum
{
    Join = 1, NumberOfMission = 2, FastReaction = 3, Points = 4, Mission = 5, Tags = 6, FirstPeople = 7, SeveralBadges = 8
}