using System;
using System.Data;
using System.Configuration;
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
    public class login
    {
        public static bool Islogin(string username,string pwd)
        {
            if (username == "admin" && pwd == "admin")
            {
                return true;
            }
            return false;
        }
    }
}
