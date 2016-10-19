using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Linq;
using MySql.Data.MySqlClient;

public partial class EditBadges : System.Web.UI.Page
{
    int badgeid = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        using (MySqlConnection conn = new MySqlConnection(cmstrDefualts.ConnStr))
        {
            conn.Open();
            // Badge.AddBadge(BadgTypeEnum.Join, conn, 29);
        }

        //CMSTRDropDownControl myTagsDropDown = (CMSTRDropDownControl)BlogTypeMyForm.FindControl("BadgeTags");
        CMSTRDropDownControl myTTypeDropDown = (CMSTRDropDownControl)BlogTypeMyForm.FindControl("BagTypeMyDropDown");
        CMSTRDropDownControl myTagsDropDown2 = (CMSTRDropDownControl)BlogTypeMyForm.FindControl("ChooseTagMyDropDown");
        List<Tags> MyList = Tags.GetList();

        //myTagsDropDown.ListItems.Add(new ListItem("בחר", "0"));
        myTagsDropDown2.ListItems.Add(new ListItem("בחר", "0"));
        if (MyList.Count > 0)
        {
            for (int i = 0; i < MyList.Count; i++)
            {
                //myTagsDropDown.ListItems.Add(new ListItem(MyList[i].Name, MyList[i].ID.ToString()));
                myTagsDropDown2.ListItems.Add(new ListItem(MyList[i].Name, MyList[i].ID.ToString()));
            }
        }
        List<BadgeType> MyBagTypeList = BadgeType.GetList();

        myTTypeDropDown.ListItems.Add(new ListItem("בחר", "0"));

        if (MyBagTypeList.Count > 0)
        {
            for (int i = 0; i < MyBagTypeList.Count; i++)
            {
                myTTypeDropDown.ListItems.Add(new ListItem(MyBagTypeList[i].Name, MyBagTypeList[i].ID.ToString()));
            }
        }

        if (cmstrDefualts.CheckQueryString("badge", out badgeid))
        {
            if (badgeid == 0)
            {
                BlogTypeMyForm.FormStatus = CMSTRFormWebUserControl.Status.Insert;
                //myTagsDropDown.ListItems[0].Selected = true;
                myTTypeDropDown.SelectedValue = "0";
                myTagsDropDown2.SelectedValue = "0";
            }
            else
            {
                if (!IsPostBack)
                {
                    List<Badge> myBadge = Badge.GetBadgeList().Where(x => x.ID == badgeid).ToList();
                    Response.Write(myBadge[0].MissionList.Count);
                    if (myBadge.Count > 0 && myBadge[0].MissionList.Count > 0)
                    {
                        string[] myArray = myBadge[0].MissionList.Select(x => x.ToString()).ToArray();
                        ((tableControl)BlogTypeMyForm.FindControl("MissionTable")).SelectedValsHidVal = String.Join(",", myArray);
                    }
                    if (myBadge.Count > 0 && myBadge[0].AssociatedBadgesList.Count > 0)
                    {
                        string[] myAssociatedBadgesArray = myBadge[0].AssociatedBadgesList.Select(x => x.ToString()).ToArray();
                        ((tableControl)BlogTypeMyForm.FindControl("BadgeTable")).SelectedValsHidVal = String.Join(",", myAssociatedBadgesArray);
                    }
                }
                BlogTypeMyForm.FormStatus = CMSTRFormWebUserControl.Status.Update;
                BlogTypeMyForm.DataKeyFieldValue = badgeid;
            }
            BlogTypeMyForm.BackURL = "ManageBadges.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&sitelang=" + Request.QueryString["sitelang"];

        }


    }

    protected void BlogTypeMyForm_ItemUpdated(string NewUserID)
    {
        siteDefaults.SiteParam.Clear();
    }
    protected string BlogTypeMyForm_ItemInserting()
    {
        ((CMSTRHiddenField)BlogTypeMyForm.FindControl("MyDateMyHiddenField")).Value = DateTime.Now.ToString();
        return "insert";
    }
    protected void BlogTypeMyForm_ItemInserted(string NewUserID)
    {
        string myVals = ((tableControl)BlogTypeMyForm.FindControl("MissionTable")).SelectedValsHidVal;
        string[] myValsArray = myVals.Split(',');

        string myBadgesVals = ((tableControl)BlogTypeMyForm.FindControl("BadgeTable")).SelectedValsHidVal;
        string[] myBadgesValsArray = { };
        myBadgesValsArray = myBadgesVals.Split(',');



        using (MySqlConnection conn = new MySqlConnection(cmstrDefualts.ConnStr))
        {
            conn.Open();
            string sql = String.Format("Delete From tblbadgemissions where badgeid={0}", NewUserID);
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            cmd.ExecuteNonQuery();
            foreach (string mission in myValsArray)
            {
                int missionNumber = 0;
                if (int.TryParse(mission, out missionNumber))
                {
                    cmd.CommandText = String.Format("Insert Into tblbadgemissions (badgeid,missionid) Values ({0},{1})", NewUserID, mission);
                    cmd.ExecuteNonQuery();
                }

            }



            sql = String.Format("Delete From tblcronicalbadges where badgeid={0}", NewUserID);
            cmd = new MySqlCommand(sql, conn);
            cmd.ExecuteNonQuery();
            foreach (string badge in myBadgesValsArray)
            {
                int TagNumber = 0;
                if (int.TryParse(badge, out TagNumber))
                {
                    cmd.CommandText = String.Format("Insert Into tblcronicalbadges (badgeid,NeedBadgeID) Values ({0},{1})", NewUserID, badge);
                    cmd.ExecuteNonQuery();
                }

            }
        }
        Badge.ClearList();

    }

}
