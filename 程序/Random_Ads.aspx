<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Random_Ads.aspx.cs" Inherits="程序.Random_Ads" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>实现页面随机效果显示</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="robots" content="all" />
<meta name="Copyright" content="Copyright (c) 2006-2009 TENCNET" />
<meta name="Description" content="" />
<meta name="Keywords" content="QQ游戏2009，最新版本，游戏大厅，腾讯游戏，我最闪亮，休闲游戏" />
<link href="http://qqgame.qq.com/css/qqgameStyle.css" rel="stylesheet" type="text/css" />
<script  src="http://ossweb-img.qq.com/images/js/cdn_speed.js"></script>
<script type="text/javascript">    if (typeof (cdn_beginCheck) == "function") cdn_beginCheck("qqgame", 10);</script>
<script type="text/javascript">
    function openSearch() {
        var key = document.getElementById('textValue').value;
        if (key == '搜索QQ游戏常见问题' || !key) {
            window.open('http://service.qq.com/category/game.html');
        } else {
            window.open('http://service.qq.com/search_qg.shtml?key=' + key + '&cl=QQ游戏');
        }
    }
    function doFocus() {
        var obj = document.getElementById("textValue");
        if (obj.value == "") {
            obj.style.color = "#888888";
        }
        else {
            obj.style.color = "#000000";
        }
    }

    function doBlur() {
        var obj = document.getElementById("textValue");
        if (obj.value == "") {
            obj.style.color = "#888888";
        }
        else {
            obj.style.color = "#000000";
        }
    }

    var $ = function(id) {
        return "string" == typeof id ? document.getElementById(id) : id;
    };

    var Extend = function(destination, source) {
        for (var property in source) {
            destination[property] = source[property];
        }
        return destination;
    }

    var CurrentStyle = function(element) {
        return element.currentStyle || document.defaultView.getComputedStyle(element, null);
    }

    var Bind = function(object, fun) {
        var args = Array.prototype.slice.call(arguments).slice(2);
        return function() {
            return fun.apply(object, args.concat(Array.prototype.slice.call(arguments)));
        }
    }

    var Tween = {
        Quart: {
            easeOut: function(t, b, c, d) {
                return -c * ((t = t / d - 1) * t * t * t - 1) + b;
            }
        },
        Back: {
            easeOut: function(t, b, c, d, s) {
                if (s == undefined) s = 1.70158;
                return c * ((t = t / d - 1) * t * ((s + 1) * t + s) + 1) + b;
            }
        },
        Bounce: {
            easeOut: function(t, b, c, d) {
                if ((t /= d) < (1 / 2.75)) {
                    return c * (7.5625 * t * t) + b;
                } else if (t < (2 / 2.75)) {
                    return c * (7.5625 * (t -= (1.5 / 2.75)) * t + .75) + b;
                } else if (t < (2.5 / 2.75)) {
                    return c * (7.5625 * (t -= (2.25 / 2.75)) * t + .9375) + b;
                } else {
                    return c * (7.5625 * (t -= (2.625 / 2.75)) * t + .984375) + b;
                }
            }
        }
    }


    //容器对象,滑动对象,切换数量
    var SlideTrans = function(container, slider, count, options) {
        this._slider = $(slider);
        this._container = $(container); //容器对象
        this._timer = null; //定时器
        this._count = Math.abs(count); //切换数量
        this._target = 0; //目标值
        this._t = this._b = this._c = 0; //tween参数

        this.Index = 0; //当前索引

        this.SetOptions(options);

        this.Auto = !!this.options.Auto;
        this.Duration = Math.abs(this.options.Duration);
        this.Time = Math.abs(this.options.Time);
        this.Pause = Math.abs(this.options.Pause);
        this.Tween = this.options.Tween;
        this.onStart = this.options.onStart;
        this.onFinish = this.options.onFinish;

        var bVertical = !!this.options.Vertical;
        this._css = bVertical ? "top" : "left"; //方向

        //样式设置
        var p = CurrentStyle(this._container).position;
        p == "relative" || p == "absolute" || (this._container.style.position = "relative");
        this._container.style.overflow = "hidden";
        this._slider.style.position = "absolute";

        this.Change = this.options.Change ? this.options.Change :
		this._slider[bVertical ? "offsetHeight" : "offsetWidth"] / this._count;
    };
    SlideTrans.prototype = {
        //设置默认属性
        SetOptions: function(options) {
            this.options = {//默认值
                Vertical: true, //是否垂直方向（方向不能改）
                Auto: true, //是否自动
                Change: 0, //改变量
                Duration: 50, //滑动持续时间
                Time: 10, //滑动延时
                Pause: 4000, //停顿时间(Auto为true时有效)
                onStart: function() { }, //开始转换时执行
                onFinish: function() { }, //完成转换时执行
                Tween: Tween.Quart.easeOut//tween算子
            };
            Extend(this.options, options || {});
        },
        //开始切换
        Run: function(index) {
            //修正index
            index == undefined && (index = this.Index);
            index < 0 && (index = this._count - 1) || index >= this._count && (index = 0);
            //设置参数
            this._target = -Math.abs(this.Change) * (this.Index = index);
            this._t = 0;
            this._b = parseInt(CurrentStyle(this._slider)[this.options.Vertical ? "top" : "left"]);
            this._c = this._target - this._b;

            this.onStart();
            this.Move();
        },
        //移动
        Move: function() {
            clearTimeout(this._timer);
            //未到达目标继续移动否则进行下一次滑动
            if (this._c && this._t < this.Duration) {
                this.MoveTo(Math.round(this.Tween(this._t++, this._b, this._c, this.Duration)));
                this._timer = setTimeout(Bind(this, this.Move), this.Time);
            } else {
                this.MoveTo(this._target);
                this.Auto && (this._timer = setTimeout(Bind(this, this.Next), this.Pause));
            }
        },
        //移动到
        MoveTo: function(i) {
            this._slider.style[this._css] = i + "px";
        },
        //下一个
        Next: function() {
            this.Run(++this.Index);
        },
        //上一个
        Previous: function() {
            this.Run(--this.Index);
        },
        //停止
        Stop: function() {
            clearTimeout(this._timer); this.MoveTo(this._target);
        }
    };



