using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_MissionStats : System.Web.UI.Page
{
    int MissionID = 0;
    protected void Page_Init(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString["MissionID"]) && int.TryParse(Request.QueryString["MissionID"].ToString(), out MissionID))
        {
            if (MissionID != 0)
            {
                TblShares.SqlFieldNames += string.Format(",(select count(*) from `tblposts2missions` as tbl2 where tbl2.usermail = tbl1.usermail AND tbl2.missionID = {0}  ) as TotalShares,(select count(*) from `tblposts2missions` as tbl2 where tbl2.usermail = tbl1.usermail AND tbl2.missionID = {0} AND Platform = 'FB'  ) as FBShares,(select count(*) from `tblposts2missions` as tbl2 where tbl2.usermail = tbl1.usermail AND tbl2.missionID = {0} AND Platform = 'Mail'  ) as MailShares,(select DatePosted from `tblposts2missions` as tbl2 where MissionID={0} AND givenpts!=0 AND tbl2.usermail = tbl1.usermail limit 1 ) as FirstShare,(select Platform from `tblposts2missions` as tbl2 where MissionID={0} AND givenpts!=0 AND tbl2.usermail = tbl1.usermail order by DatePosted limit 1 ) as FistSharePlatform", MissionID);
                TblShares.TblHeaderNames += ",סך הכול שיתופים,שיתופי פייסבוק,שיתופי מייל,תאריך שיתוף ראשון,שיתוף ראשי דרך..";
                TblShares.SqlGroupBy = "tbl1.usermail";
                TblShares.SqlWhereQuery = "tbl1.MIssionID=" + MissionID;
                TblShares.SortBy = "DatePosted";
                TblShares.ReplaceField = ",,,,,Mail=<span style=\"color:red;\">Mail</span>|FB=<span style=\"color:blue;\">Facebook</span>";
                TblShares.HasGroupBy = true;

            }
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request.QueryString["MissionID"]) && int.TryParse(Request.QueryString["MissionID"].ToString(), out MissionID))
        {
            if (MissionID != 0)
            {
                showmission.HRef = "missionfram.aspx?mission=" + MissionID;
                using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
                {
                    con.Open();
                    MySqlCommand _cmd = new MySqlCommand();
                    _cmd.Connection = con;
                    _cmd.CommandText = "Select * from tblpages where idtblpages = " + MissionID;
                    MySqlDataReader _dr = _cmd.ExecuteReader();
                    if (_dr.Read())
                    {

                        try
                        {
                            //Response.Write((DateTime.Parse(_dr["StartingDate"].ToString())).Date + " " + DateTime.Now.Date + "/n" + (DateTime.Parse(_dr["EndingDate"].ToString())).Date + " " + DateTime.Now.Date);
                            H1Title.InnerText = string.Format("סטטיסטיקות עבור משימה: {0}", _dr["pagename"].ToString());
                            lbl_MissionName.Text = _dr["pagename"].ToString();
                            lbl_MissionCode.Text = _dr["PageGuid"].ToString();
                            lbl_MissionEditLink.Text = string.Format("<a class=\"showmissionanchorclass\" href=\"ManagePages.aspx?contact={0}{1}\">עריכת משימה</a>", _dr["idtblpages"].ToString(), "&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"]);
                            lbl_MissionPts.Text = _dr["MissionPoints"].ToString();
                            lbl_facebookMissionPts.Text = _dr["MissionFacebookPoints"].ToString();
                            lbl_MissionStatus.Text = ((DateTime.Parse(_dr["StartingDate"].ToString())).Date <= DateTime.Now.Date && (DateTime.Parse(_dr["EndingDate"].ToString())).Date >= DateTime.Now.Date) ? "<span style=\"color:green; font-weight:bold;\">משימה בתוקף</span>" : "<span style=\"color:red; font-weight:bold;\">משימה לא בתוקף</span>";
                            lbl_MissionDates.Text = string.Format("{0} - {1}", DateTime.Parse(_dr["StartingDate"].ToString()).ToShortDateString(), DateTime.Parse(_dr["EndingDate"].ToString()).ToShortDateString());
                        }
                        catch
                        { }
                    }
                    _dr.Close();
                    _cmd.CommandText = "select *,(select count(*) from tblposts2missions as tbl2 where tbl2.MissionName = tbl1.MissionName ) as TotalShares,(select count(distinct Usermail) from tblposts2missions as tbl2 where tbl2.MissionName = tbl1.MissionName) as TotalUniqueShares,(select sum( GivenPts) from tblposts2missions as tbl2 where tbl2.MissionName = tbl1.MissionName) as TotalGivenPts from tblposts2missions as tbl1 where MissionName ='" + lbl_MissionCode.Text + "'  group by MissionName";
                    _dr = _cmd.ExecuteReader();
                    if (_dr.Read())
                    {
                        lbl_MissionTotalShares.Text = _dr["TotalShares"].ToString();
                        lbl_totalUniqeShares.Text = _dr["TotalUniqueShares"].ToString();
                        lbl_TotalGivenPts.Text = _dr["TotalGivenPts"].ToString();

                    }
                    _dr.Close();
                    _cmd.CommandText = "Select * from tblposts2missions  where MissionName = '" + lbl_MissionCode.Text + "'  group By UserMail order by DatePosted";
                    _dr = _cmd.ExecuteReader();
                    if (_dr.HasRows)
                    {
                        ShareresRepeater.DataSource = _dr;
                        ShareresRepeater.DataBind();
                    }
                    _dr.Close();
                    _cmd.CommandText = "SELECT count(*) from tbljoinenters where  MissionName='" + lbl_MissionCode.Text + "'";
                    _dr = _cmd.ExecuteReader();
                    if (_dr.Read())
                    {
                        lblJoinEnteries.Text = _dr.GetInt32(0).ToString();
                    }
                    _dr.Close();


                    _cmd.CommandText = "SELECT tagname FROM tbltagsformissions left join tbltags on tbltags.tbltagsid=tbltagsformissions.tagid where missionid=" + MissionID;
                    _dr = _cmd.ExecuteReader();
                    while (_dr.Read())
                    {
                        MissionTags.Text += _dr["tagname"].ToString() +", ";
                    }
                    _dr.Close();
                    if (MissionTags.Text!="")
                    {
                        MissionTags.Text = MissionTags.Text.Remove((MissionTags.Text.Length - 2), 2);    
                    }
                    
                    SharesTable.SqlFieldNames = "DatePosted,Platform,concat(FBResponseID|'/posts/'|FBResponsePostID) AS FacebookLink,UserMail";
                    SharesTable.TblHeaderNames = "תאריך שיתוף,פלטפורמה,קישור,כתובת מייל";
                    SharesTable.SqlWhereQuery = "missionName='" + lbl_MissionCode.Text+"'";
                    SharesTable.SortBy = "DatePosted";
                    SharesTable.ReplaceField = ",,,";
                    SharesTable.CustomField = ",,<a target=\"_blank\" href=\"http://facebook.com/{0}\" >{0}</a>,";

                    JoinEntersViaUsers.SqlWhereQuery = "missionName='" + lbl_MissionCode.Text + "' and referrer !='0'";
                    JoinEntersViaUsers.SqlFieldNames = "tblusers.EmailAddress, count(tbl1.referrer) as mycount";
                    JoinEntersViaUsers.TblName = "tbljoinenters as tbl1 left join tblusers on tbl1.Referrer=tblusers.Guid";
                    JoinEntersViaUsers.TblHeaderNames = "כתובת מייל,כמות נכנסים על ידי JOIN";
                    JoinEntersViaUsers.SqlGroupBy = "Referrer";
                    JoinEntersViaUsers.ReplaceField = ",";

                    //_cmd.CommandText = "SELECT * from tbljoinregisters where MissionName='" + lbl_MissionCode.Text + "'";
                    //_dr = _cmd.ExecuteReader();
                    //if (_dr.HasRows)
                    //{
                    //    RegistersRepeater.DataSource = _dr;
                    //    RegistersRepeater.DataBind();

                    //}
                    //_dr.Close();
                    JoinRegistersViaUsers.SqlWhereQuery = "missionName='" + lbl_MissionCode.Text + "' and refferer !='0'";
                    JoinRegistersViaUsers.SqlFieldNames = "tbl1.EmailAddress,CreationDate,tblusers.EmailAddress,GrpID";
                    JoinRegistersViaUsers.TblName = "tbljoinregisters as tbl1 left join tblusers on tbl1.Refferer=tblusers.Guid";
                    JoinRegistersViaUsers.TblHeaderNames = "נרשם חדש,תאריך רישום,מי הביא אותו,ארגון";
                    //JoinRegistersViaUsers.SqlGroupBy = "Refferer";
                    JoinRegistersViaUsers.ReplaceField = ",,,";
                    con.Close();
                }
                backUrl.HRef = "ManagePages.aspx?&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];
                backUrl.InnerText = "חזור לכל הדפים";
            }
        }

    }
}