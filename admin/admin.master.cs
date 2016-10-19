using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Collections;
using System.Data;


public partial class admin : System.Web.UI.MasterPage
{
	public string cat = "65";
    MySqlDataReader MyReader = null;
    TableRow bannerRow = new TableRow();
    public string langtext = "";
    public string myderection = "Right";
	protected void Page_Init(object sender, EventArgs e)
	{
        if (Session["SiteID"] == null)
        {
            if (Request.Cookies["adminspindate"] != null)
            {
                HttpCookie rememberCookie = Request.Cookies["adminspindate"];
                Session["SiteID"] = rememberCookie.Values["SiteID"];
                Session["LastLogin"] = rememberCookie.Values["LastLogin"];
                Session["ManUN"] = rememberCookie.Values["ManUN"];
                Session["secLevel"] = rememberCookie.Values["secLevel"];  
            }
            else
            {
                Response.Redirect("./");
            }
        }
        if (Session["langcode"] == null)
        {
           Session["langcode"]="heb";
        }
       Session["Lang"] = "Eng";
        if (Session["Lang"].ToString().ToLower() != "heb")
        {
            langtext = Session["Lang"].ToString();
        }
	}		
	protected void Page_Load(object sender, EventArgs e)
    {       
        Page.Title = Languages2.MyText("General_Manage System_מערכת ניהול")+ "-" + siteDefaults.SiteName;
		bannerRow.CssClass = "bannerRow";
		TableCell bannerRowRight = new TableCell();
		TableCell bannerRowLeft = new TableCell();
		bannerRowRight.CssClass = "bannerRowRight";
		bannerRowLeft.CssClass = "bannerRowLeft";
		bannerRowRight.Text = "&nbsp;";
		bannerRowLeft.Text = "&nbsp;";
		bannerRow.Cells.Add(bannerRowRight);
		if (Request.QueryString["cat"] != null)
		{
			cat = Request.QueryString["cat"].Replace("'", "''");
		}
		else
		{
			Response.Redirect("./");
		}
		if (Session["SiteID"] == null)
		{
			Response.Redirect("./");
		}
        List<adminpages> Getadminpages =   adminpages.AdminPagesList.Where(m => m.catParent == int.Parse(cat) && m.secLevel >= int.Parse( Session["secLevel"].ToString())).ToList();
        Getadminpages.OrderBy(m => m.catOrder);
        using (MySqlConnection con = new MySqlConnection(siteDefaults.ConnStr))
		{
			con.Open();
			string sql = "SELECT *  FROM adminpages where catparent=" + cat + "  AND secLevel>=" + Session["secLevel"] +" ORDER BY catOrder";
            MySqlCommand cmd = new MySqlCommand(sql, con);
            #region set cat sub of pages links     
            for (int i = 0; i < Getadminpages.Count; i++)
            {  
                TableCell rightCell = new TableCell();
                TableRow rightRow = new TableRow();
                rightCell.Text = Getadminpages[i].catText; // MyReader["catText" + langtext].ToString();
                if (Getadminpages[i].isHeader == true)
                {
                    rightCell.CssClass = "rightCellHeader";
                    rightRow.Cells.Add(rightCell);
                    rightTable.Rows.Add(rightRow);
                    List<adminpages> Getadminpages2 = adminpages.AdminPagesList.Where(m => m.catParent == Getadminpages[i].catID  && m.secLevel >= int.Parse(Session["secLevel"].ToString())).ToList();
                    Getadminpages2.OrderBy(m => m.catOrder);
                    for (int j= 0; j < Getadminpages2.Count; j++)
                    {
                        rightCell = new TableCell();
                        rightRow = new TableRow();
                        rightCell.Text = Getadminpages2[j].catText;// MyReader2["catText" + langtext].ToString();
                        rightCell.HorizontalAlign = HorizontalAlign.Right;
                        SetTableLinks(Getadminpages2[j].catLink, Getadminpages2[j].catID, ref  rightCell);
                        rightRow.Cells.Add(rightCell);
                        rightTable.Rows.Add(rightRow);
                    }                 
                }
                else
                {
                    SetTableLinks(Getadminpages[i].catLink, Getadminpages[i].catID, ref  rightCell);                   
                    rightRow.Cells.Add(rightCell);
                    rightTable.Rows.Add(rightRow);
                }
            }          
            #endregion
            sql = "Select * From languages";           
            MySqlDataAdapter ad = new MySqlDataAdapter(sql,con);
            DataSet ds = new DataSet();
            ad.Fill(ds, "myLang");
            LangMyDropDown.DataSource = ds.Tables["myLang"].DefaultView;
            #region Top cat order
            List<adminpages> Getadminpages0 = adminpages.AdminPagesList.Where(m => m.catParent == 0 && m.secLevel >= int.Parse(Session["secLevel"].ToString())).ToList();
            Getadminpages0.OrderBy(m => m.catOrder);
			TableCell bannerEmptyRight = new TableCell();
			TableCell bannerEmptyLeft = new TableCell();
			bannerEmptyLeft.CssClass = "bannerEmptyLeft";
			bannerEmptyRight.CssClass = "bannerEmptyRight";
			bannerRow.Cells.Add(bannerEmptyRight);          
            for (int i = 0; i < Getadminpages0.Count; i++)
            {            
				TableCell bannerCell = new TableCell();
				TableCell bannerLineCell = new TableCell();
				bannerCell.Width = 132;
                if (Getadminpages0[i].catID.ToString() == Request.QueryString["cat"].ToString())
				{				
					bannerCell.CssClass = "bannerCellSelected";
				}
				else
				{				
					bannerCell.CssClass = "bannerCell";
				}
                bannerCell.Text = Getadminpages0[i].catText;// MyReader["catText" + langtext].ToString();
				if (  Getadminpages0[i].catLink.Length > 0)
				{
                    string admincat = "?cat=";
                    if (Getadminpages0[i].catLink.Contains("?"))
                    {
                        admincat = "&cat=";
                    
                    }
                    if (Getadminpages0[i].catID.ToString() == Request.QueryString["cat"].ToString())
					{
                        bannerCell.Text = "<a href=\"" + Getadminpages0[i].catLink + admincat + Getadminpages0[i].catID.ToString() + "\" class=\"bannerSelected\">" + bannerCell.Text + "</a>";
					}
					else
					{
                        bannerCell.Text = "<a href=\"" + Getadminpages0[i].catLink + admincat + Getadminpages0[i].catID.ToString() + "\" class=\"banner\">" + bannerCell.Text + "</a>";
					}
				}
				bannerLineCell.Width = 5;
				bannerLineCell.Text = "<img src=\"images/SearchHeaderLine.jpg\" style=\"border:none\" alt=\"\" />";
				bannerRow.Cells.Add(bannerCell);
				bannerRow.Cells.Add(bannerLineCell);
            }
            #endregion
            Session.Timeout = 90;
			TableCell EmptyCell = new TableCell();
			EmptyCell.HorizontalAlign = HorizontalAlign.Left;
			EmptyCell.ForeColor = System.Drawing.Color.FromName("#ffffff");
			sql = "SELECT *  FROM adminsites where siteID=" + Session["siteID"];
			cmd.CommandText=sql;
			cmd.Connection = con;			
			MyReader = cmd.ExecuteReader();			
			if (MyReader.Read())
			{
                LoginInfoCell.Text = Languages2.MyText("General_Manage Site_אתר מנוהל:") + " <b>" + MyReader["SiteName"].ToString() + "</b><br> " + Languages2.MyText("General_Connected as:_מחובר כ:") + "  <b>" + Session["ManUN"].ToString() + "</b>";
                LoginInfoCell.Text += "<br>" + Languages2.MyText("General_Last Login_כניסה אחרונה") + ":<b>" + Session["LastLogin"].ToString() + "</b>";
				LoginInfoCell.CssClass = "LoginInfoCell";
			}
			MyReader.Close();
			con.Close();
			EmptyCell.Text = "&nbsp";
			bannerRow.Cells.Add(EmptyCell);
			bannerRow.Cells.Add(bannerRowLeft);
			bannerRow.Cells.Add(bannerEmptyLeft);
			bannerTable.Rows.Add(bannerRow);
			con.Close();			
		}
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        if (Request.QueryString["sitelang"] == null && Session["langcode"] != null && Session["langcode"] != "")
        {
            int mylang =0 ;
            if (int.TryParse(Session["langcode"].ToString(), out mylang))
            {
                ChangeLangUrl(Session["langcode"].ToString());

            }
            else
            {
                ChangeLangUrl("1");     
            }             
        }
        int mylangNum =0;
        if (String.IsNullOrEmpty(LangMyDropDown.SelectedValue))
        {
            int sitelang = 1;
            if (Request.QueryString["sitelang"] != null && int.TryParse(Request.QueryString["sitelang"].ToString(), out sitelang))
            {
                LangMyDropDown.SelectedValue = sitelang.ToString();
                Session["langcode"] = sitelang.ToString();

            }
            else
            {
                if (Session["langcode"] != null && int.TryParse(Session["langcode"].ToString(), out mylangNum))
                {
                    LangMyDropDown.SelectedValue = Session["langcode"].ToString();
                }
                else
                {
                    if (LangMyDropDown.ListItems.Count > 0)
                    {
                        LangMyDropDown.ListItems[0].Selected = true;
                    }
                }
            }
        }
        TitleLable.Text = siteDefaults.SiteName + " - " + Session["langcode"];
        TitleLable.Text = siteDefaults.SiteName + " - admin system";
        hreflogo.HRef = "./";// siteDefaults.SiteUrl;
    }
    protected void SetLang(object sender, EventArgs e)
    {
        Session["langcode"] = ((DropDownList)sender).SelectedValue;
        ChangeLangUrl(((DropDownList)sender).SelectedValue);
     //   Response.Redirect("admin.aspx?cat=1");
    }
    protected void ChangeLangUrl(string myValue)
    {

        string myUrl = Request.Url.AbsoluteUri;
        if (myUrl.Contains("sitelang"))
        {
            myUrl = Request.Url.LocalPath;
            for (int i = 0; i < Request.QueryString.Count; i++)
            {
                if (i == 0)
                {
                    if (Request.QueryString.AllKeys[i] == "sitelang")
                    {
                        myUrl += "?" + Request.QueryString.AllKeys[i] + "=" + myValue;
                    }
                    else
                    {
                        myUrl += "?" + Request.QueryString.AllKeys[i] + "=" + Request.QueryString[i];
                    }
                }
                else
                {
                    if (Request.QueryString.AllKeys[i] == "sitelang")
                    {
                        myUrl += "&" + Request.QueryString.AllKeys[i] + "=" + myValue;
                    }
                    else
                    {
                        myUrl += "&" + Request.QueryString.AllKeys[i] + "=" + Request.QueryString[i];
                    }
                }
            }
        }
        else
        {
            if (myUrl.Contains("?"))
            {
                myUrl += "&sitelang=" + myValue;
            }
            else
            {
                myUrl += "?sitelang=" + myValue;
            }
        }       
        Response.Redirect(myUrl);
    }
    protected void SetTableLinks(string catLink, int catid, ref TableCell rightCell)
    {
        if (catLink.Length > 0)
        {
            string sign = "?";
            if (catLink.Contains("?"))
            {
                sign = "&";
            }
            if (Request.QueryString["sub"] != null)
            {
                if (Request.QueryString["sub"].ToString() == catid.ToString())
                {
                    rightCell.CssClass = "rightCellSelected";
                    rightCell.Text = "<table cellspacing=\"0\" cellpadding=\"0\"><tr><td style=\"width:30px\"><img src=\"images/Arrow" + myderection + "blue.gif\"></td><td><a href=\"" + catLink + sign + "cat=" + Request.QueryString["cat"].ToString() + "&sub=" + catid + "\" class=\"rightSelected\">" + rightCell.Text + "</a></td></tr></table>";
                }
                else
                {
                    rightCell.CssClass = "rightCell";
                    rightCell.Text = "<table cellspacing=\"0\" cellpadding=\"0\"><tr><td style=\"width:30px\"><img src=\"images/Arrow" + myderection + ".gif\"></td><td><a href=\"" + catLink + sign + "cat=" + Request.QueryString["cat"].ToString() + "&sub=" + catid + "\" class=\"right\">" + rightCell.Text + "</a></td></tr></table>";
                }
            }
            else
            {
                rightCell.CssClass = "rightCell";
                rightCell.Text = "<table cellspacing=\"0\" cellpadding=\"0\"><tr><td style=\"width:30px\"><img src=\"images/Arrow" + myderection + ".gif\"></td><td><a href=\"" + catLink + sign + "cat=" + Request.QueryString["cat"].ToString() + "&sub=" + catid + "\" class=\"right\">" + rightCell.Text + "</a></td></tr></table>";
            }
        }    
    }
}
