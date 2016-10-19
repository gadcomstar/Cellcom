using System;
using System.Collections.Generic;
using System.Web;
using MySql.Data.MySqlClient;
using System.Collections;
using System.Drawing;
using System.Web.UI.WebControls;
using System.Web.UI;
using EeekSoft.Web.Controls;

/// <summary>
/// Summary description for GridViewTemplate1
/// </summary>
public class GridViewTemplate1 : ITemplate
{
	//this code was by insparation from : http://beta.codeproject.com/KB/aspnet/create_template_columns.aspx
	private string ConnStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
	MySqlDataReader MyReader = null;
	//A variable to hold the type of ListItemType.
	String _templateType;
	//A variable to hold the column name.
	string _columnName;

	//A variable to hold the max length of the field
	int _maxTextLength;
	string _TblName;
	string customField = "";
	string replaceField = "";
    string _title = "";
	//Constructor where we define the template type and column name.
	public GridViewTemplate1(string type, string colname, string CustomField, string ReplaceField, string TblName, int MaxTextLength)
	{
		//Stores the template type.
		_templateType = type;
		//Stores the column name.
		_columnName = colname.Replace("|",",");
		if (_columnName.ToLower().Contains(" as "))
		{
			_columnName = _columnName.Remove(0,_columnName.ToLower().LastIndexOf(" as ")+4);
		}
		_maxTextLength = MaxTextLength;
		_TblName = TblName;
		customField = CustomField;
		replaceField = ReplaceField;
	}
    public GridViewTemplate1(string type, string colname, string CustomField, string ReplaceField, string TblName, int MaxTextLength, string title)
    {
        //Stores the template type.
        _templateType = type;
        //Stores the column name.
        _columnName = colname.Replace("|", ",");
        if (_columnName.ToLower().Contains(" as "))
        {
            _columnName = _columnName.Remove(0, _columnName.ToLower().LastIndexOf(" as ") + 4);
        }
        _maxTextLength = MaxTextLength;

        _TblName = TblName;
        customField = CustomField;
        replaceField = ReplaceField;
        _title = title;
    }
	void ITemplate.InstantiateIn(System.Web.UI.Control container)
	{
		switch (_templateType)
		{
			case "TextAreaItem":
				Label tb1 = new Label();                            //Allocates the new text box object.
				tb1.DataBinding += new EventHandler(tb1_DataBinding);   //Attaches the data binding event.
				container.Controls.Add(tb1);                            //Adds the newly created textbox to the container.
				break;

			case "OrderItem":
				ImageButton orderBtnUp = new ImageButton();
				orderBtnUp.ImageUrl = "images/up.gif";
				orderBtnUp.DataBinding += new EventHandler(orderBtnUp_DataBinding);
				container.Controls.Add(orderBtnUp);

				ImageButton orderBtnDn = new ImageButton();
				orderBtnDn.ImageUrl = "images/dn.gif";
				orderBtnDn.DataBinding += new EventHandler(orderBtnDn_DataBinding);
				container.Controls.Add(orderBtnDn);
				Label OrderNum = new Label();
				OrderNum.DataBinding += new EventHandler(orderNum_DataBinding);
				break;

            case "ShowItem":
                Literal showShowItem = new Literal();
                showShowItem.ID = "ShowLiteral";
                container.Controls.Add(showShowItem);
                break;

			case "DelItem":
				LinkButton DelBtn = new LinkButton ();
				if (customField != "")
				{
					DelBtn.Text = "<img src=\""+customField+"\" style=\"border:none;\">";
				}
				else
					DelBtn.Text = "<img src=\"images/DelOn.png\" style=\"border:none;\" alt=\"" + Languages2.MyText("general_Delete") + "\" title=\"" + Languages2.MyText("general_Delete") + "\" >";
				DelBtn.DataBinding += new EventHandler(DelBtn_DataBinding);
				container.Controls.Add(DelBtn);
				break;


			case "EditItem":
				HyperLink EditBtn = new HyperLink();
                EditBtn.CssClass = "EditUserFancyClass";
                if (_title != "")
                { }
                else
                {
                    _title = Languages2.MyText("general_Edit");
                }
                EditBtn.Text = "<img src=\"images/EditOff.png\" style=\"border:none; margin-right:10px;\" onmouseover=\"$(this).parent().parent().prev().children('.hideshowdivclass').show();this.src='images/EditOn.png'\" onmouseout=\"$(this).parent().parent().prev().children('.hideshowdivclass').hide();this.src='images/EditOff.png'\" alt=\"" + Languages2.MyText("general_Edit") + "\" title=\"" + _title + "\">";
				EditBtn.DataBinding += new EventHandler(EditBtn_DataBinding);
                ((TableCell)container).Style["width"] = "30px";
				container.Controls.Add(EditBtn);
				break;


			case "CheckBox":
				GraphicalCheckBox CheckBox = new GraphicalCheckBox();
				Panel checkPanel = new Panel();
				if (replaceField != "")
				{
					CheckBox.CheckedImg = replaceField;
				}
				else
				{
					CheckBox.CheckedImg = "images/SelectOn.png";
				}
				CheckBox.UncheckedImg = "images/SelectOff.png";
				CheckBox.Font.Size = FontUnit.Parse("100%");
				CheckBox.Title = Languages2.MyText("general_Select");
				CheckBox.DataBinding += new EventHandler(CheckBox_DataBinding);
				
				checkPanel.PreRender += checkPanel_PreRender;
				checkPanel.Controls.Add(CheckBox);
				container.Controls.Add(checkPanel);
				break;

			case "CheckFooter":
				Label CheckAllLbl = new Label();
				string CheckImg = "images/SelectOn.png";
				if (replaceField != "")
				{
					CheckImg = replaceField;
				}

				CheckAllLbl.Text = "<img src=\"" + CheckImg + "\" style=\"vertical-align:middle\" alt=\"" + Languages2.MyText("general_Select All") + "\" onclick=\"javascript:checkAll()\"> " + Languages2.MyText("general_Select All") + "";
				container.Controls.Add(CheckAllLbl);

				Label unCheckAllLbl = new Label();
				unCheckAllLbl.Text = "&nbsp;<img src=\"images/SelectOff.png\" style=\"vertical-align:middle\" alt=\""+Languages2.MyText("general_Clear All")+"\" onclick=\"javascript:uncheckAll()\"> "+Languages2.MyText("general_Clear All")+"";
				container.Controls.Add(unCheckAllLbl);
				break;


			case "Header":
				LinkButton HeaderBtn = new LinkButton();
				
				TextBox WidthHid = new TextBox();
				WidthHid.CssClass = "tableHid tableHid" + customField.Replace("`", "");
				WidthHid.Style["display"]="none";
				container.Controls.Add(WidthHid);


				HeaderBtn.Font.Underline = false;
				HeaderBtn.ForeColor = System.Drawing.Color.White;
				HeaderBtn.CommandArgument = customField;
				HeaderBtn.Command += HeaderBtn_Click;
				HeaderBtn.Text = "&nbsp;&nbsp;" + _columnName + "&nbsp;&nbsp;";

				((TableCell)container).CssClass = "resizeable cell" + customField.Replace("`", "");
				HeaderBtn.CssClass = "cellLbl cellLbl" + customField.Replace("`", "").Trim();
				HeaderBtn.Style["display"] = "block";
				HeaderBtn.Style["overflow"] = "hidden";

				container.Controls.Add(HeaderBtn);
				break;

		}
	}

