<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="����.Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>��վ�����̨��½����</title>
    <STYLE type=text/css>A:link {
	COLOR: #000000; FONT-FAMILY: AdobeSm; TEXT-DECORATION: none
}
A:visited {
	COLOR: #000000; TEXT-DECORATION: none
}
A:hover {
	COLOR: green; FONT-FAMILY: ����,MingLiU; TEXT-DECORATION: underline
}
BODY {
	FONT-SIZE: 9pt; COLOR: #000000; FONT-FAMILY: ����,MingLiU, Arial
}
TD {
	TABLE-LAYOUT: fixed; FONT-SIZE: 9pt; COLOR: #000000; WORD-BREAK: break-all; FONT-FAMILY: ����,MingLiU, Arial
}
P {
	FONT-SIZE: 9pt; COLOR: #000000; FONT-FAMILY: ����,MingLiU, Arial
}
INPUT {
	FONT-SIZE: 9pt; COLOR: #000000; FONT-FAMILY: ����,MingLiU, Arial
}
BODY {
	MARGIN: 0px; COLOR: #000000
}
SELECT {
	FONT-SIZE: 9pt
}
OPTION {
	FONT-SIZE: 9pt
}
TEXTAREA {
	FONT-SIZE: 9pt
}
</STYLE>
<script type="text/javascript" language="javascript">
    var p1 = document.getElementById("panel1");
    var p2 = document.getElementById("Panel2");

</script>
    <SCRIPT language=VBScript type=text/vbscript><!--
function FrontPage_Form1_onsubmit()
  Set theForm = document.FrontPage_Form1

  If (theForm.user.value = "") Then
    MsgBox "���� �û��� ��������ֵ��", 0, "��Ч����֤����"
    theForm.user.focus()
    FrontPage_Form1_onsubmit = False
    Exit Function
  End If

  If (Len(theForm.user.value) < 2) Then
    MsgBox "�� �û��� ���У����������� 2 ���ַ���", 0, "��Ч����֤����"
    theForm.user.focus()
    FrontPage_Form1_onsubmit = False
    Exit Function
  End If

  If (Len(theForm.user.value) > 20) Then
    MsgBox "�� �û��� ���У���������� 20 ���ַ���", 0, "��Ч����֤����"
    theForm.user.focus()
    FrontPage_Form1_onsubmit = False
    Exit Function
  End If

  If (theForm.pass.value = "") Then
    MsgBox "���� ���� ��������ֵ��", 0, "��Ч����֤����"
    theForm.pass.focus()
    FrontPage_Form1_onsubmit = False
    Exit Function
  End If

  If (Len(theForm.pass.value) < 5) Then
    MsgBox "�� ���� ���У����������� 5 ���ַ���", 0, "��Ч����֤����"
    theForm.pass.focus()
    FrontPage_Form1_onsubmit = False
    Exit Function
  End If

  If (Len(theForm.pass.value) > 20) Then
    MsgBox "�� ���� ���У���������� 20 ���ַ���", 0, "��Ч����֤����"
    theForm.pass.focus()
    FrontPage_Form1_onsubmit = False
    Exit Function
  End If

  If (theForm.XuasYzm.value = "") Then
    MsgBox "���� ��֤�� ��������ֵ��", 0, "��Ч����֤����"
    theForm.XuasYzm.focus()
    FrontPage_Form1_onsubmit = False
    Exit Function
  End If

  If (Len(theForm.XuasYzm.value) < 5) Then
    MsgBox "�� ��֤�� ���У����������� 5 ���ַ���", 0, "��Ч����֤����"
    theForm.XuasYzm.focus()
    FrontPage_Form1_onsubmit = False
    Exit Function
  End If

  If (Len(theForm.XuasYzm.value) > 5) Then
    MsgBox "�� ��֤�� ���У���������� 5 ���ַ���", 0, "��Ч����֤����"
    theForm.XuasYzm.focus()
    FrontPage_Form1_onsubmit = False
    Exit Function
  End If

  checkOK = "0123456789-" 
  checkStr = theForm.XuasYzm.value
  allValid = True
  validGroups = True
  decPoints = 0
  allNum = ""
  For i = 1 to len(checkStr)
    ch = Mid(checkStr, i, 1)
    If (InStr(checkOK, ch) = 0) Then
        allValid = False
        Exit For
    End If
    allNum = allNum & ch
  Next
  If (Not allValid) Then
    MsgBox "�� ��֤�� ���У�ֻ������ ���� �ַ���", 0, "��Ч����֤����"
    theForm.XuasYzm.focus()
    FrontPage_Form1_onsubmit = False
    Exit Function
  End If

  If ((checkstr <> "" And Not IsNumeric(allNum)) Or (decPoints > 1) Or Not validGroups) Then
    MsgBox "���� XuasYzm ��������һ����Ч���֡�", 0, "��Ч����֤����"
    theForm.XuasYzm.focus()
    FrontPage_Form1_onsubmit = False
    Exit Function
  End If
  FrontPage_Form1_onsubmit = True 
