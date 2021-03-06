﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using System.Collections;
using System.IO;
using System.Text;
using System.Web.UI.HtmlControls;
using SD = System.Drawing;
using System.Drawing.Imaging;
using System.Drawing.Drawing2D;

public partial class FormViewControl13 : System.Web.UI.UserControl
{
    Panel fileLoadPanel = new Panel();
	public delegate void InsertedDelegate(string NewUserID);
	public event InsertedDelegate ItemInserted;

	public delegate void UpdatedDelegate(string UserID);
	public event UpdatedDelegate ItemUpdated;
	
	private string ConnStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
	MySqlDataReader MyReader = null;

	//private static ArrayList FileControls = new ArrayList();
	
	
	public enum FormViewActionTypes
	{
		Insert=1,
		Edit=2,
		Search=3,
		SuperSearch=4
	}
	private string delCommand = "";
	private string formViewTitle = "";
	private string tblName = "";
	private string[] tblHeaderNames = { };
	private string[] sqlFieldNames = { };
	private string[] sqlFieldType = { };
	private string[] sqlOptions = { };
	string[] replaceField = { };
    string[] remarks = { };
    string[] sqlRegEx = { };
    string[] sqlReqFeild = { };
	string[] sqlNoDuplicateFieldID = { };
	private string sqlWhereQuery = "";
	private string returnURL = "";
	string idField = "";
	string idValue = "";
	string sql = "";
	private bool isControlDisabled = false;
    //private bool showSaveReturnButton = true;
    string searchRedirectUrl = "";
	//private bool showBar = true;


	public string SqlNoDuplicateFieldID
	{
		get { return string.Join(",", sqlNoDuplicateFieldID); }
		set { sqlNoDuplicateFieldID = value.Split(','); }
	}

	public bool IsControlDisabled
	{
		get { return isControlDisabled; }
		set {  isControlDisabled = value ;}
	}
	
	public string SqlRegEx
	{
		get { return string.Join(",", sqlRegEx); }
		set { sqlRegEx = value.Split(','); }
	}

    public string SqlReqFeild
    {
        get { return string.Join(",", sqlReqFeild); }
        set { sqlReqFeild = value.Split(','); }
    }

	private FormViewActionTypes formViewAction;
	public FormViewActionTypes FormViewAction
	{
		get { return formViewAction; }
		set { formViewAction = value; }
	}
	public string OutputSql
	{
		get { return sql; }
		set { sql = value; }
	}
	public string DelCommand
	{
		get { return delCommand; }
		set { delCommand = value; }
	}


	public string FormViewTitle
	{
		get { return formViewTitle; }
		set { formViewTitle = value; }
	}

	public string ReturnURL
	{
		get { return returnURL; }
		set { returnURL = value; }
	}

	public string SearchRedirectUrl
	{
		get { return searchRedirectUrl; }
		set { searchRedirectUrl = value; }
	}

	public string SqlFieldType
	{
		get { return string.Join(",", sqlFieldType); }
		set { sqlFieldType = value.Split(','); }
	}

	public string SqlOptions
	{
		get { return string.Join(",", sqlOptions); }
		set { sqlOptions = value.Split(','); }
	}

	public string ReplaceField
	{
		get { return string.Join(",", replaceField); }
		set { replaceField = value.Split(','); }
	}

	public string SqlWhereQuery
	{
		get { return sqlWhereQuery; }
		set { sqlWhereQuery = value; }
	}

	public string TblName
	{
		get { return tblName; }
		set { tblName = value; }
	}

	public string TblHeaderNames
	{
		get { return string.Join(",", tblHeaderNames); }
		set { tblHeaderNames = value.Split(','); }
	}

	public string SqlFieldNames
	{
		get { return string.Join(",", sqlFieldNames); }
		set { sqlFieldNames = value.Split(','); }
	}
	/// <summary>
	//     Gets or sets an array that contains the names of the primary key fields for
	//     the items displayed in a System.Web.UI.WebControls.GridView control.
	//
	// Returns:
	//     An array that contains the names of the primary key fields for the items
	//     displayed in a System.Web.UI.WebControls.GridView control.
	/// </summary>
	public string IdField
	{
		get { return idField; }
		set { idField = value; }
	}

    public string IdValue
	{
		get { return idValue; }
		set { idValue = value; }
	}

	protected void Page_Load(object sender, EventArgs e)
	{
		CreateFormView();
		FormTitleLit.Text = formViewTitle;

        tblUserCats1Cell.Attributes.Add("onclick", "ShowHide('" + tblUserCats1.ClientID + "', this)");
	}


