<%@ WebHandler Language="C#" Class="ImgUpload" %>

using System;
using System.Web;
using System.IO;

public class ImgUpload : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        string savedpath = "";
        int srcWidth; 
        int srcHeight; 
        int thumbHeight;
        int thumbWidth;
        System.Drawing.Bitmap bmp;
        System.Drawing.Graphics gr;
        System.Drawing.Rectangle rectDestination;
        context.Response.ContentType = "text/plain";
        context.Response.Expires = -1;
        try
        {
            HttpPostedFile postedFile = context.Request.Files["Filedata"];


            string RawTempPath = "../images/temp";
            string tempPath = context.Server.MapPath(RawTempPath);
            //giving the file a unique name, but saving it's extension
            string filename = Guid.NewGuid().ToString() + "_Large" + postedFile.FileName.Substring(postedFile.FileName.LastIndexOf("."));

            if (!Directory.Exists(tempPath))
                Directory.CreateDirectory(tempPath);

            //removing files that exist in the upload folder for more than 2 days
            string[] olderFiles = Directory.GetFiles(tempPath);
            for (int i = 0; i < olderFiles.Length; i++)
            {
                FileInfo fileInf = new FileInfo(olderFiles[i]);
                if (fileInf.CreationTime < DateTime.Now.AddDays(-2) && fileInf.FullName.Contains("_Large"))
                {
                    File.Delete(olderFiles[i]);
                }
            }

            postedFile.SaveAs(tempPath + @"\" + filename);

            string[] splitter = { "--" };
            string[] savePathsArr = context.Request["folder"].Split('|');
            int filecount = 0;
            foreach (string Path_size_name in savePathsArr)
            {
                if (Path_size_name.Contains("x") && Path_size_name.Contains("--"))
                {
                    string[] Path_size_nameArr = Path_size_name.Split(splitter, StringSplitOptions.None);
                    if (Path_size_nameArr.Length == 3)
                    {
                        filecount++;
                        string savepath = context.Server.MapPath(Path_size_nameArr[0]);
                        string[] saveSize = Path_size_nameArr[1].Split('x');
                        int SaveHeight = 0;
                        int SaveWidth = 0;
                        string saveAppendix = Path_size_nameArr[2];

                        //if (int.TryParse(saveSize[0], out SaveWidth) && int.TryParse(saveSize[1], out SaveHeight))
                        //{
                        if (int.TryParse(saveSize[0], out thumbWidth) && int.TryParse(saveSize[1], out thumbHeight))
                        {

                           

                            if (!Directory.Exists(savepath))
                                Directory.CreateDirectory(savepath);
                            if (filecount == 1)
                            {
                                savedpath = Path_size_nameArr[0] + filename.Replace("_Large", saveAppendix);
                            }

                            using (System.Drawing.Image fullSizeImg = System.Drawing.Image.FromFile(tempPath + @"\" + filename))
                            {

                                System.Drawing.Image.GetThumbnailImageAbort dummyCallBack = new System.Drawing.Image.GetThumbnailImageAbort(dummyfalse);
                                System.Drawing.Image ThumbSizeImg;
                                if (thumbWidth == 0)
                                    {
                                        thumbWidth = fullSizeImg.Width;
                                    }
                                if (thumbHeight == 0)
                                {
                                    thumbHeight = fullSizeImg.Height;
                                }
                                
                                srcWidth = fullSizeImg.Width;
                                srcHeight = fullSizeImg.Height; 
                                //if (fullSizeImg.Height * 100 / SaveHeight > fullSizeImg.Width * 100 / SaveWidth)

                                //{ ThumbSizeImg = fullSizeImg.GetThumbnailImage((fullSizeImg.Width * SaveHeight) / fullSizeImg.Height, SaveHeight, dummyCallBack, IntPtr.Zero); }
                                //else
                                //{ ThumbSizeImg = fullSizeImg.GetThumbnailImage(SaveWidth, (fullSizeImg.Height * SaveWidth) / fullSizeImg.Width, dummyCallBack, IntPtr.Zero); }

                                if ((fullSizeImg.Height / thumbHeight * 1000) > (fullSizeImg.Width / thumbWidth * 1000))
                                {
                                    thumbWidth = (fullSizeImg.Width * thumbHeight) / fullSizeImg.Height;
                                }
                                else
                                {
                                    thumbHeight = (fullSizeImg.Height * thumbWidth) / fullSizeImg.Width;
                                }
                                bmp = new System.Drawing.Bitmap(thumbWidth, thumbHeight, System.Drawing.Imaging.PixelFormat.Format32bppArgb);
                                gr = System.Drawing.Graphics.FromImage(bmp);
                                gr.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;
                                gr.CompositingQuality = System.Drawing.Drawing2D.CompositingQuality.HighQuality;
                                gr.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.High;
                                rectDestination = new System.Drawing.Rectangle(0, 0, thumbWidth, thumbHeight);
                                gr.DrawImage(fullSizeImg, rectDestination, 0, 0, srcWidth, srcHeight, System.Drawing.GraphicsUnit.Pixel);
                                
                                switch (System.IO.Path.GetExtension(savepath + @"\" + filename).ToLower())
                                {
                                    case ".jpg":
                                        //ThumbSizeImg.Save((savepath + @"\" + filename).Replace("_Large", saveAppendix), System.Drawing.Imaging.ImageFormat.Jpeg);
                                         bmp.Save((savepath + @"\" + filename).Replace("_Large", saveAppendix),System.Drawing.Imaging.ImageFormat.Jpeg);
                                        
                                        break;
                                    case ".gif":
                                        bmp.Save((savepath + @"\" + filename).Replace("_Large", saveAppendix), System.Drawing.Imaging.ImageFormat.Gif);
                                        break;
                                    case ".png":
                                        bmp.Save((savepath + @"\" + filename).Replace("_Large", saveAppendix), System.Drawing.Imaging.ImageFormat.Png);
                                        break;
                                }


                                bmp.Dispose();
                            }
                        }
                    }
                }

            }

            savedpath = ".."+ savedpath.Remove(0, savedpath.IndexOf("/images/"));
            //savedpath = savedpath.Remove(0, savedpath.IndexOf("/Images/"));

            context.Response.Write(savedpath);
            context.Response.StatusCode = 200;
        }
        catch (Exception ex)
        {
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

    protected bool dummyfalse()
    {
        return false;
    }

}