</script>

</head>
<body>
<!-- 头部开始-->
<form id="form1" runat="server">
<div id="top">
  <div id="header">

        <table>
    <tr>
        <td><asp:AdRotator ID="AdRotator1" runat="server" 
            AdvertisementFile="~/XMLFile1.xml" Width="200px" Height="70px"/></td>
            </tr>
            </table>
     <div class="topmenu"><span><a href="javascript:window.external.AddFavorite('http://qqgame.qq.com', 'QQ游戏 无处不在的快乐')">收藏本站</a></span><span><a href="http://gamevip.qq.com/gamevip/" target="_blank">蓝钻贵族</a></span><span><a href="http://minigame.qq.com/market/" target="_blank">游戏商城</a></span><span><a href="http://jz.qq.com/" target="_blank">游戏家族</a></span><span><a href="http://qqgame.qzone.qq.com/" target="_blank">官方博客</a></span><span class="last"><a href="http://game.qq.com/" target="_blank">腾讯游戏</a></span></div>  
  </div>
  <div class="clear"></div>
  <div id="topnav">
    <ul id="menu">
     <li id="home"><a href="index.shtml" class="current_home">首页</a></li>
     <li id="download"><a href="download.html">游戏下载</a></li>
     <li id="help"><a href="help1_1.html">新手帮助</a></li>
     <li id="act"><a href="act.html">活动专区</a></li>
     <li id="bbs"><a href="http://qqgame.gamebbs.qq.com/" target="_blank">游戏论坛</a></li>
     <li id="service"><a href="http://service.qq.com/game/qqgame.html" target="_blank">客服中心</a></li>
    </ul>
  </div>
