using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Text;

public partial class admin_ManageGeneralText : System.Web.UI.Page
{
    int myPage = 0;
    
    protected void Page_Load(object sender, EventArgs e)
	{
       
        

        if(Request.QueryString["MyPage"]!=null && int.TryParse(Request.QueryString["MyPage"],out myPage))
        {
        backLink.NavigateUrl = "ManageGeneralPage.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];
        GenParametersDataSource.SelectCommand = "SELECT * FROM generaltexts WHERE genPage=" + myPage;
        using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
        {

            string sql = "SELECT * FROM pages WHERE pageid=" + myPage;
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            conn.Open();
            MySqlDataReader dr = cmd.ExecuteReader();
            if (dr.Read())
            {

                pageName.InnerText = dr["pageName"].ToString();
            }
        
        }

       } else 
            {
                Response.Redirect("./");
            
            }
	}
    protected void TextBox_PreRender(object sender, EventArgs e)
    {

        HiddenField longtxtboxHidden = (HiddenField)sender;
        string iscke = ((HiddenField)((HiddenField)sender).Parent.FindControl("typeHidden")).Value;
        if (iscke == "True")
        {
            StringBuilder _js = new StringBuilder();
            _js.AppendLine("<script type='text/javascript' language='javascript'>");
            _js.AppendLine("var instance = CKEDITOR.instances." + longtxtboxHidden.ClientID + "text11" + ";");
            _js.AppendLine("if (instance) { CKEDITOR.remove(CKEDITOR.instances." + longtxtboxHidden.ClientID + "text11" + "); }");
            _js.AppendLine("CKEDITOR.replace( '" + longtxtboxHidden.ClientID + "text11" + "',{id:'ckeditor1', contentsLangDirection : 'rtl',filebrowserBrowseUrl : 'Ckfinder/ckfinder.html',filebrowserImageBrowseUrl : 'Ckfinder/ckfinder.html?Type=Images',filebrowserFlashBrowseUrl : 'Ckfinder/ckfinder.html?Type=Flash',filebrowserUploadUrl : '/Ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Files',filebrowserImageUploadUrl : 'Ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Images',filebrowserFlashUploadUrl : '/Ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Flash'});");

            if (longtxtboxHidden.Value != "")
                _js.AppendLine("CKEDITOR.instances." + longtxtboxHidden.ClientID + "text11" + ".setData(document.getElementById('" + longtxtboxHidden.ClientID + "').value)");

            _js.AppendLine("CKEDITOR.instances." + longtxtboxHidden.ClientID + "text11" + ".on('blur',function() {setHidden" + longtxtboxHidden.ID + "()})");

            ((LinkButton)longtxtboxHidden.Parent.FindControl("EditBtn")).OnClientClick = "setHidden" + longtxtboxHidden.ID + "()";

            _js.AppendLine("function setHidden" + longtxtboxHidden.ID + "(){document.getElementById('" + longtxtboxHidden.ClientID + "').value= CKEDITOR.instances." + longtxtboxHidden.ClientID + "text11" + ".getData()}");

            _js.AppendLine("</script>");


            ScriptManager.RegisterStartupScript(updatePanel1, GetType(), "cke", _js.ToString(), false);
            // Page.RegisterStartupScript("CKEditor" + ((TextBox)sender).ClientID, _js.ToString());
        }
        else
        {
            StringBuilder _js = new StringBuilder();
            _js.AppendLine("<script type='text/javascript' language='javascript'>");
            if (longtxtboxHidden.Value != "")
                _js.AppendLine( "$('#"+ longtxtboxHidden.ClientID + "text11')" + ".val(document.getElementById('" + longtxtboxHidden.ClientID + "').value)");

            _js.AppendLine("$('#" + longtxtboxHidden.ClientID + "text11') " + ".bind('blur',function() {setHidd" + longtxtboxHidden.ID + "()})");

            _js.AppendLine("function setHidd" + longtxtboxHidden.ID + "(){ document.getElementById('" + longtxtboxHidden.ClientID + "').value= $('#" + longtxtboxHidden.ClientID + "text11')" + ".val();}");

            _js.AppendLine("</script>");
            ScriptManager.RegisterStartupScript(updatePanel1, GetType(), "cke2", _js.ToString(), false);
        
        }
    }

}
