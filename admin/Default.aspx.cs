using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using System.Data.OleDb;
using MySql.Data.MySqlClient;
using System.IO;

public partial class _Default : System.Web.UI.Page
{
     MySqlDataReader MyReader = null;

    protected void Page_Load(object sender, EventArgs e)
    {  

        if (Session["ManUN"] != null)
        {
            Response.Redirect("AdminHome.aspx?cat=65");
        }
        else if (Request.Cookies["adminspindate"] != null)
        {
            HttpCookie rememberCookie = Request.Cookies["adminspindate"];
            Session["SiteID"] = rememberCookie.Values["SiteID"];
            Session["LastLogin"] = rememberCookie.Values["LastLogin"];
            Session["ManUN"] = rememberCookie.Values["ManUN"];
            Session["secLevel"] = rememberCookie.Values["secLevel"];
            Response.Redirect("AdminHome.aspx?cat=65");
        }

        Page.Title = "מערכת ניהול-"+ siteDefaults.SiteName;
        TitleLabel.Text = siteDefaults.SiteName;
		UserName.Attributes.Add("onkeypress", "return clickButton(event,'" + LinkButton1.ClientID + "')");
		UserPass.Attributes.Add("onkeypress", "return clickButton(event,'" + LinkButton1.ClientID + "')");
		//get a random background from gif images in the backgrounds directory
		if (Directory.Exists(MapPath("backgrounds")))
		{
			if (Directory.GetFiles(MapPath("backgrounds")).Length>0)
			{
				string[] backgrounds = Directory.GetFiles(MapPath("backgrounds"),"*.gif");
				Random rand = new Random();
				defaultMain.Style.Add("background-image", "url('backgrounds/EnterBack" + rand.Next(1, backgrounds.Length + 1) + ".gif'");
			}
		}

          
		if (Page.IsPostBack)
		{
            //UserName.Value = "comstar";
            //UserPass.Value = "1qazxcvb";

            using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
			{
				con.Open();
				string sql = "SELECT *  FROM adminmanagers where ManUN=\'" + UserName.Value.ToString().Replace("'","''") + "\' AND ManPass=\'" + UserPass.Value.ToString().Replace("'","''") + "\'";
                MySqlCommand cmd = new MySqlCommand(sql, con);

				MyReader = cmd.ExecuteReader();

				if (MyReader.Read())
				{

                    if (MyCheckBox.Checked == true)
                    {
                        HttpCookie rememberCookie = new HttpCookie("adminspindate");
                        rememberCookie.Expires = DateTime.Now.AddDays(90);
                        rememberCookie.Values["ManID"] = MyReader["ManID"].ToString();
                        rememberCookie.Values["SiteID"] = MyReader["SiteID"].ToString();
                        rememberCookie.Values["LastLogin"] = MyReader["LastLogin"].ToString();
                        rememberCookie.Values["ManUN"] = MyReader["ManUN"].ToString();
                        rememberCookie.Values["secLevel"] = MyReader["secLevel"].ToString();


                        //rememberCookie.Values["Lang"] = Lang;
                        if (!Request.Url.Host.Contains("localhost"))
                        {
                            rememberCookie.Domain = siteDefaults.Domain;
                        }
                        Response.Cookies.Add(rememberCookie);
                    }
					Session.Timeout = 90;
					Session["ManUN"] = MyReader["ManUN"];
					Session["SiteID"] = MyReader["SiteID"];
					Session["secLevel"] = MyReader["secLevel"];
					if (MyReader["LastLogin"] != null && MyReader["LastLogin"].ToString()!="")
					{
						Session["LastLogin"] = MyReader["LastLogin"].ToString();
					}
					else
					{
						Session["LastLogin"] = DateTime.Now.ToString();
					}

                    using (MySqlConnection con2 = new MySqlConnection(siteDefaults.ConnStr))
					{
						con2.Open();

                        MySqlCommand updatePage = new MySqlCommand();
                        updatePage.CommandText = "UPDATE adminmanagers SET lastLogin='" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "' WHERE ManID=" + MyReader["ManID"].ToString();
						updatePage.Connection = con2;
						updatePage.ExecuteNonQuery();
					}

					//Response.Redirect("admin.aspx?cat=65");
                    Response.Redirect("AdminHome.aspx?cat=65");
				}
				else
				{
					denied.Text = "User Name or Password are not correct,Please try again!";
				}
			}
		}
		
    }

      [System.Web.Services.WebMethod]
    public static string forgotpassword(string username)
    {

        string returnValue = "no"; 
        using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
        {

            string sql = String.Format("Select ManPass,manageremail From adminmanagers where manageremail='{0}' OR ManUN='{0}' ", username);
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            conn.Open();

            MySqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {

                string body = "";

                body += "<p style=margin:0px;padding:0px;>";
                body += String.Format("there are yours credentials form Spindate manageing site: ");              
                body += "</p>";
                body += "<p style=margin:0px;padding:0px;>";
                body += String.Format("password: ");
                body += string.Format("<b> {0} </b>", dr["ManPass"].ToString());
                body += "</p>";
                string title = "mail from spindate";
                string email = dr["manageremail"].ToString();

                bool isSend =  cmstrDefualts.SendMail(body, title, email);
                if (isSend)
                {
                    returnValue = "yes";
                }
               
            }
           
            conn.Close();
        
        }
     
        return returnValue;
    }
}
