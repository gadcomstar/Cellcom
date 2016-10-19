using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using SD = System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;
using System.IO;

public partial class Controls_CMSTRFileUploadrControl : CMSTRBase
{

    String path = HttpContext.Current.Request.PhysicalApplicationPath + "images\\";
    public enum fileTypes
    {
        Image,
        Text,
        Music,
        Video,
        ALL,
        Other
    }
    #region Properties
    private string cssClass = "FileUploadHolderDivClass";
    private bool showImage = false;
    private string imageUrl = "";
    private string alternativeText;
    private string text = "";
    //  private string uploadImage = "Uploadify/Uploadbutton.gif";
    private string uploadImage = "images/Siteimages/takephotobtn.png";
    private bool showTextBox = false;
    private string value;
    private string saveDirectory = "images/uploadimages/";
    private string dimension = "";
    private int width = 190;
    private int height = 60;
    private string fileDesc = "image files";
    private string fileExt = "*.jpg;*.gif;*.png";
    private string fileTypeList = "";
    private string SendedParameters = "";
    private string defaultImage;
    private bool hasCrop = false;
    private string buttonText = "Choose File";
    private string onSelected = "";
    public bool Visible
    {
        set { FileUploadHolder.Visible = value; }
        get { return FileUploadHolder.Visible; }
    }
    public String OnSelected
    {
        set { onSelected = value; }
        get { return onSelected; }
    }
    public String ButtonText
    {
        set { buttonText = value; }
        get { return buttonText; }
    }
    public bool HasCrop
    {
        set { hasCrop = value; }
        get { return hasCrop; }
    }
    public String FileTypeList
    {
        set { fileTypeList = value; }
        get { return fileTypeList; }
    }
    public override string DataFieldValue
    {
        set { MyImageHiddenField.Value = value; }
        get { return MyImageHiddenField.Value; }
    }
    private fileTypes types = fileTypes.Image;
    public fileTypes Types
    {
        set { this.types = value; }
        get { return this.types; }
    }
    public int Width
    {
        set { this.width = value; }
        get { return this.width; }
    }
    public int Height
    {
        set { this.height = value; }
        get { return this.height; }
    }
    public bool ShowImage
    {
        set { this.showImage = value; }
        get { return this.showImage; }
    }
    public bool ShowTextBox
    {
        set { this.showTextBox = value; }
        get { return this.showTextBox; }
    }
    /// <summary>
    /// Example 200x100
    /// </summary>
    public String Dimension
    {
        set { dimension = value; }
        get { return dimension; }
    }
    public String SaveDirectory
    {
        set { saveDirectory = value; }
        get { return saveDirectory; }
    }
    public String DefaultImage
    {
        set { defaultImage = value; }
        get { return defaultImage; }
    }
    public String Value
    {
        set { MyImageHiddenField.Value = value; }
        get { return MyImageHiddenField.Value; }
    }
    public String UploadImage
    {
        set { this.uploadImage = value; }
        get { return this.uploadImage; }
    }
    public String Text
    {
        set { this.text = value; }
        get { return this.text; }
    }
    public String AlternativeText
    {
        set { this.alternativeText = value; }
        get { return this.alternativeText; }
    }
    public String ImageUrl
    {
        set { this.imageUrl = value; }
        get { return this.imageUrl; }
    }
    public String CssClass
    {
        set { this.cssClass = value; }
        get { return this.cssClass; }
    }
    #endregion
    protected void Page_PreRender(object sender, EventArgs e)
    {
        FileUploadHolder.Attributes["class"] = this.cssClass;
        Imageholder.Visible = this.showImage;
        MyImage.AlternateText = this.alternativeText;
        if (this.imageUrl.Contains("http://"))
        {
            MyImage.ImageUrl = this.imageUrl;
        }
        else
        {
            if (imageUrl == "")
            {
                imageUrl = Value;
            }
            MyImage.ImageUrl = siteDefaults.SiteUrl + "/" + this.imageUrl.Replace("../", "");
        }
        MyTextBoxHolderClass.Visible = this.showTextBox;
        if (fileTypeList != "")
        {
            this.types = fileTypes.Other;
        }
        switch (this.types)
        {
            case fileTypes.Image:
                fileExt = "*.jpg;*.gif;*.png";
                fileDesc = "image files";
                SendedParameters = "'filetype':'image'";
                if (dimension != "")
                {
                    SendedParameters += ",'dimension':'" + dimension + "'";
                }
                break;
            case fileTypes.Music:
                fileExt = "*.mp3;*.wav";
                fileDesc = "music files";
                SendedParameters = "'filetype':'music'";
                break;
            case fileTypes.Text:
                fileExt = "*.pdf;*.doc";
                fileDesc = "text files";
                SendedParameters = "'filetype':'text'";
                break;
            case fileTypes.Video:
                fileExt = "*.flv";
                fileDesc = "video files";
                SendedParameters = "'filetype':'video'";
                break;
            case fileTypes.ALL:
                fileExt = "*.7z;*.aiff;*.asf;*.avi;*.bmp;*.csv;*.doc;*.docx;*.fla;*.flv;*.gif;*.gz;*.gzip;*.jpeg;*.jpg;*.mid;*.mov;*.mp3;*.mp4;*.mpc;*.mpeg;*.mpg;*.ods;*.odt;*.pdf;*.png;*.ppt;*.pptx;*.pxd;*.qt;*.ram;*.rar;*.rm;*.rmi;*.rmvb;*.rtf;*.sdc;*.sitd;*.swf;*.sxc;*.sxw;*.tar;*.tgz;*.tif;*.tiff;*.txt;*.vsd;*.wav;*.wma;*.wmv;*.xls;*.xlsx;*.zip";
                fileDesc = "All files";
                SendedParameters = "'filetype':'all'";
                break;
            case fileTypes.Other:
            default:
                fileExt = this.fileTypeList;
                fileDesc = "user files";
                SendedParameters = "'filetype':'others'";
                break;
        }
        CropButton.Visible = hasCrop;
        if (HasCrop)
        {
            string _jscrop = "";
            _jscrop += "var jcrop_api;";
            _jscrop += "$(document).ready(function () { mycrop();});";
            _jscrop += "function mycrop(){";
            _jscrop += "$('#" + MyImage.ClientID + "').Jcrop({";
            _jscrop += "onSelect: updateCoords";
            _jscrop += "}";
            _jscrop += ",function(){";
            _jscrop += " jcrop_api = this;";
            _jscrop += " });";
            _jscrop += "};";
            _jscrop += "function updateCoords(c) {";
            _jscrop += "$('#" + X.ClientID + "').val(c.x);";
            _jscrop += " $('#" + Y.ClientID + "').val(c.y);";
            _jscrop += " $('#" + W.ClientID + "').val(c.w);";
            _jscrop += " $('#" + H.ClientID + "').val(c.h);";
            _jscrop += "};";
            Page.ClientScript.RegisterStartupScript(typeof(Page), "_jscrop" + W.ClientID, _jscrop, true);
        }
    }
    protected void fileup_PreRender(object sender, EventArgs e)
    {
        FileUpload FileUpload1 = (FileUpload)sender;
        StringBuilder _js = new StringBuilder();
        //the list of options is at: http://www.uploadify.com/documentation/
        _js.AppendLine("$(window).load(");
        _js.AppendLine("function () {");
        _js.AppendLine("$(\"#" + FileUpload1.ClientID + "\").fileUpload({");
        //the uploader file	
        _js.AppendLine("'uploader': 'Uploadify/uploader.swf',");
        _js.AppendLine("'cancelImg': 'Uploadify/cancel.png',");
        _js.AppendLine("'buttonText': '" + buttonText + "',");
        //The Image file of the button	
        _js.AppendLine("'buttonImg': '" + this.uploadImage + "',");
        _js.AppendLine("'width': '" + this.width + "',");
        _js.AppendLine("'height': '" + this.height + "',");
        _js.AppendLine("'wmode': 'transparent',");
        //the server-side uploader file
        _js.AppendLine("'script': 'fileUpload.ashx',");
        _js.AppendLine("'folder': '" + saveDirectory + "--" + dimension + "--_prod" + "',");
        _js.AppendLine("'fileDesc': '" + fileDesc + "',");
        _js.AppendLine("'fileExt': '" + fileExt + "',");
        _js.AppendLine("'scriptData':{" + SendedParameters + "},");
        _js.AppendLine("'onComplete': function (event, queueID, fileObj, response, data) {");
        string textScript = "";
        string imageScript = "";
        if (showTextBox)
        {
            textScript = "document.getElementById('" + MyTextBoxClass.ClientID + "').value=response; jcrop_api.destroy();mycrop();";
        }
        if (showImage && imageUrl != "" && types == fileTypes.Image)
        {
            imageScript = "var imgid='" + MyImage.ClientID + "';document.getElementById('" + MyImage.ClientID + "').src='" + siteDefaults.SiteUrl + "/'+response.replace('../','');";
        }
        _js.AppendLine("if(response.indexOf('Error')==-1){ document.getElementById('" + MyImageHiddenField.ClientID + "').value=response; " + imageScript + textScript + onSelected + "}");
        _js.AppendLine("},");
        _js.AppendLine("'multi': false,");
        _js.AppendLine("'auto': true");
        _js.AppendLine("});");
        _js.AppendLine("}");
        _js.AppendLine("); ");
        string UploaderID = Guid.NewGuid().ToString();
        UploaderID = UploaderID.Remove(UploaderID.IndexOf("-"));
        Page.ClientScript.RegisterStartupScript(typeof(Page), UploaderID, _js.ToString(), true);
    }
    protected void Submit_Click(object sender, EventArgs e)
    {
        string fileName = MyImageHiddenField.Value;
        if (W.Value != "")
        {
            string ImageName = fileName.Replace("../", "");
            int w = Convert.ToInt32(W.Value);
            int h = Convert.ToInt32(H.Value);
            int x = Convert.ToInt32(X.Value);
            int y = Convert.ToInt32(Y.Value);
            byte[] CropImage = Crop(MapPath("../" + ImageName), w, h, x, y);
            using (MemoryStream ms = new MemoryStream(CropImage, 0, CropImage.Length))
            {
                ms.Write(CropImage, 0, CropImage.Length);
                using (SD.Image CroppedImage = SD.Image.FromStream(ms, true))
                {
                    string SaveTo = MapPath("../" + ImageName);
                    CroppedImage.Save(SaveTo, CroppedImage.RawFormat);
                    MyImage.ImageUrl = ImageName;
                    MyImageHiddenField.Value = ImageName;
                }
            }
        }
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
}