End Function
--></SCRIPT>
</head>
<body style=" margin-left:0px; margin-top:0px;">

    <FORM name="FrontPage_Form1" method="post" target="_top"  runat="server">

    
    <asp:Panel ID="panel1" runat="server">
<%--                <asp:SiteMapPath ID="SiteMapPath1" ShowToolTips="true" runat="server" Font-Names="Verdana" Font-Size="12" PathSeparator="<<">
                  
        </asp:SiteMapPath>--%>
<DIV align=center>
<TABLE id=table9 height="100%" cellSpacing=0 cellPadding=0 width="100%" 
border=0>
  <TBODY>
  <TR>
    <TD 
    style="TABLE-LAYOUT: fixed; FONT-SIZE: 9pt; COLOR: #000000; WORD-BREAK: break-all; FONT-FAMILY: ����,MingLiU, Arial">
      <DIV align=center>
      <TABLE id=table10 height=364 cellSpacing=0 cellPadding=0 width=563 
      background=��վ��̨��¼_files/admin_login.jpg border=0>
        <TBODY>
        <TR>
          <TD 
          style="TABLE-LAYOUT: fixed; FONT-SIZE: 9pt; COLOR: #000000; WORD-BREAK: break-all; FONT-FAMILY: ����,MingLiU, Arial" 
          vAlign=top>
            <DIV align=center>
            <DIV align=center>
            <TABLE id=table11 cellSpacing=0 cellPadding=0 width="100%" 
              border=0><TBODY>
              <TR>
                <TD 
                style="TABLE-LAYOUT: fixed; FONT-SIZE: 9pt; COLOR: #000000; WORD-BREAK: break-all; FONT-FAMILY: ����,MingLiU, Arial" 
                width=207 height=130>��</TD>
                <TD 
                style="TABLE-LAYOUT: fixed; FONT-SIZE: 9pt; COLOR: #000000; WORD-BREAK: break-all; FONT-FAMILY: ����,MingLiU, Arial" 
                height=130></TD>
                <TD 
                style="TABLE-LAYOUT: fixed; FONT-SIZE: 9pt; COLOR: #000000; WORD-BREAK: break-all; FONT-FAMILY: ����,MingLiU, Arial" 
                width=37 height=130>��</TD></TR>
              <TR>
                <TD 
                style="TABLE-LAYOUT: fixed; FONT-SIZE: 9pt; COLOR: #000000; WORD-BREAK: break-all; FONT-FAMILY: ����,MingLiU, Arial" 
                width=207 height=111>��</TD>
                <TD 
                style="TABLE-LAYOUT: fixed; FONT-SIZE: 9pt; COLOR: #000000; WORD-BREAK: break-all; FONT-FAMILY: ����,MingLiU, Arial" 
                height=111>
                        <table width="277" height="77" border="0" id="Tb_login">
  <tr>
    <td width="84">�û�����</td>
    <td width="179"><asp:TextBox ID="Txt_LoginUser" runat="server" BorderColor="#FFFFCC" 
            BorderStyle="Ridge"></asp:TextBox></td>
  </tr>
  <tr>
    <td>���룺</td>
    <td><asp:TextBox ID="Txt_password" runat="server" BorderColor="#FFFFCC" 
            BorderStyle="Ridge" TextMode="Password"></asp:TextBox></td>
  </tr>