	public delegate void HeaderBtnDelegate(string HeaderCol);
	public event HeaderBtnDelegate HeaderBtnClick;
	void HeaderBtn_Click(object sender, CommandEventArgs e)
	{
		HeaderBtnClick(e.CommandArgument.ToString());
	}


	/// <summary>
	/// This is the event, which will be raised when the binding happens.
	/// </summary>
	/// <param name="sender"></param>
	/// <param name="e"></param>
	void tb1_DataBinding(object sender, EventArgs e)
	{
		Label txtdata = (Label)sender;
		((TableCell)txtdata.Parent).CssClass = "resizeable cell" + _columnName.Replace("`", "");
		txtdata.CssClass = "cellLbl cellLbl" + _columnName.Replace("`", "").Trim();
		txtdata.Style["display"] = "block";
		txtdata.Style["overflow"] = "hidden";
		GridViewRow container = (GridViewRow)txtdata.NamingContainer;
		if (DataBinder.Eval(container.DataItem, _columnName.Replace("`", "")) != DBNull.Value)
		{
			txtdata.Text = DataBinder.Eval(container.DataItem, _columnName.Replace("`", "")).ToString().Replace(" 00:00:00", "");
		}

		//Shortens the text in the case maxLength was set, and shows the full text in a tooltip
		if (_maxTextLength != 0 && txtdata.Text.Length > _maxTextLength)
		{
			if (customField == "" && !txtdata.Text.StartsWith("<"))
			{
				txtdata.ToolTip = txtdata.Text.Replace("'","&quot;");
				//txtdata.Text = txtdata.Text.Substring(0, _maxTextLength) + "...";
			}
		}

		//makes the adjustment if this field should be customized
		if (customField != "")
		{
			txtdata.Text = string.Format(customField, txtdata.Text);
		}

		if (replaceField != "")
		{
			string[] replaceList = replaceField.Split('|');
			foreach (string rep in replaceList)
			{
				string repSource = "";
				string repTarget = "";

				repSource = rep.Substring(0, rep.IndexOf('='));
				repTarget = rep.Substring(rep.IndexOf('=') + 1);

				if (repTarget.Contains("Languages2:"))
				{
					repTarget = Languages2.MyText(repTarget.Replace("Languages2:", ""));
				}

				if (txtdata.Text == repSource)
				{
					txtdata.Text = repTarget;
				}
			}
		}
		else
		{
			txtdata.Text = txtdata.Text;
		}
	}
	/// <summary>
	/// This is the event what will be raised when the binding to the up button happens.
	/// </summary>
	/// <param name="sender"></param>
	/// <param name="e"></param>
	void orderBtnUp_DataBinding(object sender, EventArgs e)
	{
		ImageButton txtdata = (ImageButton)sender;
		GridViewRow container = (GridViewRow)txtdata.NamingContainer;
        if (container.RowIndex > 0)
        {

            if (DataBinder.Eval(container.DataItem, _columnName.Replace("`", "")) != DBNull.Value)
            {
                txtdata.CommandArgument = _TblName + "_" + _columnName + "_" + DataBinder.Eval(container.DataItem, _columnName).ToString() + "_" + DataBinder.Eval(container.DataItem, customField.Replace("`", "")).ToString();
                txtdata.Command += orderBtnUp_Click;
                txtdata.ID = "up" + DataBinder.Eval(container.DataItem, _columnName).ToString();
            }
        }
        else
        {
            ((ImageButton)sender).Visible = false;
        }
	}
	void orderNum_DataBinding(object sender, EventArgs e)
		{
			Label txtdata = (Label)sender;
			GridViewRow container = (GridViewRow)txtdata.NamingContainer;
			if (DataBinder.Eval(container.DataItem, _columnName) != DBNull.Value)
			{
				txtdata.Text = DataBinder.Eval(container.DataItem, _columnName).ToString();
			}
		}

