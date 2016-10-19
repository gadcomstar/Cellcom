using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using MySql.Data.MySqlClient;
using System.Web.SessionState;
using System.Collections;
using System.Web.Compilation;
using System.CodeDom;
using System.Security.Permissions;



public class Languages : ExpressionBuilder
{

	public override CodeExpression GetCodeExpression(BoundPropertyEntry entry, object parsedData, ExpressionBuilderContext context)
	{
		CodeTypeReferenceExpression thisType = new CodeTypeReferenceExpression(base.GetType());


		CodePrimitiveExpression expression = new CodePrimitiveExpression(entry.Expression.Trim().ToString());

		string evaluationMethod = "MyText";

		return new CodeMethodInvokeExpression(thisType, evaluationMethod, new CodeExpression[] { expression });
	}
	static public List<string> LangNames = new List<string>();
	static public List<string> PageNames = new List<string>();
	static public List<List<Dictionary<string, string>>> TextPages = new List<List<Dictionary<string, string>>>();
	static public List<SendMsgLang2> sendMagLangs = new List<SendMsgLang2>();
	public static string MyText(string textName)
	{
        int lang = 0;
		System.Web.HttpContext currentContext = System.Web.HttpContext.Current;
		HttpSessionState CurSession = currentContext.Session;
        //string lang = HttpContext.Current.Request.QueryString["Lang"].ToString();
		string langName = "1";

        if (HttpContext.Current.Request.QueryString["Lang"] != null && int.TryParse(HttpContext.Current.Request.QueryString["Lang"], out lang))
        {
            langName = lang.ToString();
        }
		else if (CurSession != null && CurSession["Lang"] != null)
		{
		//	langName = CurSession["Lang"].ToString();
		}      
		string pageName = "general";
		string hebText="";
        int pagestatus = 0;
        int textType = 1;

        string[] textArry = textName.Split('_');
        hebText = textArry[0].Replace("'", "''").Trim();

        textName = hebText.Length > 50 ? hebText.Remove(50) : hebText;
        pageName = textArry.Length > 1 ? textArry[1].Replace("'", "''").Trim().ToLower() : "general";
        if (int.TryParse( pageName[0].ToString()+ pageName[1].ToString()  , out pagestatus))
        {
            pageName = pageName.Remove(0, 2);
        } else  if (int.TryParse( pageName[0].ToString(),out pagestatus))
        {
            pageName = pageName.Remove(0, 1);        
        }
        textType = textArry.Length > 2 ? int.Parse(textArry[2]) : 1;


        //if (textName.Contains("_"))
        //{
        //    pageName = textName.Remove(textName.IndexOf("_"));
        //    textName = textName.Substring(textName.IndexOf("_") + 1);
        //}

        //        if (textName.Contains("_"))
        //{
        //    hebText = textName.Substring(textName.IndexOf("_") + 1);
        //    textName = textName.Remove(textName.IndexOf("_"));
        //}

		SendMsgLang2 tempLang = null;
		foreach (SendMsgLang2 sendMsgLang in sendMagLangs)
		{
			if (sendMsgLang.LangName == langName)
			{
				tempLang = sendMsgLang;
			}
		}
		if (tempLang == null)
		{
			tempLang = new SendMsgLang2(langName);
			lock (sendMagLangs)
			{
				sendMagLangs.Add(tempLang);
			}
		}
        return tempLang.getText(pageName, textName, hebText, pagestatus, textType);
	}


    //public static string MyText(string textName,string langName)
    //{
    //    if(langName=="")
    //    {
    //        langName = "Heb";
    //    }

    //    string pageName = "general";
    //    string hebText="";
    //    if (textName.Contains("_"))
    //    {
    //        pageName = textName.Remove(textName.IndexOf("_"));
    //        textName = textName.Substring(textName.IndexOf("_") + 1);
    //    }

    //            if (textName.Contains("_"))
    //    {
    //        hebText = textName.Substring(textName.IndexOf("_") + 1);
    //        textName = textName.Remove(textName.IndexOf("_"));
    //    }

    //    SendMsgLang tempLang = null;
    //    foreach (SendMsgLang sendMsgLang in sendMagLangs)
    //    {
    //        if (sendMsgLang.LangName == langName)
    //        {
    //            tempLang = sendMsgLang;
    //        }
    //    }
    //    if (tempLang == null)
    //    {
    //        tempLang = new SendMsgLang(langName);
    //        lock (sendMagLangs)
    //        {
    //            sendMagLangs.Add(tempLang);
    //        }
    //    }

    //    return tempLang.getText(pageName, textName, hebText);
    //}

}




public class SendMsgLang2
{
	string langName;
	List<SendMsgPage2> sendMsgPages = new List<SendMsgPage2>();

	public string LangName
	{
		get { return langName; }
	}

	public SendMsgLang2(string LangCode)
	{
		langName = LangCode;
	}

    public string getText(string pageName, string textName, string hebText, int pagestatus, int textType)
	{
		SendMsgPage2 tempPage = null; 
		foreach (SendMsgPage2 sendMsgPage in sendMsgPages)
		{
			if (sendMsgPage.PageName == pageName)
			{
				tempPage = sendMsgPage;
			}
		}
		if (tempPage == null)
		{
			tempPage = new SendMsgPage2(pageName);
			lock (sendMsgPages)
			{
				sendMsgPages.Add(tempPage);
			}
		}

        return tempPage.getText(langName, textName, hebText, pagestatus, textType);
	}

}