</table></TD>
                <TD 
                style="TABLE-LAYOUT: fixed; FONT-SIZE: 9pt; COLOR: #000000; WORD-BREAK: break-all; FONT-FAMILY: ����,MingLiU, Arial" 
                width=37 height=111>��</TD></TR>
              <TR>
                <TD 
                style="TABLE-LAYOUT: fixed; FONT-SIZE: 9pt; COLOR: #000000; WORD-BREAK: break-all; FONT-FAMILY: ����,MingLiU, Arial" 
                width=207>��</TD>
                <TD 
                style="TABLE-LAYOUT: fixed; FONT-SIZE: 9pt; COLOR: #000000; WORD-BREAK: break-all; FONT-FAMILY: ����,MingLiU, Arial">��</TD>
                <TD 
                style="TABLE-LAYOUT: fixed; FONT-SIZE: 9pt; COLOR: #000000; WORD-BREAK: break-all; FONT-FAMILY: ����,MingLiU, Arial" 
                width=37>��</TD></TR>
              <TR>
                <TD 
                style="TABLE-LAYOUT: fixed; FONT-SIZE: 9pt; COLOR: #000000; WORD-BREAK: break-all; FONT-FAMILY: ����,MingLiU, Arial" 
                width=207>��</TD>
                <TD 
                style="TABLE-LAYOUT: fixed; FONT-SIZE: 9pt; COLOR: #000000; WORD-BREAK: break-all; FONT-FAMILY: ����,MingLiU, Arial">
                  <P align=center>
                      <asp:ImageButton ID="ImageButton1" runat="server" 
                          ImageUrl="~/��վ��̨��¼_files/login001.jpg" onclick="ImageButton1_Click" />
                      &nbsp;
                      <asp:ImageButton ID="ImageButton2" runat="server" 
                          ImageUrl="~/��վ��̨��¼_files/login002.jpg" />
                    </P></TD>
                <TD 
                style="TABLE-LAYOUT: fixed; FONT-SIZE: 9pt; COLOR: #000000; WORD-BREAK: break-all; FONT-FAMILY: ����,MingLiU, Arial" 
                width=37>��</TD></TR>
              <TR>
                <TD 
                style="TABLE-LAYOUT: fixed; FONT-SIZE: 9pt; COLOR: #000000; WORD-BREAK: break-all; FONT-FAMILY: ����,MingLiU, Arial" 
                width=207 height=56>��</TD>
                <TD 
                style="TABLE-LAYOUT: fixed; FONT-SIZE: 9pt; COLOR: #000000; WORD-BREAK: break-all; FONT-FAMILY: ����,MingLiU, Arial" 
                height=56>��</TD>
                <TD 
                style="TABLE-LAYOUT: fixed; FONT-SIZE: 9pt; COLOR: #000000; WORD-BREAK: break-all; FONT-FAMILY: ����,MingLiU, Arial" 
                width=37 height=56>��</TD></TR>
              <TR>
                <TD 
                style="TABLE-LAYOUT: fixed; FONT-SIZE: 9pt; COLOR: #000000; WORD-BREAK: break-all; FONT-FAMILY: ����,MingLiU, Arial" 
                width=207>&nbsp;��<FONT color=#ffbec6>2010-2-3 
                11:51:29</FONT></TD>
                <TD 
                style="TABLE-LAYOUT: fixed; FONT-SIZE: 9pt; COLOR: #000000; WORD-BREAK: break-all; FONT-FAMILY: ����,MingLiU, Arial"></TD>
                <TD 
                style="TABLE-LAYOUT: fixed; FONT-SIZE: 9pt; COLOR: #000000; WORD-BREAK: break-all; FONT-FAMILY: ����,MingLiU, Arial" 
                width=37>��</TD></TR></TBODY></TABLE></DIV></DIV></TD></TR></TBODY></TABLE></DIV></TD></TR></TBODY></TABLE></DIV></asp:Panel></FORM>
</body>
</html>
