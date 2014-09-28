<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loginpage.aspx.cs" Inherits="程序.loginpage" %>
    <%@ Register Src="~/login.ascx" TagName="login" TagPrefix="uc1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>使用用户控件实现登陆界面</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <uc1:login ID="uc_login" runat="server" />
    </div>
    </form>


</body>
</html>
