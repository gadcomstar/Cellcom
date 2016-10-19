using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using System.IO;
using SD = System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;
using System.Drawing;
using System.Net;

public partial class images : System.Web.UI.Page
{
    DataView dv;
    public int imagecount = 0;
    public string imageprofile = "-1";
    int imgMode = 0;
    int mymember = 0;
    int selectedImage = 0;
    public int imagenumber = 0;
    string clientid = "536784263051130";
    string Secret = "135a88c7ca7783f41a3030af4ae84a0a";

    protected void Page_Load(object sender, EventArgs e)
    {
        clientid = siteDefaults.GetParam("facebookAppID");
        Secret = siteDefaults.GetParam("FacebookSecretID");
        if (Session["memberid"] != null)
        {
            if (!IsPostBack && siteDefaults.CheckQueryString("img", out selectedImage))
            {

            }
            DoLoad();
            try
            {
                if (Request.QueryString["code"] != null)
                {
                    HttpWebRequest webRequest = (HttpWebRequest)System.Net.WebRequest.Create("https://graph.facebook.com/oauth/access_token?client_id="+clientid+"&redirect_uri=" + siteDefaults.GetLink( "images.aspx?cat=137&client_secret="+Secret)+"&code=" + Request.QueryString["code"]); //setting an httpWebRequest with the URL of the API

                    webRequest.Method = "GET";//the type of method the API returns
                    webRequest.Timeout = 20000;//sets the timeout for thew request
                    webRequest.ContentType = "application/x-www-form-urlencoded";//the content type. most of the times it will be application/x-www-form-urlencoded
                    StreamReader MyStream = new StreamReader(webRequest.GetResponse().GetResponseStream());//creating a stream reader to read the results from the API
                    string responseData = MyStream.ReadToEnd();//reading the result from the API into a string

                    string accessToken = responseData.Replace("access_token=", "");


                    webRequest = (HttpWebRequest)System.Net.WebRequest.Create("https://graph.facebook.com/me?access_token=" + accessToken); //setting an httpWebRequest with the URL of the API
                    //  webRequest = (HttpWebRequest)System.Net.WebRequest.Create("https://graph.facebook.com/https://graph.facebook.com/100002196022957/albums/?access_token=" + accessToken); //setting an httpWebRequest with the URL of the API
                    webRequest.Method = "GET";//the type of method the API returns
                    webRequest.Timeout = 20000;//sets the timeout for thew request
                    webRequest.ContentType = "application/x-www-form-urlencoded";//the content type. most of the times it will be application/x-www-form-urlencoded
                    MyStream = new StreamReader(webRequest.GetResponse().GetResponseStream());//creating a stream reader to read the results from the API
                    responseData = MyStream.ReadToEnd();//reading the result from the API into a string


                    System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();//creating a JSON deserializer JSON.
                    FacebookUser FriendsArr = serializer.Deserialize<FacebookUser>(responseData);//De-serealization of the string into an array of pre-defined objects


                    //string myimage =   "https://graph.facebook.com/" + FriendsArr.id + "/picture?type=large";

                    // bla.Text += "<br /><img src=\"https://graph.facebook.com/" + FriendsArr.id + "/picture\" />";


                    #region getting the picture's ID from facebook
                    webRequest = (HttpWebRequest)WebRequest.Create("https://graph.facebook.com/" + FriendsArr.id + "/albums/?access_token=" + accessToken);
                    HttpWebResponse res = (HttpWebResponse)webRequest.GetResponse();
                    Stream resStream = res.GetResponseStream();
                    StreamReader reader = new StreamReader(resStream);
                    string pictureID = reader.ReadToEnd();//gets the album's data
                    if (pictureID.Contains("cover_photo"))
                    {
                        pictureID = pictureID.Substring(pictureID.IndexOf(",\"cover_photo\":\"", pictureID.IndexOf("Profile Pictures")) + 16);
                        pictureID = pictureID.Remove(pictureID.IndexOf("\""));

                        webRequest = (HttpWebRequest)WebRequest.Create("https://graph.facebook.com/" + pictureID + "/?access_token=" + accessToken);
                        res = (HttpWebResponse)webRequest.GetResponse();
                        resStream = res.GetResponseStream();
                        reader = new StreamReader(resStream);
                        string pictureLoc = reader.ReadToEnd();//gets the photo's number
                        pictureLoc = pictureLoc.Substring(pictureLoc.IndexOf(",\"source\":\"") + 11);
                        pictureLoc = pictureLoc.Remove(pictureLoc.IndexOf("\"")).Replace("\\/", "/");

                        string fileExtension = pictureLoc.Substring(pictureLoc.LastIndexOf("."));

                        pictureLoc = LoadFacebookImage(pictureLoc, fileExtension);

                        LoadProfile.ImageUrl = pictureLoc;
                        LoadProfile.Value = "../" + pictureLoc;
                        //fbbutton.Text = pictureLoc;
                        string _js = "saveimage('" + "../" + pictureLoc + "');";
                        //_js += "$('#" + MyProfileImage.ClientID + "').attr('src','" + pictureLoc + "');";
                        //_js += " setimgpos(  $('#" + MyProfileImage.ClientID + "') );";
                        ClientScript.RegisterStartupScript(GetType(), "saveimg", _js, true);

                    }
                    #endregion
                }
            }
            catch (Exception ex)
            {

                fbbutton.Text = ex.Message;
            }

        }
    }

