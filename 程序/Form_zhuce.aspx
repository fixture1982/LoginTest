<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form_zhuce.aspx.cs" Inherits="����.Form_zhuce" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>����֤���ܵ�ע���</title>
<meta name="author" content="he" />
<meta name="keywords" content="�û�ע��" />
<meta name="description" content="�йش������û�ע�ᡣ" />
<link media="screen" rel="stylesheet" href="http://icon.zol-img.com.cn/front_end/css/cg_reset.css" type="text/css">
<link href="reg.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript" src="./js/ajax.js"></script>
<script language="javascript" type="text/javascript" src="./js/GlobalProvinces.js"></script>
            <style type="text/css">
        .style1
        {
                    width: 96px;
                }
    </style>
</head>
<body class="div_body">
  <div class="head clearfix"> <a href="http://www.zol.com.cn/" class="logo"><img src="http://icon.zol.com.cn/logo.gif" /></a> <strong>�û�ע��</strong> 
    
  </div>
	<form id="form1" runat="server">
<input type="hidden" name="act" value="lit_register">
<input type="hidden" name="backUrl" value="http://www.baidu.com/s?bs=%D3%C3%BB%A7%D7%A2%B2%E1%C4%A3%B0%E5&f=8&wd=%D3%C3%BB%A7%D7%A2%B2%E1">
<input type="hidden" name="usercode" value="">
<input type="hidden" name="user_code" value="">
<input type="hidden" name="bbsid" value="0">
<input type="hidden" name="miniblog" value="0">
<input type="hidden" name="invite_from" value="">
<input type="hidden" name="active_flag" value="0">
  <div style=" margin-left:180px;">
     <table border="0" cellpadding="0" cellspacing="0" 
                   style="width:500px; height: 275px;">
              <tr>
                <td class="style1" align="center">�û���</td>
                <td width="180"><asp:TextBox ID="username" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="�û�������Ϊ�գ�" ControlToValidate="username"></asp:RequiredFieldValidator>
               </td>
              </tr>
              <tr>
                <td class="style1" align="center">���룺</td>
                <td><asp:TextBox ID="pwd" runat="server"></asp:TextBox>
                   <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="���벻��Ϊ�գ�" ControlToValidate="pwd"></asp:RequiredFieldValidator>
                </td>
                 
              </tr>
              <tr>
                <td class="style1" align="center">ȷ�����룺</td>
                <td><asp:TextBox ID="surepwd" runat="server"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
            ErrorMessage="����ǰ�����룬��һ�£�" ControlToCompare="pwd" 
            ControlToValidate="surepwd"></asp:CompareValidator>
                </td>
              </tr>
                <tr>
                <td class="style1" align="center">���䣺</td>
                <td><asp:TextBox ID="age" runat="server"></asp:TextBox>
                       <asp:RangeValidator ID="RangeValidator1" runat="server" 
            ErrorMessage="���䲻�ڹ涨��Χ�ڣ�" ControlToValidate="age" MaximumValue="100" 
            MinimumValue="0" Type="Integer"></asp:RangeValidator>
                </td>
              </tr>
                <tr>
                <td class="style1" align="center">���䣺</td>
                <td><asp:TextBox ID="email" runat="server"></asp:TextBox>
                  <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ErrorMessage="�����ʽ������" ControlToValidate="email" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
              </tr>
                <tr>
                <td class="style1" align="center">���֤�ţ�</td>
                <td><asp:TextBox ID="idCard" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator ControlToValidate="idCard" ID="RegularExpressionValidator2" runat="server" ErrorMessage="������Ч�����֤��!" ValidationExpression="\d{17}[\d|X]\d{15}"></asp:RegularExpressionValidator>
                </td>
              </tr>
              <tr>
                <td class="style1">
                    <asp:Button ID="Btn_zhuce" runat="server" Text="ע��"/></td>
                <td>
                    <asp:Button ID="Btn_reset" runat="server" Text="����" /></td>
              </tr>
            </table>
    </div>
  
</form>
</body>
</html>
