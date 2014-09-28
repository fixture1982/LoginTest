<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="fileup.aspx.cs" Inherits="程序.fileup" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div><h3>文件上传</h3></div>
    <div>
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Button ID="Btn_up" runat="server" onclick="Button1_Click" Text="上传" />
    </div>
    </form>
</body>
</html>