</div>
<!-- 头部结束-->
<div id="main">
<!-- 左边开始-->
  <div id="leftbar">
     <h2><a href="http://dl_dir3.qq.com/minigamefile/QQGame2010Beta6_setup_web.EXE"><img src="http://ossweb-img2.qq.com/images/qqgame/images/ow_btn_qqgamedown.gif" alt="立即下载" /></a></h2>
   <div id="lbox">
       <h1><span>新手专区</span></h1>
        <div>
          <ul>
            <li class="q_ico01"><a href="http://freeqqm.qq.com/" target="_blank">帐号注册</a></li>
            <li class="q_ico02"><a href="http://pay.qq.com/" target="_blank">帐户充值</a></li>
            <li class="q_ico03"><a href="help1_1.html">新手指南</a></li>
          </ul>
        </div>
       <h1><span>互动中心</span></h1>
        <div>
          <ul>
            <li class="q_ico04"><a href="act.html">最新活动</a></li>
            <li class="q_ico05"><a href="http://qqgame.gamebbs.qq.com/" target="_blank">官方论坛</a></li>
            <li class="q_ico06"><a href="http://qqgame.qzone.qq.com/" target="_blank">官方博客</a></li>
            <li class="q_ico07"><a href="http://wenwen.soso.com/z/GameHelpHome.htm?source=3" target="_blank">互助问答</a></li>
            <li class="q_ico14"><a href="http://gb.qq.com/hall/money/index.html" target="_blank">获取游戏币</a></li>
            <li class="q_ico15"><a href="http://qqgame.qq.com/act/a20090223cdkey/cdkey.htm" target="_blank">礼包兑换</a></li>
          </ul>
        </div>
       <h1><span>客服中心</span></h1>
        <div>
          <ul>
            <li class="q_ico08"><a href="http://service.qq.com/cgi-bin/communion?sid=73" target="_blank">快速提问</a></li>
            <li class="q_ico09"><a href="http://QQGamekf.gamebbs.qq.com" target="_blank">咨询论坛</a></li>
            <li class="q_ico10"><a href="license.html">用户协议</a></li>
            <li class="q_ico11"><a href="rules.html">玩家条例</a></li>
            <li class="q_ico12"><a href="http://service.qq.com/secondary_web/psw.shtml" target="_blank">密码找回</a></li>
            <li class="q_ico13"><a href="http://fcm.qq.com/" target="_blank">防沉迷认证</a></li>
            <li class="q_ico16"><a href="http://gamesafe.qq.com/" target="_blank">游戏安全</a></li>
			<li class="q_ico17"><a href="http://game.qq.com/jhtx/index.shtml" target="_blank">家长监控工程</a></li>
          </ul>
        </div>
    </div>
  </div>
<!-- 左边结束-->
<!-- 中间部分开始-->
  <div id="content">
    <div id="ibanner">
    <div class=container id=idContainer2>
     <table id=idSlider2 border="0" cellspacing="0" cellpadding="0">
      <tr>
      <td><a href="http://qqgame.qq.com/act/a20100531qxzb/index.shtml?ADTAG=IED.GAMEGW" target="_blank"><img src="http://ossweb-img.qq.com/images/qqgame/images/img_20100818qxzb2.jpg" width="485" height="192" /></a></td>
      
              <td><a href="http://qqgame.qq.com/act/a20090729dm/index.html?ADTAG=IED.GAMEHD" target="_blank"><img src="http://ossweb-img.qq.com/images/qqgame/images/img_20100817dmlq1.jpg" width="485" height="192" /></a></td>
        <td><a href="http://minigame.qq.com/act/gamepet/?ADTAG=ied.gwsy" target="_blank"> <img src="http://ossweb-img.qq.com/images/qqgame/images/img_20100806p.jpg" width="485" height="192" /></a></td>
        <td><a href="http://www.3366.com/index.shtml?ADTAG=ied.qqgame.sy" target="_blank"> <img src="http://ossweb-img.qq.com/images/qqgame/images/img_20100816ssll2.jpg" width="485" height="192" /></a></td>
        <td><a href="http://qqgame.qq.com/act/a20100806dy/inedx.html?ADTAG=IED.GAMEGW" target="_blank"> <img src="http://ossweb-img.qq.com/images/qqgame/images/img_20100819bbly2.jpg" width="485" height="192" /></a></td> 
      </tr>
    </table>
