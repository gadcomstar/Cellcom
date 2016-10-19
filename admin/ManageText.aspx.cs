using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.OleDb;
using System.Text;

public partial class Admin_ManageText : System.Web.UI.Page
{
    private string ConnStr = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source='" + HttpContext.Current.Server.MapPath(System.Web.Configuration.WebConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString) + "';";
    protected void Page_Load(object sender, EventArgs e)
    {

    }


	protected void TextBox_PreRender(object sender, EventArgs e)
	{


		StringBuilder _js = new StringBuilder();
		_js.AppendLine("<script type='text/javascript' language='javascript'>");
		_js.AppendLine("CKEDITOR.replace( '" + ((TextBox)sender).ClientID + "',{id:'ckeditor1', contentsLangDirection : 'rtl',filebrowserBrowseUrl : 'Ckfinder/ckfinder.html',filebrowserImageBrowseUrl : 'Ckfinder/ckfinder.html?Type=Images',filebrowserFlashBrowseUrl : 'Ckfinder/ckfinder.html?Type=Flash',filebrowserUploadUrl : '/Ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Files',filebrowserImageUploadUrl : 'Ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Images',filebrowserFlashUploadUrl : '/Ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Flash'});");
		_js.AppendLine("</script>");

		//Page.RegisterStartupScript("CKEditor" + ((TextBox)sender).ClientID, _js.ToString());
        Page.ClientScript.RegisterStartupScript(GetType(), "CKEditor" + ((TextBox)sender).ClientID, _js.ToString());
	}
}
