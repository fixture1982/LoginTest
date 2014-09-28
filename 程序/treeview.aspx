<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="treeview.aspx.cs" Inherits="程序.treeview" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>在网页中实现树形导航</title>
<meta name="keywords" content="1.,Asp.Net,Asp.Net,构架,Http,Handler,介绍,Part.2" />
<meta name="description" content="在本文中，我通过三个实例：图片防盗链、图片验证码、处理自定义后缀名请求，详细介绍了IHttpHandler的实现方法和使用过程。对 IHttpHandlerFactory也作了概要介绍。" />
<link type="text/css" rel="stylesheet" href="http://www.cnblogs.com/css/common.css"/>
<link id="MainCss" type="text/css" rel="stylesheet" href="http://www.cnblogs.com/Skins/LessIsMore/style.css"/>
<link type="text/css" rel="stylesheet" href="http://www.cnblogs.com/css/common2.css"/>
<link type="text/css" rel="stylesheet" href="http://common.cnblogs.com/css/shCore.css"/>
<link type="text/css" rel="stylesheet" href="http://common.cnblogs.com/css/shThemeDefault.css"/>
<link type="text/css" rel="stylesheet" href="http://www.cnblogs.com/JimmyZhang/customcss.aspx?id=28363"/>
<link title="RSS" type="application/rss+xml" rel="alternate" href="http://www.cnblogs.com/JimmyZhang/rss"/>
<link title="RSD" type="application/rsd+xml" rel="EditURI" href="http://www.cnblogs.com/JimmyZhang/rsd.xml"/> 
<script src="http://common.cnblogs.com/script/jquery.js" type="text/javascript"></script>  
<script src="/script/common.js" type="text/javascript"></script>
<script src="http://common.cnblogs.com/script/jquery.json-2.2.min.js" type="text/javascript"></script>
</head>                                                                                  
<body>
    <form id="form1" runat="server">
<div>
<input type="hidden" name="__EVENTTARGET" id="__EVENTTARGET" value="" />
<input type="hidden" name="__EVENTARGUMENT" id="__EVENTARGUMENT" value="" />
<input type="hidden" name="__VIEWSTATE" id="
__VIEWSTATE" value="" />
</div>

<%--<script type="text/javascript">
    //<![CDATA[
    var theForm = document.forms['Form1'];
    if (!theForm) {
        theForm = document.Form1;
    }
    function __doPostBack(eventTarget, eventArgument) {
        if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
            theForm.__EVENTTARGET.value = eventTarget;
            theForm.__EVENTARGUMENT.value = eventArgument;
            theForm.submit();
        }
    }
    //]]>
</script>--%>


        
<!--done-->
<div id="home">
<div id="header">
	<div id="blogTitle">
		
<!--done-->
<div class="title"></div>
<div class="subtitle">静水流深 细水流长</div>



		
	</div><!--end: blogTitle 博客的标题和副标题 -->
	<div id="navigator">
		
<!--done-->
			<ul id="navList">
				<li><a id="MyLinks1_HomeLink" class="menu" href="http://www.cnblogs.com/">博客园</a></li>
				<li><a id="MyLinks1_MyHomeLink" class="menu" href="http://www.cnblogs.com/JimmyZhang/">首页</a></li>
				<li><a href="http://news.cnblogs.com/">新闻</a></li>				
				<li><a id="MyLinks1_NewPostLink" class="menu" href="http://www.cnblogs.com/JimmyZhang/admin/EditPosts.aspx?opt=1">新随笔</a></li>
				<li><a id="MyLinks1_ContactLink" accesskey="9" class="menu" href="http://space.cnblogs.com/msg/send/Jimmy+Zhang">联系</a></li>
				<li><a id="MyLinks1_Admin" class="menu" href="http://www.cnblogs.com/JimmyZhang/admin/EditPosts.aspx">管理</a></li>
				<li><a id="MyLinks1_Syndication" class="menu" href="http://www.cnblogs.com/JimmyZhang/rss">订阅</a>
				<a id="MyLinks1_XMLLink" class="aHeaderXML" href="http://www.cnblogs.com/JimmyZhang/rss"><img src="/Skins/Custom/images/rss.gif" alt="订阅" style="border-width:0px;" /></a></li>
			</ul>


		<div class="blogStats">
			
			
<!--done-->
随笔-115&nbsp;
文章-0&nbsp;
评论-2899&nbsp;

			
		</div><!--end: blogStats -->
	<div>
       
    </div>
    
    </div><!--end: navigator 博客导航栏 -->
