<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThemePage.aspx.cs" Inherits="程序.ThemePage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>在网页中实现皮肤切换</title>
        <LINK href="河南专任教师达110万人%20特别的爱给特别的你-大河网_files/c_reset.css" type=text/css 
rel=stylesheet><LINK href="河南专任教师达110万人%20特别的爱给特别的你-大河网_files/c_include.css" 
type=text/css rel=stylesheet><LINK 
href="河南专任教师达110万人%20特别的爱给特别的你-大河网_files/c_con.css" type=text/css 
rel=stylesheet>
<link href='http://uploads.dahe.cn/yn/index/img/c_reset_n.css' rel='stylesheet' type='text/css'>
<link href='http://uploads.dahe.cn/yn/index/img/c_index_0819.css' rel='stylesheet' type='text/css'>
<link href="http://mimg.126.net/xm/reg_all/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/mailregAll/js/md5-min.js"></script>
<script type="text/javascript" src="/mailregAll/js/jquery-1.3.1.min.js"></script>
<script type="text/javascript" src="/mailregAll/js/jquery_ajax.js"></script>
<script type="text/javascript" src="/mailregAll/js/requestUtil.js"></script>
<script type="text/javascript" src="/mailregAll/js/function.js"></script>
<style>
  .aa
{
	 float:left;
	 width:60%;
	}
</style>
</head>

<body>
    <form id="form1" runat="server">
         <div id="dNavBar" class="clearfix">
    	<a href="http://www.dahe.cn"><img src='http://www.dahe.cn/upload/index_logo.gif' title='大河网' alt='大河网'></a>
        <ul class="ulLink1">
        	<li class="liS"><strong><a href="http://news.dahe.cn" target="_blank">新闻</a></strong></li>
            <li><a href="http://jdwt.dahe.cn/focus/" target="_blank">民声</a></li>
            <li><a href="http://photo.dahe.cn/" target="_blank">图片</a></li>
            <li><a href="http://ent.dahe.cn" target="_blank">娱乐</a></li>
            <li class="liS"><strong><a href="http://opinion.dahe.cn" target="_blank">评论</a></strong></li>
            <li><a href="http://t.dahe.cn/" target="_blank">视频</a></li>
            <li><a href="http://www.dahe.cn/xwzx/sh/index.htm" target="_blank">猛料</a></li>
            <li><a href="http://news.dahe.cn/dhfd/" target="_blank">沸点</a></li>
        </ul>
        <ul class="ulLink2">
        	<li class="liS"><strong><a href="http://bbs.dahe.cn/" target="_blank">论坛</a></strong></li>
            <li><a href="http://jdwt.dahe.cn/" target="_blank">焦点网谈</a></li>
            <li><a href=" http://news.dahe.cn/dysj/index.html" target="_blank">第一时间</a></li>
            <li><a href="http://jdwt.dahe.cn/" target="_blank">嘉宾</a></li>
            <li><a href="http://house.dahe.cn/" target="_blank">楼市</a></li>
            <li class="liS"><strong><a href="http://i.dahe.cn/" target="_blank">博客</a></strong></li>
            <li><a href="http://hnzx.dahe.cn/" target="_blank">在线对话</a></li>
            <li><a href="http://www.dahe.cn/xwzx/wmjzbdt/index.htm" target="_blank">网民记者</a></li>
            <li><a href="http://shoucang.dahe.cn/" target="_blank">收藏</a></li>
            <li><a href="http://edu.dahe.cn/" target="_blank">教育</a></li>           
        </ul>
        <ul class="ulLink3">
        	<li class="liS"><a href="http://jr.dahe.cn/" target="_blank">金融</a></li>
            <li><a href="http://tuangou.dahe.cn/" target="_blank">团购</a></li>
            <li><a href="http://art.dahe.cn/" target="_blank">美术</a></li>
            <li><a href="http://mail.dahe.cn" target="_blank">邮箱</a></li>
            <li><a href="http://law.dahe.cn" target="_blank">法制</a></li>
            <li><a href="http://book.dahe.cn/" target="_blank">读书</a></li>
            <li><a href="http://py.dahe.cn/" target="_blank">濮阳</a></li>
            <li class="liS"><a href="http://www.dahe.cn/wealth/" target="_blank">财富</a></li>
            <li><a href="http://auto.dahe.cn/" target="_blank">汽车</a></li>
            <li><a href="http://dongman.dahe.cn/" target="_blank">动漫</a></li>
            <li><a href="http://www.dahe.cn/pdjx/ly/index.htm" target="_blank">旅游</a></li>
            <li><a href="http://q.dahe.cn/" target="_blank">圈子</a></li>
            <li><a href="http://baixing.dahe.cn/" target="_blank">百姓</a></li>
            <li><a href="http://xiangyi.dahe.cn" target="_blank">乡医</a></li>
        </ul>
    </div>
