<%@ WebHandler Language="C#" Class="Upload" %> 
 
using System; 
using System.Web; 
using System.IO;

public class Upload : IHttpHandler
{

	public void ProcessRequest(HttpContext context)
	{
		context.Response.ContentType = "text/plain";
		context.Response.Expires = -1;
		try
		{
			HttpPostedFile postedFile = context.Request.Files["Filedata"];

			string savepath = "";
			string tempPath = "";
			tempPath = "../images/products";
			savepath = context.Server.MapPath(tempPath);
			//giving the file a unique name, but saving it's extension
			string filename = Guid.NewGuid().ToString() + "_Large" + postedFile.FileName.Substring(postedFile.FileName.LastIndexOf("."));
			if (!Directory.Exists(savepath))
				Directory.CreateDirectory(savepath);

			//removing files that exist in the upload folder for more than 2 days
			string[] olderFiles = Directory.GetFiles(savepath);
			for (int i = 0; i < olderFiles.Length; i++)
			{
				FileInfo fileInf = new FileInfo(olderFiles[i]);
				if (fileInf.CreationTime < DateTime.Now.AddDays(-2) && fileInf.FullName.Contains("_Large"))
				{
					File.Delete(olderFiles[i]);
				}
			}
			
			postedFile.SaveAs(savepath + @"\" + filename);
			context.Response.Write(tempPath + "/" + filename);
			context.Response.StatusCode = 200;
		}
		catch (Exception ex)
		{
            string aa = ex.Message;
			//context.Response.Write("Error: " + ex.Message);
		}
	}

	public bool IsReusable
	{
		get
		{
			return false;
		}
	}
}
