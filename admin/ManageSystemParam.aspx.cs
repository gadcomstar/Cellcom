using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class ManageSystemParam : System.Web.UI.Page
{
   // int contatctid = 0;
//    int siteLang = 0;
	protected void Page_Load(object sender, EventArgs e)
	{       
     
           

	}


    protected void SetParams(string myid)
	{

        siteDefaults.SiteGeneralParam();
        List<int> mymembers = new List<int>();
        foreach (int myspin  in methods.MemberList.Keys)
        {
            mymembers.Add(myspin);
        }
        foreach (int myspin in mymembers)
        {
            methods.MemberList.Remove(myspin);
            methods.AddMember(myspin);
        
        }

	}

}
