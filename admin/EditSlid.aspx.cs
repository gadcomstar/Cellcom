using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Linq;
using MySql.Data.MySqlClient;

public partial class EditSlid : System.Web.UI.Page
{
    int badgeid = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        using (MySqlConnection conn = new MySqlConnection(cmstrDefualts.ConnStr))
        {
            conn.Open();
           
        }

        if (cmstrDefualts.CheckQueryString("badge", out badgeid))
        {
            if (badgeid == 0)
            {
                BlogTypeMyForm.FormStatus = CMSTRFormWebUserControl.Status.Insert;
            }
            else
            {
                
                BlogTypeMyForm.FormStatus = CMSTRFormWebUserControl.Status.Update;
                BlogTypeMyForm.DataKeyFieldValue = badgeid;
            }
            BlogTypeMyForm.BackURL = "ManageSlider.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&sitelang=" + Request.QueryString["sitelang"];

        }


    }

   
}