    protected void DoLoad()
    {        
        string imagesql = "";
        
        if (Request.QueryString["mymember"] != null && int.TryParse(Request.QueryString["mymember"], out mymember) && mymember.ToString() != Session["memberid"].ToString())
        {
            EditImage.Visible = false;
            ProfileButtons.Visible = false;
            deletebutton.Visible = false;
            if (siteDefaults.SiteParam["hasConfirmPicture"].ToLower() == "true")
            {
                imagesql = " AND isConfirm=1";
            }
        }
        else
        {
            EditImage.Visible = true;
            mymember = int.Parse(Session["memberid"].ToString());

        }
        using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
        {
            string sql = String.Format("select imagelink,iduserimages,userprofileimage,isConfirm,usergendor,memberid,xvalue,yvalue From tblusers  left join userimages  On userimages.memberid=tblusers.userid  Where userid={0} {1}", mymember, imagesql);
            MySqlDataAdapter ad = new MySqlDataAdapter(sql, conn);
            DataSet ds = new DataSet();
            ad.Fill(ds, "images");
            dv = ds.Tables["images"].DefaultView;

            //dv.RowFilter = "userprofileimage=iduserimages";
            if (dv.Count > 0)
            {
                for (int i = 0; i < dv.Count; i++)
                {
                    int x = 0;
                    int y = 0;
                    int.TryParse(dv[i]["xvalue"].ToString(), out x);
                    int.TryParse(dv[i]["yvalue"].ToString(), out y);
                    int iduserimages;
                    int.TryParse(dv[i]["iduserimages"].ToString(), out iduserimages);
                    if (selectedImage == iduserimages)
                    {
                        imagenumber = i;
                        imageselected.Value = i.ToString();
                        string _sethedden = "sethiddenstart(" + x + "," + y + ");";
                        Page.ClientScript.RegisterStartupScript(GetType(), "setstart", _sethedden, true);
                    }
                    if (i == 0)
                    {
                        if (dv[i]["usergendor"].ToString().ToLower() == "false")
                        {
                            MyProfileImage.Src = siteDefaults.SiteUrl + "/images/SiteImages/proffilebig.png";                           
                        }
                        else
                        {

                            MyProfileImage.Src = siteDefaults.SiteUrl + "/images/SiteImages/proffilebig2.png";
                        }
                        if (dv.Count <= 1 && String.IsNullOrEmpty(dv[i]["imagelink"].ToString()))
                        {
                            GenderLiteral.Text = "<input id=\"mygenderimg\" type=\"hidden\" value=\"" + MyProfileImage.Src + "\" />";
                            deletebutton.Visible = false;
                           
                        }
                    }
                    // MyProfileImage.Attributes["onload"] = "setimgpos(this);";


                    if (dv[i]["iduserimages"].ToString() == dv[i]["userprofileimage"].ToString())
                    {

                        imageprofile = i.ToString();
                        MyprofileImgHiddenField.Value = imageprofile;
                        if (File.Exists(MapPath(dv[i]["imagelink"].ToString().Replace("../", "").Replace("_size1", "_size0"))))
                        {
                            MyProfileImage.Src = siteDefaults.SiteUrl + "/" + dv[i]["imagelink"].ToString().Replace("../", "").Replace("_size1", "_size2");
                            MyProfileImage.Attributes["onload"] = "setimgposnew(this," + x + "," + y + ");";
                            //MyProfileImage.Style["width"] = "90%";
                        }

                    }
                }
                dv.RowFilter = "memberid=" + mymember;
                imagesRepeater.DataSource = dv;
                imagesRepeater.DataBind();
            }           
            else
            {
                if (methods.MemberList.ContainsKey(mymember))
                {
                    spinmember memspin = methods.MemberList[mymember];
                    if (memspin.Image == "")
                    {
                        string genimag = siteDefaults.SiteUrl + "/images/SiteImages/proffilebig.png"; 
                        if (memspin.Gender == 1)
                        {
                            genimag = siteDefaults.SiteUrl + "/images/SiteImages/proffilebig2.png"; 
                        }
                      
                        GenderLiteral.Text = "<input id=\"mygenderimg\" type=\"hidden\" value=\"" + genimag + "\" />";
                    }
                    
                }
            }
          

            imagecount = dv.Count;

            imgcount.Text = String.Format("({0} {1})", imagesRepeater.Items.Count, Languages.MyText("photos_images"));
            allnum.InnerText = imagesRepeater.Items.Count.ToString();
        } 


    }

