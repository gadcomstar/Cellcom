using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

/// <summary>
/// Summary description for Tags
/// </summary>
public class Tags
{
    public string Name { set; get; }
    public int ID { set; get; }
    public static List<Tags> TagsList = new List<Tags>();

	public Tags()
	{
		
	}
    public Tags(string name,int id)
    {
        this.Name = name;
        this.ID = id;
    }
    public static List<Tags> GetList()
    {
        if (TagsList.Count == 0)
        {
            using (MySqlConnection conn = new MySqlConnection(cmstrDefualts.ConnStr))
            {
                conn.Open();
                string sql = "Select tblTagsid,tagName From tbltags";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    int id = 0;
                    int.TryParse(dr["tblTagsid"].ToString(), out id);
                    string name = dr["tagName"].ToString();
                    Tags myTag = new Tags(name,id);
                    if (!TagsList.Contains(myTag))
                    {
                        TagsList.Add(myTag);
                    }
                }
                dr.Close();
            }        
        }
        return TagsList;
    }
    public static void  ClearList()
    {
        TagsList.Clear();
    }

}