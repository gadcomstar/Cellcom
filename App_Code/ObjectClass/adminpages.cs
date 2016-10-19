using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for adminpages
/// </summary>
/// 
public class adminpages
{
    public static List<adminpages> AdminPagesList = new List<adminpages>(); 

    public int catID { get; private set; }
    public int catParent { get; private set; }
    public int catOrder { get; private set; }
    public string catText { get; private set; }
    public string catLink { get; private set; }
    public bool isHeader { get; private set; }
    public int secLevel { get; private set; }
    public bool delfeild { get; private set; }
    public string catTextEng { get; private set; }
    public int catParentToShow { get; private set; }
	public adminpages()
	{       
		//
		// TODO: Add constructor logic here
		//
	}
   
    public adminpages(int catID, int catParent, int catOrder, string catText, string catLink, bool isHeader, int secLevel, bool delfeild, string catTextEng)
    {
       this.catID = catID;
       this.catParent = catParent;
       this.catOrder = catOrder;
       this.catText = catText;
       this.catLink = catLink;
       this.isHeader = isHeader;
       this.secLevel = secLevel;
       this.delfeild = delfeild;
       this.catTextEng = catTextEng;
    }
    public adminpages(int catID, int catParent, int catOrder, string catText, string catLink, bool isHeader, int secLevel, bool delfeild, string catTextEng,int catParentToShow,bool addtolist)
    {
        this.catID = catID;
        this.catParent = catParent;
        this.catOrder = catOrder;
        this.catText = catText;
        this.catLink = catLink;
        this.isHeader = isHeader;
        this.secLevel = secLevel;
        this.delfeild = delfeild;
        this.catTextEng = catTextEng;
        if (catParentToShow == 0)
        {
            this.catParentToShow = catParent;
        }
        else
        {
            this.catParentToShow = catParentToShow;
        }
        if (addtolist)
        {
            AddToList(this);
        }
        setCatParentToShow(this);
    }


    public static void AddToList(adminpages myadminpages)
    {
        var q = AdminPagesList.FirstOrDefault(m => m.catID == myadminpages.catID);
        if (q==null)
        {
            AdminPagesList.Add(myadminpages);
        }
    }
    public static void RemoveFromList(adminpages myadminpages)
    {
        var q = AdminPagesList.FirstOrDefault(m => m.catID == myadminpages.catID);
        if (q != null)
        {
            AdminPagesList.Remove(myadminpages);
        }
    }

    public static void CreateList(bool isUpdate)
    {
        if (isUpdate)
        {
            AdminPagesList.Clear();
            FillListFromDb();
        }
        else
        {
            if (AdminPagesList.Count == 0)
            {
                FillListFromDb();
            }
        }
    }

     public static void setCatParentToShow(adminpages myadminpages)
     {
       
     }
    
    public static void FillListFromDb()
    {
        using(MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
        {
            string sql = String.Format("Select *,(Select catParent From adminpages where myPages.catParent=catID AND isHeader=true ) as myParent from adminpages as myPages order by catOrder");
            conn.Open();
            MySqlCommand cmd = new MySqlCommand(sql,conn);
            MySqlDataReader dr = cmd.ExecuteReader();
            int catParentToShow = 0;
            
            while (dr.Read())
            {
                if (dr["myParent"] != null)
                {
                    int.TryParse(dr["myParent"].ToString(), out catParentToShow);
                }
                adminpages myadminpages = new adminpages(dr.GetInt32("catID"), dr.GetInt32("catParent"), dr.GetInt32("catOrder"), dr.GetString("catText"), dr.GetString("catLink"), dr.GetBoolean("isHeader"), dr.GetInt32("secLevel"), dr.GetBoolean("delfeild"), dr.GetString("catTextEng"), catParentToShow,true);                           
            }            
        }        
    }
}