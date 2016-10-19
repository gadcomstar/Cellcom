using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;

public partial class about : System.Web.UI.Page
{
    string mytitle = "";
    string mydescription = "";
    string mykeyword = "";
    protected void Page_Init(object sender, EventArgs e)
    {
        mytitle = Languages.MyText("about Title_about");
        mydescription = Languages.MyText("about Description_about");
        mykeyword = Languages.MyText("about Key Word_about");
        Master.IsSitePage = true;     
    }
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        #region SEO DEF (change the automatic)
        Page.Title = mytitle;
        ((HtmlMeta)Master.FindControl("description")).Content = mydescription;
        ((HtmlMeta)Master.FindControl("keywords")).Content = mykeyword;
        #endregion
    }
}