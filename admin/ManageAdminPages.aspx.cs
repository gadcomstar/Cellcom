using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;

public partial class admin_ManageAdminPages : System.Web.UI.Page
{

  
    protected void Page_Load(object sender, EventArgs e)
	{
        CatsTable.AddLink = "EditAdminPages.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];
        CatsTable.EditUrl = "EditAdminPages.aspx?id={field}&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];
        ((GridView)CatsTable.FindControl("GridView1")).PreRender += ManageTable_PreRender;
	}
    protected void ManageTable_PreRender(object sender, EventArgs e)
    {


        foreach (GridViewRow row in ((GridView)(CatsTable).FindControl("GridView1")).Rows)
        {
            if ( ((Label)row.Cells[2].Controls[0]).Text.Contains("False"))
            {
                row.Cells[1].Text = "<img src=\"images/DelOff.png\" title=\"" + "לא למחיקה" + "\" alt=\"" + "לא למחיקה" + "\" style=\"cursor:url('images/delete.gif')\" />";
            }

        }
    }
}
