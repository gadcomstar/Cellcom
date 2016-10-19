using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class ManageTopLine : System.Web.UI.Page
{
    int contatctid = 0;
    int siteLang = 0;
	protected void Page_Load(object sender, EventArgs e)
	{
        int mytpo = 1;
        if (cmstrDefualts.CheckQueryString("sitelang", out siteLang))
        {
            //  CatsTable.SqlWhereQuery = String.Format("gamelang={0}", siteLang);
            using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
            {
                string sql = String.Format("Select toplinemsgid From toplinemsg where toplang={0}", siteLang);
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                conn.Open();
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    int.TryParse(dr["toplinemsgid"].ToString(), out mytpo);
                }
                else
                {
                    mytpo = 0; ;
                }
                dr.Close();
            }
            if (mytpo != 0)
            {
                BlogTypeMyForm.FormStatus = CMSTRFormWebUserControl.Status.Update;
                BlogTypeMyForm.DataKeyFieldValue = mytpo;
                ((ASP.controls_cmstrhiddenfield_ascx)BlogTypeMyForm.FindControl("LangMyHiddenField")).Visible = false;
            }
            else
            {
                BlogTypeMyForm.FormStatus = CMSTRFormWebUserControl.Status.Insert;
                ((ASP.controls_cmstrhiddenfield_ascx)BlogTypeMyForm.FindControl("LangMyHiddenField")).Value = siteLang.ToString();
                string muguid = Guid.NewGuid().ToString();
                ((ASP.controls_cmstrhiddenfield_ascx)BlogTypeMyForm.FindControl("MyHiddenField1")).Value = muguid;
                string muguid2 = Guid.NewGuid().ToString();
                ((ASP.controls_cmstrhiddenfield_ascx)BlogTypeMyForm.FindControl("MyHiddenField2")).Value = muguid2;
            }


        }
      
        
	}





    protected void BlogTypeMyForm_ItemUpdated(string NewUserID)
    {
        bool isupadte1 = false;
        bool isupadte2 = false;

        using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
        {
            string sql = String.Format("Select isupadte1,isupadte2 From toplinemsg where toplinemsgid={0}", NewUserID);
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            conn.Open();
            MySqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                bool.TryParse(dr["isupadte1"].ToString(), out isupadte1);
                if (dr["isupadte1"].ToString() == "1")
                {
                    isupadte1 = true;
                }
                bool.TryParse(dr["isupadte2"].ToString(), out isupadte2);
                if (dr["isupadte2"].ToString() == "1")
                {
                    isupadte2 = true;
                }
            }
            dr.Close();
            if (isupadte1 && isupadte2)
            {
                string myguid = Guid.NewGuid().ToString();
                string myguid2  = Guid.NewGuid().ToString();
                sql = String.Format("Update toplinemsg Set  msgkeysite='{0}',msgkeysystem='{1}',isupadte1=false,isupadte2=false where toplinemsgid={2}", myguid, myguid2, NewUserID);
            } else if(isupadte1)
            {
                string myguid = Guid.NewGuid().ToString();
                sql = String.Format("Update toplinemsg Set  msgkeysite='{0}',isupadte1=false where toplinemsgid={1}", myguid, NewUserID);
            
            } else if(isupadte2)
            {
                string myguid = Guid.NewGuid().ToString();
                sql = String.Format("Update toplinemsg Set  msgkeysystem='{0}',isupadte2=false where toplinemsgid={1}", myguid, NewUserID);            
            } else
            {
                sql ="";
            }
            if(sql!="")
            {
                cmd.CommandText = sql;
                cmd.ExecuteNonQuery();
            }
          
        }
    }
}
