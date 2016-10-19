using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Timers;

/// <summary>
/// Summary description for AutoClear
/// </summary>
public static class AutoClear
{

    static Timer SendTimer = new Timer();
  

    public static void Start()
    {

        SendTimer.Elapsed += new ElapsedEventHandler(checkonline);
        SendTimer.Interval = 60000;//Starts sending every 60 secs.
        SendTimer.Start();

    }
    private static void checkonline(object source, ElapsedEventArgs e)
    {

        List<int> mylist = methods.MemberList.Keys.ToList<int>();
        foreach (int item in mylist)
        {
            if ((DateTime.Now - methods.MemberList[item].Date).TotalSeconds > 60)
            {
               methods.MemberList.Remove(item);
            }
        
        }

    }
	
}