</div>

<div class="content">
	<div class="mhd">
    	<div class="tit"></a></div>
 	</div>
    <div class="mcont">
        	<!-- 分拆补充资料部分 Start -->
        	    <div>
    <div style=" margin-left:0px;">
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged" >
          <asp:ListItem Value="" Text="默认"></asp:ListItem>
          <asp:ListItem Value="Blue" Text="蓝皮肤"></asp:ListItem>
          <asp:ListItem Value="Gray" Text="灰皮肤"></asp:ListItem>
        </asp:DropDownList>
        </div>
    </div>

         <h1 style=" font-size:20px;">河南专任教师达110万人 特别的爱给特别的你</h1>
   <div id="Main" class="aa">
                 
               <div id="msg"><span class="sTime">2010年09月10日09:14</span><span>来源:大河网-河南日报 </span><span class="sAuthor"></span></div>
                <div id="main">
        	<div><p><img src="http://img.dahe.cn/2010/09-10/100462527.jpg" border="0" /> </p>
</div>
<div align="center"><p><img src="http://img.dahe.cn/2010/09-10/100462529.jpg" border="0" /> </p>
</div>
<div align="center"><p><img src="http://img.dahe.cn/2010/09-10/100462531.jpg" border="0" /> </p>
</div>
<div align="center"><p>9月9日，漯河市召陵区实验小学的学生们向老师敬礼，祝福老师节日快乐。 王铮 杨东辉 摄 </p>
</div>
<div align="center"><p><img src="http://img.dahe.cn/2010/09-10/100462533.jpg" border="0" /> </p>
</div>
<div align="center"><p>9月10日是全国第26个教师节，郑州部分大学校园里的花店生意异常火爆。学生们纷纷送鲜花给老师，以此表达自己对老师的感恩之情。⑧3陈更生 宋洁 摄 </p>
</div>
<div align="center"><p><img src="http://img.dahe.cn/2010/09-10/100462534.jpg" border="0" /> </p>
</div>
<div align="center"><p>9月8日，武陟县特殊教育学校的学生给老师们戴上花环。教师节临近，该校学生自发开展“教师节里献真情”活动，孩子们制作出各种手工艺品，并亲手送给老师，表达对老师们的节日祝福。⑧3高超 秦林林 摄 </p>
</div>
<div align="center"><p><img src="http://img.dahe.cn/2010/09-10/100462535.jpg" border="0" /> </p>
</div>
<div align="center"><p>9月9日，漯河市郾城区聋儿康复中心的赵梓烁把亲手制作的环保低碳贺卡送给老师。教师节来临之际，该中心的小朋友用旧挂历等材料制成环保贺卡，送给自己的老师，在呼吁注意环保的同时祝愿老师节日快乐。王铮 杨东辉 摄 </p>
</div>
<p>　　编者按 </p>
<p>　　秋天的脚步款款而至，第26个教师节也已到来。老师是人类最光荣的职业，他们最美的风景不只是站在讲台上的那一瞬间，而是言传身教以人品带给无数个学生心灵上的震撼和感动。人都说师恩难忘，对我们每个人而言，从顽皮孩童到青涩少年再到风华青年的生命历程中，老师，是我们一生中值得尊重和感恩的人！在教师节里，除了尊敬，让我们衷心地对老师们说声：节日快乐！ </p>
<p>　　<strong>110万“园丁”奉献三尺讲台</strong> </p>
<p>　　（记者冯芸）百年大计，教育为本。9月9日，记者从省教育厅了解到，目前，我省从事教育事业的专任教师已达110万人。 </p>
<p>　　统计显示，全省现共有中小学专任教师87.2万人，高校专任教师7.15万人，中职专任教师5.95万人，学前教育专任教师5.83万人，其他专任教师3万多人。全省小学教师中具有专科及以上学历的人数为35.16万人，比例为71.88%；普通初中教师中具有本科及以上学历的人数为12.72万人，比例为45.74%；普通高中教师中具有本科及以上学历的人数为9.88万人，比例为93.98%。 </p>
<p>　　为促进教育均衡发展，全省积极开展城镇教师支援农村教育活动。据统计，2000年以来，全省组织城镇教师到农村学校任教13.5万余人次。 </p>
<p>　　全省高校大力实施“人才强校工程”，建立了一批协同攻关的教学、科研创新团队。目前，在河南省高校工作的“两院”院士已达111人，专任教师中具有副高及以上职称的2.36万人，占32.98%，具有研究生及以上学历的2.96万人（其中博士学历5910人），占41.43%。②6 </p>
<p>　　<strong>□师者之尊缘自用心 </strong></p>
<p>　　<strong>葛堂友：深山从教42年 </strong></p>
<p>　　9月7日，在位于深山区的博爱县寨豁乡大底村小学，葛堂友老师正在辅导一年级小学生写字。今年59周岁的葛堂友老师是该校唯一的一名教师。1968年刚刚初中毕业的葛堂友，当上了一名山村教师，这一干就是42年。为改变山区孩子的命运，葛堂友老师为山区的教育事业默默地奉献出了自己的青春年华。⑧3程全摄 </p>
<p>　　<strong>王生英：以校为家以家为校</strong> </p>
<p>　　王生英是河南省林州市横水镇卸甲平小学的一名普通的山村女教师。三十年来，她二十年以校为家，十余年以家为校，历尽艰辛，默默奉献。用自己的言行诠释着对教师的深刻理解、深厚挚爱和无悔追求。 </p>
<p>　　<strong>二十年以校为家　不让一个孩子辍学</strong> </p>
<p>　　1956年，她出生在卸甲平大队的西平自然村，生活十分清贫。幼时一场小儿麻痹症，使她落下残疾。可生性好强的她，一心想上学读书。她立下志向，长大当一名教师，让村里的孩子都能上学。在父母艰难的支撑下，她以顽强的毅力，勤奋刻苦，终于读完了高中，并在1974年考取了民办教师，实现了自己的愿望。 </p>
<p>　　位于太行山区的卸甲平村自然条件非常差，那里山路崎岖，交通不便。1978年6月，大雨下个不停，破旧的校舍已经不能遮风挡雨，为了孩子们的安全，她只好让孩子们回家。为了不耽误孩子们的学习，20多天里，不管雨有多大、风有多急，她拖着残疾的腿，每天坚持跑遍全村，挨家挨户到每个学生家里上课，决不落下一个孩子。 </p>
<p>　　为了钟爱的教育事业，三十年的教学生活，她二十年以校为家，从来没有误过孩子们的学习。 </p>
<p>　　<strong>十余载以家为校　为孩子们撑起一间教室 </strong></p>
<p>　　1993年，一场暴雨冲毁了破旧不堪的教室。村里却找不出一间能容下几十个学生的房屋，而村委会新建校舍又拿不出钱。无奈之下，她决定把孩子们领到自己家里去上课。从此，她的家便成了学生的教室。 </p>
<p>　　在以家为校的日子里，为了给学生创造良好的学习生活环境，王生英一家人节衣缩食，每天拾柴烧火做饭、挖野菜充饥。 </p>
<p>　　20年以校为家，10余年以家为校，数名学生升入了大学，数十名学生升入了高中，数百名有知识、有文化的毕业生在改变着家乡贫穷落后的面貌……为此，王生英无怨无悔。（据新华社郑州9月9日电） </p>
<p>　　<strong>蒋二军：用生命坚守讲台 </strong></p>
<p>　　9月9日，温县赵堡镇北平皋村小学教师蒋二军在校园里给学生讲解爱护环境、保护花草树木的知识。两年前，蒋二军被确诊为慢性肾衰竭中晚期，他一边与病魔作斗争，一边坚守在自己喜爱的讲台上。⑧3徐宏星摄 </p>
<p>　　<strong>□桃李芬芳真情感恩 </strong></p>
<p>　　<strong>清丰开展“党员谢师恩”活动</strong> </p>
<p>　　本报讯（记者李铮通讯员王飞李永）给母校老师写一封情真意切的信，为母校师生们送去学习和生活用品……教师节来临之际，清丰县组织开展“共产党员谢师恩”主题活动，党员们带头在全县掀起了尊师重教的高潮。 </p>
<p>　　在教师节来临之际，清丰县以“谢师恩”主题活动为载体，推进创先争优活动深入开展，先后组织举行了“百名书记、局长访恩师”、“谢师恩征文比赛”、“谢师恩短信创作比赛”、“感谢您——老师”演讲比赛等丰富多彩、主题鲜明的活动。活动在全县掀起了尊师重教的高潮，截至目前，该县各级党组织已收到“谢师恩”征文1240余篇、手机短信8600余条，56个县直单位组织已经组织了演讲选拔赛。②11 </p>
<p>　　<strong>长垣民企重奖优秀教师 </strong></p>
<p>　　本报讯（记者李虎成通讯员张宗桥贾胜波）在第26个教师节到来之际，9月6日，长垣县民营企业家、河南矿山起重集团董事长崔培军一次性拿出35万元，奖励长垣一中评选出的10名功勋教师和160名优秀教师。 </p>
<p>　　崔培军说，他和他的河南矿山集团一直把扶贫、扶弱、帮助文化教育、支持社会公益作为义不容辞的责任和使命，始终把助学助教、尊师重教放在企业责任的重要位置，希望通过助学助教活动，让老师领悟到来自社会、企业的敬佩之心，表达社会对呕心沥血教书育人的老师的一份敬意。 </p>
<p>　　<strong>□师者离去师魂余香 </strong></p>
<p>　　<strong>蚕丝吐尽春未老 </strong></p>
<p>　　<strong>——追记太康县回族中学校长李琳</strong> </p>
<p>　　□本报记者张靖本报通讯员郜敏 </p>
<p>　　她是红烛，燃烧自己，照亮莘莘学子路；她是春蚕，吐尽最后一根丝，织出一个锦绣校园。这些日子，赫然辞世的太康县回族中学校长李琳让无数人感怀。 </p>
<p>　　从7月26日李琳在给学生送高中录取通知书的路上突发急症猝死至今，几乎每天都有她以前教过的学生、处过的同事闻讯从全国各地匆匆赶来，在悲痛中一遍遍回忆以往的点点滴滴，找寻李琳遗留在回中的生命痕迹。 </p>
<p>　　43岁，5年校长生涯。她毫无保留地为事业、为学生奉献了一生。 </p>
<p>　　2005年8月李琳到回中报到时，学校账目上仅剩下6角8分钱，因拖欠水电费，学校水电都停了，全校46名教师，学生却只有110多人。面对这样一个“烂摊子”，她没有退缩。 </p>
<p>　　招不来学生，李琳就和老师们一起在辖区内甚至到附近村庄家访。两个月内，她走访了200个家庭。 </p>
<p>　　师资力量薄弱，代课教师少，李琳就身兼数职。学生年龄小，需要处处关心，她就每天最早到校，最晚离校。 </p>
<p>　　李琳对家长的承诺不是“空头支票”。不到一年，回中校园内的泥土地就全部硬化，随后又购进100多张学生双人床改善住宿条件。2008年，回中又开始建新教学楼并在年底投入使用。 </p>
<p>　　“在我心里，她就跟妈妈一样。”学生刘涛说。2008年10月5日早晨，刘涛感觉有点发烧。到班里巡视的李琳知道后立即骑自行车把他送到学校附近一家诊所看病。从输液一直到晚上9点多，李琳依然守候在他身边。“你妈晚上都没吃饭，一直在这里照看你……”诊所医生感叹着对刘涛说。刘涛听后眼泪止不住地流下来。这样的故事，熟悉她的人，随口都能说出很多。 </p>
<p>　　春蚕到死丝方尽，蜡炬成灰泪始干。在人们心中，李琳老师从未离开。 </p>

        </div><!--main-->

    </div>

    	<!-- 分拆补充资料部分 End -->

    
      <DIV class=dConR id=sideBar><IFRAME id=iframe1 name=iframe1 marginWidth=0 
marginHeight=0 src="河南专任教师达110万人%20特别的爱给特别的你-大河网_files/index-ilist.htm" 
frameBorder=0 width=320 scrolling=no height=1950 
allowTransparency></IFRAME></DIV>
    </div>
    <div class="mft"></div>
</div>




    </form>
</body>
</html>
