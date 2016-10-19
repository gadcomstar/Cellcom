using isendAPI;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_MailingListsChecker : System.Web.UI.Page
{
    int OriginMLID = 0;
    int DestMLID = 0;
    public int TotalResults = 0;
    List<SendMsgUser> FoundUsersList = new List<SendMsgUser>();
    protected void Adduser_WL(int SiteID, string Mail, int ListID)
    {
        bool tmp;
        bool AddUsersToListResult;
        SendMsgResults _res = new SendMsgResults();
        SendMsgService _svc = new SendMsgService();
        List<SendMsgUser> _UsersList = new List<SendMsgUser>();
        List<SendMsgList> _mailList = new List<SendMsgList>();
        _mailList.Add(new SendMsgList() { ExistingListID = ListID, ExistingListIDSpecified = true });
        _UsersList.Add(new SendMsgUser() { EmailAddress = Mail });

        _svc.AddUsersToLists(SiteID, true, "IL110077", _UsersList.ToArray(), _mailList.ToArray(), out AddUsersToListResult, out tmp, out _res);


    }
    protected void Page_Load(object sender, EventArgs e)
    {
        bool _t;
        bool _t2;
        SendMsgResults _res;
        SendMsgList[] _lists;
        SendMsgService _svc = new SendMsgService();
        _svc.GetMailingListNames(5078, true, "IL110077", out _t, out _t2, out _lists, out _res);
        List<SendMsgList> _sendMsgLists = _lists.ToList();
        if (!IsPostBack)
        {
            foreach (SendMsgList item in _lists)
            {
                DDL_DestinationList.Items.Add(new ListItem() { Text = item.ExistingListID.ToString() + " - " + item.NewListDescription, Value = item.ExistingListID.ToString() });
                DDL_OriginalList.Items.Add(new ListItem() { Text = item.ExistingListID.ToString() + " - " + item.NewListDescription, Value = item.ExistingListID.ToString() });
            }
        }


    }
    protected void btnStartProcedure_Click(object sender, EventArgs e)
    {
        int.TryParse(DDL_DestinationList.SelectedValue, out DestMLID);
        int.TryParse(DDL_OriginalList.SelectedValue, out OriginMLID);


        if (DestMLID != 0 && OriginMLID != 0)
        {

            bool _t;
            bool _t2;
            SendMsgUser[] _users;
            SendMsgResults _res;
            SendMsgService _svc = new SendMsgService();
            _svc.GetMailingListUsers(5078, true, "IL110077", OriginMLID, true, SendMsgUsersRequestType.AllUsers, true, out _t, out _t2, out _users, out _res);
            List<SendMsgUser> _lst = _users.ToList<SendMsgUser>();
            var q = _lst.Where(x => x.DeleteUserSpecified == true).ToList();
            using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
            {
                con.Open();
                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = con;
                foreach (SendMsgUser item in q)
                {
                    cmd.CommandText = "SELECT * from tblusers where EmailAddress='" + item.EmailAddress + "'";
                    MySqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows)
                    {
                        FoundUsersList.Add(item);
                    }
                    dr.Close();
                }
                con.Close();
            }
            foreach (SendMsgUser item in FoundUsersList)
            {
                Adduser_WL(5078, item.EmailAddress, DestMLID);
            }
            Repeater_FoundUsers.DataSource = FoundUsersList;
            Repeater_FoundUsers.DataBind();
            if (FoundUsersList.Count > 0)
            {
                Panel_FoundUsers.Visible = true;
                TotalResults = FoundUsersList.Count;
            }
        }
        else
        {
            lblStatus.Text = "הייתה בעיה בתהליך, אנא פנה למתכנת";
        }

    }

    protected void Unnamed_ServerValidate(object source, ServerValidateEventArgs args)
    {
        //int tmptxt1 = 0;
        //int tmptxt2 = 0;
        //int.TryParse(txtDestinationMailingListID.Text, out tmptxt1);
        //int.TryParse(txtOriginMailingListID.Text, out tmptxt2);
        //if (tmptxt1 == 0 || tmptxt2 == 0)
        //{
        //    args.IsValid = false;
        //}
    }
}