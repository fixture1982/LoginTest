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
    public partial class ThemePage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["t"] != null)
                {
                    DropDownList1.SelectedValue = Request.QueryString["t"].ToString();
                }  
            }
        }

        protected void Page_PreInit(object sender, EventArgs e)
        {
            string theme = Request.QueryString["t"];
            Page.Theme = theme;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            Session["theme"] = DropDownList1.SelectedItem.Value;
            Response.Redirect("ThemePage.aspx?t="+Session["theme"].ToString());
        }

    }
}
