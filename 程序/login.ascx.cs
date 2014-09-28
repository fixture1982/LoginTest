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
    public partial class login1 : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Btn_login_Click(object sender, EventArgs e)
        {
            if (Txt_user.Text == "admin" && Txt_pwd.Text == "admin")
            {
                Response.Write("<script>alert('登录成功！')</script>");
            }
            else
            {
                Response.Write("<script>alert('登录失败！')</script>");
            }
        }
    }
}