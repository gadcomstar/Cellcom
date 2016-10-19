using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //UPDATE tblusers SET SignInByMail=1 WHERE LoginMailAddress is not null;
        //UPDATE tblusers SET SignInByFace=1 WHERE LoginType is not null;
    }
    protected void Unnamed_Click(object sender, EventArgs e)
    {
        Response.Write(DateTime.Now);
        Processes.processMissions();
        Response.Write("<br />");
        Response.Write(DateTime.Now);
    }
}