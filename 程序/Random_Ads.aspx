<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Random_Ads.aspx.cs" Inherits="����.Random_Ads" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>ʵ��ҳ�����Ч����ʾ</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="robots" content="all" />
<meta name="Copyright" content="Copyright (c) 2006-2009 TENCNET" />
<meta name="Description" content="" />
<meta name="Keywords" content="QQ��Ϸ2009�����°汾����Ϸ��������Ѷ��Ϸ������������������Ϸ" />
<link href="http://qqgame.qq.com/css/qqgameStyle.css" rel="stylesheet" type="text/css" />
<script  src="http://ossweb-img.qq.com/images/js/cdn_speed.js"></script>
<script type="text/javascript">    if (typeof (cdn_beginCheck) == "function") cdn_beginCheck("qqgame", 10);</script>
<script type="text/javascript">
    function openSearch() {
        var key = document.getElementById('textValue').value;
        if (key == '����QQ��Ϸ��������' || !key) {
            window.open('http://service.qq.com/category/game.html');
        } else {
            window.open('http://service.qq.com/search_qg.shtml?key=' + key + '&cl=QQ��Ϸ');
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


    //��������,��������,�л�����
    var SlideTrans = function(container, slider, count, options) {
        this._slider = $(slider);
        this._container = $(container); //��������
        this._timer = null; //��ʱ��
        this._count = Math.abs(count); //�л�����
        this._target = 0; //Ŀ��ֵ
        this._t = this._b = this._c = 0; //tween����

        this.Index = 0; //��ǰ����

        this.SetOptions(options);

        this.Auto = !!this.options.Auto;
        this.Duration = Math.abs(this.options.Duration);
        this.Time = Math.abs(this.options.Time);
        this.Pause = Math.abs(this.options.Pause);
        this.Tween = this.options.Tween;
        this.onStart = this.options.onStart;
        this.onFinish = this.options.onFinish;

        var bVertical = !!this.options.Vertical;
        this._css = bVertical ? "top" : "left"; //����

        //��ʽ����
        var p = CurrentStyle(this._container).position;
        p == "relative" || p == "absolute" || (this._container.style.position = "relative");
        this._container.style.overflow = "hidden";
        this._slider.style.position = "absolute";

        this.Change = this.options.Change ? this.options.Change :
		this._slider[bVertical ? "offsetHeight" : "offsetWidth"] / this._count;
    };
    SlideTrans.prototype = {
        //����Ĭ������
        SetOptions: function(options) {
            this.options = {//Ĭ��ֵ
                Vertical: true, //�Ƿ�ֱ���򣨷����ܸģ�
                Auto: true, //�Ƿ��Զ�
                Change: 0, //�ı���
                Duration: 50, //��������ʱ��
                Time: 10, //������ʱ
                Pause: 4000, //ͣ��ʱ��(AutoΪtrueʱ��Ч)
                onStart: function() { }, //��ʼת��ʱִ��
                onFinish: function() { }, //���ת��ʱִ��
                Tween: Tween.Quart.easeOut//tween����
            };
            Extend(this.options, options || {});
        },
        //��ʼ�л�
        Run: function(index) {
            //����index
            index == undefined && (index = this.Index);
            index < 0 && (index = this._count - 1) || index >= this._count && (index = 0);
            //���ò���
            this._target = -Math.abs(this.Change) * (this.Index = index);
            this._t = 0;
            this._b = parseInt(CurrentStyle(this._slider)[this.options.Vertical ? "top" : "left"]);
            this._c = this._target - this._b;

            this.onStart();
            this.Move();
        },
        //�ƶ�
        Move: function() {
            clearTimeout(this._timer);
            //δ����Ŀ������ƶ����������һ�λ���
            if (this._c && this._t < this.Duration) {
                this.MoveTo(Math.round(this.Tween(this._t++, this._b, this._c, this.Duration)));
                this._timer = setTimeout(Bind(this, this.Move), this.Time);
            } else {
                this.MoveTo(this._target);
                this.Auto && (this._timer = setTimeout(Bind(this, this.Next), this.Pause));
            }
        },
        //�ƶ���
        MoveTo: function(i) {
            this._slider.style[this._css] = i + "px";
        },
        //��һ��
        Next: function() {
            this.Run(++this.Index);
        },
        //��һ��
        Previous: function() {
            this.Run(--this.Index);
        },
        //ֹͣ
        Stop: function() {
            clearTimeout(this._timer); this.MoveTo(this._target);
        }
    };



</script>

</head>
<body>
<!-- ͷ����ʼ-->
<form id="form1" runat="server">
<div id="top">
  <div id="header">

        <table>
    <tr>
        <td><asp:AdRotator ID="AdRotator1" runat="server" 
            AdvertisementFile="~/XMLFile1.xml" Width="200px" Height="70px"/></td>
            </tr>
            </table>
     <div class="topmenu"><span><a href="javascript:window.external.AddFavorite('http://qqgame.qq.com', 'QQ��Ϸ �޴����ڵĿ���')">�ղر�վ</a></span><span><a href="http://gamevip.qq.com/gamevip/" target="_blank">�������</a></span><span><a href="http://minigame.qq.com/market/" target="_blank">��Ϸ�̳�</a></span><span><a href="http://jz.qq.com/" target="_blank">��Ϸ����</a></span><span><a href="http://qqgame.qzone.qq.com/" target="_blank">�ٷ�����</a></span><span class="last"><a href="http://game.qq.com/" target="_blank">��Ѷ��Ϸ</a></span></div>  
  </div>
  <div class="clear"></div>
  <div id="topnav">
    <ul id="menu">
     <li id="home"><a href="index.shtml" class="current_home">��ҳ</a></li>
     <li id="download"><a href="download.html">��Ϸ����</a></li>
     <li id="help"><a href="help1_1.html">���ְ���</a></li>
     <li id="act"><a href="act.html">�ר��</a></li>
     <li id="bbs"><a href="http://qqgame.gamebbs.qq.com/" target="_blank">��Ϸ��̳</a></li>
     <li id="service"><a href="http://service.qq.com/game/qqgame.html" target="_blank">�ͷ�����</a></li>
    </ul>
  </div>
</div>
<!-- ͷ������-->
<div id="main">
<!-- ��߿�ʼ-->
  <div id="leftbar">
     <h2><a href="http://dl_dir3.qq.com/minigamefile/QQGame2010Beta6_setup_web.EXE"><img src="http://ossweb-img2.qq.com/images/qqgame/images/ow_btn_qqgamedown.gif" alt="��������" /></a></h2>
   <div id="lbox">
       <h1><span>����ר��</span></h1>
        <div>
          <ul>
            <li class="q_ico01"><a href="http://freeqqm.qq.com/" target="_blank">�ʺ�ע��</a></li>
            <li class="q_ico02"><a href="http://pay.qq.com/" target="_blank">�ʻ���ֵ</a></li>
            <li class="q_ico03"><a href="help1_1.html">����ָ��</a></li>
          </ul>
        </div>
       <h1><span>��������</span></h1>
        <div>
          <ul>
            <li class="q_ico04"><a href="act.html">���»</a></li>
            <li class="q_ico05"><a href="http://qqgame.gamebbs.qq.com/" target="_blank">�ٷ���̳</a></li>
            <li class="q_ico06"><a href="http://qqgame.qzone.qq.com/" target="_blank">�ٷ�����</a></li>
            <li class="q_ico07"><a href="http://wenwen.soso.com/z/GameHelpHome.htm?source=3" target="_blank">�����ʴ�</a></li>
            <li class="q_ico14"><a href="http://gb.qq.com/hall/money/index.html" target="_blank">��ȡ��Ϸ��</a></li>
            <li class="q_ico15"><a href="http://qqgame.qq.com/act/a20090223cdkey/cdkey.htm" target="_blank">����һ�</a></li>
          </ul>
        </div>
       <h1><span>�ͷ�����</span></h1>
        <div>
          <ul>
            <li class="q_ico08"><a href="http://service.qq.com/cgi-bin/communion?sid=73" target="_blank">��������</a></li>
            <li class="q_ico09"><a href="http://QQGamekf.gamebbs.qq.com" target="_blank">��ѯ��̳</a></li>
            <li class="q_ico10"><a href="license.html">�û�Э��</a></li>
            <li class="q_ico11"><a href="rules.html">�������</a></li>
            <li class="q_ico12"><a href="http://service.qq.com/secondary_web/psw.shtml" target="_blank">�����һ�</a></li>
            <li class="q_ico13"><a href="http://fcm.qq.com/" target="_blank">��������֤</a></li>
            <li class="q_ico16"><a href="http://gamesafe.qq.com/" target="_blank">��Ϸ��ȫ</a></li>
			<li class="q_ico17"><a href="http://game.qq.com/jhtx/index.shtml" target="_blank">�ҳ���ع���</a></li>
          </ul>
        </div>
    </div>
  </div>
<!-- ��߽���-->
<!-- �м䲿�ֿ�ʼ-->
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
//��������
for(var i = 0, n = st._count - 1; i <= n;){
	(nums[i] = $("idNum").appendChild(document.createElement("li"))).innerHTML = ++i;
}

forEach(nums, function(o, i){
	o.onmouseover = function(){ o.className = "on"; st.Auto = false; st.Run(i); }
	o.onmouseout = function(){ o.className = ""; st.Auto = true; st.Run(); }
})

//���ð�ť��ʽ
st.onStart = function(){
	forEach(nums, function(o, i){ o.className = st.Index == i ? "on" : ""; })
}

//$("idAuto").onclick = function(){
	//if(st.Auto){
		//st.Auto = false; st.Stop(); this.value = "�Զ�";
	//}else{
		//st.Auto = true; st.Run(); this.value = "ֹͣ";
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
    <!-- ���Ź��濪ʼ-->
    <div id="i_news">
      <h2><span>���Ź���</span><p><a href="http://qqgame.qq.com/news.shtml?iPdName=24&channel=1">����&gt;&gt;</a></p></h2>
       <div class="i_content">
          <iframe src="http://qqgame.qq.com/CommNews/static/inc/news_list.htm" class="i_n01" frameBorder=0 scrolling=no allowTransparency></iframe>
         <div class="clear"></div>
       </div>
    </div>
    <!-- ���Ź������-->
    <div id="i_question">
      <h2>
      <span class="kf_logo"><a href="http://service.qq.com/game/qqgame.html" target="_blank" title="��Ѷ�ͷ�"></a></span>
      <span class="search">
      <input type="text" size="38" value="����QQ��Ϸ��������" class="t_input" name="sp" id="textValue" onfocus="if(this.value=='����QQ��Ϸ��������')this.value=''" onkeypress="if(event.keyCode==13){openSearch();return false;}" autocomplete="off" /></span>
      <span class="btn_search"><input type="button" class="wenwen_search" onclick="openSearch();" style="cursor:hand;" value="�� ��"/>
      </span>

      </h2>
       <div class="q_content">
         <ul>
          <li>[��������]&nbsp;&nbsp;<a href="http://service.qq.com/info/33907.html
" target="_blank">��ο��ٻ�ȡ���ֶ�?</a><!--&nbsp;&nbsp;<span>[03/10]</span>--></li>
          <li>[��������]&nbsp;&nbsp;<a href="http://service.qq.com/info/11152.html" target="_blank">QQ��Ϸ����ϴ���Ƭ��?</a></li>
          <li>[��������]&nbsp;&nbsp;<a href="http://service.qq.com/info/11149.html" target="_blank">QQ��Ϸ������޸���Ƭ��?</a></li>
          <li>[��������]&nbsp;&nbsp;<a href="http://service.qq.com/info/9517.html" target="_blank">Ϊʲô���ֶ�������?</a></li>
          <li>[��������]&nbsp;&nbsp;<a href="http://service.qq.com/info/44491_0.html" target="_blank">QQ��Ϸ�����������Щ��Ȩ?</a></li>
          <li>[��������]&nbsp;&nbsp;<a href="http://service.qq.com/info/10018.html" target="_blank">�������ɳ���ϵ��ô����?</a></li>
         </ul>
       </div>
    </div>
    <!-- ���Ź������-->
  </div>
<!-- �м䲿�ֽ���-->
  <div id="rightbar">
   <div class="game_pai">
    <h2>������Ϸ<span>(33��)</span></h2>
    <p><a href="http://minigameimg.qq.com/help/rule81.html" target="_blank">������</a><span class="dot_hot"></span>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule105.html" target="_blank">���ֶ�����</a><span class="dot_hot"></span>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule130.html" target="_blank">����</a><br />
      <a href="http://minigameimg.qq.com/help/rule129.html" target="_blank">�ܵÿ�</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule131.html" target="_blank">&nbsp;��Ƶ������</a><span class="dot_hot"></span>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule91.html" target="_blank">����</a><span class="dot_hot"></span><br>

      <a href="http://minigameimg.qq.com/help/rule132.html" target="_blank">�����</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule90.html" target="_blank">���˶�����</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule31.html" target="_blank">�ڿ�</a><br />
      <a href="http://qqgamecdnimg.qq.com/help/rule137.html" target="_blank">�ɵ���</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="http://qqgamecdnimg.qq.com/help/rule141.html" target="_blank">&nbsp;�ܺ���</a><span class="dot_new"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule125.html" target="_blank">����</a><br />
      <a href="http://minigameimg.qq.com/help/rule13.html" target="_blank">����һ</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule35.html" target="_blank">��ƴ˫��</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://qqgamecdnimg.qq.com/help/rule147.html" target="_blank">����</a><span class="dot_new"></span></p>
   </div>
<!-- ������Ϸ����-->
    <div class="game_mj Tmargin10">
    <h2>�齫����Ϸ<span>(11��)</span></h2>
    <p><a href="http://qqgamecdnimg.qq.com/help/rule133.html" target="_blank">�����齫</a><span class="dot_new"></span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule82.html" target="_blank">QQ�齫</a><span class="dot_hot"></span>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="http://qqgamecdnimg.qq.com/help/rule92.html" target="_blank">�Ĵ��齫</a><span class="dot_hot"></span><br />
      <a href="http://minigameimg.qq.com/help/rule28.html" target="_blank">�人�齫</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule126.html" target="_blank">�Ϻ��齫</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule29.html" target="_blank">��ɳ�齫</a><br />
      <a href="http://minigameimg.qq.com/help/rule32.html" target="_blank">�㶫�齫</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="http://qqgamecdnimg.qq.com/help/rule140.html" target="_blank">�����齫</a><span class="dot_new"></span>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule76.html" target="_blank">�����齫</a></p>
   </div>
<!-- �齫����Ϸ����-->
    <div class="game_xj Tmargin10">
    <h2>���о�����<span>(16��)</span></h2>
    <p><a href="http://minigameimg.qq.com/help/rule11.html" target="_blank">��ƴ����˹</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule83.html" target="_blank">������</a><span class="dot_hot"></span>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule14.html" target="_blank">��ƴ������</a><br />
      <a href="http://game-web.qq.com/help/lz/index.shtml" target="_blank">QQ����</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule85.html" target="_blank">�Զ���</a><span class="dot_hot"></span>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule128.html" target="_blank">��Ů�Ҳ�</a><span class="dot_new"></span><br />
      <a href="http://minigameimg.qq.com/help/rule86.html" target="_blank">����</a><span class="dot_hot"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;<a href="http://game.qq.com/new05/help/wjz.htm" target="_blank">�ڽ���</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule121.html" target="_blank">ƴƴ��</a></p>
   </div>
<!-- ���о��������-->
    <div class="game_qi Tmargin10">
    <h2>������Ϸ<span>(8��)</span></h2>
    <p><a href="http://minigameimg.qq.com/help/rule87.html" target="_blank">�Ĺ�����</a><span class="dot_hot"></span>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule4.html" target="_blank">�й�����</a><span class="dot_hot"></span>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule20.html" target="_blank">���й�����</a><br />
      <a href="http://minigameimg.qq.com/help/rule21.html" target="_blank">QQ����&nbsp;&nbsp;</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule12.html" target="_blank">������</a><span class="dot_hot"></span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule9.html" target="_blank">������</a><br />
      <a href="http://minigameimg.qq.com/help/rule17.html" target="_blank">Χ��</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="http://minigameimg.qq.com/help/rule127.html" target="_blank">��������</a>    </p>
    </div>
<!-- ������Ϸ����-->   
    <div class="game_sj Tmargin10">
    <h2>�ֻ���Ϸ<span>(7��)</span></h2>
    <p><a href="http://mqqgame.qq.com/showGameInfo.action?gameId=994&amp;from=qqgame" target="_blank">������</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="http://mqqgame.qq.com/showGameInfo.action?gameId=995&amp;from=qqgame" target="_blank">����</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="http://mqqgame.qq.com/showGameInfo.action?gameId=996&amp;from=qqgame" target="_blank">�齫</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="http://mqqgame.qq.com/showGameInfo.action?gameId=998&amp;from=qqgame" target="_blank">�й�����</a><br />
      <a href="http://mqqgame.qq.com/showGameInfo.action?gameId=997&amp;from=qqgame" target="_blank">������&nbsp;&nbsp;</a>|&nbsp;&nbsp;<a href="http://mqqgame.qq.com/showGameInfo.action?gameId=999&amp;from=qqgame" target="_blank">����</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="http://mqqgame.qq.com/showGameInfo.action?gameId=1000&amp;from=qqgame" target="_blank">�����</a>    </p>
    </div>
    <div class="r_box"></div>
   <div class="clear"></div>
  </div>
<!-- ��Ϸ�б����-->
 </div>
 <div class="clear"></div>
<div class="footer">
  <p><A href="http://www.tencent.com/" target="_blank">������Ѷ</A> | <A href="http://www.tencent.com/index_e.shtml" target="_blank">About Tencent </A>| 
  <A href="http://www.qq.com/contract.shtml" target="_blank">��������</A> | <A href="http://www.tencentmind.com/" target="_blank">������</A> | <A href="http://hr.tencent.com/" target="_blank">��Ѷ��Ƹ</A> | <A href="http://www.tencent.com/about/corp.shtml" target="_blank">����Ǣ̸</A> | <A href="http://www.qq.com/map/" target="_blank">��վ����</A> | <A href="http://service.qq.com/" target="_blank">��Ѷ�ͷ�</A><BR>
  Copyright &copy; 1998 �C 2010 Tencent. All Rights Reserved. &nbsp;&nbsp;<A href="http://www.tencent.com/law/mo_law.shtml?/law/copyright.htm" target=_blank>��Ѷ��˾ ��Ȩ����</A></p>
</div>

<script language="javascript" src="http://pingjs.qq.com/ping.js"></script>
<script language="javascript">
if(typeof(pgvMain) == 'function')
pgvMain();
</script>
</form>
</body>
</html>
