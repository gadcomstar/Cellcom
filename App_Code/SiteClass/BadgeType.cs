using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using MySql.Data.MySqlClient;

/// <summary>
/// Summary description for Tags
/// </summary>
public class BadgeType
{
    public string Name { set; get; }
    public int ID { set; get; }
    public static List<BadgeType> BadgeTypesList = new List<BadgeType>();

	public BadgeType()
	{
		
	}
    public BadgeType(string name, int id)
    {
        this.Name = name;
        this.ID = id;
    }
    public static List<BadgeType> GetList()
    {
        if (BadgeTypesList.Count == 0)
        {
            using (MySqlConnection conn = new MySqlConnection(cmstrDefualts.ConnStr))
            {
                conn.Open();
                string sql = "Select tblBadgeTypesid,tblBadgeTypesName From tblbadgetypes";
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                MySqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    int id = 0;
                    int.TryParse(dr["tblBadgeTypesid"].ToString(), out id);
                    string name = dr["tblBadgeTypesName"].ToString();
                    BadgeType myTag = new BadgeType(name, id);
                    if (!BadgeTypesList.Contains(myTag))
                    {
                        BadgeTypesList.Add(myTag);
                    }
                }
                dr.Close();
            }        
        }
        return BadgeTypesList;
    }
    public static void  ClearList()
    {
        BadgeTypesList.Clear();
    }

}