</div><!--end: header 头部 -->
<div id="main">
	<div id="mainContent"><!--end: forFlow -->
    <div style=" width:15%; margin-top:50px;  float:left;">
        <asp:TreeView ID="TreeView1" runat="server" ImageSet="News" NodeIndent="10">
            <ParentNodeStyle Font-Bold="False" />
            <HoverNodeStyle Font-Underline="True" />
            <SelectedNodeStyle Font-Underline="True" HorizontalPadding="0px" 
                VerticalPadding="0px" />
          <Nodes>
            <asp:TreeNode Text="新闻" NavigateUrl="#">
               <asp:TreeNode Text="焦点新闻" NavigateUrl="#"></asp:TreeNode>
               <asp:TreeNode Text="国内" NavigateUrl="#"></asp:TreeNode>
               <asp:TreeNode Text="国际" NavigateUrl="#"></asp:TreeNode>
            </asp:TreeNode>
            <asp:TreeNode Text="互联网" NavigateUrl="#">
                <asp:TreeNode Text="搜索引擎" NavigateUrl="#"></asp:TreeNode>
                <asp:TreeNode Text="电子商务" NavigateUrl="#"></asp:TreeNode>
                <asp:TreeNode Text="网络游戏" NavigateUrl="#"></asp:TreeNode>
            </asp:TreeNode>
            <asp:TreeNode Text="财经" NavigateUrl="#">
                <asp:TreeNode Text="股票" NavigateUrl="#"></asp:TreeNode>
                <asp:TreeNode Text="理财" NavigateUrl="#"></asp:TreeNode>
                <asp:TreeNode Text="经济民生" NavigateUrl="#"></asp:TreeNode>
            </asp:TreeNode>
          </Nodes>
            <NodeStyle Font-Names="Arial" Font-Size="10pt" ForeColor="Black" 
                HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
        </asp:TreeView>   
    </div>
                     <div style=" float:left; margin-left:30px; margin-top:50px;"><h3>南京肌溶解属HAFF病与小龙虾有关</h3> 
<h6>汉网 www.cnhan.com 2010-09-08 稿件来源： 四川新闻网-成都晚报 </h6>
 
 
 
    “南京地区发现的与食用小龙虾相关的横纹肌溶解症综合症患者，具有与HAFF病相似的流行病学特色和临床表现，如病前4-13小时内均有食用较多(10只以上)小龙虾史。”昨天傍晚，南京市政府召开了“关于食用小龙虾相关横纹肌溶解综合症调查进展新闻发布会”，中国疾病预防控制中心营养与食品安全所专家 
通报了经过10多天的调查、采样、实验室检测后的初步检测结果，初步提出了病例定义和病例检测方案。

　　据南京市食品药品监督管理局副局长华文介绍，截止到昨日12时，南京市共收治与食用小龙虾相关横纹溶解综合症的病例共有23人。23名患者均有全身肌肉酸痛症状，并伴有肌酸激酶、肌红蛋白明显增高。临床诊断为横纹溶解综合症，经治疗，已有22人治愈出院，还有1人仍然住院治疗，目前情况稳定。

　　中国疾病预防控制中心营养与食品安全所研究员吴永宁介绍说：“南京地区发现的食用小龙虾相关的横纹溶解综合症患者，具有与HAFF相似的流行病学特征和临床表现，如病前4到13小时内均有食用较多小龙虾史，主要症状为肌肉酸痛，无发热和关节疼痛，无神经麻痹，仅个别出现恶心症状，临床检验发现患者肌酸激酶进行性的一过性升高。”

　　吴永宁指出，依据初步的流行病学调查、临床和实验室检测结果和临床会诊意见，综合分析认为与国际上时有报道的HAFF病基本一致，具体致病因素还需进一步的研究、探索。吴永宁解释说：“吃小龙虾不发病的吃的都是不到10只，所以这个小龙虾肯定不是都是带毒，是大部分没毒，我们调查结论极少数会有症状出现。”

　　HAFF病都是吃水产品造成的

　　1924年夏秋，在波罗地海的HAFF海滨出现急性中毒性肌肉病的流行，其表现为突然出现严重的肌肉僵硬疼痛，多数病人迅速恢复正常，仅个别严重者死亡。在此后9年内的同一季节和同一地区发现了大约1000例病人，均与吃淡水鱼有关。

　　从1934年至今类似HAFF病的描述还出现在瑞典和原苏联。2000年美国的Buchholz总结了6例进食水牛鱼导致的HAFF病。2000年8月上旬，在北京地区曾相继出现进食蝲蛄引起的HAFF病患者。
 
 

详情请看：http://www.cnhan.com/gb/content/2010-09/08/content_1195132.htm</div>
    </div><!--end: mainContent 主体内容容器-->
	</div><!--end: main -->
	<div id="footer">
		
<!--done-->
Copyright &copy;2010 Jimmy Zhang
	</div><!--end: footer -->
</div><!--end: home 自定义的最大容器 -->
    
    
    </form>
    	<script type="text/javascript" src="http://common.cnblogs.com/script/shCore.js"></script>
	<script type="text/javascript" src="http://common.cnblogs.com/script/shLanguage.js"></script>
    <script type="text/javascript">
        try {
            SyntaxHighlighter.config.clipboardSwf = 'http://common.cnblogs.com/flash/clipboard.swf';
            SyntaxHighlighter.all();
        } catch (e) { }
    </script>  
    <script type="text/javascript" src="http://www.cnblogs.com/script/ShowHidden.js"></script>
    
<script type="text/javascript">
        var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
        document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
    </script>
    <script type="text/javascript">
        try {
            var pageTracker = _gat._getTracker("UA-476124-1");
            pageTracker._trackPageview();
        } catch (err) { }
        </script>
</body>
</html>
