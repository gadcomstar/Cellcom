using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_UploadLogoControl : System.Web.UI.UserControl
{
	private static string productID = "";

	public string ProductID
	{
		get { return productID; }
		set { productID = value; }
	}

	protected void Page_Load(object sender, EventArgs e)
    {

    }

	protected void UploadBtn_Click(object sender, EventArgs e)
	{
		if (picUpload.HasFile)
		{
		if (System.IO.File.Exists(MapPath("../images/Products/img" + ProductID + ".jpg")))
		{
			System.IO.File.Delete(MapPath("../images/Products/img" + ProductID + ".jpg"));
			System.IO.File.Delete(MapPath("../images/Products/img" + ProductID + "Page.jpg"));
		}
		if (System.IO.File.Exists(MapPath("../images/Products/img" + ProductID + ".gif")))
		{
			System.IO.File.Delete(MapPath("../images/Products/img" + ProductID + ".gif"));
			System.IO.File.Delete(MapPath("../images/Products/img" + ProductID + "Page.gif"));
		}
		if (System.IO.File.Exists(MapPath("../images/Products/img" + ProductID + ".png")))
		{
			System.IO.File.Delete(MapPath("../images/Products/img" + ProductID + ".png"));
			System.IO.File.Delete(MapPath("../images/Products/img" + ProductID + "Page.png"));
		}
		
			string filePath = "../images/Products/img" + ProductID + "_Large" + System.IO.Path.GetExtension(picUpload.FileName);
			picUpload.SaveAs(MapPath(filePath));

			using (System.Drawing.Image fullSizeImg = System.Drawing.Image.FromFile(MapPath(filePath)))
			{

				System.Drawing.Image.GetThumbnailImageAbort dummyCallBack = new System.Drawing.Image.GetThumbnailImageAbort(dummyfalse);
				System.Drawing.Image ThumbSizeImg;

				if (fullSizeImg.Height > fullSizeImg.Width)
				{ ThumbSizeImg = fullSizeImg.GetThumbnailImage((fullSizeImg.Width * 148) / fullSizeImg.Height, 148, dummyCallBack, IntPtr.Zero); }
				else
				{ ThumbSizeImg = fullSizeImg.GetThumbnailImage(185, (fullSizeImg.Height * 185) / fullSizeImg.Width, dummyCallBack, IntPtr.Zero); }

				switch (System.IO.Path.GetExtension(MapPath(filePath)).ToLower())
				{
					case ".jpg":
						ThumbSizeImg.Save(MapPath(filePath.Replace("_Large", "")), System.Drawing.Imaging.ImageFormat.Jpeg);
						break;
					case ".gif":
						ThumbSizeImg.Save(MapPath(filePath.Replace("_Large", "")), System.Drawing.Imaging.ImageFormat.Gif);
						break;
					case ".png":
						ThumbSizeImg.Save(MapPath(filePath.Replace("_Large", "")), System.Drawing.Imaging.ImageFormat.Png);
						break;
				}

				if (fullSizeImg.Height > fullSizeImg.Width)
				{ ThumbSizeImg = fullSizeImg.GetThumbnailImage((fullSizeImg.Width * 295) / fullSizeImg.Height, 295, dummyCallBack, IntPtr.Zero); }
				else
				{ ThumbSizeImg = fullSizeImg.GetThumbnailImage(430, (fullSizeImg.Height * 430) / fullSizeImg.Width, dummyCallBack, IntPtr.Zero); }

				switch (System.IO.Path.GetExtension(MapPath(filePath)))
				{
					case ".jpg":
						ThumbSizeImg.Save(MapPath(filePath.Replace("_Large", "Page")), System.Drawing.Imaging.ImageFormat.Jpeg);
						break;
					case ".gif":
						ThumbSizeImg.Save(MapPath(filePath.Replace("_Large", "Page")), System.Drawing.Imaging.ImageFormat.Gif);
						break;
					case ".png":
						ThumbSizeImg.Save(MapPath(filePath.Replace("_Large", "Page")), System.Drawing.Imaging.ImageFormat.Png);
						break;
				}



				ThumbSizeImg.Dispose();
			}

			System.IO.File.Delete(MapPath(filePath));
			//CropperDiv.Visible = true;
		}
		if (Request.Url.ToString().Contains("tab="))
		{
			Response.Redirect(Request.Url.ToString().Replace("tab=1", "tab=5").Replace("tab=2", "tab=5").Replace("tab=3", "tab=5").Replace("tab=4", "tab=5").Replace("tab=6", "tab=5"));
		}
		else
		{
			Response.Redirect(Request.Url.ToString().Replace("&from", "&tab=5&from"));
		}
	}

	protected bool dummyfalse()
	{
		return false;
	}
}
