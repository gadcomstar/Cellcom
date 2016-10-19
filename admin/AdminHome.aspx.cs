using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class admin_AdminHome : System.Web.UI.Page
{
    int cat = 0;
    int type = 0;
    int seclevel = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!int.TryParse(Session["secLevel"].ToString(), out seclevel))
        {
            seclevel = 10;
        }
        cmstrDefualts.CheckQueryString("cat", out cat);
        var getparent = adminpages.AdminPagesList.FirstOrDefault(m => m.catParent == 0 && m.catID == cat);
        if (getparent == null)
        {
            MyAdminHeaderRepeater2.Visible = false;
            List<adminpages> myparent = adminpages.AdminPagesList.Where(m => m.catParent == 0 && m.secLevel >= seclevel).ToList();
            MyAdminHeaderRepeater.DataSource = myparent;
            MyAdminHeaderRepeater.DataBind();
        }
        else
        {
            MyAdminHeaderRepeater.Visible = false;
            List<adminpages> subpages = new List<adminpages>();
            List<adminpages> myparent = adminpages.AdminPagesList.Where(m => m.catParent == cat && m.secLevel >= seclevel ).ToList();
            foreach (adminpages mypage in myparent)
            {
                if (mypage.isHeader == true)
                {
                    List<adminpages> headerList = adminpages.AdminPagesList.Where(m => m.catParent == mypage.catID && m.secLevel >= seclevel).ToList();
                    subpages.AddRange(headerList);
                }
                else
                {
                    subpages.Add(mypage);
                }
            }
            MyAdminHeaderRepeater2.DataSource = subpages;
            MyAdminHeaderRepeater2.DataBind();
        }
       
    }
    protected void MyAdminHeaderRepeater_PreRender(object sender, EventArgs e)
    {
        Repeater myRepeater = (Repeater)sender;
        int parent = 0;
        List<adminpages> subpages = new List<adminpages>();
        int.TryParse(  ((HiddenField)myRepeater.Parent.FindControl("CatIdHiddenField")).Value,out parent);
        List<adminpages> myparent = adminpages.AdminPagesList.Where(m => m.catParent == parent && m.secLevel >= seclevel).ToList();
        foreach (adminpages mypage in myparent)
        {
            if (mypage.isHeader == true)
            {
                List<adminpages> headerList = adminpages.AdminPagesList.Where(m => m.catParent == mypage.catID && m.secLevel >= seclevel).ToList();
                subpages.AddRange( headerList);
            }
            else
            {
                subpages.Add(mypage);
            }
        }
        myRepeater.DataSource = subpages;
        myRepeater.DataBind();
    }
}