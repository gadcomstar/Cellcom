using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;

public partial class admin_EditSiteManager : System.Web.UI.Page
{
    int myId = 0;
    protected void Page_Load(object sender, EventArgs e)
	{

        
        MyForm1.BackURL = "ManageSiteManager.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];
        if (!String.IsNullOrEmpty(Request.QueryString["id"]) && int.TryParse(Request.QueryString["id"], out myId))
        {
            MyForm1.DataKeyFieldValue = myId;
            MyForm1.FormStatus = CMSTRFormWebUserControl.Status.Update;
        }
        else
        {
            MyForm1.FormStatus = CMSTRFormWebUserControl.Status.Insert;
        }

        if (Session["secLevel"] != null)
        {
            if (Session["secLevel"].ToString() == "1")
            {
                ListItem myListItem1 = new ListItem("Sub manager", "4");
                myListItem1.Selected = true;
                ((ASP.controls_cmstrdropdowncontrol_ascx)MyForm1.FindControl("SecMyDropDown")).ListItems.Add(myListItem1);
                ListItem myListItem2 = new ListItem("Site Manager", "2");
                ((ASP.controls_cmstrdropdowncontrol_ascx)MyForm1.FindControl("SecMyDropDown")).ListItems.Add(myListItem2);
                ListItem myListItem3 = new ListItem("Program manager", "1");
                ((ASP.controls_cmstrdropdowncontrol_ascx)MyForm1.FindControl("SecMyDropDown")).ListItems.Add(myListItem3);            
     
            }
            else if (Session["secLevel"].ToString() == "2")
            {
               
                      ListItem myListItem1 = new ListItem("Sub manager", "4");
                    myListItem1.Selected = true;
                    ((ASP.controls_cmstrdropdowncontrol_ascx)MyForm1.FindControl("SecMyDropDown")).ListItems.Add(myListItem1);
                    ListItem myListItem2 = new ListItem("Site Manager", "2");
                    ((ASP.controls_cmstrdropdowncontrol_ascx)MyForm1.FindControl("SecMyDropDown")).ListItems.Add(myListItem2);                
               
              
            }
            else
            {
                ((ASP.controls_cmstrdropdowncontrol_ascx)MyForm1.FindControl("SecMyDropDown")).Visible = false;
            
              
            
            }
        }
        else
        {

            Response.Redirect("./");
        }
    }

    protected void PasswordMyTextBox1_PreRender(object sender, EventArgs e)
    {
        if (MyForm1.FormStatus == CMSTRFormWebUserControl.Status.Insert)
        {
            ((CMSTRTextBoxControl)sender).IsRequiredFieldValidator = true;
        }
    }

}