	protected void CreateFormView()
	{
		string selWhat = IdField;
		for (int i = 0; i < sqlFieldNames.Length; i++)
		{
			if (sqlFieldNames[i].Trim() != "")
			{
				if(selWhat!="")
				{
					selWhat += ",";
				}
				selWhat += sqlFieldNames[i].ToString().Trim();
			}
		}
		sql = "SELECT " + selWhat + " FROM " + tblName;
		if (SqlWhereQuery != "")
		{
			sql += " WHERE " + SqlWhereQuery;
			if (IdField != "" && IdValue != "")
			{
				sql += " AND " + IdField + "=" + IdValue;
			}
		}
		else 
		{
			if (IdField != "" && IdValue != "")
			{
				sql += " WHERE " + IdField+"="+IdValue;
			}
		}


		using (MySqlConnection con = new MySqlConnection(ConnStr))
		{
			con.Open();
			MySqlCommand cmd = new MySqlCommand(sql, con);
			
			MyReader = cmd.ExecuteReader();
			

			if (formViewAction == FormViewActionTypes.Insert || formViewAction == FormViewActionTypes.Search || (MyReader.Read() && (formViewAction == FormViewActionTypes.Edit || formViewAction == FormViewActionTypes.SuperSearch)))
			{
				int TabNum = 2;
				for (int pos = 0; pos < sqlFieldNames.Length; pos++)
				{
					TableCell catName = new TableCell();
					TableCell catValue = new TableCell();
					TableRow catRow = new TableRow();
					catName.VerticalAlign = VerticalAlign.Top;
					catName.CssClass = "ltrLeft";

					if (tblHeaderNames.Length >= pos)
					{
						string HeaderText = tblHeaderNames[pos];
						
						catName.Text = HeaderText;
					}
					if (sqlFieldType.Length >= pos)
					{
						switch (sqlFieldType[pos].ToString()) // check if the the kind of the field
						{
							case "1"://the filed id a textbox
								TextBox txtbox = new TextBox();
								if (isControlDisabled)
								{
									txtbox.Enabled = false;
								}
								TableCell ValidatorCell = new TableCell();
								HiddenField NoDuplHid = new HiddenField();
								txtbox.ID = sqlFieldNames[pos];
								txtbox.CssClass = "textbox";

								NoDuplHid.ID = txtbox.ID + "Old";
								NoDuplHid.Value = "";
								NoDuplHid.EnableViewState = true;
								ValidatorCell.Controls.Add(NoDuplHid);

								if (formViewAction == FormViewActionTypes.Edit)
								{
									txtbox.Text = MyReader[sqlFieldNames[pos].ToString().Replace("`","")].ToString();
									NoDuplHid.Value = txtbox.Text;
								}
								if (replaceField.Length != 0)
								{
									foreach (string nameVal in replaceField)
									{
										string[] nameValArr = nameVal.Split('=');
										if (nameValArr[0] == sqlFieldNames[pos].Replace("`", ""))
										{
											txtbox.Text = nameValArr[1];
										}
									}
								}
								catValue.Controls.Add(txtbox);
								
								catValue.CssClass = "textbox";

								if (sqlRegEx.Length > pos)
								{
									if (sqlRegEx[pos] != "")
									{
										RegularExpressionValidator RegExVal = new RegularExpressionValidator();
                                        RegExVal.ToolTip = "המידע בתא זה אינו חוקי";
										RegExVal.EnableClientScript = true;
										RegExVal.Text = "*";
										RegExVal.ValidationExpression = sqlRegEx[pos];
										RegExVal.ControlToValidate = sqlFieldNames[pos];
										RegExVal.Display = ValidatorDisplay.Dynamic;
										
										
										ValidatorCell.Controls.Add(RegExVal);
									}
								}

								catRow.Cells.Add(catName);
								catRow.Cells.Add(catValue);
								catRow.Cells.Add(ValidatorCell);
								break;
							case "2"://the field is a selectbox
								RadioButtonList radio = new RadioButtonList();
								if (isControlDisabled)
								{
									radio.Enabled = false;
								}
								radio.RepeatDirection = RepeatDirection.Horizontal;
								radio.ID = sqlFieldNames[pos];
								ListItem opt1 = new ListItem();
                                opt1.Text = "כן";
								opt1.Value = "1";
								ListItem opt2 = new ListItem();
								opt2.Text = "לא";
								opt2.Value = "0";
								using (MySqlConnection con2 = new MySqlConnection(ConnStr))
								{
									if (formViewAction == FormViewActionTypes.Edit)
									{
										if (MyReader[sqlFieldNames[pos].ToString().Replace("`", "")].ToString().ToLower() == "true") { opt1.Selected = true; }
										else { opt2.Selected = true; }
									}
									else if(formViewAction == FormViewActionTypes.Insert)
									{
										opt2.Selected = true;
									}
									if (replaceField.Length != 0)
									{
										foreach (string nameVal in replaceField)
										{
											string[] nameValArr = nameVal.Split('=');
											if (nameValArr[0] == sqlFieldNames[pos].Replace("`", ""))
											{
												if ( nameValArr[1]== "1") { opt1.Selected = true; }
												else { opt2.Selected = true; }
											}
										}
									}
								}
								radio.Items.Add(opt1);
								radio.Items.Add(opt2);
								catValue.Controls.Add(radio);

								catRow.Cells.Add(catName);
								catRow.Cells.Add(catValue);
								break;
							case "3":
								DropDownList drop = new DropDownList();
								if (isControlDisabled)
								{
									drop.Enabled = false;
								}
								if (formViewAction != FormViewActionTypes.Search && formViewAction != FormViewActionTypes.SuperSearch)
								{
									drop.ID = sqlFieldNames[pos];
								}
								else
								{
									drop.ID = "Select" + sqlFieldNames[pos];
								}
								drop.CssClass = "selectBox";
								catValue.CssClass = "selectBox";
								string[] options = {};
								if(sqlOptions.Length>=pos)
								options = sqlOptions[pos].Split('|');

								if (formViewAction == FormViewActionTypes.Search || formViewAction == FormViewActionTypes.SuperSearch)
								{
									ListItem optEmpty = new ListItem("", "");
									drop.Items.Add(optEmpty);
								}

								int i = 1;
                                foreach (string str in options)
                                {
                                    if (str.Contains("~"))
                                    {
                                        string[] strarr = str.Split('~');
                                        string optValuesText = strarr[0];
                                        string optValuesValue = strarr[1];
                                        ListItem opt = new ListItem(optValuesText, optValuesValue);
                                        drop.Items.Add(opt);
                                        i++;
                                    }
                                    else
                                    {
                                        string optValuesText = str;
                                        ListItem opt = new ListItem(optValuesText, i.ToString());
                                        drop.Items.Add(opt);
                                        i++;
                                    }
                                }


								if (formViewAction == FormViewActionTypes.Edit)
									{
										drop.SelectedValue = MyReader[sqlFieldNames[pos].ToString().Replace("`", "")].ToString();
									}
								if (replaceField.Length != 0)
								{
									foreach (string nameVal in replaceField)
									{
										string[] nameValArr = nameVal.Split('=');
										if (nameValArr[0] == sqlFieldNames[pos].Replace("`", "") || nameValArr[0] == "Select" + sqlFieldNames[pos].Replace("`", ""))
										{
											drop.SelectedValue = nameValArr[1];
										}
									}
								}
								catValue.Controls.Add(drop);

								catRow.Cells.Add(catName);
								catRow.Cells.Add(catValue);
								break;
							case "4":
								catName.Text = "<hr />";
								catName.ColumnSpan = 5;

								catRow.Cells.Add(catName);
								break;
							case "5":
								TableCell TabsCell = new TableCell();
								TableCell SeperatorCell = new TableCell();
								SeperatorCell.Text = "<img src=\"images/EnterTableTopLine.gif\" alt=\"\" />";
								Label TabLabel = new Label();
								TabLabel.Text = "<div>&nbsp;&nbsp;" + catName.Text + "&nbsp;&nbsp;</div>";
								TabsCell.Attributes.Add("onclick", "ShowHide('tblUserCats" + TabNum.ToString() + "', this)");
								TabsCell.CssClass = "EnterTableTop";
								TabsCell.Controls.Add(TabLabel);
								TabsRow.Cells.Add(SeperatorCell);
								TabsRow.Cells.Add(TabsCell);

								catName.Text = "</td></tr></table><table id=\"tblUserCats" + TabNum.ToString() + "\" style=\"display:none; margin:auto;\"><tr><td>";
								TabNum++;
								catName.ColumnSpan = 2;

								catRow.Cells.Add(catName);
								break;
							case "6":
								if (formViewAction != FormViewActionTypes.Search && formViewAction != FormViewActionTypes.SuperSearch)
								{
									TextBox calSerialTxtBox = new TextBox();
									if (isControlDisabled)
									{
										calSerialTxtBox.Enabled = false;
									}
									calSerialTxtBox.ID = "Date" + sqlFieldNames[pos];
									calSerialTxtBox.CssClass = "textbox";
									catValue.CssClass = "textbox";


									if (formViewAction == FormViewActionTypes.Edit)
									{
										DateTime thedate = new DateTime();
										if (DateTime.TryParse(MyReader[sqlFieldNames[pos].ToString().Replace("`", "")].ToString(), out thedate))
										{
											calSerialTxtBox.Text = thedate.ToString("dd/MM/yyyy");
										}
									}
									catValue.Controls.Add(calSerialTxtBox);

									RegularExpressionValidator calValidator = new RegularExpressionValidator();
									calValidator.ControlToValidate = "Date" + sqlFieldNames[pos];
									calValidator.ValidationExpression = @"^(((0[1-9]|[12]\d|3[01])\/(0[13578]|1[02])\/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)\/(0[13456789]|1[012])\/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])\/02\/((19|[2-9]\d)\d{2}))|(29\/02\/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$";
									calValidator.Text = "<span style=\"text-decoration:italic; cursor:pointer;\" title=\"תא זה יכול להכיל תאריכים בלבד\">*</span>";
									calValidator.SetFocusOnError = true;
									TableCell calValCell = new TableCell();
									calValCell.Controls.Add(calValidator);

									TableCell dateCalSerial = new TableCell();

									AjaxControlToolkit.CalendarExtender CalExt = new AjaxControlToolkit.CalendarExtender();
									CalExt.TargetControlID = calSerialTxtBox.ID;
									CalExt.FirstDayOfWeek = FirstDayOfWeek.Sunday;
									CalExt.Format = "dd/MM/yyyy";

									dateCalSerial.Controls.Add(CalExt);

									catRow.Cells.Add(catName);
									catRow.Cells.Add(catValue);
									catRow.Cells.Add(dateCalSerial);
									catRow.Cells.Add(calValCell);
								}
								else//if this is a search/supersearch
								{
									TextBox fromCalSerialTxtBox = new TextBox();
									if (isControlDisabled)
									{
										fromCalSerialTxtBox.Enabled = false;
									}
									fromCalSerialTxtBox.ID = "DateFrom" + sqlFieldNames[pos];
									fromCalSerialTxtBox.CssClass = "textbox";
									catValue.CssClass = "textbox";
									catValue.Controls.Add(fromCalSerialTxtBox);
									TableCell toLabelcell = new TableCell();
                                    toLabelcell.Text = "עד";
									TableCell toCatValue = new TableCell();
									TextBox toCalSerialTxtBox = new TextBox();
									toCalSerialTxtBox.ID = "DateTo" + sqlFieldNames[pos];
									toCalSerialTxtBox.CssClass = "textbox";
									toCatValue.CssClass = "textbox";
									if (replaceField.Length != 0)
									{
										foreach (string nameVal in replaceField)
										{
											string[] nameValArr = nameVal.Split('=');
											if (nameValArr[0] == "DateFrom" + sqlFieldNames[pos].Replace("`", ""))
											{
												DateTime thedate = new DateTime();
												if (DateTime.TryParse(nameValArr[1], out thedate))
												{
													fromCalSerialTxtBox.Text = thedate.ToString("dd/MM/yyyy");
												}
											}
											if (nameValArr[0] == "DateTo" + sqlFieldNames[pos].Replace("`", ""))
											{
												DateTime thedate = new DateTime();
												if (DateTime.TryParse(nameValArr[1], out thedate))
												{
													toCalSerialTxtBox.Text = thedate.ToString("dd/MM/yyyy");
												}
											}

										}
									}
									toCatValue.Controls.Add(toCalSerialTxtBox);

									RegularExpressionValidator fromCalValidator = new RegularExpressionValidator();
									fromCalValidator.ControlToValidate = "DateFrom" + sqlFieldNames[pos];
									fromCalValidator.ValidationExpression = @"^(((0[1-9]|[12]\d|3[01])\/(0[13578]|1[02])\/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)\/(0[13456789]|1[012])\/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])\/02\/((19|[2-9]\d)\d{2}))|(29\/02\/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$";
									fromCalValidator.Text = "<span style=\"text-decoration:italic; cursor:pointer;\" title=\"תא זה יכול להכיל תאריכים בלבד\">*</span>";
									fromCalValidator.SetFocusOnError = true;
									catValue.Controls.Add(fromCalValidator);

									
									AjaxControlToolkit.CalendarExtender fromCalExt = new AjaxControlToolkit.CalendarExtender();
									fromCalExt.TargetControlID = fromCalSerialTxtBox.ID;
									fromCalExt.FirstDayOfWeek = FirstDayOfWeek.Sunday;
									fromCalExt.Format = "dd/MM/yyyy";
									catValue.Controls.Add(fromCalExt);


									RegularExpressionValidator toCalValidator = new RegularExpressionValidator();
									toCalValidator.ControlToValidate = toCalSerialTxtBox.ID;
									toCalValidator.ValidationExpression = @"^(((0[1-9]|[12]\d|3[01])\/(0[13578]|1[02])\/((19|[2-9]\d)\d{2}))|((0[1-9]|[12]\d|30)\/(0[13456789]|1[012])\/((19|[2-9]\d)\d{2}))|((0[1-9]|1\d|2[0-8])\/02\/((19|[2-9]\d)\d{2}))|(29\/02\/((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))))$";
                                    toCalValidator.Text = "<span style=\"text-decoration:italic; cursor:pointer;\" title=\"תא זה יכול להכיל תאריכים בלבד\">*</span>";
									toCalValidator.SetFocusOnError = true;
									toCatValue.Controls.Add(toCalValidator);


									AjaxControlToolkit.CalendarExtender toCalExt = new AjaxControlToolkit.CalendarExtender();
									toCalExt.TargetControlID = toCalSerialTxtBox.ID;
									toCalExt.FirstDayOfWeek = FirstDayOfWeek.Sunday;
									toCalExt.Format = "dd/MM/yyyy";
									toCatValue.Controls.Add(toCalExt);
									catRow.Cells.Add(catName);
									catRow.Cells.Add(catValue);
									catRow.Cells.Add(toLabelcell);
									catRow.Cells.Add(toCatValue);
								}
								break;
							case "7":
								if (formViewAction == FormViewActionTypes.Search || formViewAction == FormViewActionTypes.SuperSearch)
								{
									TextBox Longtxtbox = new TextBox();
									if (isControlDisabled)
									{
										Longtxtbox.Enabled = false;
									}
									Longtxtbox.ID = sqlFieldNames[pos];
									Longtxtbox.CssClass = "textbox";

									if (replaceField.Length != 0)
									{
										foreach (string nameVal in replaceField)
										{
											string[] nameValArr = nameVal.Split('=');
											if (nameValArr[0] == "DateFrom" + sqlFieldNames[pos].Replace("`", ""))
											{
												Longtxtbox.Text = nameValArr[1];
											}
										}
									}
									catValue.Controls.Add(Longtxtbox);

									catValue.CssClass = "textbox";
									catRow.Cells.Add(catName);
									catRow.Cells.Add(catValue);
								}
								else
								{
									Table longTable = new Table();
									longTable.Font.Size = 1;
									longTable.CellPadding = 0;
									longTable.CellSpacing = 0;
									TableRow longTopRow = new TableRow();
									TableRow longMiddleRow = new TableRow();
									TableRow longButtomRow = new TableRow();
									TableCell longTopCell = new TableCell();
									TableCell longBottomCell = new TableCell();
									TableCell longRightCell = new TableCell();
									TableCell longLeftCell = new TableCell();
									TableCell longRTCell = new TableCell();
									TableCell longRBCell = new TableCell();
									TableCell longLTCell = new TableCell();
									TableCell longLBCell = new TableCell();
									TableCell longCell = new TableCell();
									longTable.Rows.Add(longTopRow);
									longTable.Rows.Add(longMiddleRow);
									longTable.Rows.Add(longButtomRow);
									longTopRow.Cells.Add(longRTCell);
									longTopRow.Cells.Add(longTopCell);
									longTopRow.Cells.Add(longLTCell);
									longMiddleRow.Cells.Add(longRightCell);
									longMiddleRow.Cells.Add(longCell);
									longMiddleRow.Cells.Add(longLeftCell);
									longButtomRow.Cells.Add(longRBCell);
									longButtomRow.Cells.Add(longBottomCell);
									longButtomRow.Cells.Add(longLBCell);

									longTopCell.Style.Add("background-image", "url(images/longTopCell.gif)");
									longTopCell.Style.Add("background-repeat", "repeat-x");
									longTopCell.Text = "&nbsp;";
									longTopCell.Height = 7;
									longBottomCell.Style.Add("background-image", "url(images/longBottomCell.gif)");
									longBottomCell.Style.Add("background-repeat", "repeat-x");
									longBottomCell.Text = "&nbsp;";
									longBottomCell.Height = 7;
									longRightCell.CssClass = "longLeft";
									longRightCell.Text = "&nbsp;";
									longRightCell.Width = 7;
									longLeftCell.CssClass = "longRight";
									longLeftCell.Text = "&nbsp;";
									longLeftCell.Width = 7;
									longRTCell.CssClass = "longLTCell";
									longRTCell.Text = "<div></div>";
									longRTCell.Height = 7;
									longRTCell.Width = 7;
									longRBCell.CssClass = "longLBCell";
									longRBCell.Text = "<div></div>";
									longRBCell.Height = 7;
									longRBCell.Width = 7;
									longLTCell.CssClass = "longRTCell";
									longLTCell.Text = "<div></div>";
									longLTCell.Height = 7;
									longLTCell.Width = 7;
									longLBCell.CssClass = "longRBCell";
									longLBCell.Text = "<div></div>";
									longLBCell.Height = 7;
									longLBCell.Width = 7;

									TextBox longtxtbox = new TextBox();
									if (isControlDisabled)
									{
										longtxtbox.Enabled = false;
									}
									longtxtbox.Style.Add("border", "none");
									longtxtbox.Style.Add("background", "transparent");
									longtxtbox.Columns = 40;
									longtxtbox.Rows = 10;
									longtxtbox.TextMode = TextBoxMode.MultiLine;
									longtxtbox.ID = sqlFieldNames[pos];

									if (formViewAction == FormViewActionTypes.Edit)
									{
										longtxtbox.Text = MyReader[sqlFieldNames[pos].ToString().Replace("`", "")].ToString();
									}

									
									longCell.Controls.Add(longtxtbox);

									catValue.Controls.Add(longTable);
									catValue.ColumnSpan = 3;
								}
								catName.VerticalAlign = VerticalAlign.Top;
								catRow.Cells.Add(catName);
								catRow.Cells.Add(catValue);
								break;
							case "8":
								if (formViewAction != FormViewActionTypes.Search && formViewAction != FormViewActionTypes.SuperSearch)
								{
									TextBox rangetxtbox = new TextBox();
									if (isControlDisabled)
									{
										rangetxtbox.Enabled = false;
									}
									rangetxtbox.ID = "range" + sqlFieldNames[pos];
									rangetxtbox.CssClass = "textbox";
									RegularExpressionValidator rangeValidator = new RegularExpressionValidator();
									rangeValidator.ControlToValidate = "range" + sqlFieldNames[pos];
									rangeValidator.ValidationExpression = @"^[-+]?[0-9]*\.?[0-9]+$";
									rangeValidator.Text = "<span style=\"text-decoration:italic; cursor:pointer;\" title=\"תא זה יכול להכיל מספרים בלבד\">*</span>";
									rangeValidator.SetFocusOnError = true;
									TableCell rangeValCell = new TableCell();
									rangeValCell.Controls.Add(rangeValidator);
									catValue.CssClass = "textbox";

									if (formViewAction == FormViewActionTypes.Edit)
									{
										rangetxtbox.Text = MyReader[sqlFieldNames[pos].ToString().Replace("`", "")].ToString();
									}
									catValue.Controls.Add(rangetxtbox);
									Literal catunitLit = new Literal();
									string[] option = { };
									if (sqlOptions.Length > pos)
										catunitLit.Text = sqlOptions[pos];
									TableCell catUnit = new TableCell();
									catUnit.Controls.Add(catunitLit);

									catRow.Cells.Add(catName);
									catRow.Cells.Add(catValue);
									catRow.Cells.Add(catUnit);
									catRow.Cells.Add(rangeValCell);
								}
								else
								{
									TableCell toCatValue = new TableCell();
									TableCell catUnit = new TableCell();
									TableCell toLabelcell = new TableCell();
									toLabelcell.Text = "עד";

									Literal catunitLit = new Literal();
									string[] option = { };
									if (sqlOptions.Length > pos)
										catunitLit.Text = sqlOptions[pos];
									catUnit.Controls.Add(catunitLit);
									
									
									TextBox fromRangetxtbox = new TextBox();
									if (isControlDisabled)
									{
										fromRangetxtbox.Enabled = false;
									}
									fromRangetxtbox.ID = "rangeFrom" + sqlFieldNames[pos];
									fromRangetxtbox.CssClass = "textbox";
									RegularExpressionValidator fromRangeValidator = new RegularExpressionValidator();
									fromRangeValidator.ControlToValidate = "rangeFrom" + sqlFieldNames[pos];
									fromRangeValidator.ValidationExpression = @"^[-+]?[0-9]*\.?[0-9]+$";
									fromRangeValidator.Text = "<span style=\"text-decoration:italic; cursor:pointer;\" title=\"תא זה יכול להכיל מספרים בלבד\">*</span>";
									fromRangeValidator.SetFocusOnError = true;
									catUnit.Controls.Add(fromRangeValidator);
									catValue.CssClass = "textbox";
									


									TextBox toRangetxtbox = new TextBox();
									if (isControlDisabled)
									{
										toRangetxtbox.Enabled = false;
									}
									toRangetxtbox.ID = "rangeTo" + sqlFieldNames[pos];
									toRangetxtbox.CssClass = "textbox";
									RegularExpressionValidator toRangeValidator = new RegularExpressionValidator();
									toRangeValidator.ControlToValidate = "rangeTo" + sqlFieldNames[pos];
									toRangeValidator.ValidationExpression = @"^[-+]?[0-9]*\.?[0-9]+$";
									toRangeValidator.Text = "<span style=\"text-decoration:italic; cursor:pointer;\" title=\"תא זה יכול להכיל מספרים בלבד\">*</span>";
									toRangeValidator.SetFocusOnError = true;
									catUnit.Controls.Add(toRangeValidator);
									toCatValue.CssClass = "textbox";

									if (replaceField.Length != 0)
									{
										foreach (string nameVal in replaceField)
										{
											string[] nameValArr = nameVal.Split('=');
											if (nameValArr[0] == ("rangeFrom" + sqlFieldNames[pos].Replace("`", "")))
											{
												fromRangetxtbox.Text = nameValArr[1];
											}
											if (nameValArr[0] == "rangeTo" + sqlFieldNames[pos].Replace("`", ""))
											{
												toRangetxtbox.Text = nameValArr[1];
											}

										}
									}

									catValue.Controls.Add(fromRangetxtbox);
									toCatValue.Controls.Add(toRangetxtbox);
									
									
									
									

									catRow.Cells.Add(catName);
									catRow.Cells.Add(catValue);
									catRow.Cells.Add(toLabelcell);
									catRow.Cells.Add(toCatValue);
									catRow.Cells.Add(catUnit);
									
								}
								break;

                            #region case 10
                            case "10"://the field is ckeditor
								if (formViewAction == FormViewActionTypes.Search || formViewAction == FormViewActionTypes.SuperSearch)
								{
									TextBox Longtxtbox = new TextBox();
									if (isControlDisabled)
									{
										Longtxtbox.Enabled = false;
									}
									Longtxtbox.ID = sqlFieldNames[pos];
									Longtxtbox.CssClass = "textbox";

									if (replaceField.Length != 0)
									{
										foreach (string nameVal in replaceField)
										{
											string[] nameValArr = nameVal.Split('=');
											if (nameValArr[0] == sqlFieldNames[pos].Replace("`", ""))
											{
												Longtxtbox.Text = nameValArr[1];
											}
										}
									}
									catValue.Controls.Add(Longtxtbox);

									catValue.CssClass = "textbox";
									catRow.Cells.Add(catName);
									catRow.Cells.Add(catValue);
								}
								else
								{
									Table longTable = new Table();
									longTable.Font.Size = 1;
									longTable.CellPadding = 0;
									longTable.CellSpacing = 0;
									TableRow longMiddleRow = new TableRow();
									TableCell longCell = new TableCell();
									longTable.Rows.Add(longMiddleRow);
									longMiddleRow.Cells.Add(longCell);
									
									TextBox longtxtbox = new TextBox();
									HiddenField longtxtboxHidden = new HiddenField();
									if (isControlDisabled)
									{
										longtxtbox.Enabled = false;
									}

									
									longtxtbox.Columns = 40;
									longtxtbox.Rows = 10;
									longtxtbox.TextMode = TextBoxMode.MultiLine;
									longtxtbox.ID = sqlFieldNames[pos].Replace("`","")+"text11";
									longtxtboxHidden.ID = sqlFieldNames[pos].Replace("`","");
									longtxtboxHidden.PreRender += longtxtboxHidden_preRender;

									if (formViewAction == FormViewActionTypes.Edit)
									{
										longtxtboxHidden.Value = MyReader[sqlFieldNames[pos].ToString().Replace("`", "")].ToString();
									}


									longCell.Controls.Add(longtxtbox);
									longCell.Controls.Add(longtxtboxHidden);


									catValue.Controls.Add(longTable);
									catValue.ColumnSpan = 3;
								}
								catName.VerticalAlign = VerticalAlign.Top;
								catRow.Cells.Add(catName);
								catRow.Cells.Add(catValue);
								break;
                            #endregion


                            #region case 11
                            case "11"://load Images
                                if (formViewAction == FormViewActionTypes.Search || formViewAction == FormViewActionTypes.SuperSearch)
                                {
                                    TextBox Longtxtbox = new TextBox();
                                    if (isControlDisabled)
                                    {
                                        Longtxtbox.Enabled = false;
                                    }
                                    Longtxtbox.ID = sqlFieldNames[pos];
                                    Longtxtbox.CssClass = "textbox";

                                    if (replaceField.Length != 0)
                                    {
                                        foreach (string nameVal in replaceField)
                                        {
                                            string[] nameValArr = nameVal.Split('=');
                                            if (nameValArr[0] == sqlFieldNames[pos].Replace("`", ""))
                                            {
                                                Longtxtbox.Text = nameValArr[1];
                                            }
                                        }
                                    }
                                    catValue.Controls.Add(Longtxtbox);

                                    catValue.CssClass = "textbox";
                                    catRow.Cells.Add(catName);
                                    catRow.Cells.Add(catValue);
                                }
                                else
                                {
                                    FileUpload fileup = new FileUpload();
                                    Literal Breaker = new Literal() { Text = "<br />" };
                                    HiddenField fileupHid = new HiddenField();
                                    Image fileupImg = new Image();
                                    fileup.PreRender += fileup_PreRender;
                                    if (replaceField.Length > pos)
                                    {
                                        fileup.Attributes["fileDir"] = replaceField[pos];
                                    }


                                    if (isControlDisabled)
                                    {
                                        fileup.Enabled = false;
                                    }
                                    TableCell FileupValidatorCell = new TableCell();
                                    fileup.ID = sqlFieldNames[pos] + "File";
                                    fileupHid.ID = sqlFieldNames[pos];
                                    fileupImg.ID = sqlFieldNames[pos] + "Img";
                                    fileupImg.Style["max-width"] = "500px;";
                                    fileup.CssClass = "";
                                    FileupValidatorCell.Controls.Add(fileupHid);

                                    if (formViewAction == FormViewActionTypes.Edit)
                                    {
                                        fileupHid.Value = MyReader[sqlFieldNames[pos].ToString().Replace("`", "")].ToString();
                                        if (string.IsNullOrEmpty(MyReader[sqlFieldNames[pos].ToString().Replace("`", "")].ToString()))
                                        {
                                            fileupImg.ImageUrl = "../images/SiteImages/Logo.png";
                                        }
                                        else
                                        {
                                            fileupImg.ImageUrl = MyReader[sqlFieldNames[pos].ToString().Replace("`", "")].ToString();
                                        }
                                    }
                                    else
                                    {
                                        fileupImg.ImageUrl = "../images/Logo.png";
                                    }
                                    if (replaceField.Length != 0)
                                    {

                                    }
                                    catValue.Controls.Add(fileupImg);
                                    catValue.Controls.Add(Breaker);
                                    catValue.Controls.Add(fileup);

                                    catValue.CssClass = "";

                                    if (sqlRegEx.Length > pos)
                                    {
                                        if (sqlRegEx[pos] != "")
                                        {
                                            RegularExpressionValidator RegExVal = new RegularExpressionValidator();
                                            RegExVal.ToolTip = "לא ניתן להעלות תמונה עם סיומת זו";
                                            RegExVal.Text = "*";
                                            RegExVal.ValidationExpression = sqlRegEx[pos];
                                            RegExVal.ControlToValidate = sqlFieldNames[pos];
                                            RegExVal.Display = ValidatorDisplay.Dynamic;


                                            FileupValidatorCell.Controls.Add(RegExVal);
                                        }
                                    }

                                    if (sqlReqFeild.Length > pos)
                                    {
                                        if (sqlReqFeild[pos] != "")
                                        {
                                            RequiredFieldValidator ReqFieldVal = new RequiredFieldValidator();
                                            ReqFieldVal.ToolTip = "המידע בשדה זה איננו תקין";
                                            ReqFieldVal.Text = "חובה למלא שדה זה";
                                            //ReqFieldVal.ValidationExpression = sqlRegEx[pos];
                                            ReqFieldVal.Enabled = !String.IsNullOrEmpty(sqlReqFeild[pos]);
                                            ReqFieldVal.ControlToValidate = sqlFieldNames[pos];
                                            ReqFieldVal.Display = ValidatorDisplay.Dynamic;


                                            FileupValidatorCell.Controls.Add(ReqFieldVal);
                                        }
                                    }

                                    catRow.Cells.Add(catName);
                                    catRow.Cells.Add(catValue);
                                    catRow.Cells.Add(FileupValidatorCell);
                                }
                                break;

                            #endregion


							case "12":
                                HiddenField Hidden = new HiddenField();
                                Hidden.ID = sqlFieldNames[pos];

                                if (formViewAction == FormViewActionTypes.Edit || formViewAction == FormViewActionTypes.Insert)
                                {

                                    if (replaceField.Length != 0)
                                    {
                                        Hidden.Value = replaceField[pos];
                                    }
                                    else
                                    {
                                        Hidden.Value = "";
                                    }
                                }
                                this.Controls.Add(Hidden);
                                break;
                            default:
                                break;


                            case "15"://load file
                                if (formViewAction == FormViewActionTypes.Search || formViewAction == FormViewActionTypes.SuperSearch)
                                {
                                    TextBox Longtxtbox = new TextBox();
                                    if (isControlDisabled)
                                    {
                                        Longtxtbox.Enabled = false;
                                    }
                                    Longtxtbox.ID = sqlFieldNames[pos];
                                    Longtxtbox.CssClass = "textbox";

                                    if (replaceField.Length != 0)
                                    {
                                        foreach (string nameVal in replaceField)
                                        {
                                            string[] nameValArr = nameVal.Split('=');
                                            if (nameValArr[0] == sqlFieldNames[pos].Replace("`", ""))
                                            {
                                                Longtxtbox.Text = nameValArr[1];
                                            }
                                        }
                                    }
                                    catValue.Controls.Add(Longtxtbox);

                                    catValue.CssClass = "textbox";
                                    catRow.Cells.Add(catName);
                                    catRow.Cells.Add(catValue);
                                }
                                else
                                {
                                    FileUpload fileup = new FileUpload();
                                    Literal Breaker = new Literal() { Text = "<br />" };
                                    HiddenField fileupHid = new HiddenField();
                                    Image fileupImg = new Image();
                                    fileup.PreRender += fileup_PreRender4;
                                    if (replaceField.Length > pos)
                                    {
                                        fileup.Attributes["fileDir"] = replaceField[pos];
                                    }


                                    if (isControlDisabled)
                                    {
                                        fileup.Enabled = false;
                                    }
                                    TableCell FileupValidatorCell = new TableCell();
                                    fileup.ID = sqlFieldNames[pos] + "File";
                                    fileupHid.ID = sqlFieldNames[pos];
                                    fileupImg.ID = sqlFieldNames[pos] + "Img";
                                    fileup.CssClass = "";
                                    FileupValidatorCell.Controls.Add(fileupHid);

                                    if (formViewAction == FormViewActionTypes.Edit)
                                    {
                                        fileupHid.Value = MyReader[sqlFieldNames[pos].ToString().Replace("`", "")].ToString();
                                        fileupImg.ImageUrl = MyReader[sqlFieldNames[pos].ToString().Replace("`", "")].ToString();
                                        fileupImg.Style["display"] = "none";
                                    }
                                    else
                                    {
                                        fileupImg.ImageUrl = "../images/Logo.png";
                                        fileupImg.Style["display"] = "none";
                                    }
                                    if (replaceField.Length != 0)
                                    {

                                    }
                                    catValue.Controls.Add(fileupImg);
                                    catValue.Controls.Add(Breaker);
                                    catValue.Controls.Add(fileup);

                                    catValue.CssClass = "";

                                    if (sqlRegEx.Length > pos)
                                    {
                                        if (sqlRegEx[pos] != "")
                                        {
                                            RegularExpressionValidator RegExVal = new RegularExpressionValidator();
                                            RegExVal.ToolTip = "לא ניתן להעלות תמונה עם סיומת זו";
                                            RegExVal.Text = "*";
                                            RegExVal.ValidationExpression = sqlRegEx[pos];
                                            RegExVal.ControlToValidate = sqlFieldNames[pos];
                                            RegExVal.Display = ValidatorDisplay.Dynamic;


                                            FileupValidatorCell.Controls.Add(RegExVal);
                                        }
                                    }
                                    if (sqlReqFeild.Length > pos)
                                    {
                                        if (sqlReqFeild[pos] != "")
                                        {
                                            RequiredFieldValidator ReqFieldVal = new RequiredFieldValidator();
                                            ReqFieldVal.ToolTip = "המידע בשדה זה איננו תקין";
                                            ReqFieldVal.Text = "חובה למלא שדה זה";
                                            //ReqFieldVal.ValidationExpression = sqlRegEx[pos];
                                            ReqFieldVal.Enabled = !String.IsNullOrEmpty(sqlReqFeild[pos]);
                                            ReqFieldVal.ControlToValidate = sqlFieldNames[pos];
                                            ReqFieldVal.Display = ValidatorDisplay.Dynamic;


                                            FileupValidatorCell.Controls.Add(ReqFieldVal);
                                        }
                                    }

                                    catRow.Cells.Add(catName);
                                    catRow.Cells.Add(catValue);
                                    catRow.Cells.Add(FileupValidatorCell);
                                }
                                break;


                            #region case 17 image with crop
                            case "17"://load Images
                                if (formViewAction == FormViewActionTypes.Search || formViewAction == FormViewActionTypes.SuperSearch)
                                {
                                    TextBox Longtxtbox = new TextBox();
                                    if (isControlDisabled)
                                    {
                                        Longtxtbox.Enabled = false;
                                    }
                                    Longtxtbox.ID = sqlFieldNames[pos];
                                    Longtxtbox.CssClass = "textbox";

                                    if (replaceField.Length != 0)
                                    {
                                        foreach (string nameVal in replaceField)
                                        {
                                            string[] nameValArr = nameVal.Split('=');
                                            if (nameValArr[0] == sqlFieldNames[pos].Replace("`", ""))
                                            {
                                                Longtxtbox.Text = nameValArr[1];
                                            }
                                        }
                                    }
                                    catValue.Controls.Add(Longtxtbox);
                                    catValue.CssClass = "textbox";
                                    catRow.Cells.Add(catName);
                                    catRow.Cells.Add(catValue);
                                }
                                else
                                {
                                    FileUpload fileup2 = new FileUpload();

                                    Literal Breaker = new Literal() { Text = "<br />" };
                                    HiddenField fileupHid = new HiddenField();
                                    HtmlInputHidden X = new HtmlInputHidden();
                                    X.ID =  sqlFieldNames[pos]+"X" ;
                                    X.Attributes["class"] = "xclass";
                                    HtmlInputHidden Y = new HtmlInputHidden();
                                    Y.Attributes["class"] = "yclass";
                                    Y.ID =  sqlFieldNames[pos]+"Y";
                                    HtmlInputHidden W = new HtmlInputHidden();
                                    W.Attributes["class"] = "wclass";
                                    W.ID =  sqlFieldNames[pos]+"W";
                                    HtmlInputHidden H = new HtmlInputHidden();
                                    H.Attributes["class"] = "hclass";
                                    H.ID =  sqlFieldNames[pos]+"H";

                                    Image fileupImg = new Image();
                                    fileup2.PreRender += fileup_PreRenderCrop;
                                    if (replaceField.Length > pos)
                                    {
                                        fileup2.Attributes["fileDir"] = replaceField[pos];
                                    }


                                    if (isControlDisabled)
                                    {
                                        fileup2.Enabled = false;
                                    }
                                    TableCell FileupValidatorCell = new TableCell();
                                    Panel imgPanel = new Panel();

                                    fileLoadPanel.ID = "PracticefileLoadPanel";
                                    fileup2.ID = sqlFieldNames[pos] + "File";
                                    fileupHid.ID = sqlFieldNames[pos];
                                    fileupImg.ID = sqlFieldNames[pos] + "Img";
                                    fileupImg.CssClass = "imgCropclass";
                                    fileup2.CssClass = "";

                                    FileupValidatorCell.Controls.Add(fileupHid);
                                    FileupValidatorCell.Controls.Add(X);
                                    FileupValidatorCell.Controls.Add(Y);
                                    FileupValidatorCell.Controls.Add(W);
                                    FileupValidatorCell.Controls.Add(H);

                                    if (formViewAction == FormViewActionTypes.Edit)
                                    {
                                        fileupHid.Value = MyReader[sqlFieldNames[pos].ToString().Replace("`", "")].ToString();
                                        fileupImg.ImageUrl = MyReader[sqlFieldNames[pos].ToString().Replace("`", "")].ToString();
                                    }
                                    else
                                    {
                                        fileupImg.ImageUrl = "../images/Logo.png";
                                    }
                                    if (replaceField.Length != 0)
                                    {

                                    }
                                    imgPanel.Style["position"] = "relative";
                                    imgPanel.Controls.Add(fileupImg);
                                    catValue.Controls.Add(imgPanel);
                                    Button saveimg = new Button();
                                    saveimg.Text = "שמור";

                                    saveimg.Command += FormViewBtn_Insert;
                                    saveimg.CommandArgument = "stay";
                                    fileLoadPanel.Controls.Add(fileup2);
                                    catValue.Controls.Add(fileup2);
                                    catValue.Controls.Add(saveimg);
                                    catValue.Controls.Add(Breaker);


                                    catValue.CssClass = "";

                                    if (sqlRegEx.Length > pos)
                                    {
                                        if (sqlRegEx[pos] != "")
                                        {
                                            RegularExpressionValidator RegExVal = new RegularExpressionValidator();
                                            RegExVal.ToolTip = "לא ניתן להעלות תמונה עם סיומת זו";
                                            RegExVal.Text = "*";
                                            RegExVal.ValidationExpression = sqlRegEx[pos];
                                            RegExVal.ControlToValidate = sqlFieldNames[pos];
                                            RegExVal.Display = ValidatorDisplay.Dynamic;


                                            FileupValidatorCell.Controls.Add(RegExVal);
                                        }
                                    }

                                    if (sqlReqFeild.Length > pos)
                                    {
                                        if (sqlReqFeild[pos] != "")
                                        {
                                            RequiredFieldValidator ReqFieldVal = new RequiredFieldValidator();
                                            ReqFieldVal.ToolTip = "המידע בשדה זה איננו תקין";
                                            ReqFieldVal.Text = "חובה למלא שדה זה";
                                            //ReqFieldVal.ValidationExpression = sqlRegEx[pos];
                                            ReqFieldVal.Enabled = !String.IsNullOrEmpty(sqlReqFeild[pos]);
                                            ReqFieldVal.ControlToValidate = sqlFieldNames[pos];
                                            ReqFieldVal.Display = ValidatorDisplay.Dynamic;

                                            FileupValidatorCell.Controls.Add(ReqFieldVal);
                                        }
                                    }

                                    catRow.Cells.Add(catName);
                                    catRow.Cells.Add(catValue);
                                    catRow.Cells.Add(FileupValidatorCell);
                                }
                                break;
                            #endregion

						}
					}
					else
					{
						TextBox txtbox = new TextBox();
						if (isControlDisabled)
						{
							txtbox.Enabled = false;
						}
						txtbox.ID = MyReader["fieldNum"].ToString();
						txtbox.CssClass = "textbox";
						if (formViewAction == FormViewActionTypes.Edit)
							{
								txtbox.Text = MyReader[sqlFieldNames[pos].ToString().Replace("`", "")].ToString();
							}
							catValue.Controls.Add(txtbox);
						
						catValue.CssClass = "textbox";
						catRow.Cells.Add(catName);
						catRow.Cells.Add(catValue);
					}

					tblUserCats1.Rows.Add(catRow);
				}

				TableCell BtnCell = new TableCell();
				TableRow BtnRow = new TableRow();
				BtnCell.ColumnSpan = 3;
				Button FormViewBtn = new Button();
                FormViewBtn.ID = "FormViewBtn";
                FormViewBtn.PreRender += FormViewBtn_PreRender;
                
                Button FormViewSaveBtn = new Button();
                FormViewSaveBtn.ID = "FormViewSaveBtn";
                FormViewSaveBtn.PreRender += FormViewSaveBtn_PreRender;


				FormViewBtn.OnClientClick = "javascript:document.getElementById('progressBar').style.display='block';";
				FormViewSaveBtn.OnClientClick = "javascript:document.getElementById('progressBar').style.display='block';";
				if (formViewAction == FormViewActionTypes.Insert)
				{
					FormViewBtn.Text = "הוסף";
					if (isControlDisabled)
					{
						FormViewBtn.Enabled = false;
					}
				}
				else if (formViewAction == FormViewActionTypes.Edit)
				{
					FormViewBtn.Text = "שמור וחזור";
					FormViewSaveBtn.Text = "שמור";
					FormViewSaveBtn.Command += FormViewBtn_Insert;
					FormViewSaveBtn.CommandArgument = "stay";
					if (isControlDisabled)
					{
						FormViewBtn.Enabled = false;
						FormViewSaveBtn.Enabled = false;
					}
				}
				else if (formViewAction == FormViewActionTypes.Search || formViewAction == FormViewActionTypes.SuperSearch)
				{
					FormViewBtn.Text = "חפש";
					if (isControlDisabled)
					{
						FormViewBtn.Enabled = false;
					}
				}

				FormViewBtn.Command += FormViewBtn_Insert;
				Literal FormViewLit = new Literal();
				FormViewLit.Text = "</td></tr></table><table style=\"margin:auto;\"><tr><td>";

				BtnCell.Controls.Add(FormViewLit);
				BtnCell.Controls.Add(FormViewBtn);
				if (formViewAction == FormViewActionTypes.Edit)
					BtnCell.Controls.Add(FormViewSaveBtn);
				
				BtnRow.Cells.Add(BtnCell);
				tblUserCats1.Rows.Add(BtnRow);

			}
			con.Close();
		}
	}