<UL class=num id=idNum></UL>
    
    
    </div>
    </div>
<SCRIPT>

//new SlideTrans("idContainer", "idSlider", 3).Run();

///////////////////////////////////////////////////////////

var forEach = function(array, callback, thisObject){
	if(array.forEach){
		array.forEach(callback, thisObject);
	}else{
		for (var i = 0, len = array.length; i < len; i++) { callback.call(thisObject, array[i], i, array); }
	}
}

var st = new SlideTrans("idContainer2", "idSlider2", 5, { Vertical: false });

var nums = [];
//插入数字
for(var i = 0, n = st._count - 1; i <= n;){
	(nums[i] = $("idNum").appendChild(document.createElement("li"))).innerHTML = ++i;
}

forEach(nums, function(o, i){
	o.onmouseover = function(){ o.className = "on"; st.Auto = false; st.Run(i); }
	o.onmouseout = function(){ o.className = ""; st.Auto = true; st.Run(); }
})

//设置按钮样式
st.onStart = function(){
	forEach(nums, function(o, i){ o.className = st.Index == i ? "on" : ""; })
}

//$("idAuto").onclick = function(){
	//if(st.Auto){
		//st.Auto = false; st.Stop(); this.value = "自动";
	//}else{
		//st.Auto = true; st.Run(); this.value = "停止";
	//}
//}
//$("idNext").onclick = function(){ st.Next(); }
//$("idPre").onclick = function(){ st.Previous(); }

//$("idTween").onchange = function(){
	//switch (parseInt(this.value)){
		//case 2 :
			//st.Tween = Tween.Bounce.easeOut; break;
		//case 1 :
			//st.Tween = Tween.Back.easeOut; break;
		//default :
			//st.Tween = Tween.Quart.easeOut;
	//}
//}


st.Run();
</SCRIPT>
<!--<script type=text/javascript>
  TB.widget.SimpleSlide.decorate('SlidePlayer', {eventType:'mouse', effect:'fade'});
</script>-->
    <!-- 新闻公告开始-->
    <div id="i_news">
      <h2><span>新闻公告</span><p><a href="http://qqgame.qq.com/news.shtml?iPdName=24&channel=1">更多&gt;&gt;</a></p></h2>
       <div class="i_content">
          <iframe src="http://qqgame.qq.com/CommNews/static/inc/news_list.htm" class="i_n01" frameBorder=0 scrolling=no allowTransparency></iframe>
         <div class="clear"></div>
       </div>
    </div>
    <!-- 新闻公告结束-->
    <div id="i_question">
      <h2>
      <span class="kf_logo"><a href="http://service.qq.com/game/qqgame.html" target="_blank" title="腾讯客服"></a></span>
      <span class="search">
      <input type="text" size="38" value="搜索QQ游戏常见问题" class="t_input" name="sp" id="textValue" onfocus="if(this.value=='搜索QQ游戏常见问题')this.value=''" onkeypress="if(event.keyCode==13){openSearch();return false;}" autocomplete="off" /></span>
      <span class="btn_search"><input type="button" class="wenwen_search" onclick="openSearch();" style="cursor:hand;" value="搜 索"/>
      </span>

      </h2>
       <div class="q_content">
         <ul>
          <li>[常见问题]&nbsp;&nbsp;<a href="http://service.qq.com/info/33907.html
