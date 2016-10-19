<%@ WebHandler Language="C#" Class="ImgUpload" %>

using System;
using System.Web;
using System.IO;

public class ImgUpload : IHttpHandler {

    public void ProcessRequest(HttpContext context)
    {
        string savedpath = "";
        context.Response.ContentType = "text/plain";
        context.Response.Expires = -1;
        try
        {
            HttpPostedFile postedFile = context.Request.Files["Filedata"];
           // System.Threading.Thread.Sleep(300000);
            string RawTempPath = "images/tempFile";
            string tempPath = context.Server.MapPath(RawTempPath);
            string filetype = context.Request.QueryString["filetype"];
            string dimension = context.Request.QueryString["dimension"];
            System.Drawing.Bitmap bmp;
            System.Drawing.Graphics gr;
            System.Drawing.Rectangle rectDestination;
            // check if directory exists
            if (!Directory.Exists(tempPath))
            {
                Directory.CreateDirectory(tempPath);
            }
            //removing files that exist in the upload folder for more than 2 days
            string[] olderFiles = Directory.GetFiles(tempPath);
            //for (int i = 0; i < olderFiles.Length; i++)
            //{
            //    FileInfo fileInf = new FileInfo(olderFiles[i]);
            //    if (fileInf.CreationTime < DateTime.Now.AddDays(-2) && fileInf.FullName.Contains("_Large"))
            //    {
            //        File.Delete(olderFiles[i]);
            //    }
            //}
            //giving the file a unique name, but saving it's extension
            string filename = postedFile.FileName.Substring(0,postedFile.FileName.LastIndexOf("."))+ Guid.NewGuid().ToString().Substring(0,6) +  postedFile.FileName.Substring(postedFile.FileName.LastIndexOf("."));
            postedFile.SaveAs(tempPath + @"\" + filename);
            savedpath = RawTempPath +"/" + filename;

            if (filetype=="image" && !string.IsNullOrEmpty(dimension))
            {

                string[] splitter = { "--" };
                string[] savePathsArr = context.Request["folder"].Split('|');
                int thumbWidth = 0;
                int thumbHeight =0;
                int filecount = 0;
                string fileExtension = System.IO.Path.GetExtension(savedpath).ToLower();
                // check if image
                bool isImage = false;
                if (postedFile.FileName.Substring(postedFile.FileName.LastIndexOf(".")).ToLower() == ".jpeg" ||postedFile.FileName.Substring(postedFile.FileName.LastIndexOf(".")).ToLower() == ".jpg" || postedFile.FileName.Substring(postedFile.FileName.LastIndexOf(".")).ToLower() == ".png" || postedFile.FileName.Substring(postedFile.FileName.LastIndexOf(".")).ToLower() == ".gif")
                {
                    isImage = true;
                }
                
                if(isImage)
                {
                string[] dimarr = dimension.Split(',');
                foreach(string dim in  dimarr)
                {
                    string[] imageSize = dim.Split('x'); 
                     thumbWidth = int.Parse( imageSize[0]);
                     thumbHeight = int.Parse( imageSize[1]);
                    int srcWidth = 0;
                    int srcHeight = 0;
                    System.Drawing.Image fullSizeImg = System.Drawing.Image.FromFile(tempPath + @"\" + filename);
                    srcWidth = fullSizeImg.Width;
                    srcHeight = fullSizeImg.Height;

                    if ((srcHeight * 1000 / thumbHeight) > (srcWidth * 1000 / thumbWidth))
                    {
                        thumbHeight = (srcHeight * thumbWidth) / srcWidth;
                    }
                    else
                    {
                        thumbWidth = (srcWidth * thumbHeight) / srcHeight;
                       
                    }
                    
                    bmp = new System.Drawing.Bitmap(thumbWidth, thumbHeight, System.Drawing.Imaging.PixelFormat.Format32bppArgb);
                    gr = System.Drawing.Graphics.FromImage(bmp);
                    gr.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;
                    gr.CompositingQuality = System.Drawing.Drawing2D.CompositingQuality.HighQuality;
                    gr.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;               
                   
                    rectDestination = new System.Drawing.Rectangle(0, 0, thumbWidth, thumbHeight);
                    gr.DrawImage(fullSizeImg, rectDestination, 0, 0, srcWidth, srcHeight, System.Drawing.GraphicsUnit.Pixel);
                    
                     savedpath = savedpath.Replace(fileExtension,"");
                     System.Drawing.Imaging.Encoder quality = System.Drawing.Imaging.Encoder.Quality;
                     System.Drawing.Imaging.EncoderParameter ratio = new System.Drawing.Imaging.EncoderParameter(quality, 80L);
                     System.Drawing.Imaging.EncoderParameters codecParams = new System.Drawing.Imaging.EncoderParameters(1);
                     codecParams.Param[0] = ratio;
                     switch (fileExtension)
                    {                            
                        case ".jpg":                         
                            bmp.Save(context.Server.MapPath(savedpath + "_size" + filecount + fileExtension), GetEncoder(System.Drawing.Imaging.ImageFormat.Jpeg),codecParams);                                        
                            break;
                        case ".gif":
                            bmp.Save(context.Server.MapPath(savedpath + "_size" + filecount +fileExtension),  GetEncoder(System.Drawing.Imaging.ImageFormat.Gif),codecParams);
                            break;
                        case ".png":
                            bmp.Save(context.Server.MapPath(savedpath + "_size" + filecount + fileExtension), GetEncoder(System.Drawing.Imaging.ImageFormat.Png),codecParams);
                            break;
                    }
                     filecount++;
                  
                }
                savedpath = savedpath + "_size0" + fileExtension;
                }

              

            }
            savedpath = "../" + savedpath;
            context.Response.Write(savedpath);
            context.Response.StatusCode = 200;
        }
        catch (Exception ex)
        {
            string aa = ex.Message;
            
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
    private System.Drawing.Imaging.ImageCodecInfo GetEncoder(System.Drawing.Imaging.ImageFormat format)
    {
        System.Drawing.Imaging.ImageCodecInfo[] codecs = System.Drawing.Imaging.ImageCodecInfo.GetImageDecoders();
        foreach (System.Drawing.Imaging.ImageCodecInfo codec in codecs)
            if (codec.FormatID == format.Guid)
                return codec;
        return null;
    }

  

}