    protected void FormViewBtn_PreRender(object sender, EventArgs e)
    {
        foreach (Control ctl in cmstrDefualts.getControls(this, typeof(TextBox)))
        {
            if (((TextBox)ctl).ID.Contains("text11"))
            {
                ((Button)sender).OnClientClick += "setHidden" + ((TextBox)ctl).ID.Replace("text11", "") + "();";
            }
        }
    }

    protected void FormViewSaveBtn_PreRender(object sender, EventArgs e)
    {
        foreach (Control ctl in cmstrDefualts.getControls(this, typeof(TextBox)))
        {
            if (((TextBox)ctl).ID.Contains("text11"))
            {
                ((Button)sender).OnClientClick += "setHidden" + ((TextBox)ctl).ID.Replace("text11", "") + "();";
            }
        }
    }

    protected void longtxtboxHidden_preRender(object sender, EventArgs e)
    {
        HiddenField longtxtboxHidden = (HiddenField)sender;


        StringBuilder _js = new StringBuilder();
        _js.AppendLine("<script type='text/javascript' language='javascript'>");

        _js.AppendLine("var instance = CKEDITOR.instances." + longtxtboxHidden.ClientID + "text11" + ";");
        _js.AppendLine("if (instance) { CKEDITOR.remove(CKEDITOR.instances." + longtxtboxHidden.ClientID + "text11" + "); }");
        _js.AppendLine("CKEDITOR.replace( '" + longtxtboxHidden.ClientID + "text11" + "',{height:'400px',width:'600px', id:'cklongtxtbox',contentsLangDirection : 'rtl',filebrowserBrowseUrl : 'ckfinder/ckfinder.html',filebrowserImageBrowseUrl : 'ckfinder/ckfinder.html?Type=Images',filebrowserFlashBrowseUrl : 'ckfinder/ckfinder.html?Type=Flash',filebrowserUploadUrl : 'ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Files',filebrowserImageUploadUrl : 'ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Images',filebrowserFlashUploadUrl : 'ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Flash'});");
        if (longtxtboxHidden.Value != "")
            _js.AppendLine("CKEDITOR.instances." + longtxtboxHidden.ClientID + "text11" + ".setData(document.getElementById('" + longtxtboxHidden.ClientID + "').value)");

        _js.AppendLine("CKEDITOR.instances." + longtxtboxHidden.ClientID + "text11" + ".on('blur',function() {setHidden" + longtxtboxHidden.ID + "()})");


        _js.AppendLine("function setHidden" + longtxtboxHidden.ID + "(){document.getElementById('" + longtxtboxHidden.ClientID + "').value= CKEDITOR.instances." + longtxtboxHidden.ClientID + "text11" + ".getData()}");
        _js.AppendLine("</script>");

        Page.ClientScript.RegisterStartupScript(GetType(), "CKEditor" + longtxtboxHidden.ID, _js.ToString(), false);

    }
	protected void delFile_Click(object sender, EventArgs e)
	{
		string filename = ((LinkButton)sender).CommandArgument;
		if (File.Exists(MapPath(filename)))
		{
			File.Delete(MapPath(filename));
			tblUserCats1.Rows.Clear();
			Page_Load(sender, e);
		}
	}


