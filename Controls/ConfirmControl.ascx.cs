using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ConfirmControl : System.Web.UI.UserControl
{
    public delegate void Yes(object sender, EventArgs e);
    public delegate void No(object sender, EventArgs e);
    public event No MyNo;
    public event Yes MyYes;
    private string title = "";
    private string content = "";
    public string Title
    {
        get { return title; }
        set { title = value; }
    }
    public string Content
    {
        get { return content; }
        set { content = value; }
    }
    public string hiddenValues
    {
        get { return controlHiddenField.Value; }
        set { controlHiddenField.Value = value; }

    }
    protected void Page_PreRender(object sender, EventArgs e)
    {
        ConfirmTitle.InnerText = Title;// "Are you sure you want to Report this person ?";
        MyContent.InnerText = Content;
    }
    protected void NoClick(object sender, EventArgs e)
    {
        if (MyNo != null)
        {
            MyNo(sender, e);
        }       
    }
    protected void YesClick(object sender, EventArgs e)
    {
        if (MyYes != null)
        {
            MyYes(sender, e);
        }
    }
    protected void DoNothing(object sender, EventArgs e)
    {
    }
}