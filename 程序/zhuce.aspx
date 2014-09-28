<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="zhuce.aspx.cs" Inherits="程序.zhuce" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>注册表单验证实例</title>
    <script type="text/javascript" language="javascript">
     function YanZheng()
	 {
		  var usernames=document.getElementById("username");
		  var pwd=document.getElementById("pwd");
		  var surepwd=document.getElementById("surepwd");
		  var age=document.getElementById("age");
		  var email = document.getElementById("email");
		  var idcard = document.getElementById("idCard");
		  if(usernames.value=="")
		  {
			   alert("用户名不能为空！");
			   return false;
			  }
			  if (pwd.value == "") {
			      alert("密码不能为空！");
			      return false;
			  }
			  if (age.value == "") {
			      alert("年龄不能为空！");
			      return false;
			  }
			  if (email.value == "") {
			      alert("邮箱不能为空！");
			      return false;
			  }
			  if (idcard.value == "") {
			      alert("身份证号不能为空！");
			      return false;
			  }
			  return true
		 }
</script>
    <style type="text/css">
        .style1
        {
            width: 60px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style=" font-family:@Adobe 宋体 Std L; color:Gray; font-size:12px; margin-top:150px; margin-left:200px; ">
               <table border="0" cellpadding="0" cellspacing="0" height="85" 
                   style="width: 101%">
              <tr>
                <td class="style1" align="center">用户名</td>
                <td width="180"><asp:TextBox ID="username" runat="server"></asp:TextBox>
                    
               </td>
              </tr>
              <tr>
                <td class="style1" align="center">密码：</td>
                <td><asp:TextBox ID="pwd" runat="server"></asp:TextBox></td>
              </tr>
              <tr>
                <td class="style1" align="center">确认密码：</td>
                <td><asp:TextBox ID="surepwd" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ErrorMessage="密码前后输入，不一致！" ControlToCompare="pwd" 
            ControlToValidate="surepwd"></asp:CompareValidator>
                </td>
              </tr>
                <tr>
                <td class="style1" align="center">年龄：</td>
                <td><asp:TextBox ID="age" runat="server"></asp:TextBox>
                       <asp:RangeValidator ID="RangeValidator1" runat="server" 
            ErrorMessage="年龄不在规定范围内！" ControlToValidate="age" MaximumValue="100" 
            MinimumValue="0" Type="Integer"></asp:RangeValidator>
                </td>
              </tr>
                <tr>
                <td class="style1" align="center">邮箱：</td>
                <td><asp:TextBox ID="email" runat="server"></asp:TextBox>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ErrorMessage="邮箱格式不符！" ControlToValidate="email" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
              </tr>
                <tr>
                <td class="style1" align="center">身份证号：</td>
                <td><asp:TextBox ID="idCard" runat="server"></asp:TextBox></td>
              </tr>
              <tr>
                <td class="style1">
                    <asp:Button ID="Btn_zhuce" runat="server" Text="注册"  OnClientClick="YanZheng()"
                        onclick="Btn_zhuce_Click"/></td>
                <td>
                    <asp:Button ID="Btn_reset" runat="server" Text="重置" /></td>
              </tr>
            </table>
</div>
</form>
</body>
</html>
