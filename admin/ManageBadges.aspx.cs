using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Linq;
public partial class ManageBadges : System.Web.UI.Page
{
    int contatctid = 0;
    int siteLang = 0;
	protected void Page_Load(object sender, EventArgs e)
	{
        List<BadgeType> MyBagTypeList = BadgeType.GetList();
        CatsTable.AddLink = "EditBadges.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&sitelang=" + Request.QueryString["sitelang"] + "&badge=0";
        CatsTable.EditUrl = "EditBadges.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&sitelang=" + Request.QueryString["sitelang"] + "&badge={field}";
        CatsTable.CustomField = ",<img src='{0}' />,";
        string typeList = "אין מידע";
        if (MyBagTypeList.Count > 0)
        {
            string[] myArray = MyBagTypeList.Select(x => x.Name).ToArray<string>();
            typeList = string.Join("|" , myArray);
        }
        CatsTable.SqlOptions = ",," + typeList;
        
	}





  
}
