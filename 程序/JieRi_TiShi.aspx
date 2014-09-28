<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="JieRi_TiShi.aspx.cs" Inherits="程序.JieRi_TiShi" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>带节日的日历</title>
    <meta name="keywords" content="网易邮箱，免费邮箱，最专业的电子邮局，WebIM，网络聊天，好友系统">
<meta name="description" content="网易免费邮箱-中国第一大电子邮件服务商，提供最专业的电子邮件系统和基于网络的WebIM聊天服务，无需下载软件。">
<meta name="title" content="网易邮箱 - 中国第一大电子邮件服务商">
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<link href="http://mimg.126.net/xm/reg_all/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/mailregAll/js/md5-min.js"></script>
<script type="text/javascript" src="/mailregAll/js/jquery-1.3.1.min.js"></script>
<script type="text/javascript" src="/mailregAll/js/jquery_ajax.js"></script>
<script type="text/javascript" src="/mailregAll/js/requestUtil.js"></script>
<script type="text/javascript" src="/mailregAll/js/function.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="header"> 
	<a href="http://email.163.com/"><img src="http://mimg.126.net/xm/friends/login_res/img/logo_netease.gif" alt="网易邮箱" class="logo" /></a>
	<div class="logo_w" title="中国第一大电子邮件服务商"><a href="http://mail.163.com/html/mail_intro/" target="_blank" class="Aknow">了解网易免费邮</a></div>
    <div class="head_links"><!-- <a href="http://mail.163.com/" target="_blank" title="网易163免费邮">163</a>&nbsp;&nbsp;&nbsp;<a href="http://www.126.com/" target="_blank" title="网易126免费邮">126</a>&nbsp;&nbsp;&nbsp; --><a href="http://help.163.com/" target="_blank" title="帮助">帮助</a>&nbsp;&nbsp;&nbsp;</div>
</div>

<div class="content">
	<div class="mhd">
    	<div class="tit"><a href="http://mail.163.com/html/mail_intro/" target="_blank" class="Aknow2">了解网易免费邮</a></div>
 	</div>
    <div class="mcont">
        	<!-- 分拆补充资料部分 Start -->
<div id="sysmessage" class="err-info" style="display:none"></div>
<input type="hidden" name="tmp" id="tmp" value="" />

<form id="regform" onsubmit="return false;">
   <div id="Main">
        <asp:Calendar ID="Calendar1" runat="server" ondayrender="Calendar1_DayRender" 
            BackColor="White" BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" 
            DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" 
            ForeColor="#003399" Height="200px" Width="220px">
            <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
            <WeekendDayStyle BackColor="#CCCCFF" />
            <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
            <OtherMonthDayStyle ForeColor="#999999" />
            <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
            <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
            <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" 
                Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
        </asp:Calendar>
    </div>
</form>
    	<!-- 分拆补充资料部分 End -->

    
    
    </div>
    <div class="mft"></div>
</div>



<div class="footer"><A href="http://corp.163.com/index_gb.html" target="_blank">关于网易</A>&nbsp;&nbsp;<A href="http://mail.blog.163.com/" target="_blank">邮箱官方博客</A>&nbsp;&nbsp;<A href="http://www.188.com/" target="_blank">财富邮</A>&nbsp;&nbsp;<A href="http://cards.163.com/" target="_blank">精美贺卡</A>&nbsp;&nbsp;<A href="http://safesurf.china.cn/data_form.php" target="_blank">举报违法信息</A>&nbsp;&nbsp;<A href="http://help.163.com/" target="_blank">客户服务</A><BR /><A href="http://corp.163.com/gb/legal/legal.html" target="_blank">相关法律</A>&nbsp;&nbsp;|&nbsp;&nbsp;网易公司版权所有&nbsp;&copy;&nbsp;1997-<script language="javascript" src="http://mimg.163.com/copyright/year.js"></script></div>

<!-- START NetEase Devilfish 2006 -->
<script src="http://analytics.163.com/ntes.js" type="text/javascript"></script>
<script type="text/javascript">
_ntes_nacc = "163mail";
neteaseTracker();
</script>
    </form>
</body>
</html>
