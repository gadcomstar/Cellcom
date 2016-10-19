using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;

public partial class EditBadgtypes : System.Web.UI.Page
{
    int tag = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (cmstrDefualts.CheckQueryString("tags", out tag))
        {
            if (tag == 0)
            {
                BlogTypeMyForm.FormStatus = CMSTRFormWebUserControl.Status.Insert;
            }
            else {
                BlogTypeMyForm.FormStatus = CMSTRFormWebUserControl.Status.Update;
                BlogTypeMyForm.DataKeyFieldValue = tag;
            }
            BlogTypeMyForm.BackURL = "ManageBadgtypes.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&sitelang=" + Request.QueryString["sitelang"];
            
        }
    }
    
    protected void BlogTypeMyForm_ItemInserted(string NewUserID)
    {
       BadgeType.ClearList();
    }
}
