<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="程序.WebForm1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
    <SCRIPT Language="JavaScript">
function checkIDCard (str) 
{ 
var isIDcard=/^(\d{15}|\d{17}[x0-9])$/i;
if (isIDcard.test(str))
{    
return true;
}
alert("请重新输入正确的身份证码！");
return false;

}  
</SCRIPT>
</head>
<body>
    <form id="form1" runat="server">
    <div>
          <input name="User_iden" id="User_iden" size="18">
    <input type="button" name="testcall" value="验证身份证号码" onclick="checkIDCard(User_iden.value)">
    </div>
    </form>
</body>
</html>
