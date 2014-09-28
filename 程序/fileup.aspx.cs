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
using System.IO;

namespace 程序
{
    public partial class fileup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            if (FileUpload1.HasFile)
            {
                if (File.Exists(Server.MapPath("~/up/") + FileUpload1.FileName))
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('该文件已存在！');</script>");
                }
                else
                {
                    FileUpload1.PostedFile.SaveAs(Server.MapPath("~/up/") + FileUpload1.FileName);
                    if (File.Exists(Server.MapPath("~/up/") + FileUpload1.FileName))
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('上传成功！');</script>");
                    }
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "", "<script>alert('尚未选择文件！');</script>");
            }
        }


    }
}
