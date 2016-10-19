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



public class Languages2 : ExpressionBuilder
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

    public static string MyText(string textName)
    {
        string lang = "Heb";
        string ConnStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
        string TheText = "";
        string PageName = "general";
        string HebText = "";
        int langPos = 0;
        int pagePos = 0;
        System.Web.HttpContext currentContext = System.Web.HttpContext.Current;
        HttpSessionState CurSession = currentContext.Session;

        if (textName.Contains("_"))
        {


            PageName = textName.Remove(textName.IndexOf("_"));
            textName = textName.Substring(textName.IndexOf("_") + 1);
        }

        if (textName.Contains("_"))
        {
            HebText = textName.Substring(textName.IndexOf("_") + 1);
            textName = textName.Remove(textName.IndexOf("_"));
        }



        if (CurSession != null && CurSession["Lang"] != null)
        {
            lang = CurSession["Lang"].ToString();
        }

        if (LangNames.Contains(lang))//if the language is in memory, find it's position.
        {
            langPos = LangNames.IndexOf(lang);
        }
        else//if the language is not in memory, find adds it.
        {
            LangNames.Add(lang);
            langPos = LangNames.Count - 1;
        }


        if (PageNames.Contains(PageName) && TextPages.Count > pagePos)//if the page is in memory, find it's position.
        {
            pagePos = PageNames.IndexOf(PageName);
            if (TextPages[pagePos].Count <= langPos)//if the language is not in memory, find adds it.
            {
                TextPages[pagePos].Add(new Dictionary<string, string>());
            }
        }
        else//if the page is not in memory, find adds it.
        {
            PageNames.Add(PageName);
            pagePos = PageNames.Count - 1;
            List<Dictionary<string, string>> TempLangList = new List<Dictionary<string, string>>();
            TempLangList.Add(new Dictionary<string, string>());
            TextPages.Add(TempLangList);

            if (TextPages[pagePos].Count <= langPos)//if the language is not in memory, find adds it.
            {
                TextPages[pagePos].Add(new Dictionary<string, string>());
            }

        }

        string[] StringFormatArr = { };
        if (textName.IndexOf(',') > 0)
        {
            textName = textName.Substring(0, textName.IndexOf(','));
            StringFormatArr = textName.Substring(textName.IndexOf(',') + 1, textName.Length - 2).Split(',');
        }




        if (TextPages[pagePos][langPos].ContainsKey(textName))// if the text doesn't exist in the dictionary, gets it from DB
        {
            TheText = string.Format(TextPages[pagePos][langPos][textName], StringFormatArr);
        }
        else
        {
            MySql.Data.MySqlClient.MySqlDataReader MyReader = null;
            using (MySql.Data.MySqlClient.MySqlConnection con = new MySql.Data.MySqlClient.MySqlConnection(ConnStr))
            {
                con.Open();

                {
                    //looking for the translation in dictionary
                    string sql = "SELECT `" + lang + "` FROM langtext WHERE `TextName`='" + textName.Replace("'", "''") + "' AND `PageName`='" + PageName + "'";
                    MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand(sql, con);
                    MyReader = cmd.ExecuteReader();
                    if (MyReader.Read())
                    {
                        TextPages[pagePos][langPos][textName] = MyReader[lang].ToString();
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

                                if (HebText != "")
                                {
                                    if (lang.ToLower() != "eng")
                                    {
                                        cmd2.CommandText = "INSERT INTO langtext (TextName,PageName, `" + lang + "`,`Eng`) VALUES ('" + textName.Replace("'", "''") + "','" + PageName + "','" + HebText.Replace("'", "''") + "','" + textName.Replace("'", "''") + "')";
                                    }
                                    else
                                    {
                                        cmd2.CommandText = "INSERT INTO langtext (TextName,PageName, `" + lang + "`) VALUES ('" + textName.Replace("'", "''") + "','" + PageName + "','" + HebText.Replace("'", "''") + "')";
                                    }

                                    TextPages[pagePos][langPos][textName] = HebText;
                                }
                                else
                                {
                                    if (lang.ToLower() != "eng")
                                    {
                                        cmd2.CommandText = "INSERT INTO langtext (TextName,PageName, `" + lang + "`,`Eng`) VALUES ('" + textName.Replace("'", "''") + "','" + PageName + "','####" + textName + "####','" + textName.Replace("'", "''") + "')";
                                    }
                                    else
                                    {
                                        cmd2.CommandText = "INSERT INTO langtext (TextName,PageName, `" + lang + "`) VALUES ('" + textName.Replace("'", "''") + "','" + PageName + "','####" + textName + "####')";
                                    }
                                    TextPages[pagePos][langPos][textName] = "####" + textName + "####";
                                }
                                cmd2.ExecuteNonQuery();
                                con2.Close();
                            }
                        }
                    }
                    TheText = string.Format(TextPages[pagePos][langPos][textName], StringFormatArr);
                }

                con.Close();
            }
        }



        return TheText;
    }



    public static string MyText(string textName, string lang)
    {
        string ConnStr = System.Configuration.ConfigurationManager.ConnectionStrings["ConnectionString1"].ConnectionString;
        string TheText = "";
        string PageName = "general";
        string HebText = "";
        int langPos = 0;
        int pagePos = 0;


        if (textName.Contains("_"))
        {


            PageName = textName.Remove(textName.IndexOf("_"));
            textName = textName.Substring(textName.IndexOf("_") + 1);
        }

        if (textName.Contains("_"))
        {
            HebText = textName.Substring(textName.IndexOf("_") + 1);
            textName = textName.Remove(textName.IndexOf("_"));
        }

        if (LangNames.Contains(lang))//if the language is in memory, find it's position.
        {
            langPos = LangNames.IndexOf(lang);
        }
        else//if the language is not in memory, find adds it.
        {
            LangNames.Add(lang);
            langPos = LangNames.Count - 1;
        }


        if (PageNames.Contains(PageName) && TextPages.Count > pagePos)//if the page is in memory, find it's position.
        {
            pagePos = PageNames.IndexOf(PageName);
            if (TextPages[pagePos].Count <= langPos)//if the language is not in memory, find adds it.
            {
                TextPages[pagePos].Add(new Dictionary<string, string>());
            }
        }
        else//if the page is not in memory, find adds it.
        {
            PageNames.Add(PageName);
            pagePos = PageNames.Count - 1;
            List<Dictionary<string, string>> TempLangList = new List<Dictionary<string, string>>();
            TempLangList.Add(new Dictionary<string, string>());
            TextPages.Add(TempLangList);

            if (TextPages[pagePos].Count <= langPos)//if the language is not in memory, find adds it.
            {
                TextPages[pagePos].Add(new Dictionary<string, string>());
            }

        }

        string[] StringFormatArr = { };
        if (textName.IndexOf(',') > 0)
        {
            textName = textName.Substring(0, textName.IndexOf(','));
            StringFormatArr = textName.Substring(textName.IndexOf(',') + 1, textName.Length - 2).Split(',');
        }




        if (TextPages[pagePos][langPos].ContainsKey(textName))// if the text doesn't exist in the dictionary, gets it from DB
        {
            TheText = string.Format(TextPages[pagePos][langPos][textName], StringFormatArr);
        }
        else
        {
            MySql.Data.MySqlClient.MySqlDataReader MyReader = null;
            using (MySql.Data.MySqlClient.MySqlConnection con = new MySql.Data.MySqlClient.MySqlConnection(ConnStr))
            {
                con.Open();

                {
                    //looking for the translation in dictionary
                    string sql = "SELECT `" + lang + "` FROM langtext WHERE `TextName`='" + textName.Replace("'", "''") + "' AND `PageName`='" + PageName + "'";
                    MySql.Data.MySqlClient.MySqlCommand cmd = new MySql.Data.MySqlClient.MySqlCommand(sql, con);
                    MyReader = cmd.ExecuteReader();
                    if (MyReader.Read())
                    {
                        TextPages[pagePos][langPos][textName] = MyReader[lang].ToString();
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

                                if (HebText != "")
                                {
                                    if (lang.ToLower() != "eng")
                                    {
                                        cmd2.CommandText = "INSERT INTO langtext (TextName,PageName, `" + lang + "`,`Eng`) VALUES ('" + textName.Replace("'", "''") + "','" + PageName + "','" + HebText.Replace("'", "''") + "','" + textName.Replace("'", "''") + "')";
                                    }
                                    else
                                    {
                                        cmd2.CommandText = "INSERT INTO langtext (TextName,PageName, `" + lang + "`) VALUES ('" + textName.Replace("'", "''") + "','" + PageName + "','" + HebText.Replace("'", "''") + "')";
                                    }

                                    TextPages[pagePos][langPos][textName] = HebText;
                                }
                                else
                                {
                                    if (lang.ToLower() != "eng")
                                    {
                                        cmd2.CommandText = "INSERT INTO langtext (TextName,PageName, `" + lang + "`,`Eng`) VALUES ('" + textName.Replace("'", "''") + "','" + PageName + "','####" + textName + "####','" + textName.Replace("'", "''") + "')";
                                    }
                                    else
                                    {
                                        cmd2.CommandText = "INSERT INTO langtext (TextName,PageName, `" + lang + "`) VALUES ('" + textName.Replace("'", "''") + "','" + PageName + "','####" + textName + "####')";
                                    }
                                    TextPages[pagePos][langPos][textName] = "####" + textName + "####";
                                }
                                cmd2.ExecuteNonQuery();
                                con2.Close();
                            }
                        }
                    }
                    TheText = string.Format(TextPages[pagePos][langPos][textName], StringFormatArr);
                }

                con.Close();
            }
        }



        return TheText;
    }


}