    protected void fileup_PreRender(object sender, EventArgs e)
    {
        FileUpload FileUpload1 = (FileUpload)sender;

        //if (CreateInstance.Value == "true")
        //{
        StringBuilder _js = new StringBuilder();
        //the list of options is at: http://www.uploadify.com/documentation/
        _js.AppendLine("$(window).load(");
        _js.AppendLine("function () {");
        _js.AppendLine("$(\"#" + FileUpload1.ClientID + "\").fileUpload({");
        //the uploader file	
        _js.AppendLine("'uploader': 'js/uploader.swf',");
        _js.AppendLine("'cancelImg': 'js/cancel.png',");
        _js.AppendLine("'buttonText': 'Choose File',");
        //The Image file of the button	
        _js.AppendLine("'buttonImg': 'js/Uploadbutton.gif',");
        _js.AppendLine("'width': '100',");
        _js.AppendLine("'height': '27',");
        //the server-side uploader file
        _js.AppendLine("'script': 'ImgUpload.ashx',");
        _js.AppendLine("'folder': '" + FileUpload1.Attributes["fileDir"] + "',");
        _js.AppendLine("'fileDesc': 'Excel Files',");
        _js.AppendLine("'fileExt': '*.jpg;*.gif;*.png',");
        _js.AppendLine("'onComplete': function (event, queueID, fileObj, response, data) {");
        _js.AppendLine("if(response.indexOf('Error')==-1){document.getElementById('" + FileUpload1.ClientID.Replace("File", "") + "').value=response; document.getElementById('" + FileUpload1.ClientID.Replace("File", "Img") + "').src=response; }");
        _js.AppendLine("},");
        _js.AppendLine("'multi': false,");
        _js.AppendLine("'auto': true");
        _js.AppendLine("});");
        _js.AppendLine("}");
        _js.AppendLine("); ");
        string UploaderID = Guid.NewGuid().ToString();
        UploaderID = UploaderID.Remove(UploaderID.IndexOf("-"));
        Page.ClientScript.RegisterStartupScript(typeof(Page), UploaderID, _js.ToString(), true);
        //CreateInstance.Value = "false";
        //}
    }

