using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Data;
using ASP;
using System.IO;
public partial class CMSTRFormWebUserControl : System.Web.UI.UserControl
{
    #region Properties
    public enum Status
    {
        Contact,
        Update,
        Insert,
        ContactAndInsert,
        ContactAndUpdate,
        Cancel,
        Disabled
    }
    public delegate void InsertedDelegate(string NewUserID);
    public event InsertedDelegate ItemInserted;
    public delegate string InsertingDelegate();
    public event InsertingDelegate ItemInserting;
    public delegate void UpdatedDelegate(string NewUserID);
    public event UpdatedDelegate ItemUpdated;
    public delegate void UpdatingDelegate(string NewUserID);
    public event UpdatingDelegate ItemUpdating;

    private List<string> MyData = new List<string>();
    private ITemplate messageTemplate = null;
    private string tableName;
    private Status formStatus = Status.Insert;
    private string dataKeyField;
    private int dataKeyFieldValue = 0;
    private string cssClass = "formplaceholderclass";
    private string header = "";
    private string backURL = "./";
    private bool closeFancy = false;
    private DataSet ds = new DataSet();
    private List<string> myDatafields = new List<string>();
    private bool hasOrder = false;
    private string orderField = "";
    private string newUpdateSql = "";
    private string savebuttonText = "";
    private string validationGroup;
    private bool fullDate = false;
    private string backButtonText = "חזור";
    private string saveReturnText = "חזור";
    private string saveButtonToolTip = "";
    private string orderQuery = "";
    private DataView sourceDV = null;
    private string updatemessage = "The Data been Saved";
    public string OrderQuery
    {
        set { this.orderQuery = value; }
        get { return this.orderQuery; }
    }
    public string SaveButtonToolTip
    {
        set { this.saveButtonToolTip = value; }
        get { return this.saveButtonToolTip; }
    }
    public bool isInsertRedirect = true;
    public DataView SourceDV
    {
        set { this.sourceDV = value; }
    }
    public string UpdateMessage
    {
        set { this.updatemessage = value; }
        get { return this.updatemessage; }
    }
    public string SaveReturnText
    {
        set { this.saveReturnText = value; }
        get { return this.saveReturnText; }
    }

    public string BackButtonText
    {
        set { this.backButtonText = value; }
        get { return this.backButtonText; }
    }

