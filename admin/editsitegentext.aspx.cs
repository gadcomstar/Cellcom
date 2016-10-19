using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.Text;

public partial class admin_editsitegentext2 : System.Web.UI.Page
{
    DataSet ds = new DataSet();
    DataView dv;
    int pageid = 0;
    int status = 0;
    MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr);
    int myLang = 0;
    protected void Page_Load(object sender, EventArgs e)
    {


        GoBack.NavigateUrl = "ManageSiteGenText.aspx?sitelang=" + Request.QueryString["sitelang"] + "&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"];
        if (cmstrDefualts.CheckQueryString("status", out status))
        {
            GoBack.NavigateUrl = "ManageSiteGenText.aspx?sitelang=" + Request.QueryString["sitelang"] + "&cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"]+"&status=";      


        }
        if (Request.QueryString["sitelang"] != null && int.TryParse(Request.QueryString["sitelang"], out myLang))
        {
            if (Request.QueryString["page"] != null)
            {
                int.TryParse(Request.QueryString["page"], out pageid);
            }
            string pagequery = pageid == 0 ? "" : " AND langtext2.PageID=" + pageid;
            
            String sql = String.Format("Select langtext2.PageID as mypage, LangTextID, `{1}` as myText,TextType,PageStatus,TextComment,TextName,pagename From langtext2 left join pages2 On pages2.pageid=langtext2.PageID  where 1=1 {0}  order by PageStatus", pagequery, myLang);
            MySqlDataAdapter MyAdapter = new MySqlDataAdapter(sql, conn);
            MyAdapter.Fill(ds, "lang");
            dv = ds.Tables["lang"].DefaultView;
            if (!IsPostBack)
            {

                if (cmstrDefualts.CheckQueryString("status", out status))
                {
                    dv.RowFilter = "PageStatus=" + status;


                }
                EditTextRepeater.DataSource = dv;
                EditTextRepeater.DataBind();
                string[] myvalues = { "PageStatus", "mypage" };
                if (dv.Count > 0)
                {
                    pageHeader.Text = dv[0]["pagename"].ToString();
                }
                dv.RowFilter = "PageStatus>0";
                DataTable mytable = dv.ToTable(true, myvalues);
                StatusRepeater.DataSource = mytable;
                StatusRepeater.DataBind();
              
            }


        }
        else
        {
            Response.Redirect("../");
        }
    }
    protected bool SelectTextMode(string type)
    {
        bool isCk = false;
        switch (type)
        {
            case "2":
               
                break;
            case "3":
                isCk = true;
                break;

            case "1":                
            default:              
                break;
        
        }

        return isCk;
    }
    protected void SaveText(object sender, EventArgs e)
    {
         conn.Open();

         if (cmstrDefualts.CheckQueryString("status", out status))
         {
             dv.RowFilter = "PageStatus=" + status;

         }
       for(int i=0; i<EditTextRepeater.Items.Count;i++)
       {

        int myid =0;
        int.TryParse( ((HiddenField)EditTextRepeater.Items[i].FindControl("MyIdHiddenField")).Value.ToString(), out myid);
        dv[i]["myText"] = ((ASP.controls_cmstrtextboxcontrol_ascx)EditTextRepeater.Items[i].FindControl("GeneralMyTextBox")).Text;
        string myText  =((ASP.controls_cmstrtextboxcontrol_ascx)EditTextRepeater.Items[i].FindControl("GeneralMyTextBox")).Text.Replace("'", "''");
        string newpass = ((ASP.controls_cmstrtextboxcontrol_ascx)EditTextRepeater.Items[i].FindControl("GeneralMyTextBox")).GetValuepass.Replace("'", "''");
       // string myText = ((ASP.controls_cmstrtextboxcontrol_ascx)((LinkButton)sender).Parent.FindControl("GeneralMyTextBox")).Text.Replace("'","''");
       // myText = ((ASP.controls_cmstrtextboxcontrol_ascx)((LinkButton)sender).Parent.FindControl("GeneralMyTextBox")).DataFieldValue.Replace("'", "''");
       // dv[i]["myText"] = myText;
        string sql = String.Format("Update langtext2 Set `{2}`='{0}' Where LangTextID={1} ", myText, myid,myLang);
       
        MySqlCommand cmd = new MySqlCommand(sql, conn);
        cmd.ExecuteNonQuery();       

       }
       conn.Close();

       Languages.PageNames.Clear();
       Languages.TextPages.Clear();
       Languages.sendMagLangs.Clear();
      
        EditTextRepeater.DataSource = dv;
        EditTextRepeater.DataBind();
    }

    protected void MyTextBox_PreRender(object sender, EventArgs e)
    {       
            HiddenField longtxtboxHidden = (HiddenField)sender;

            StringBuilder _js = new StringBuilder();
            _js.AppendLine("<script type='text/javascript' language='javascript'>");

            _js.AppendLine("var instance = CKEDITOR.instances." + MyTextBox.ClientID + ";");
            _js.AppendLine("if (instance) { CKEDITOR.remove(CKEDITOR.instances." + MyTextBox.ClientID + "); }");
            _js.AppendLine("CKEDITOR.replace( '" + MyTextBox.ClientID + "',{height:'400px',width:'600px', id:'cklongtxtbox',contentsLangDirection : 'rtl',filebrowserBrowseUrl : 'ckfinder/ckfinder.html',filebrowserImageBrowseUrl : 'ckfinder/ckfinder.html?Type=Images',filebrowserFlashBrowseUrl : 'ckfinder/ckfinder.html?Type=Flash',filebrowserUploadUrl : 'ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Files',filebrowserImageUploadUrl : 'ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Images',filebrowserFlashUploadUrl : 'ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Flash'});");
            if (longtxtboxHidden.Value != "")
                _js.AppendLine("CKEDITOR.instances." + MyTextBox.ClientID + ".setData(document.getElementById('" + longtxtboxHidden.ClientID + "').value)");

            _js.AppendLine("CKEDITOR.instances." + MyTextBox.ClientID + ".on('blur',function() {setHidden" + longtxtboxHidden.ClientID + "()})");


            _js.AppendLine("function setHidden" + longtxtboxHidden.ClientID + "(){document.getElementById('" + longtxtboxHidden.ClientID + "').value= CKEDITOR.instances." + MyTextBox.ClientID + ".getData(); $('.textbox'+myid).children().next().next().children().val(CKEDITOR.instances." + MyTextBox.ClientID + ".getData())}");
            _js.AppendLine("</script>");

            Page.ClientScript.RegisterStartupScript(GetType(), "CKEditor" + longtxtboxHidden.ClientID, _js.ToString(), false);
        }
  
}