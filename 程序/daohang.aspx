<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="daohang.aspx.cs" Inherits="程序.daohang" %>

<%@ Register Src="~/DaoHang.ascx" TagName="daohang" TagPrefix="uc2"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>使用用户控件为网站设计导航系统</title>
    <link href="style.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
      <div id="wrap">
      <div id="header"><h1>Green</h1></div>
          <uc2:daohang ID="dh" runat="server" />
        <div id="content">
        <div id="right"></div>
         <h1>Heading</h1>
        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, <a href="#">sed diam nonummy</a> nibh euismod tincidunt ut laoreet doloresit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip.</p>
        <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit, <a href="#">sed diam nonummy</a> nibh euismod tincidunt ut laoreet doloresit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat.</p></div>
        <div id="footer">
        <p>Copyright&copy; 2005 Your Company <br />
        |&nbsp;XHTML template by <a href="http://webzonecentral.com" target="blank">arwen54</a>&nbsp;|&nbsp;<a href="http://validator.w3.org/check?uri=referer" target="_blank">Valid XHTML</a>&nbsp;|&nbsp;<a href="http://jigsaw.w3.org/css-validator/" target="_blank">Valid CSS</a>&nbsp;|</p>
        </div>
        </div>
    </form>
</body>
</html>
