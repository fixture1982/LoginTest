<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="login.ascx.cs" Inherits="程序.login1" %>
<table>
<tr>
<td>用户名：</td>
<td><asp:TextBox ID="Txt_user" runat="server"></asp:TextBox><asp:RequiredFieldValidator
        ID="RequiredFieldValidator1" ControlToValidate="Txt_user" runat="server" ErrorMessage="用户名不能为空！"></asp:RequiredFieldValidator></td>
</tr>
<tr>
<td>密码：</td>
<td><asp:TextBox ID="Txt_pwd" runat="server" TextMode="Password"></asp:TextBox>
    <asp:RequiredFieldValidator ControlToValidate="Txt_pwd" ID="RequiredFieldValidator2" runat="server" ErrorMessage="密码不能为空！"></asp:RequiredFieldValidator>
</td>
</tr>
<tr>
  <td>
      <asp:Button ID="Btn_login" runat="server" Text="登录" onclick="Btn_login_Click" /></td>
  <td>
     <input type="button" id="cancel" value="退出" onclick="login()"/></td>
</tr>
</table>
<script type="text/javascript">
    function login() {
        window.close();
    }
</script>