	/// <summary>
	/// This is the event that will be raised when the binding to the down button happens.
	/// </summary>
	/// <param name="sender"></param>
	/// <param name="e"></param>
	void orderBtnDn_DataBinding(object sender, EventArgs e)
	{
		ImageButton txtdata = (ImageButton)sender;
		GridViewRow container = (GridViewRow)txtdata.NamingContainer;
		if (DataBinder.Eval(container.DataItem, _columnName) != DBNull.Value)
		{
			txtdata.CommandArgument = _TblName + "_" + _columnName + "_" + DataBinder.Eval(container.DataItem, _columnName).ToString() + "_" + DataBinder.Eval(container.DataItem, customField.Replace("`", "")).ToString();
			txtdata.Command += orderBtnDn_Click;
			txtdata.ID = "dn" + DataBinder.Eval(container.DataItem, _columnName).ToString();
		}
	}
    void ShowLt_DataBinding(object sender, EventArgs e)
	{
        Literal txtdata = (Literal)sender;
		GridViewRow container = (GridViewRow)txtdata.NamingContainer;
        if (DataBinder.Eval(container.DataItem, _columnName.Replace("`", "")) != DBNull.Value)
        {
            txtdata.ID = "showDivLit" + _columnName;
            txtdata.Text = "<div id=\"" + "showDiv" + _columnName + "\"></div>";
        }
	}
	/// <summary>
	/// This is the event that will be raised when the binding to the del button happens.
	/// </summary>
	/// <param name="sender"></param>
	/// <param name="e"></param>
	void DelBtn_DataBinding(object sender, EventArgs e)
	{
		LinkButton txtdata = (LinkButton)sender;
		GridViewRow container = (GridViewRow)txtdata.NamingContainer;
		if (DataBinder.Eval(container.DataItem, _columnName.Replace("`", "")) != DBNull.Value)
		{
			txtdata.CommandArgument = _TblName + "_" + _columnName + "_" + DataBinder.Eval(container.DataItem, _columnName.Replace("`", "")).ToString() + "_" + DataBinder.Eval(container.DataItem, _columnName.Replace("`", "")).ToString();
			txtdata.Command += DelBtnDn_Click;
			if(replaceField!="")
				txtdata.OnClientClick = "javascript:return confirm('"+replaceField+"')";
			else
				txtdata.OnClientClick = "javascript:return confirm('"+Languages2.MyText("general_Are you sure you want to delete this entry?")+"')";
			
			txtdata.ID = "del" + DataBinder.Eval(container.DataItem, _columnName.Replace("`", "")).ToString();
		}
	}
	/// <summary>
	/// This is the event that will be raised when the binding to the Edit button happens.
	/// </summary>
	/// <param name="sender"></param>
	/// <param name="e"></param>
	void EditBtn_DataBinding(object sender, EventArgs e)
	{
		HyperLink txtdata = (HyperLink)sender;
		GridViewRow container = (GridViewRow)txtdata.NamingContainer;
		if (DataBinder.Eval(container.DataItem, _columnName.Replace("`", "")) != DBNull.Value)
		{		
			txtdata.NavigateUrl = replaceField.Replace("{table}", _TblName).Replace("{field}", DataBinder.Eval(container.DataItem, customField.Replace("`", "")).ToString());
			txtdata.ID = "Edit" + DataBinder.Eval(container.DataItem, _columnName.Replace("`", "")).ToString();
		}
	}
/// <summary>
	/// This is the event that will be raised when the binding to the checkbox button happens.
	/// </summary>
	/// <param name="sender"></param>
	/// <param name="e"></param>
	void CheckBox_DataBinding(object sender, EventArgs e)
	{
		GraphicalCheckBox txtdata = (GraphicalCheckBox)sender;
		GridViewRow container = (GridViewRow)txtdata.NamingContainer;
		if (DataBinder.Eval(container.DataItem, _columnName.Replace("`","")) != DBNull.Value)
		{
			txtdata.EnableViewState = false;
			txtdata.ID = "Check" + DataBinder.Eval(container.DataItem, _columnName.Replace("`", "")).ToString();
		}
	}
	void checkPanel_PreRender(object sender, EventArgs e)
	{
		((Panel)sender).Attributes.Add("onclick", "unMarkAllPages('" + ((Panel)sender).NamingContainer.NamingContainer.NamingContainer.ClientID + "'); ");
	}
	public delegate void OrderChanged(string Table_Field_Order_KeyName);
	public event OrderChanged UpClick;
	protected void orderBtnUp_Click(object sender, CommandEventArgs e)
	{		
		UpClick(e.CommandArgument.ToString());
	}
	public event OrderChanged DnClick;
	protected void orderBtnDn_Click(object sender, CommandEventArgs e)
	{
		DnClick(e.CommandArgument.ToString());
	}
	public event OrderChanged DelClick;
	protected void DelBtnDn_Click(object sender, CommandEventArgs e)
	{
		DelClick(e.CommandArgument.ToString());
	}	
	public event OrderChanged EditClick;
	protected void EditBtnDn_Click(object sender, CommandEventArgs e)
	{
		EditClick(e.CommandArgument.ToString());
	}
}