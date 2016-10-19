using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class page_badges : System.Web.UI.Page
{
    string usermail="";
    int User_ID = 0;
    string User_Fullname = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Logged"] == null)
        {
            Response.Redirect("login.aspx");
        }
        else
        {

            if (Session["LoggedUserMail"] != null)
            {
                usermail = Session["LoggedUserMail"].ToString();
            }
            if (usermail != "")
            {
                Thread.CurrentThread.CurrentCulture = new CultureInfo("en-US");
                bool UsersExists = false;
                using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
                {
                    con.Open();
                    MySqlCommand cmd = new MySqlCommand();
                    cmd.Connection = con;
                    cmd.CommandText = "SELECT UserID,FullName from tblUsers where EmailAddress='" + usermail + "' limit 1";
                    MySqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        int.TryParse(dr["UserID"].ToString(), out User_ID);                      
                        User_Fullname = dr["FullName"].ToString();
                        UsersExists = true;
                    }
                    dr.Close();

					cmd.CommandText = String.Format("Select tblbadgesofuser.badgedate,badgeImage,badgename,badgedescription,badgeID from tblbadgesofuser left join tblbadges on tblbadgesofuser.badgeid=tblbadges.badgid where userid={0} AND tblbadges.badgid is NOT null", User_ID);
                    dr = cmd.ExecuteReader();
                    BadgeRepeater.DataSource = dr;
                    BadgeRepeater.DataBind();
                    dr.Close();
                }
                FullNameLabel.Text = User_Fullname;
            }
        }

    }
}