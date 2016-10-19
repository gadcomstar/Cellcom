using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MailError : System.Web.UI.Page
{
    protected void Page_PreRender(object sender, EventArgs e)
    {
        PageText.Text = MainMenu.PageContent;
        Page.Title = MainMenu.PageTitle;
        description.Content = MainMenu.PageDesc;
        keywords.Content = MainMenu.PageKeyWord;
    }
}