class SendMsgPage2
{
	string pageName;
	List<SendMagLangText2> sendMsgTexts = new List<SendMagLangText2>();

	public SendMsgPage2(string PageName)
	{
		pageName = PageName;
	}

	public string PageName
	{
		get { return pageName; }
	}

	public string getText(string langName, string textName,string hebText,int  pagestatus,int textType)
	{
		SendMagLangText2 tempText = null;
        lock (sendMsgTexts)
        {
		    foreach (SendMagLangText2 sendMsgText in sendMsgTexts)
		    {
			    if (sendMsgText.TextName == textName)
			    {
				    tempText = sendMsgText;
			    }
		    }
        }
		if (tempText == null)
		{
			tempText = new SendMagLangText2(textName);
			lock (sendMsgTexts)
			{
				sendMsgTexts.Add(tempText);
			}
			
		}

        return tempText.getText(langName, pageName, hebText, pagestatus, textType);
	}	
}

class SendMagLangText2
{
	string textName = "";
	string textValue = null;
	public SendMagLangText2(string TextName)
	{
		textName = TextName;
	}

	public string TextName
	{
		get { return textName; }
	}

	public string getText(string langName, string pageName, string hebText,int pagestatus,int textType)
	{

		if (textValue != null)
		{
		}
		else
		{
			MySql.Data.MySqlClient.MySqlDataReader MyReader = null;
			string ConnStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;

			using (MySql.Data.MySqlClient.MySqlConnection con = new MySql.Data.MySqlClient.MySqlConnection(ConnStr))
			{
				con.Open();
                // check if page name 
                string sql = String.Format("Select PageID From pages2 where pagename='{0}'", pageName);
                MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand(sql, con);
                MyReader = cmd.ExecuteReader();
                if (MyReader.Read())
                {
                    pageName = MyReader["PageID"].ToString();
                    MyReader.Close();
                }
                else
                {
                    MyReader.Close();
                    sql = String.Format("insert into pages2 (pagename) Values ('{0}')", pageName);
                    cmd.CommandText = sql;
                    cmd.ExecuteNonQuery();

                    sql = "select last_insert_id() as myid";
                    cmd.CommandText = sql;
                    MyReader = cmd.ExecuteReader();
                    if (MyReader.Read())
                    {
                        pageName = MyReader["myid"].ToString();
                    }
                    MyReader.Close();                
                }
				//looking for the translation in dictionary
                sql = String.Format("SELECT `{0}`  As EngText FROM langtext2 WHERE `TextName`='{1}' AND `PageID`={2}", langName, textName.Replace("'", "''"), pageName);// "SELECT `" + langName + "`, `1` As EngText FROM langtext2 WHERE `TextName`='" + textName.Replace("'", "''") + "' AND `PageID`=" + pageName;
                 cmd.CommandText = sql;
				MyReader = cmd.ExecuteReader();
				if (MyReader.Read())
				{
                    //if (MyReader[langName].ToString() != "")
                    //{

                    //    textValue = MyReader[langName].ToString();

                    //}
                    //else
                    //{
						textValue = MyReader["EngText"].ToString();
                    //}
				}
				else//if the text is not in the database - adds it.
				{
					if (textName != "")
					{
						using (MySql.Data.MySqlClient.MySqlConnection con2 = new MySql.Data.MySqlClient.MySqlConnection(ConnStr))
						{
							con2.Open();
							MySqlCommand cmd2 = new MySqlCommand();
							cmd2.Connection = con2;

							if (hebText != "")
							{
								if (langName.ToLower() != "1")
								{
                                    cmd2.CommandText = "INSERT INTO langtext2 (TextName,PageID, `" + langName + "`,`1`,`TextType`,`PageStatus`) VALUES ('" + textName.Replace("'", "''") + "'," + pageName + ",'" + hebText.Replace("'", "''") + "','" + textName.Replace("'", "''") + "'," + textType + "," + pagestatus + ")";
								}
								else
								{
                                    cmd2.CommandText = "INSERT INTO langtext2 (TextName,PageID, `" + langName + "`,`TextType`,`PageStatus`) VALUES ('" + textName.Replace("'", "''") + "','" + pageName + "','" + hebText.Replace("'", "''") + "'," + textType + "," + pagestatus + ")";
								}
								textValue = hebText;
							}
							else
							{
								if (langName.ToLower() != "1")
								{
                                    cmd2.CommandText = "INSERT INTO langtext2 (TextName,PageID, `" + langName + "`,`1`,`TextType`,`PageStatus`) VALUES ('" + textName.Replace("'", "''") + "'," + pageName + ",'####" + textName.Replace("'", "''") + "####','" + textName.Replace("'", "''") + "'," + textType + "," + pagestatus + ")";
								}
								else
								{
                                    cmd2.CommandText = "INSERT INTO langtext2 (TextName,PageID, `" + langName + "`,`TextType`,`PageStatus`) VALUES ('" + textName.Replace("'", "''") + "'," + pageName + ",'####" + textName.Replace("'", "''") + "####'," + textType + "," + pagestatus + ")";
								}
								textValue = "####" + textName + "####";
							}
							cmd2.ExecuteNonQuery();
							con2.Close();
						}
					}
				}
				MyReader.Close();
                cmd.CommandText = "UPDATE langtext2 SET lastUsed='" + DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss") + "' WHERE `TextName`='" + textName.Replace("'", "''") + "' AND `PageID`=" + pageName; ;
				cmd.ExecuteNonQuery();
				con.Close();
			}
		}
		return textValue;
	}
}