    protected void fileup_PreRender4(object sender, EventArgs e)
    {
        FileUpload FileUpload1 = (FileUpload)sender;

        //if (CreateInstance.Value == "true")
        //{
        StringBuilder _js = new StringBuilder();
        //the list of options is at: http://www.uploadify.com/documentation/
        _js.AppendLine("$(window).load(");

        _js.AppendLine("function () {");

        _js.AppendLine("$(\"#" + FileUpload1.ClientID + "\").fileUpload({");
        //the uploader file	
        _js.AppendLine("'uploader': 'js/uploader.swf',");
        _js.AppendLine("'cancelImg': 'js/cancel.png',");
        _js.AppendLine("'buttonText': 'Choose File',");
        //The Image file of the button	
        _js.AppendLine("'buttonImg': 'js/Uploadbutton.gif',");
        _js.AppendLine("'width': '100',");
        _js.AppendLine("'height': '27',");
        //the server-side uploader file
        _js.AppendLine("'script': 'FileUpload.ashx',");
        _js.AppendLine("'folder': '" + FileUpload1.Attributes["fileDir"] + "',");
        _js.AppendLine("'fileDesc': 'pdf Files',");
        _js.AppendLine("'fileExt': '*.pdf',");

        _js.AppendLine("'onComplete': function (event, queueID, fileObj, response, data) {");


        _js.AppendLine("if(response.indexOf('Error')==-1){ document.getElementById('" + FileUpload1.ClientID.Replace("File", "") + "').value=response; document.getElementById('" + FileUpload1.ClientID.Replace("File", "Img") + "').src=response; }");
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


    protected void fileup_PreRenderCrop(object sender, EventArgs e)
    {

        FileUpload FileUpload1 = (FileUpload)sender;
        Session["fileUploadcrop"] = FileUpload1.ID;
        string dim = FileUpload1.Attributes["fileDir"];
        dim = dim.Remove(0, dim.IndexOf('-') + 2);
        dim = dim.Remove(dim.IndexOf('-'));
        string[] newDim = dim.Split('x');
        //string cropjs = "$('.imgCropclass').Jcrop({ onSelect: storeCoords, onChange: storeCoords, maxSize: [245, 160], minSize: [245, 160]}); ";
        string cropjs = "var api;function setcrops() {api= $('.imgCropclass').Jcrop({ onSelect: storeCoords" + FileUpload1.ID + ", onChange: storeCoords" + FileUpload1.ID + ", maxSize: [" + newDim[0] + ", " + newDim[1] + "], minSize: [" + newDim[0] + " , " + newDim[1] + "]});};setcrops();";
        //if (CreateInstance.Value == "true")
        //{
        StringBuilder _js = new StringBuilder();
        //the list of options is at: http://www.uploadify.com/documentation/

        _js.AppendLine(" function storeCoords" + FileUpload1.ID + "(c) {");
        //_js.AppendLine("$('#" + X.ClientID + "').val(c.x);");
        _js.AppendLine("$('#" + X.ClientID + "').val( $('#" + X.ClientID + "').val() + '" + FileUpload1.ID.Replace("File", "") + "'+c.x+'_');");
        
        //_js.AppendLine("$('#" + FileUpload1.ClientID.Replace("File", "Y") + "').val(c.y);");
        _js.AppendLine("$('#" + Y.ClientID + "').val( $('#" + Y.ClientID + "').val() + '" + FileUpload1.ID.Replace("File", "") + "'+c.y+'_');");
        _js.AppendLine("$('#" + W.ClientID + "').val( $('#" + W.ClientID + "').val() + '" + FileUpload1.ID.Replace("File", "") + "'+c.w+'_');");
       // _js.AppendLine("$('#" + FileUpload1.ClientID.Replace("File", "H") + "').val(c.h);");
        _js.AppendLine("$('#" + H.ClientID + "').val( $('#" + H.ClientID + "').val() + '" + FileUpload1.ID.Replace("File", "") + "'+c.h+'_');");
        _js.AppendLine("  };");
        _js.AppendLine("$(window).load(");
        _js.AppendLine("function () {");
        _js.AppendLine("$(\"#" + FileUpload1.ClientID + "\").fileUpload({");
        //the uploader file	
        _js.AppendLine("'uploader': 'js/uploader.swf',");
        _js.AppendLine("'cancelImg': 'js/cancel.png',");
        _js.AppendLine("'buttonText': 'Choose File',");
        //The Image file of the button	
        _js.AppendLine("'buttonImg': 'js/Uploadbutton.gif',");
        _js.AppendLine("'width': '100',");
        _js.AppendLine("'height': '27',");
        //the server-side uploader file
        _js.AppendLine("'script': 'ImgCropUpload.ashx',");
        _js.AppendLine("'folder': '" + FileUpload1.Attributes["fileDir"] + "',");
        _js.AppendLine("'fileDesc': 'Excel Files',");
        _js.AppendLine("'fileExt': '*.jpg;*.gif;*.png',");
        _js.AppendLine("'onComplete': function (event, queueID, fileObj, response, data) {");

        _js.AppendLine("if(response.indexOf('Error')==-1){document.getElementById('" + FileUpload1.ClientID.Replace("File", "") + "').value=response; document.getElementById('" + FileUpload1.ClientID.Replace("File", "Img") + "').src=response;" + cropjs + "document.getElementById('" + fileLoadPanel.ClientID + "').style.display='none'; }");

        _js.AppendLine("},");
        _js.AppendLine("'multi': false,");
        _js.AppendLine("'auto': true");
        _js.AppendLine("});");
        _js.AppendLine("}");
        _js.AppendLine("); ");

        string UploaderID = Guid.NewGuid().ToString();
        UploaderID = UploaderID.Remove(UploaderID.IndexOf("-"));
        Page.ClientScript.RegisterStartupScript(typeof(Page), UploaderID, _js.ToString(), true);
        //CreateInstance.Value = "false";
        //}
    }

	protected void PlusFileButton_Click(object sender, EventArgs e)
	{
		//for (int i = 0; i < FileControls.Count; i++)
		//{
		//    RecreateFileButton(FileControls[i].ToString());
		//}

		//LinkButton fileButton = sender as LinkButton;
		//Literal fileBRUp = new Literal();
		//fileBRUp.Text = "<br>";

		//string[] s = fileButton.CommandArgument.Split(new string[] { "fileCell" }, StringSplitOptions.None);
		//FileUpload FileUp = new FileUpload();
		//FileUp.EnableViewState = true;

		//string FileUpID = s[0] + "fileUp" + s[1] + "fileUp";
		//int fileUpNum = 0;
		//for (int i = 0; i < FileControls.Count; i++)
		//{ fileUpNum = i + 1; }

		//FileUp.ID = FileUpID + fileUpNum.ToString();
		//FileUp.CssClass = "fileUp";

		//object o = new TableCell();
		//foreach (Control ctl in Defaults.getControls(this, o.GetType()))
		//{
		//    if (ctl.ID == fileButton.CommandArgument)
		//    {
		//        ctl.Controls.Add(fileBRUp);
		//        ctl.Controls.Add(FileUp);
		//    }
		//}
		//FileControls.Add(fileButton.CommandArgument + "fileCell" + fileUpNum.ToString());
	}


	protected void RecreateFileButton(string cellName)
	{
		Literal fileBRUp = new Literal();
		fileBRUp.Text = "<br>";

		string[] s = cellName.Split(new string[] { "fileCell" }, StringSplitOptions.None);
		FileUpload FileUp = new FileUpload();
		FileUp.ID = s[0] + "fileUp" + s[1] + "fileUp" + s[2];
		FileUp.CssClass = "fileUp";
		FileUp.EnableViewState = true;

		object o = new TableCell();
        foreach (Control ctl in cmstrDefualts.getControls(this, o.GetType()))
		{
			if (ctl.ID == s[0] + "fileCell" + s[1])
			{
				ctl.Controls.Add(fileBRUp);
				ctl.Controls.Add(FileUp);
			}
		}
	}


	ArrayList namesArr = new ArrayList();
	ArrayList valuesArr = new ArrayList();


    protected void SaveCropImg(object sender, CommandEventArgs e)
    {
        foreach (Control ctl in cmstrDefualts.getControls(this, typeof(HiddenField)))
        {
            if (((HiddenField)ctl).ID != null && !(((HiddenField)ctl).ID.Contains("Old")))
            {
                namesArr.Add(((HiddenField)ctl).ID.Replace("hidden", "").Replace("_num", ""));
                if (((HiddenField)ctl).ID.Contains("_num"))
                    valuesArr.Add("" + ((HiddenField)ctl).Value + "");
                else if (((HiddenField)ctl).Value.IndexOf("_c_rop") > -1)
                {

           //         string newimage = "";
                    if (W.Value != "")
                    {
                        int w = 0;
                        int h = 0;
                        int x = 0;
                        int y = 0;
                        string[] Warr = W.Value.Split('_');
                        for (int i = 0; i < Warr.Length; i++)
                        {
                            if (Warr[i].Contains(((HiddenField)ctl).ID))
                            {
                                w = Convert.ToInt32(Warr[i].Replace(((HiddenField)ctl).ID, ""));

                            }
                        }
                        string[] Xarr = X.Value.Split('_');
                        for (int i = 0; i < Xarr.Length; i++)
                        {
                            if (Warr[i].Contains(((HiddenField)ctl).ID))
                            {
                                x = Convert.ToInt32(Xarr[i].Replace(((HiddenField)ctl).ID, ""));

                            }
                        }
                        string[] Yarr = Y.Value.Split('_');
                        for (int i = 0; i < Warr.Length; i++)
                        {
                            if (Yarr[i].Contains(((HiddenField)ctl).ID))
                            {
                                y = Convert.ToInt32(Yarr[i].Replace(((HiddenField)ctl).ID, ""));

                            }
                        }
                        string[] Harr = H.Value.Split('_');
                        for (int i = 0; i < Harr.Length; i++)
                        {
                            if (Harr[i].Contains(((HiddenField)ctl).ID))
                            {
                                h = Convert.ToInt32(Harr[i].Replace(((HiddenField)ctl).ID, ""));

                            }
                        }
                        string ImageName = MapPath(((HiddenField)ctl).Value);
                        //int w = Convert.ToInt32(W.Value);
                        //int h = Convert.ToInt32(H.Value);
                        //int x = Convert.ToInt32(X.Value);
                        //int y = Convert.ToInt32(Y.Value);
                        //string path = MapPath("../images/");
                        if (w != 0 || h != 0)
                        {
                            byte[] CropImage = Crop(ImageName, w, h, x, y);
                            using (MemoryStream ms = new MemoryStream(CropImage, 0, CropImage.Length))
                            {
                                ms.Write(CropImage, 0, CropImage.Length);
                                using (SD.Image CroppedImage = SD.Image.FromStream(ms, true))
                                {
                                    string SaveTo = ImageName;
                                    // newimage = ((HiddenField)ctl).Value.Replace("_prod", "_crop");
                                    CroppedImage.Save(SaveTo, CroppedImage.RawFormat);

                                }
                            }

                            if (File.Exists(MapPath(((HiddenField)ctl).Value).Replace("crop", "prod")))
                            {
                                ImageName = MapPath(((HiddenField)ctl).Value).Replace("crop", "prod");

                                CropImage = Crop(ImageName, w, h, x, y);
                                using (MemoryStream ms = new MemoryStream(CropImage, 0, CropImage.Length))
                                {
                                    ms.Write(CropImage, 0, CropImage.Length);
                                    using (SD.Image CroppedImage = SD.Image.FromStream(ms, true))
                                    {
                                        string SaveTo = ImageName;
                                        // newimage = ((HiddenField)ctl).Value.Replace("_prod", "_crop");
                                        CroppedImage.Save(SaveTo, CroppedImage.RawFormat);

                                    }
                                }
                            }
                            
                        }
                    }



                    valuesArr.Add("'" + ((HiddenField)ctl).Value.Replace("'", "''") + "'");
                    // valuesArr.Add("'" + newimage.Replace("'", "''") + "'");
                }


                else
                {
                    if (((HiddenField)ctl).Value.ToString().Contains("_NOT_STRING"))
                    {
                        valuesArr.Add(((HiddenField)ctl).Value.Replace("_NOT_STRING", ""));
                    }
                    else
                    {
                        valuesArr.Add("'" + ((HiddenField)ctl).Value + "'");
                    }
                }
            }
        }
       

    }

	protected void FormViewBtn_Insert(object sender, CommandEventArgs e)
	{
		//for (int j = 0; j < FileControls.Count; j++)
		//{
		//    RecreateFileButton(FileControls[j].ToString());
		//}


        foreach (Control ctl in cmstrDefualts.getControls(this, typeof(TextBox)))
		{
			if (((TextBox)ctl).ID.StartsWith("Date"))
			{
				string[] dateSplitter = {"/","-"," ","."};
				if (((TextBox)ctl).Text != "")
				{
					if (formViewAction != FormViewActionTypes.Search && formViewAction != FormViewActionTypes.SuperSearch)
						namesArr.Add(((TextBox)ctl).ID.Remove(0, 4));
					else
						namesArr.Add(((TextBox)ctl).ID);
					string[] theDateStr = ((TextBox)ctl).Text.Trim().Split(dateSplitter, StringSplitOptions.RemoveEmptyEntries);
					valuesArr.Add("'" + (theDateStr[2] + "-" + theDateStr[1] + "-" + theDateStr[0]) + "'");
				}
			}
			else if (((TextBox)ctl).ID.Contains("range"))
			{
				if (formViewAction != FormViewActionTypes.Search && formViewAction != FormViewActionTypes.SuperSearch)
				{
					namesArr.Add(((TextBox)ctl).ID.Replace("range", ""));
					if (((TextBox)ctl).Text != "")
					{
						valuesArr.Add(((TextBox)ctl).Text);
					}
					else
					{
						valuesArr.Add("null");
					}
				}
				else
				{
					if (((TextBox)ctl).Text != "")
					{
						namesArr.Add(((TextBox)ctl).ID);
						valuesArr.Add(((TextBox)ctl).Text);
					}
				}
			}
            else if (((TextBox)ctl).ID.Contains("text11"))
            {
                //doesn't take the value from the editor itself
            }
			else
			{
				if (SqlNoDuplicateFieldID.Length > 0)
				{
					if (sqlNoDuplicateFieldID.Contains(((TextBox)ctl).ID.Replace("`", "")))
					{
						using (MySqlConnection con = new MySqlConnection(ConnStr))
						{
							con.Open();
							MySqlCommand cmd = new MySqlCommand();
							cmd.Connection = con;
							cmd.CommandText = "SELECT " + ((TextBox)ctl).ID + " FROM `" + tblName + "` WHERE " + ((TextBox)ctl).ID + "='" + ((TextBox)ctl).Text.Replace("'", "''").Trim() + "' AND NOT " + ((TextBox)ctl).ID + " ='" + ((HiddenField)(tblUserCats1.FindControl(((TextBox)ctl).ID + "Old"))).Value.Trim() + "'";
							MySqlDataReader MyReader = cmd.ExecuteReader();
							if (MyReader.Read())
							{
								ErrMsg.Text = "<script language=\"javascript\">alert('תוכן התא \"" + ((TableRow)((TableCell)((TextBox)ctl).Parent).Parent).Cells[0].Text + "\" הינו ייחודי ולכן שתי שורות באותה הטבלה אינן יכולות להכיל את אותו הערך')</script>";
								return;
							}
							else
							{
								ErrMsg.Text = "";
								((HiddenField)(tblUserCats1.FindControl(((TextBox)ctl).ID + "Old"))).Value = ((TextBox)ctl).Text.Replace("'", "''").Trim();
							}
							con.Close();
						}
					}
				}

				namesArr.Add(((TextBox)ctl).ID);
				valuesArr.Add("'" + ((TextBox)ctl).Text.Replace("'", "''") + "'");
			}
		}


        foreach (Control ctl in cmstrDefualts.getControls(this, typeof(RadioButtonList)))
		{
			if (((RadioButtonList)ctl).SelectedValue != null)
			{
				namesArr.Add(((RadioButtonList)ctl).ID);
				valuesArr.Add("'" + ((RadioButtonList)ctl).SelectedValue + "'");
			}
		}




        foreach (Control ctl in cmstrDefualts.getControls(this, typeof(HiddenField)))
		{
			if (((HiddenField)ctl).ID != null && !(((HiddenField)ctl).ID.Contains("Old")))
			    {

                
				namesArr.Add(((HiddenField)ctl).ID.Replace("hidden", "").Replace("_num",""));
				if(((HiddenField)ctl).ID.Contains("_num"))
					valuesArr.Add("" + ((HiddenField)ctl).Value + "");
                else if (((HiddenField)ctl).Value.IndexOf("_c_rop") > -1)
                {

         //           string newimage = "";
                    if (W.Value != "")
                    {
                        int w=0 ;
                        int h=0 ;
                        int x=0 ;
                        int y=0 ;
                        string[] Warr = W.Value.Split('_');
                        for (int i = 0; i < Warr.Length; i++)
                        {
                            if(Warr[i].Contains(((HiddenField)ctl).ID))
                            {
                                 w = Convert.ToInt32(Warr[i].Replace(((HiddenField)ctl).ID,""));

                            }
                        }
                        string[] Xarr = X.Value.Split('_');
                        for (int i = 0; i < Xarr.Length; i++)
                        {
                            if (Warr[i].Contains(((HiddenField)ctl).ID))
                            {
                                x = Convert.ToInt32(Xarr[i].Replace(((HiddenField)ctl).ID, ""));

                            }
                        }
                        string[] Yarr = Y.Value.Split('_');
                        for (int i = 0; i < Warr.Length; i++)
                        {
                            if (Yarr[i].Contains(((HiddenField)ctl).ID))
                            {
                                y = Convert.ToInt32(Yarr[i].Replace(((HiddenField)ctl).ID, ""));

                            }
                        }
                        string[] Harr = H.Value.Split('_');
                        for (int i = 0; i < Harr.Length; i++)
                        {
                            if (Harr[i].Contains(((HiddenField)ctl).ID))
                            {
                                h = Convert.ToInt32(Harr[i].Replace(((HiddenField)ctl).ID, ""));

                            }
                        }
                        string ImageName = MapPath(((HiddenField)ctl).Value);
                        //int w = Convert.ToInt32(W.Value);
                        //int h = Convert.ToInt32(H.Value);
                        //int x = Convert.ToInt32(X.Value);
                        //int y = Convert.ToInt32(Y.Value);
                        //string path = MapPath("../images/");
                        if (w != 0 || h != 0)
                        {
                            byte[] CropImage = Crop(ImageName, w, h, x, y);
                            
                            using (MemoryStream ms = new MemoryStream(CropImage, 0, CropImage.Length))
                            {
                                ms.Write(CropImage, 0, CropImage.Length);
                                using (SD.Image CroppedImage = SD.Image.FromStream(ms, true))
                                {
                                    string SaveTo = ImageName;
                                    // newimage = ((HiddenField)ctl).Value.Replace("_prod", "_crop");
                                    CroppedImage.Save(SaveTo, CroppedImage.RawFormat);

                                }
                            }

                            //if (File.Exists(MapPath(((HiddenField)ctl).Value).Replace("_rop", "_prod")))
                            //{
                            //    ImageName = MapPath(((HiddenField)ctl).Value).Replace("_rop", "_prod");
                            //    CropImage = Crop(ImageName, w, h, x, y);
                            //    using (MemoryStream ms = new MemoryStream(CropImage, 0, CropImage.Length))
                            //    {
                            //        ms.Write(CropImage, 0, CropImage.Length);
                            //        using (SD.Image CroppedImage = SD.Image.FromStream(ms, true))
                            //        {
                            //            string SaveTo = ImageName;
                            //            // newimage = ((HiddenField)ctl).Value.Replace("_prod", "_crop");
                            //            CroppedImage.Save(SaveTo, CroppedImage.RawFormat);

                            //        }
                            //    }
                            //}
                        }
                    }



                    valuesArr.Add("'" + ((HiddenField)ctl).Value.Replace("'", "''") + "'");
                    // valuesArr.Add("'" + newimage.Replace("'", "''") + "'");
                }


                else
                {
                    if (((HiddenField)ctl).Value.ToString().Contains("_NOT_STRING"))
                    {
                        valuesArr.Add( ((HiddenField)ctl).Value.Replace("_NOT_STRING","") );
                    }
                    else
                    {
                        valuesArr.Add("'" + ((HiddenField)ctl).Value + "'");
                    }
                }
			}
		}
        foreach (Control ctl in cmstrDefualts.getControls(this, typeof(DropDownList)))
		{

			namesArr.Add(((DropDownList)ctl).ID);
			valuesArr.Add("'" + ((DropDownList)ctl).Items[((DropDownList)ctl).SelectedIndex].Value + "'");
		}

		if (formViewAction == FormViewActionTypes.Insert)
		{
			ItemInserted += DummyItemInserted;
			string names = "";
			string values = "";
			for (int i = 0; i < namesArr.Count; i++)
			{
				if (i != 0)
				{
					names += ",";
					values += ",";
				}
				names += namesArr[i];
				values += valuesArr[i];
			}
			string comStr = "INSERT INTO " + TblName;			
            comStr += " (" + names + ") values (" + values +")";
			using (MySqlConnection con = new MySqlConnection(ConnStr))
			{
				con.Open();
				MySqlCommand cmd = new MySqlCommand(comStr, con);
				cmd.ExecuteNonQuery();
				//gets the new User's ID
				cmd.CommandText = "SELECT last_insert_id() AS NewUserID";
				MyReader = cmd.ExecuteReader();
				if (MyReader.Read())
				{
					//sends the new user's ID with the event showing it was inserted
					if (MyReader["NewUserID"].ToString() != "")
					{
						ItemInserted(MyReader["NewUserID"].ToString());
					}
				}
				MyReader.Close();
				con.Close();
			}
				Response.Redirect(returnURL);
		}
		else if (formViewAction == FormViewActionTypes.Edit)
		{
			ItemUpdated += DummyItemUpdated;
			string comStr = "UPDATE " + TblName+" SET ";
			for (int i = 0; i < namesArr.Count; i++)
			{
				if (comStr != "UPDATE " + TblName + " SET ")
				{
					comStr += ",";
				}
				comStr += namesArr[i]+"="+ valuesArr[i];
			}
			
			if (SqlWhereQuery != "")
			{
				comStr += " WHERE " + SqlWhereQuery;
				if (IdField != "" && IdValue != "")
				{
					comStr += " AND " + IdField + "=" + IdValue;
				}
			}
			else
			{
				if (IdField != "" && IdValue != "")
				{
					comStr += " WHERE " + IdField + "=" + IdValue;
				}
			}
			using (MySqlConnection con = new MySqlConnection(ConnStr))
			{
				con.Open();
				MySqlCommand cmd = new MySqlCommand(comStr, con);
				cmd.ExecuteNonQuery();
				con.Close();
			}
			
			ItemUpdated(IdValue);

            if (e.CommandArgument.ToString() != "stay")
            {
                Response.Redirect(returnURL);
            }
            else {

                Response.Redirect(Request.Url.ToString());
            }
		}
		else if (formViewAction == FormViewActionTypes.Search || formViewAction == FormViewActionTypes.SuperSearch)
		{
			if (SearchRedirectUrl.Contains("?") == false)
			{
				SearchRedirectUrl += "?no=0";
			}
			for (int i = 0; i < namesArr.Count; i++)
			{
				SearchRedirectUrl += "&"+namesArr[i].ToString().Replace("`","")+"="+valuesArr[i].ToString().Replace("'","");
			}

			Response.Redirect(SearchRedirectUrl);
		}


	}

	protected void DummyItemInserted(string str)
	{

	}

	protected void DummyItemUpdated(string str)
	{

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