" target="_blank">如何快速获取欢乐豆?</a><!--&nbsp;&nbsp;<span>[03/10]</span>--></li>
          <li>[常见问题]&nbsp;&nbsp;<a href="http://service.qq.com/info/11152.html" target="_blank">QQ游戏如何上传照片秀?</a></li>
          <li>[常见问题]&nbsp;&nbsp;<a href="http://service.qq.com/info/11149.html" target="_blank">QQ游戏中如何修改照片秀?</a></li>
          <li>[常见问题]&nbsp;&nbsp;<a href="http://service.qq.com/info/9517.html" target="_blank">为什么欢乐豆被锁定?</a></li>
          <li>[常见问题]&nbsp;&nbsp;<a href="http://service.qq.com/info/44491_0.html" target="_blank">QQ游戏蓝钻贵族有哪些特权?</a></li>
          <li>[常见问题]&nbsp;&nbsp;<a href="http://service.qq.com/info/10018.html" target="_blank">蓝钻贵族成长体系怎么计算?</a></li>
         </ul>
       </div>
    </div>
    <!-- 新闻公告结束-->
  </div>
<!-- 中间部分结束-->
  <div id="rightbar">
   <div class="game_pai">
    <h2>牌类游戏<span>(33款)</span></h2>
    <p><a href="http://minigameimg.qq.com/help/rule81.html" target="_blank">斗地主</a><span class="dot_hot"></span>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule105.html" target="_blank">欢乐斗地主</a><span class="dot_hot"></span>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule130.html" target="_blank">够级</a><br />
      <a href="http://minigameimg.qq.com/help/rule129.html" target="_blank">跑得快</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule131.html" target="_blank">&nbsp;视频斗地主</a><span class="dot_hot"></span>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule91.html" target="_blank">升级</a><span class="dot_hot"></span><br>

      <a href="http://minigameimg.qq.com/help/rule132.html" target="_blank">打滚子</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule90.html" target="_blank">四人斗地主</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule31.html" target="_blank">挖坑</a><br />
      <a href="http://qqgamecdnimg.qq.com/help/rule137.html" target="_blank">干瞪眼</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="http://qqgamecdnimg.qq.com/help/rule141.html" target="_blank">&nbsp;跑胡子</a><span class="dot_new"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule125.html" target="_blank">桥牌</a><br />
      <a href="http://minigameimg.qq.com/help/rule13.html" target="_blank">三打一</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule35.html" target="_blank">火拼双扣</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://qqgamecdnimg.qq.com/help/rule147.html" target="_blank">憋七</a><span class="dot_new"></span></p>
   </div>
<!-- 牌类游戏结束-->
    <div class="game_mj Tmargin10">
    <h2>麻将类游戏<span>(11款)</span></h2>
    <p><a href="http://qqgamecdnimg.qq.com/help/rule133.html" target="_blank">二人麻将</a><span class="dot_new"></span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule82.html" target="_blank">QQ麻将</a><span class="dot_hot"></span>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="http://qqgamecdnimg.qq.com/help/rule92.html" target="_blank">四川麻将</a><span class="dot_hot"></span><br />
      <a href="http://minigameimg.qq.com/help/rule28.html" target="_blank">武汉麻将</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule126.html" target="_blank">上海麻将</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule29.html" target="_blank">长沙麻将</a><br />
      <a href="http://minigameimg.qq.com/help/rule32.html" target="_blank">广东麻将</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="http://qqgamecdnimg.qq.com/help/rule140.html" target="_blank">陕西麻将</a><span class="dot_new"></span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule76.html" target="_blank">欢乐麻将</a></p>
   </div>
