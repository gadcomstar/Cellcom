using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ManageGeneralPage : System.Web.UI.Page
{
    int parentID = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        if (!String.IsNullOrEmpty(Request.QueryString["Parent"]) && int.TryParse(Request.QueryString["Parent"], out parentID))
        {
            backLink.NavigateUrl = "ManageGeneralPage.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];
            CatTable.CustomField = "<span id=\"{0}\"></span>,,,<a href=\"ManageGeneralText.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&MyPage={0}\" >נהל</a>,";
            CatTable.SqlFieldNames = "PageIsDel,PageID,PageName,PageID";
            CatTable.FieldsToShow = "1,1,1,1";
            CatTable.FieldsToSearch = "0,0,0,0";
            CatTable.TblHeaderNames = ",מספר,שם הדף,ניהול טקסטים וכותרות";
            CatTable.SqlFieldType = "1,1,1,1,1";
            CatTable.EditUrl = "EditGeneralPage.aspx?id={field}&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] +"&Parent="+ Request.QueryString["Parent"];
            CatTable.AddLink = "EditGeneralPage.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&Parent=" + Request.QueryString["Parent"];
            CatTable.IsDelField = "true";
            CatTable.SqlWhereQuery = "PageParent=" + parentID + " AND IsChild=true AND lang='" + Session["langcode"] + "'";
            ((GridView)CatTable.FindControl("GridView1")).PreRender += ManageTable_PreRender;
        }
        else
        {
            backLink.Visible = false;
            // only for programmers
            if (int.Parse(Session["secLevel"].ToString()) == 1)
            {
                CatTable.IsDelField = "true";
                CatTable.AddLink = "EditGeneralPage.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] ;
                ((GridView)CatTable.FindControl("GridView1")).PreRender += ManageTable_PreRender;
                CatTable.SqlWhereQuery = "IsChild=false  AND lang='" + Session["langcode"] + "'";
            }
            CatTable.CustomField = "<span id=\"{0}\"></span>,,,<a href=\"ManageGeneralText.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&MyPage={0}\" >נהל</a>,<a href=\"ManageGeneralPage.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&Parent={0}\" >הוסף</a>";
            CatTable.EditUrl = "EditGeneralPage.aspx?type=1&id={field}&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];
            if (siteDefaults.isAddingPages)
            {
                CatTable.AddLink = "EditGeneralPage.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];
            
            }
            if (!siteDefaults.hasSubmenu && Session["secLevel"].ToString() != "1")
            {
                CatTable.CustomField = "<span id=\"{0}\"></span>,,,<a href=\"ManageGeneralText.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&MyPage={0}\" >נהל</a>,<a href=\"ManageGeneralPage.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&Parent={0}\" ></a>";
                CatTable.TblHeaderNames = ",מספר,שם הדף,ניהול טקסטים וכותרות,";
            }

        }
    }
    protected void ManageTable_PreRender(object sender, EventArgs e)
    {
        foreach (GridViewRow row in ((GridView)(CatTable).FindControl("GridView1")).Rows)
        {
            if (((Label)row.Cells[2].Controls[0]).Text.Contains("False"))
            {
                row.Cells[1].Text = "<img src=\"images/DelOff.png\" title=\"" + "לא למחיקה" + "\" alt=\"" + "לא למחיקה" + "\" style=\"cursor:url('images/delete.gif')\" />";
            }

        }
    }
}
