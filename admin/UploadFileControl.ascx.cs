using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_UploadFileControl : System.Web.UI.UserControl
{
	private string imgID = "";

	public string ImgID
	{
		get { return imgID; }
		set { imgID = value; }
	}

	private static string bizNum = "";

	public string BizNum
	{
		get { return bizNum; }
		set { bizNum = value; }
	}

	protected void Page_Load(object sender, EventArgs e)
    {

    }

	protected void UploadBtn_Click(object sender, EventArgs e)
	{
		if (picUpload.FileName.Contains(".jpg"))
		{
			string CurrentDirectory = System.AppDomain.CurrentDomain.BaseDirectory;
			string filePath = CurrentDirectory + "proPics\\Det" + bizNum + "_" + imgID + ".jpg";
			picUpload.SaveAs(filePath);

			using (System.Drawing.Image fullSizeImg = System.Drawing.Image.FromFile(filePath))
			{

				System.Drawing.Image.GetThumbnailImageAbort dummyCallBack = new System.Drawing.Image.GetThumbnailImageAbort(dummyfalse);
				System.Drawing.Image thumbSizeImg = fullSizeImg.GetThumbnailImage(73, 43, dummyCallBack, IntPtr.Zero);
				thumbSizeImg.Save(filePath.Replace("Det", "Thumbs\\t"), System.Drawing.Imaging.ImageFormat.Jpeg);
				thumbSizeImg.Dispose();
			}
			Response.Redirect("AddBiz.aspx?cat=" + Request.QueryString["cat"] + "&sub=" + Request.QueryString["sub"] + "&BizID=" + Request.QueryString["BizID"] + "&tab=5");
		}
		else
		{
			errMsg.Text = "הקובץ חייב להיות מסוג JPG";
		}
	}

	protected bool dummyfalse()
	{
		return false;
	}
}