    protected void Page_PreRender(object sender, EventArgs e)
    {

        if (Request.QueryString["mode"] != null && int.TryParse(Request.QueryString["mode"], out imgMode))
        {
            EditImage.Visible = false;
            string _js = "showimages2();checkProfile(" + imagenumber + ");";
            Page.ClientScript.RegisterStartupScript(GetType(), "PictureShow", _js, true);
            deletediv.Attributes["onclick"] = "CloseFrom();";
            imageHolder.Style["width"] = "480px";

        }
        int status = 0;
        int room = 0;
        int user = 0;
        if (siteDefaults.CheckQueryString("status", out status) && siteDefaults.CheckQueryString("room", out room))
        {
            myCloseFrom.Attributes["onclick"] = "window.parent.openMyprofile('createroom.aspx?status=" + status + "&room=" + room + "', '480', '470');";
            deletediv.Attributes["onclick"] = "window.parent.openMyprofile('createroom.aspx?status=" + status + "&room=" + room + "', '480', '470');";
        }
        if (siteDefaults.CheckQueryString("user", out user) )
        {
            myCloseFrom.Attributes["onclick"] = "window.parent.openMyprofile('Onlineshow.aspx?user=" + user  + "', '480', '470');";
            deletediv.Attributes["onclick"] = "window.parent.openMyprofile('Onlineshow.aspx?user=" + user + "', '480', '470');";
        }
    }
    protected void LoadImagesRepeater(object sender, EventArgs e)
    {
        DoLoad();

        //using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
        //{
        //    string sql = String.Format("select * From userimages Where memberid={0}", Session["memberid"]);
        //    MySqlDataAdapter ad = new MySqlDataAdapter(sql, conn);
        //    DataSet ds = new DataSet();
        //    ad.Fill(ds, "images");
        //    dv = ds.Tables["images"].DefaultView;

        //}
        //imagesRepeater.DataSource = dv;
        //imagesRepeater.DataBind();
        //imagecount = dv.Count;
        if (imageselected.Value != "")
        {
            string _js = "showimages($('.imagesclass' + " + imageselected.Value + "));";
            ClientScript.RegisterStartupScript(GetType(), "loadimage", _js, true);
        }

    }


