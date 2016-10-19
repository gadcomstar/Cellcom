using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_EditUser : System.Web.UI.Page
{
    int UserID = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        frm_EditUser.BackURL = "ManageUsers.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];
        if (!string.IsNullOrEmpty(Request.QueryString["ID"]) && int.TryParse(Request.QueryString["ID"].ToString(), out UserID))
        {
            if (UserID != 0)
            {
                frm_EditUser.DataKeyField = "UserID";
                frm_EditUser.DataKeyFieldValue = UserID;
                frm_EditUser.FormStatus = CMSTRFormWebUserControl.Status.Update;
                frm_EditUser.DataBind();
            }
        }
    }
    protected void frm_EditUser_ItemInserted(string NewUserID)
    {
        using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
        {
            con.Open();
            MySqlCommand _cmd = new MySqlCommand();
            _cmd.Connection = con;
            _cmd.CommandText = "UPDATE tblusers set CreationTime = now() where UserID =" + NewUserID;
            _cmd.ExecuteNonQuery();

        }
    }
}