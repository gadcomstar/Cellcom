using isendAPI;
using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ManageUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        tblUsers.EditUrl += "&sub=" + Request.QueryString["sub"] + "&cat=" + Request.QueryString["cat"];
        tblUsers.AddLink += "?sub=" + Request.QueryString["sub"] + "&cat=" + Request.QueryString["cat"];
        tblUsersWithFacebook.EditUrl += "&sub=" + Request.QueryString["sub"] + "&cat=" + Request.QueryString["cat"];
        TableControl1.EditUrl += "&sub=" + Request.QueryString["sub"] + "&cat=" + Request.QueryString["cat"];
    }
    protected void Unnamed_Click(object sender, EventArgs e)
    {
        bool _t;
        bool _t2;
        SendMsgUser[] _users;
        SendMsgResults _res;
        SendMsgService _svc = new SendMsgService();
        _svc.GetMailingListUsers(5078, true, "IL110077", 17, true, SendMsgUsersRequestType.AllUsers, true, out _t, out _t2, out _users, out _res);
        List<SendMsgUser> _lst = _users.ToList<SendMsgUser>();
        var q = _lst.Where(x => x.DeleteUserSpecified == true).ToList();

        using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
        {
            con.Open();
            MySqlCommand _cmd = new MySqlCommand();
            _cmd.Connection = con;
            q.ForEach(p =>
            {
                bool itemExists = false;
                _cmd.CommandText = "SELECT * from tblUsers where EmailAddress ='" + p.EmailAddress + "'";
                MySqlDataReader _dr = _cmd.ExecuteReader();
                if (_dr.HasRows)
                {
                    itemExists = true;
                }
                _dr.Close();
                if (!itemExists)
                {
                    _cmd.CommandText = string.Format("INSERT into tblUsers (tblUsers.FullName,tblUsers.EmailAddress,tblUsers.Password) Values('{0}','{1}','{2}')", p.UserSystemFields[0].Value, p.EmailAddress, p.UserSystemFields[1].Value);
                    _cmd.ExecuteNonQuery();
                }
            });

            con.Close();
        }


    }
}