    public bool IsInsertRedirect
    {
        set { this.isInsertRedirect = value; }

    }
    public bool FullDate
    {
        set { this.fullDate = value; }
        get { return this.fullDate; }
    }
    public bool HideSaveButton
    {
        set { this.butonholder.Visible = value; }

    }
    DataView dv;
    public string ValidationGroup
    {
        set { this.validationGroup = value; }
        get { return this.validationGroup; }
    }
    public string OnClientClick
    {
        set { this.mybuttton.OnClientClick = value; }
        get { return this.mybuttton.OnClientClick; }
    }
    public string SaveButtonText
    {
        set { this.savebuttonText = value; }
        get { return this.savebuttonText; }

    }
    public string OrderField
    {
        set { this.orderField = value; }
        get { return this.orderField; }

    }
    public bool HasOrder
    {
        set { this.hasOrder = value; }
        get { return this.hasOrder; }

    }
    public bool CloseFancy
    {
        set { this.closeFancy = value; }
        get { return this.closeFancy; }

    }
    public bool VisibleSaveButton
    {
        set { this.mybuttton.Visible = value; }
        get { return this.mybuttton.Visible; }

    }
    public bool VisibleBackButton
    {
        set { this.BackButton.Visible = value; }
        get { return this.BackButton.Visible; }

    }
    public bool VisibleSaveAndBackButton
    {
        set { this.SaveRetunLinkButton.Visible = value; this.buttonbackholder.Visible = value; }
        get { return this.SaveRetunLinkButton.Visible; }

    }
    public String BackURL
    {
        set { this.backURL = value; }
        get { return this.backURL; }

    }
    public String TableName
    {
        set { this.tableName = value; }
        get { return this.tableName; }

    }
    public String Header
    {
        set { this.header = value; }
        get { return this.header; }

    }
    public String CssClass
    {
        set { this.cssClass = value; }
        get { return this.cssClass; }
    }
    public Status FormStatus
    {
        set { this.formStatus = value; }
        get { return this.formStatus; }
    }
    public string DataKeyField
    {
        set { this.dataKeyField = value; }
        get { return this.dataKeyField; }

    }
    public int DataKeyFieldValue
    {
        set { this.dataKeyFieldValue = value; }
        get { return this.dataKeyFieldValue; }
    }
    #endregion
    [TemplateContainer(typeof(MessageContainer))]
    [PersistenceMode(PersistenceMode.InnerProperty)]
    public ITemplate MessageTemplate
    {
        get
        {
            return messageTemplate;
        }
        set
        {
            messageTemplate = value;
        }
    }
    MessageContainer container;
    void Page_Init()
    {
        mybuttton.ValidationGroup = ValidationGroup;
        SaveRetunLinkButton.ValidationGroup = ValidationGroup;
        if (messageTemplate != null)
        {
            container = new MessageContainer();
            messageTemplate.InstantiateIn(container);
            PlaceHolder1.Controls.Add(container);
        }
    }
    void Page_PreRender()
    {
        FormHolder.Attributes["class"] = CssClass;
        mybuttton.Text = savebuttonText;
        if (saveButtonToolTip != "")
        {
            mybuttton.ToolTip = saveButtonToolTip;
        }
        if (dataKeyFieldValue != 0)
        {
            using (MySqlConnection conn = new MySqlConnection(cmstrDefualts.ConnStr))
            {
                string sql = String.Format("Select * From {0} where {1}={2}", tableName, dataKeyField, dataKeyFieldValue);
                MySqlDataAdapter MyAdapter = new MySqlDataAdapter(sql, conn);
                MyAdapter.Fill(ds, "MyData");
                dv = ds.Tables["MyData"].DefaultView;
            }
            List<Control> list = new List<Control>();
            list = cmstrDefualts.getControls2(container);
            if (list.Count > 0 && dv.Count > 0)
            {
                for (int i = 0; i < list.Count; i++)
                {
                    if (list[i] is CMSTRBase)
                    {
                        if (((CMSTRBase)list[i]).DataFieldName == null || dv[0][((CMSTRBase)list[i]).DataFieldName] == null)
                        {
                        }
                        else
                        {
                            CMSTRBase MyControls = ((CMSTRBase)list[i]);
                            if (!IsPostBack && MyControls.DataForceValue)
                            {
                            }
                            else
                            {
                                switch (MyControls.DataFieldType)
                                {
                                    case DataTypes.Bool:
                                        if (MyControls.DataFieldValue.ToLower() != "false" && MyControls.DataFieldValue.ToLower() != "true")
                                        {
                                            MyControls.DataFieldValue = "false";
                                        }
                                        else
                                        {
                                            MyControls.DataFieldValue = dv[0][((CMSTRBase)list[i]).DataFieldName].ToString();
                                        }
                                        break;
                                    default:
                                        MyControls.DataFieldValue = dv[0][((CMSTRBase)list[i]).DataFieldName].ToString();
                                        break;
                                }
                            }
                        }
                    }
                }
            }
        }
        if (formStatus == Status.Disabled)
        {
            List<Control> list = new List<Control>();
            list = cmstrDefualts.getControls2(container);
            for (int i = 0; i < list.Count; i++)
            {
                if (list[i] is CMSTRBase)
                {
                    CMSTRBase MyControls = ((CMSTRBase)list[i]);
                    MyControls.Enabled = false;
                }
            }
        }
        if (formStatus == Status.Insert)
        {
            VisibleSaveAndBackButton = false;
        }
    }
    public void CalldoClick()
    {
        EventArgs e = new EventArgs();
        object sender = mybuttton;
        doClick(sender, e);

    }
    protected void doClick(object sender, EventArgs e)
    {
        string sql = "";
        List<Control> list = new List<Control>();
        list = cmstrDefualts.getControls2(container);
        if (formStatus == Status.Insert)
        {
            if (ItemInserting != null)
            {
                string resultInserting = ItemInserting();

                if (resultInserting == "insert")
                {

                }
                else if (resultInserting == "")
                {

                    formStatus = Status.Cancel;
                }
                else
                {
                    if (int.TryParse(resultInserting, out dataKeyFieldValue))
                    {
                        formStatus = Status.Update;
                    }
                    else
                    {
                        formStatus = Status.Cancel;
                    }
                }
            }
        }
        #region Update
        if (formStatus == Status.Update)
        {
            ItemUpdated += DummyItemInserted;
            ItemUpdating += DummyItemInserted;
            ItemUpdating(dataKeyFieldValue.ToString());
            // upadete table
            sql += String.Format("Update {0} Set ", tableName);
            MymsgLabel.Text = "";
            int controlsCount = 0;
            for (int i = 0; i < list.Count; i++)
            {
                if (list[i] is CMSTRBase)
                {
                    CMSTRBase MyControls = (CMSTRBase)list[i];
                    if (MyControls.Enabled == true)
                    {
                        if (!String.IsNullOrEmpty(MyControls.DataFieldName))
                        {
                            controlsCount++;
                            if (controlsCount > 1)
                            {
                                sql += ",";
                            }
                            switch (MyControls.DataFieldType)
                            {
                                case DataTypes.String:
                                    sql += String.Format(" `{0}`='{1}' ", MyControls.DataFieldName, MyControls.DataFieldValue.Replace("'", "''"));
                                    break;
                                case DataTypes.Number:
                                    sql += String.Format(" `{0}`={1}", MyControls.DataFieldName, MyControls.DataFieldValue);
                                    break;
                                case DataTypes.Bool:
                                    if (MyControls.DataFieldValue.ToString().ToLower() == "true" || MyControls.DataFieldValue.ToString().ToLower() == "false")
                                    {
                                        sql += String.Format(" `{0}`={1}", MyControls.DataFieldName, MyControls.DataFieldValue);
                                    }
                                    else
                                    {
                                        sql += String.Format(" `{0}`={1}", MyControls.DataFieldName, "false");
                                    }
                                    break;
                                case DataTypes.DateTime:
                                    DateTime myDateTime = new DateTime();
                                    if (MyControls.DataFieldValue == null || MyControls.DataFieldValue.ToString() == "" || !DateTime.TryParse(MyControls.DataFieldValue.ToString().Replace(".", "/"), out myDateTime))
                                    {
                                        sql += String.Format(" `{0}`='{1}'", MyControls.DataFieldName, DateTime.Now.ToString("yyyy-MM-dd"));
                                    }
                                    else
                                    {
                                        sql += String.Format(" `{0}`='{1}'", MyControls.DataFieldName, myDateTime.ToString("yyyy-MM-dd"));
                                    }
                                    break;
                                case DataTypes.File:
                                    string DirName = ((ASP.controls_cmstrfileuploadrcontrol_ascx)MyControls).SaveDirectory; //;"usersImages";
                                    int size = 0;
                                    string myfile = MapPath(MyControls.DataFieldValue);
                                    if (!File.Exists(myfile.Replace("tempFile", DirName)))
                                    {
                                        while (File.Exists(myfile))
                                        {

                                            File.Copy(myfile, myfile.Replace("tempFile", DirName), true);
                                            size++;
                                            myfile = myfile.Replace("_size" + (size - 1), "_size" + size);

                                        }
                                        sql += String.Format(" `{0}`='{1}' ", MyControls.DataFieldName, MyControls.DataFieldValue.Replace("'", "''").Replace("tempFile", DirName));
                                    }
                                    else
                                    {
                                        sql = sql.Remove(sql.Length - 1);
                                    }
                                    break;
                            }
                        }
                    }
                }
            }
            sql += String.Format(" where {0}={1}", DataKeyField, dataKeyFieldValue);
        }
        #endregion
        #region  insert to table
        if (formStatus == Status.Insert)
        {
            ItemInserted += DummyItemInserted;
            sql = String.Format("Insert Into {0} ", tableName);
            string fieldlist = "";
            string valuelist = "";
            int controlsCount = 0;
            for (int i = 0; i < list.Count; i++)
            {
                if (list[i] is CMSTRBase)
                {
                    CMSTRBase MyControls = (CMSTRBase)list[i];
                    if (MyControls.Enabled == true && !String.IsNullOrEmpty(MyControls.DataFieldName))
                    {
                        controlsCount++;
                        if (controlsCount > 1)
                        {
                            fieldlist += ",";
                            valuelist += ",";
                        }
                        switch (MyControls.DataFieldType)
                        {
                            case DataTypes.String:
                                fieldlist += String.Format(" `{0}`", MyControls.DataFieldName);
                                valuelist += String.Format(" '{0}' ", MyControls.DataFieldValue.Replace("'", "''"));
                                break;
                            case DataTypes.Number:
                                if (MyControls.DataFieldValue == null || MyControls.DataFieldValue.ToString() == "")
                                {
                                    fieldlist += String.Format(" `{0}`", MyControls.DataFieldName);
                                    valuelist += String.Format(" {0} ", 0);
                                }
                                else
                                {
                                    fieldlist += String.Format(" `{0}`", MyControls.DataFieldName);
                                    valuelist += String.Format(" {0} ", MyControls.DataFieldValue);
                                }
                                break;
                            case DataTypes.Bool:
                                if (MyControls.DataFieldValue.ToString().ToLower() == "true" || MyControls.DataFieldValue.ToString().ToLower() == "false")
                                {
                                    fieldlist += String.Format(" `{0}`", MyControls.DataFieldName);
                                    valuelist += String.Format(" {0} ", MyControls.DataFieldValue);
                                }
                                else
                                {
                                    fieldlist += String.Format(" `{0}`", MyControls.DataFieldName);
                                    valuelist += String.Format("{0}", "false");
                                }
                                break;
                            case DataTypes.DateTime:
                                if (MyControls.DataFieldValue == null || MyControls.DataFieldValue.ToString() == "")
                                {
                                    fieldlist += String.Format(" `{0}`", MyControls.DataFieldName);
                                    valuelist += String.Format(" '{0}' ", (FullDate ? DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") : DateTime.Now.ToString("yyyy-MM-dd")));
                                }
                                else
                                {
                                    fieldlist += String.Format(" `{0}`", MyControls.DataFieldName);
                                    valuelist += String.Format(" '{0}' ", (FullDate ? DateTime.Parse(MyControls.DataFieldValue).ToString("yyyy-MM-dd HH:mm:ss") : DateTime.Parse(MyControls.DataFieldValue).ToString("yyyy-MM-dd")));
                                }
                                break;
                            case DataTypes.File:
                                string DirName = ((ASP.controls_cmstrfileuploadrcontrol_ascx)MyControls).SaveDirectory; //;"usersImages";
                                int size = 0;
                                string myfile = MapPath(MyControls.DataFieldValue);
                                if (!File.Exists(myfile.Replace("tempFile", DirName)))
                                {
                                    while (File.Exists(myfile))
                                    {
                                        File.Copy(myfile, myfile.Replace("tempFile", DirName), true);
                                        size++;
                                        myfile = myfile.Replace("_size" + (size - 1), "_size" + size);
                                    }
                                    fieldlist += String.Format(" `{0}`", MyControls.DataFieldName);
                                    valuelist += String.Format(" '{0}' ", MyControls.DataFieldValue.Replace("'", "''").Replace("tempFile", DirName));
                                }
                                else
                                {
                                    fieldlist = fieldlist.Remove(sql.Length - 1);
                                    valuelist = valuelist.Remove(sql.Length - 1);
                                }
                                break;
                        }
                    }
                }
            }
            //set order
            if (hasOrder == true && orderField != "")
            {
                fieldlist += ",";
                valuelist += ",";
                fieldlist += String.Format(" `{0}`", orderField);
                valuelist += String.Format(" {0} ", "1");
            }
            sql += String.Format(" ({0}) Values ({1})", fieldlist, valuelist);
        }
        #endregion
        using (MySqlConnection conn = new MySqlConnection(siteDefaults.ConnStr))
        {
            conn.Open();
            if (formStatus == Status.Insert)
            {
                if (hasOrder == true && orderField != "")
                {
                    string sqlOrder = String.Format("Update  {0} Set {1}={1}+1  {2}", tableName, orderField, OrderQuery);
                    MySqlCommand cmdOrder = new MySqlCommand(sqlOrder, conn);
                    cmdOrder.ExecuteNonQuery();
                }
            }
            MySqlCommand cmd = new MySqlCommand(sql, conn);
            if (formStatus != Status.Cancel)
            {
                // mark out the outputdown
               // MymsgLabel.Text = cmd.CommandText;
                cmd.ExecuteNonQuery();
            }
            if (formStatus == Status.Insert)
            {
                //gets the new User's ID
                cmd.CommandText = "SELECT last_insert_id() AS NewUserID";
                MySqlDataReader MyReader;
                MyReader = cmd.ExecuteReader();
                if (MyReader.Read())
                {
                    //sends the new user's ID with the event showing it was inserted
                    if (MyReader["NewUserID"].ToString() != "" && MyReader["NewUserID"].ToString() != "0")
                    {
                        ItemInserted(MyReader["NewUserID"].ToString());
                    }
                }
                MyReader.Close();
                conn.Close();
            }
            if (closeFancy)
            {
                string _js = "parent.$.fancybox.close();";
                Page.ClientScript.RegisterStartupScript(GetType(), "close", _js, true);
            }
        }
        if (formStatus == Status.Update)
        {
            ItemUpdated(dataKeyFieldValue.ToString());
        }
        if (formStatus == Status.Insert)
        {
            if (!closeFancy && isInsertRedirect)
            {
                Response.Redirect(BackURL);
            }
        }
        else
        {
            MymsgLabel.Text = UpdateMessage; 
        }
        if (formStatus == Status.Cancel)
        {
            Response.Redirect(BackURL);
        }
    }
    protected void SaveAndBack(object sender, EventArgs e)
    {
        doClick(sender, e);
        Response.Redirect(BackURL);
    }
    protected string getUpdateString()
    {
        string sql = "";
        return sql;
    }
    public class MessageContainer : Control, INamingContainer
    {
    }
    protected void DummyItemInserted(string str)
    {
    }
    protected string DummyItemInserting()
    {
        return "insert";
    }
    public override Control FindControl(string controlName)
    {
        Control MyControl = new Control();
        MyControl = PlaceHolder1.Controls[0].FindControl(controlName);
        return MyControl;
    }
}