<!-- 麻将类游戏结束-->
    <div class="game_xj Tmargin10">
    <h2>休闲竞技类<span>(16款)</span></h2>
    <p><a href="http://minigameimg.qq.com/help/rule11.html" target="_blank">火拼俄罗斯</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule83.html" target="_blank">连连看</a><span class="dot_hot"></span>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule14.html" target="_blank">火拼泡泡龙</a><br />
      <a href="http://game-web.qq.com/help/lz/index.shtml" target="_blank">QQ龙珠</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule85.html" target="_blank">对对碰</a><span class="dot_hot"></span>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule128.html" target="_blank">美女找茬</a><span class="dot_new"></span><br />
      <a href="http://minigameimg.qq.com/help/rule86.html" target="_blank">桌球</a><span class="dot_hot"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;<a href="http://game.qq.com/new05/help/wjz.htm" target="_blank">挖金子</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule121.html" target="_blank">拼拼看</a></p>
   </div>
<!-- 休闲竞技类结束-->
    <div class="game_qi Tmargin10">
    <h2>棋类游戏<span>(8款)</span></h2>
    <p><a href="http://minigameimg.qq.com/help/rule87.html" target="_blank">四国军旗</a><span class="dot_hot"></span>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule4.html" target="_blank">中国象棋</a><span class="dot_hot"></span>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule20.html" target="_blank">新中国象棋</a><br />
      <a href="http://minigameimg.qq.com/help/rule21.html" target="_blank">QQ跳棋&nbsp;&nbsp;</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule12.html" target="_blank">飞行棋</a><span class="dot_hot"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule9.html" target="_blank">五子棋</a><br />
      <a href="http://minigameimg.qq.com/help/rule17.html" target="_blank">围棋</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule127.html" target="_blank">国际象棋</a>    </p>
    </div>
<!-- 棋类游戏结束-->   
    <div class="game_sj Tmargin10">
    <h2>手机游戏<span>(7款)</span></h2>
    <p><a href="http://mqqgame.qq.com/showGameInfo.action?gameId=994&amp;from=qqgame" target="_blank">斗地主</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="http://mqqgame.qq.com/showGameInfo.action?gameId=995&amp;from=qqgame" target="_blank">升级</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="http://mqqgame.qq.com/showGameInfo.action?gameId=996&amp;from=qqgame" target="_blank">麻将</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="http://mqqgame.qq.com/showGameInfo.action?gameId=998&amp;from=qqgame" target="_blank">中国象棋</a><br />
      <a href="http://mqqgame.qq.com/showGameInfo.action?gameId=997&amp;from=qqgame" target="_blank">五子棋&nbsp;&nbsp;</a>|&nbsp;&nbsp;<a href="http://mqqgame.qq.com/showGameInfo.action?gameId=999&amp;from=qqgame" target="_blank">拱猪</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="http://mqqgame.qq.com/showGameInfo.action?gameId=1000&amp;from=qqgame" target="_blank">锄大地</a>    </p>
    </div>
    <div class="r_box"></div>
   <div class="clear"></div>
  </div>
<!-- 游戏列表结束-->
 </div>
 <div class="clear"></div>
<div class="footer">
  <p><A href="http://www.tencent.com/" target="_blank">关于腾讯</A> | <A href="http://www.tencent.com/index_e.shtml" target="_blank">About Tencent </A>| 
  <A href="http://www.qq.com/contract.shtml" target="_blank">服务条款</A> | <A href="http://www.tencentmind.com/" target="_blank">广告服务</A> | <A href="http://hr.tencent.com/" target="_blank">腾讯招聘</A> | <A href="http://www.tencent.com/about/corp.shtml" target="_blank">商务洽谈</A> | <A href="http://www.qq.com/map/" target="_blank">网站导航</A> | <A href="http://service.qq.com/" target="_blank">腾讯客服</A><BR>
  Copyright &copy; 1998 – 2010 Tencent. All Rights Reserved. &nbsp;&nbsp;<A href="http://www.tencent.com/law/mo_law.shtml?/law/copyright.htm" target=_blank>腾讯公司 版权所有</A></p>
</div>

<script language="javascript" src="http://pingjs.qq.com/ping.js"></script>
<script language="javascript">
if(typeof(pgvMain) == 'function')
pgvMain();
</script>
</form>
</body>
</html>
