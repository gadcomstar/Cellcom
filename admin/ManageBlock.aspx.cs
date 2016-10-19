using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ManageBlock : System.Web.UI.Page
{
    int contact = 0;
//    int siteLang = 0;

	protected void Page_Load(object sender, EventArgs e)
	{
        backhref.HRef = "ManageUsers.aspx?sitelang=" + Request.QueryString["sitelang"] + "&user=" + Request.QueryString["contact"] + "&cat=" + Request.QueryString["cat"];

        if (cmstrDefualts.CheckQueryString("contact", out contact))
        {
            using (MySqlConnection conn =new MySqlConnection(siteDefaults.ConnStr) )
            {
                string sql = String.Format("Select userfirstname, userlastname From tblusers where userid={0} ", contact);
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                conn.Open();
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                   // userHeader.InnerText = "Manage Block/Report of User: " + dr["userfirstname"].ToString() + " " + dr["userlastname"].ToString();
                    userHeader.InnerHtml = "Manage Block/Report of User: " + "<span style=\"color:#dc234a;font-size:24px;font-style:italic;\">" + dr["userfirstname"].ToString() + " " + dr["userlastname"].ToString() + "</span>";


                }
                conn.Close();
            }
           

            LangTableControl.TblName = "blockmembers Left Join tblusers On tblusers.userid=blockmembers.memberid";
            LangTableControl.EditUrl = "ManageUsers.aspx?sitelang=" + Request.QueryString["sitelang"] + "&user={field}&cat=" + Request.QueryString["cat"];
            LangTableControl.SqlWhereQuery = String.Format("blockmembers.userid={0}", contact);


            ReportMeTableControl.TblName = "blockmembers left join tblusers on tblusers.userid=blockmembers.userid";
            ReportMeTableControl.CustomField = ",,,,,,,<a href=\"ManageUsers.aspx?sitelang=" + Request.QueryString["sitelang"] + "&user={0}&cat=" + Request.QueryString["cat"]+"\"><img alt=\"Edit\" title=\"Go to user\" src=\"images/EditOff.png\"  /></a>";
            ReportMeTableControl.SqlWhereQuery = String.Format("blockmembers.memberid={0}", contact);

            ReportAbusedTableControl.TblName = "blockmembers Left Join tblusers On tblusers.userid=blockmembers.memberid";
            ReportAbusedTableControl.EditUrl = "ManageUsers.aspx?sitelang=" + Request.QueryString["sitelang"] + "&user={field}&cat=" + Request.QueryString["cat"];
            ReportAbusedTableControl.SqlWhereQuery = String.Format(" isreported=true AND blockmembers.userid={0}", contact);
            
            ReportAbusedMeTableControl.TblName = "blockmembers left join tblusers on tblusers.userid=blockmembers.userid";
            ReportAbusedMeTableControl.CustomField = ",,,,,<a href=\"ManageUsers.aspx?sitelang=" + Request.QueryString["sitelang"] + "&user={0}&cat=" + Request.QueryString["cat"] + "\"><img alt=\"Edit\" title=\"Go to user\" src=\"images/EditOff.png\"  /></a>";
            ReportAbusedMeTableControl.SqlWhereQuery = String.Format(" isreported=true AND blockmembers.memberid={0}", contact);


        }
        else
        {
            Response.Redirect("./");
        }
	}

   


}