    public string LoadFacebookImage(string imglink, string imgext)
    {
       
        string savedpath = "";

        try
        {
            //HttpWebRequest request = (HttpWebRequest)WebRequest.Create(imglink);
            //  HttpPostedFile postedFile =// context.Request.Files["Filedata"];

            string RawTempPath = "images/tempFile";
            string tempPath = MapPath(RawTempPath);
            string filetype = "image";
            string dimension = "200x200,100x100,405x405";
            System.Drawing.Bitmap bmp;
            System.Drawing.Graphics gr;
            System.Drawing.Rectangle rectDestination;
            // check if directory exists
            if (!Directory.Exists(tempPath))
            {
                Directory.CreateDirectory(tempPath);
            }

            string newimglink = imglink.Substring(imglink.LastIndexOf("/") + 1);
            newimglink = newimglink.Substring(0, newimglink.LastIndexOf("."));
            string filename = newimglink + Guid.NewGuid().ToString().Substring(0, 6) + imgext;

            save_file_from_url(tempPath + @"\" + filename, imglink);
            //postedFile.SaveAs(tempPath + @"\" + filename);
            savedpath = RawTempPath + "/" + filename;

            if (filetype == "image" && !string.IsNullOrEmpty(dimension))
            {

                string[] splitter = { "--" };

                int thumbWidth = 0;
                int thumbHeight = 0;
                int filecount = 0;
                string fileExtension = System.IO.Path.GetExtension(savedpath).ToLower();
                // check if image
                bool isImage = false;
                if (imglink.Substring(imglink.LastIndexOf(".")).ToLower() == ".jpeg" || imglink.Substring(imglink.LastIndexOf(".")).ToLower() == ".jpg" || imglink.Substring(imglink.LastIndexOf(".")).ToLower() == ".png" || imglink.Substring(imglink.LastIndexOf(".")).ToLower() == ".gif")
                {
                    isImage = true;
                }

                if (isImage)
                {
                    string[] dimarr = dimension.Split(',');
                    foreach (string dim in dimarr)
                    {
                        string[] imageSize = dim.Split('x');
                        thumbWidth = int.Parse(imageSize[0]);
                        thumbHeight = int.Parse(imageSize[1]);
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

                        savedpath = savedpath.Replace(fileExtension, "");
                        System.Drawing.Imaging.Encoder quality = System.Drawing.Imaging.Encoder.Quality;
                        System.Drawing.Imaging.EncoderParameter ratio = new System.Drawing.Imaging.EncoderParameter(quality, 80L);
                        System.Drawing.Imaging.EncoderParameters codecParams = new System.Drawing.Imaging.EncoderParameters(1);
                        codecParams.Param[0] = ratio;
                        switch (fileExtension)
                        {
                            case ".jpg":
                                bmp.Save(Server.MapPath(savedpath + "_size" + filecount + fileExtension), GetEncoder(System.Drawing.Imaging.ImageFormat.Jpeg), codecParams);
                                break;
                            case ".gif":
                                bmp.Save(Server.MapPath(savedpath + "_size" + filecount + fileExtension), GetEncoder(System.Drawing.Imaging.ImageFormat.Gif), codecParams);
                                break;
                            case ".png":
                                bmp.Save(Server.MapPath(savedpath + "_size" + filecount + fileExtension), GetEncoder(System.Drawing.Imaging.ImageFormat.Png), codecParams);
                                break;
                        }
                        filecount++;

                    }
                    savedpath = savedpath + "_size0" + fileExtension;
                }
            }

        }
        catch (Exception ex)
        {
            string aaa = ex.Message;
        }
        return savedpath;
    }


    public bool save_file_from_url(string file_path, string url)
    {
        try
        {
            byte[] content;
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
            WebResponse response = request.GetResponse();

            Stream stream = response.GetResponseStream();

            using (BinaryReader br = new BinaryReader(stream))
            {
                content = br.ReadBytes(500000);
                br.Close();
            }
            response.Close();

            FileStream fs = new FileStream(file_path, FileMode.Create);
            BinaryWriter bw = new BinaryWriter(fs);
            try
            {
                bw.Write(content);
            }
            finally
            {
                fs.Close();
                bw.Close();
            }
            return true;
        }
        catch
        {
            return false;
        }
    }

    private System.Drawing.Imaging.ImageCodecInfo GetEncoder(System.Drawing.Imaging.ImageFormat format)
    {
        System.Drawing.Imaging.ImageCodecInfo[] codecs = System.Drawing.Imaging.ImageCodecInfo.GetImageDecoders();
        foreach (System.Drawing.Imaging.ImageCodecInfo codec in codecs)
            if (codec.FormatID == format.Guid)
                return codec;
        return null;
    }

    static byte[] Crop(string Img, int Width, int Height, int X, int Y)
    {
        try
        {
            using (SD.Image OriginalImage = SD.Image.FromFile(Img))
            {
                using (SD.Bitmap bmp = new SD.Bitmap(Width, Height))
                {
                    bmp.SetResolution(OriginalImage.HorizontalResolution, OriginalImage.VerticalResolution);
                    using (SD.Graphics Graphic = SD.Graphics.FromImage(bmp))
                    {
                        Graphic.SmoothingMode = SmoothingMode.AntiAlias;
                        Graphic.InterpolationMode = InterpolationMode.HighQualityBicubic;
                        Graphic.PixelOffsetMode = PixelOffsetMode.HighQuality;
                        Graphic.DrawImage(OriginalImage, new SD.Rectangle(0, 0, Width, Height), X, Y, Width, Height, SD.GraphicsUnit.Pixel);

                        MemoryStream ms = new MemoryStream();
                        bmp.Save(ms, OriginalImage.RawFormat);
                        return ms.GetBuffer();
                    }
                }
            }
        }
        catch (Exception Ex)
        {
            throw (Ex);
        }
    }


    static void MakeImageBusiness(string filename)
    {
        try
        {
            // get the files from the folder

            string pathAndFile = filename;
            //toSave_path = MapPath("images/GalleryImages/Business/tmp/");
            // frames_path = System.Web.HttpContext.Current.Server.MapPath("images/GalleryImages/Frames/FramesTemplate.png");
            string finalSave_path = filename.Replace("_size1", "_gray");

            #region find the current image size
            System.Drawing.Image sourceImage = System.Drawing.Image.FromFile(pathAndFile);
            //Size size = new Size(img_width, img_height);
            //Size newSize = GetNewSize(sourceImage, size);
            #endregion

            #region createTwoTmpImages

            Bitmap bitmap = new Bitmap(sourceImage);

            using (Graphics gr = Graphics.FromImage((System.Drawing.Image)bitmap))
            {
                gr.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighSpeed;
                gr.CompositingQuality = System.Drawing.Drawing2D.CompositingQuality.HighSpeed;
                gr.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.High;
                gr.DrawImage(sourceImage, 0, 0);// (sourceImage,  (img_width - newSize.Width) / 2, (img_height - newSize.Height) / 2, newSize.Width, newSize.Height);
            }

            System.Drawing.Image NewColorImage = (System.Drawing.Image)bitmap;
            //NewColorImage.Save(toSave_path + "tmp_Color.jpg");

            //create a blank bitmap the same size as original
            Bitmap newBitmap = new Bitmap(NewColorImage.Width, NewColorImage.Height);

            //get a graphics object from the new image
            Graphics g = Graphics.FromImage(newBitmap);

            //create the grayscale ColorMatrix
            ColorMatrix colorMatrix = new ColorMatrix(
                new float[][] 
                {
                    new float[] {.3f, .3f, .3f, 0, 0},
                    new float[] {.59f, .59f, .59f, 0, 0},
                    new float[] {.11f, .11f, .11f, 0, 0},
                    new float[] {0, 0, 0, 1, 0},
                    new float[] {0, 0, 0, 0, 1}
                });

            //create some image attributes
            ImageAttributes attributes = new ImageAttributes();

            //set the color matrix attribute
            attributes.SetColorMatrix(colorMatrix);

            //draw the original image on the new image
            //using the grayscale color matrix
            g.DrawImage(NewColorImage, new Rectangle(0, 0, NewColorImage.Width, NewColorImage.Height),
                0, 0, NewColorImage.Width, NewColorImage.Height, GraphicsUnit.Pixel, attributes);

            System.Drawing.Image NewGrayImage = (System.Drawing.Image)newBitmap;
            NewGrayImage.Save(finalSave_path);

            #endregion

            bitmap.Dispose();
            newBitmap.Dispose();
            //frameBitmap.Dispose();
            sourceImage.Dispose();

            // return true;
        }
        catch (Exception ex)
        {
            string aaa = ex.Message;
        }

    }


    protected void FaceBookLogin(object sender, EventArgs e)
    {
        try
        {
            if (Request.QueryString["code"] == null)
            {
                Response.Redirect("https://www.facebook.com/dialog/oauth?client_id=" + clientid + "&redirect_uri=" + siteDefaults.GetLink("images.aspx?cat=137") + "&scope=user_hometown,email,user_likes&state=1256");
            }
        }
        catch { }
    }

    [System.Web.Services.WebMethod]
    public static string SaveImage(string myimage,string count)
    {
        if (methods.CheckSeesion())
        {
            spinmember myspin =methods.GetMe();
            string DirName = "memberimages";
            int size = 0;
            string myfile = HttpContext.Current.Server.MapPath(myimage.Replace("../", ""));
            if (!File.Exists(myfile.Replace("tempFile", DirName)))
            {
                while (File.Exists(myfile))
                {

                    string SaveTo = myfile.Replace("tempFile", DirName).Replace('\\', '/');
                    try
                    {
                        File.Copy(myfile, SaveTo);
                    }
                    catch (Exception ex)
                    {
                        string aaa = ex.Message;
                    }
                    if (size == 1)
                    {
                        MakeImageBusiness(SaveTo);
                    }
                    size++;
                    myfile = myfile.Replace("_size" + (size - 1), "_size" + size);

                }
            }
            string imageid = "";
            string myimg="";
            int isconfirm =0;
            using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
            {
                string sql = String.Format("Insert Into userimages (imagelink,memberid) Values ('{0}',{1});SELECT last_insert_id(); ", myimage.Replace("tempFile", DirName),myspin.MemberID);
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                conn.Open();
                imageid = cmd.ExecuteScalar().ToString();
                if (count == "0")
                {
                    cmd.CommandText = String.Format("Update tblusers Set userprofileimage={0} WHERE userid={1}", imageid, HttpContext.Current.Session["memberid"]);
                    cmd.ExecuteNonQuery();
                    cmd.CommandText = String.Format("Select imagelink,isConfirm From userimages Where iduserimages={0}", imageid);
                    MySqlDataReader dr = cmd.ExecuteReader();
                    if (dr.Read())
                    {
                        myimg = dr["imagelink"].ToString();
                        int.TryParse(dr["isConfirm"].ToString(), out isconfirm);
                    }
                      myspin.Image = myimg;
                    myspin.IsImgConfirm = isconfirm;
                    myimg = siteDefaults.SiteUrl + "/" + myimg.ToString().Replace("../", "").Replace("_size1", "_size0");
                  
            }
            conn.Close();
          
            }
                //cmd.ExecuteNonQuery();
            return imageid;// myimage.Replace("tempFile", DirName);
        }
        else
        {
            return "1error1";
        }
    }


    [System.Web.Services.WebMethod]
    public static string SaveProfile(string myid)
    {
        if (methods.CheckSeesion())
        {
            string myimg = "";
            int memberid = 0;
            int.TryParse(HttpContext.Current.Session["memberid"].ToString(), out memberid);
            myimg = SaveProfile(myid, memberid);
            //int isconfirm = 0;
            //using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
            //{
            //    string sql = String.Format("Update  tblusers Set userprofileimage={0} Where userid={1}  ", myid, HttpContext.Current.Session["memberid"]);
            //    MySqlCommand cmd = new MySqlCommand(sql, conn);
            //    conn.Open();
            //    cmd.ExecuteNonQuery();
            //    cmd.CommandText = String.Format("Select imagelink,isConfirm From userimages Where iduserimages={0}", myid);
            //    MySqlDataReader dr = cmd.ExecuteReader();
            //    if (dr.Read())
            //    {
            //        myimg = dr["imagelink"].ToString();
            //        int.TryParse(dr["isConfirm"].ToString(), out isconfirm);

            //    }
            //    conn.Close();
            //}
            //spinmember mydata = methods.MemberList[int.Parse(HttpContext.Current.Session["memberid"].ToString())];
            //mydata.Image = myimg;
            //mydata.IsImgConfirm = isconfirm;
            //myimg = siteDefaults.SiteUrl + "/" + myimg.ToString().Replace("../", "").Replace("_size1", "_size0");

            return myimg;
        }
        else
        {
            return "1error1";
        }
    }
    public static string SaveProfile(string myid,int memberid)
    {        
            string myimg = "";
            int isconfirm = 0;
            using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
            {
                string sql = String.Format("Update  tblusers Set userprofileimage={0} Where userid={1}  ", myid, memberid);
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                conn.Open();
                cmd.ExecuteNonQuery();
                cmd.CommandText = String.Format("Select imagelink,isConfirm From userimages Where iduserimages={0}", myid);
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    myimg = dr["imagelink"].ToString();
                    int.TryParse(dr["isConfirm"].ToString(), out isconfirm);
                }
                conn.Close();
            }
            spinmember mydata = methods.MemberList[memberid];
            mydata.Image = myimg;
            mydata.IsImgConfirm = isconfirm;
            myimg = siteDefaults.SiteUrl + "/" + myimg.ToString().Replace("../", "").Replace("_size1", "_size0");

            return myimg;        
    }



