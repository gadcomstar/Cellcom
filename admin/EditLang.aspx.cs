using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

public partial class admin_EditLang : System.Web.UI.Page
{
    int myId = 0;
    protected void Page_Load(object sender, EventArgs e)
	{
        MyForm1.BackURL = "ManageLang.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];
        if (!String.IsNullOrEmpty(Request.QueryString["id"]) && int.TryParse(Request.QueryString["id"], out myId))
        {
            MyForm1.DataKeyFieldValue = myId;
            MyForm1.FormStatus = CMSTRFormWebUserControl.Status.Update;
        }
        else
        {
            MyForm1.FormStatus = CMSTRFormWebUserControl.Status.Insert;
        }
    }

    protected void PasswordMyTextBox1_PreRender(object sender, EventArgs e)
    {
        if (MyForm1.FormStatus == CMSTRFormWebUserControl.Status.Insert)
        {
            ((CMSTRTextBoxControl)sender).IsRequiredFieldValidator = true;
        }
    }

    protected void AddLang(string tableid)
    {
        string langcode = "";
        using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
        {

            string sql = String.Format("Select langcode From langsite Where langID={0}", tableid);
            conn.Open();
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            MySqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {
                langcode = dr["langcode"].ToString();
            
            }
            dr.Close();
            List<int> myIds = new List<int>();
            List<int> parentIds = new List<int>();
            Dictionary<int, int> idToNewid = new Dictionary<int,int>();

            if (langcode!="")
            {
                
                sql = String.Format("Select * From pages Where PageIsDel=false AND lang='heb' Order by PageParent");
                cmd.CommandText = sql;
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    myIds.Add((int)dr["pageid"]);
                    parentIds.Add((int)dr["pageparent"]); 
                }
                dr.Close();
                int count = 0;
                string myparent = "";
                foreach(int pageid in myIds)
                {
                    if (idToNewid.ContainsKey(parentIds[count]))
                    {
                        if (parentIds[count] > 0)
                        {
                            myparent =idToNewid[ parentIds[count]].ToString();
                        }
                        else
                        {
                            myparent = "0";

                        }

                    }
                    else
                    {

                        myparent = "0";
                    }
                    sql = String.Format("INSERT INTO pages (PageName,PageURL,PageTitle,PageSEODesc,PageOrder,IsPageOnMainMenu,PageParent,PageDescription,PageHeader,PageContent,PageKeyWords,PageIsDel,IsChild,lang) SELECT PageName,PageURL,PageTitle,PageSEODesc,PageOrder,IsPageOnMainMenu,{2},PageDescription,PageHeader,PageContent,PageKeyWords,PageIsDel,IsChild,'{1}' FROM pages WHERE pageid={0};", pageid, langcode, myparent);
                    cmd.CommandText = sql;
                    cmd.ExecuteNonQuery();

                    int newpageid = 0;
                    cmd.CommandText = "SELECT last_insert_id() AS NewUserID";
                    dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        newpageid = int.Parse( dr["NewUserID"].ToString());
                        idToNewid.Add(pageid, newpageid);
                    }
                    dr.Close();

                    sql = String.Format("INSERT INTO generaltexts (genName,genContent,genPage,genType,lang) SELECT genName,genContent,{2},genType,'{1}' FROM generaltexts WHERE lang='heb' AND genPage={0};", pageid, langcode, newpageid);
                    cmd.CommandText = sql;
                    cmd.ExecuteNonQuery();




                    count++;
                }

               
            }

            conn.Close();
        
        }

    
    }

}
