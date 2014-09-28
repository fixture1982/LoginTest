<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jianli.aspx.cs" Inherits="程序.jianli" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <h3>个人信息</h3>
  <table border="0" cellpadding="0" cellspacing="2">
    <tr>
    <td>姓名：</td>
    <td><input  type="text"/></td>
    <td>出生年月：</td>
    <td>
    <select name="select">
      <option>2010</option>
      <option>2011</option>
      <option>2012</option>
      <option>2013</option>
    </select>
   年
<select>
    <option>1</option>
      <option>2</option>
      <option>3</option>
      <option>4</option>
   </select>月
    <select>
      <option>1</option>
      <option>2</option>
      <option>3</option>
      <option>4</option>
    </select>
    </td>
    </tr>
    <tr>
    <td>身份证号：</td>
    <td><input type="text" /></td>
    <td>籍贯</td>
    <td><input type="text" /></td>
    </tr>
    <tr>
       <td>手机号码：</td>
       <td><input type="text" value=""/></td>
       <td>现居住地</td>
       <td><input type="text" /></td>
    </tr>
   </table>
    
    <h3>教育背景</h3>
    <table>
      <tr>
        <td>毕业院校</td>
        <td><input type="text" /></td>
        <td>所学专业</td>
        <td><input type="text" /></td>
      </tr>
    </table>
    <h3>工作经验</h3>
    <div><textarea></textarea></div>
    
    <h3>应聘职位</h3>
    <table>
       <tr>
          <td>应聘职位</td>
          <td><input type="text" /></td>
          <td>期望工资</td>
          <td><input type="text" /></td>
       </tr>
    </table>
    <input type="submit" value="注册" />
    </div>
    </form>
</body>
</html>
