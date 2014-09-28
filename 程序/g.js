/*
 * 注册类型切换事件
 */
var g_Switch="";
function f_InitSwitch(lo_apply_qq,lo_apply_email)
{
    var la_url=[
        "http://reg.qq.com/",
        "http://emailreg.qq.com/email/step0.shtml"
        ];
    try
    {
        if(lo_apply_qq.checked) 
        {
            g_Switch = "qq";
        }else if(lo_apply_email.checked)
        {
            g_Switch = "email";
        }
        else
            g_Switch = ""; 
        lo_apply_qq.onclick    = function(){if(g_Switch!="qq") {location.replace(la_url[0]); } return false;}
        lo_apply_email.onclick = function(){if(g_Switch!="email") {location.replace(la_url[1]);} return false; }
    }catch(e) {}
}

//f_InitSwitch(document.forms[0].elements[0],document.forms[0].elements[1]);