    [System.Web.Services.WebMethod]
    public static string DeleteImage(string myid)
    {
        spinmember myspin = methods.GetMe();
        bool changeProfileImage = false;
        if (methods.CheckSeesion())
        {
            string myfile = "";
            using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
            {
                string sql = String.Format("Select imagelink  From   userimages Where iduserimages={0} AND memberid={1}  ", myid, myspin.MemberID);
                MySqlCommand cmd = new MySqlCommand(sql, conn);
                conn.Open();
                MySqlDataReader dr = cmd.ExecuteReader();
                if (dr.Read())
                {
                    myfile = HttpContext.Current.Server.MapPath(dr["imagelink"].ToString().Replace("../", ""));
                    if (myspin.Image2 == dr["imagelink"].ToString())
                    {
                        changeProfileImage = true;
                    }                    
                }
                dr.Close();
                sql = String.Format("Delete From   userimages Where iduserimages={0} AND memberid={1}  ", myid, myspin.MemberID);
                cmd.CommandText = sql;
                cmd.ExecuteNonQuery();
                if (changeProfileImage)
                {
                    cmd.CommandText = String.Format("Select iduserimages From userimages where memberid={0} limit 1", myspin.MemberID);
                    dr = cmd.ExecuteReader();
                    int iduserimages = 0;
                    if (dr.Read())
                    {
                        int.TryParse(dr["iduserimages"].ToString(), out iduserimages);                    
                    }
                    dr.Close();
                    if (iduserimages > 0)
                    {
                        SaveProfile(iduserimages.ToString(), myspin.MemberID);
                    }
                }
                conn.Close();

                int size = 0;
                while (File.Exists(myfile))
                {

                    File.Delete(myfile);
                    size++;
                    myfile = myfile.Replace("_size" + (size - 1), "_size" + size);
                }
            }
            return myid;
        }
        else
        {
            return "1error1";
        }
    }

   

}