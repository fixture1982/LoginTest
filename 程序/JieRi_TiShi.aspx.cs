using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

namespace 程序
{
    public partial class JieRi_TiShi : System.Web.UI.Page
    {
        String[][] holidays = new String[13][];
        protected void Page_Load(object sender, EventArgs e)
        {
               for (int i = 0; i < 13; i++)
               {
                   holidays[i] = new String[32];
               }
                   holidays[1][1] = "元旦";
                   holidays[2][14] = "情人节";
                   holidays[3][8] = "妇女节";
                   holidays[3][12] = "植树节";
                   holidays[4][1] = "愚人节";
                   holidays[5][1] = "劳动节";
                   holidays[5][4] = "青年节";
                   holidays[5][12] = "护士节";
                   holidays[5][14] = "母亲节";
                   holidays[5][14] = "助残日";
                   holidays[6][1] = "国际儿童节";
                   holidays[6][5] = "环境保护日";
                   holidays[6][18] = "父亲节";
                   holidays[6][26] = "国际禁毒日";
                   holidays[7][1] = "中共诞辰";
                   holidays[8][1] = "建军节";
                   holidays[9][10] = "教师节";
                   holidays[10][1] = "国庆节";
                   holidays[11][23] = "感恩节";
                   holidays[12][1] = "艾滋病日";
                   holidays[12][12] = "西安事变";
                   holidays[12][25] = "圣诞节";
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            CalendarDay d = ((DayRenderEventArgs)e).Day;
            TableCell c = ((DayRenderEventArgs)e).Cell;
            if (e.Day.IsOtherMonth)
            {
                e.Cell.Controls.Clear();
            }
            else
            {
                try
                {
                    string hol = holidays[e.Day.Date.Month][e.Day.Date.Day];
                    if (hol != string.Empty)
                    {
                        e.Cell.Controls.Add(new LiteralControl("<br><font color=blue size=2>" +hol + "</font>"));
                    }
                }
                catch (Exception exc)
                {
                    ClientScript.RegisterStartupScript(this.GetType(),"","<script>alert('"+exc.ToString()+"')</script>");
                }
            }
        }
    }
}
