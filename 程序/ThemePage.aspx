<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ThemePage.aspx.cs" Inherits="����.ThemePage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>����ҳ��ʵ��Ƥ���л�</title>
        <LINK href="����ר�ν�ʦ��110����%20�ر�İ����ر����-�����_files/c_reset.css" type=text/css 
rel=stylesheet><LINK href="����ר�ν�ʦ��110����%20�ر�İ����ر����-�����_files/c_include.css" 
type=text/css rel=stylesheet><LINK 
href="����ר�ν�ʦ��110����%20�ر�İ����ر����-�����_files/c_con.css" type=text/css 
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
    	<a href="http://www.dahe.cn"><img src='http://www.dahe.cn/upload/index_logo.gif' title='�����' alt='�����'></a>
        <ul class="ulLink1">
        	<li class="liS"><strong><a href="http://news.dahe.cn" target="_blank">����</a></strong></li>
            <li><a href="http://jdwt.dahe.cn/focus/" target="_blank">����</a></li>
            <li><a href="http://photo.dahe.cn/" target="_blank">ͼƬ</a></li>
            <li><a href="http://ent.dahe.cn" target="_blank">����</a></li>
            <li class="liS"><strong><a href="http://opinion.dahe.cn" target="_blank">����</a></strong></li>
            <li><a href="http://t.dahe.cn/" target="_blank">��Ƶ</a></li>
            <li><a href="http://www.dahe.cn/xwzx/sh/index.htm" target="_blank">����</a></li>
            <li><a href="http://news.dahe.cn/dhfd/" target="_blank">�е�</a></li>
        </ul>
        <ul class="ulLink2">
        	<li class="liS"><strong><a href="http://bbs.dahe.cn/" target="_blank">��̳</a></strong></li>
            <li><a href="http://jdwt.dahe.cn/" target="_blank">������̸</a></li>
            <li><a href=" http://news.dahe.cn/dysj/index.html" target="_blank">��һʱ��</a></li>
            <li><a href="http://jdwt.dahe.cn/" target="_blank">�α�</a></li>
            <li><a href="http://house.dahe.cn/" target="_blank">¥��</a></li>
            <li class="liS"><strong><a href="http://i.dahe.cn/" target="_blank">����</a></strong></li>
            <li><a href="http://hnzx.dahe.cn/" target="_blank">���߶Ի�</a></li>
            <li><a href="http://www.dahe.cn/xwzx/wmjzbdt/index.htm" target="_blank">�������</a></li>
            <li><a href="http://shoucang.dahe.cn/" target="_blank">�ղ�</a></li>
            <li><a href="http://edu.dahe.cn/" target="_blank">����</a></li>           
        </ul>
        <ul class="ulLink3">
        	<li class="liS"><a href="http://jr.dahe.cn/" target="_blank">����</a></li>
            <li><a href="http://tuangou.dahe.cn/" target="_blank">�Ź�</a></li>
            <li><a href="http://art.dahe.cn/" target="_blank">����</a></li>
            <li><a href="http://mail.dahe.cn" target="_blank">����</a></li>
            <li><a href="http://law.dahe.cn" target="_blank">����</a></li>
            <li><a href="http://book.dahe.cn/" target="_blank">����</a></li>
            <li><a href="http://py.dahe.cn/" target="_blank">���</a></li>
            <li class="liS"><a href="http://www.dahe.cn/wealth/" target="_blank">�Ƹ�</a></li>
            <li><a href="http://auto.dahe.cn/" target="_blank">����</a></li>
            <li><a href="http://dongman.dahe.cn/" target="_blank">����</a></li>
            <li><a href="http://www.dahe.cn/pdjx/ly/index.htm" target="_blank">����</a></li>
            <li><a href="http://q.dahe.cn/" target="_blank">Ȧ��</a></li>
            <li><a href="http://baixing.dahe.cn/" target="_blank">����</a></li>
            <li><a href="http://xiangyi.dahe.cn" target="_blank">��ҽ</a></li>
        </ul>
    </div>
</div>

<div class="content">
	<div class="mhd">
    	<div class="tit"></a></div>
 	</div>
    <div class="mcont">
        	<!-- �ֲ𲹳����ϲ��� Start -->
        	    <div>
    <div style=" margin-left:0px;">
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" 
            onselectedindexchanged="DropDownList1_SelectedIndexChanged" >
          <asp:ListItem Value="" Text="Ĭ��"></asp:ListItem>
          <asp:ListItem Value="Blue" Text="��Ƥ��"></asp:ListItem>
          <asp:ListItem Value="Gray" Text="��Ƥ��"></asp:ListItem>
        </asp:DropDownList>
        </div>
    </div>

         <h1 style=" font-size:20px;">����ר�ν�ʦ��110���� �ر�İ����ر����</h1>
   <div id="Main" class="aa">
                 
               <div id="msg"><span class="sTime">2010��09��10��09:14</span><span>��Դ:�����-�����ձ� </span><span class="sAuthor"></span></div>
                <div id="main">
        	<div><p><img src="http://img.dahe.cn/2010/09-10/100462527.jpg" border="0" /> </p>
</div>
<div align="center"><p><img src="http://img.dahe.cn/2010/09-10/100462529.jpg" border="0" /> </p>
</div>
<div align="center"><p><img src="http://img.dahe.cn/2010/09-10/100462531.jpg" border="0" /> </p>
</div>
<div align="center"><p>9��9�գ������������ʵ��Сѧ��ѧ��������ʦ����ף����ʦ���տ��֡� ��� ��� �� </p>
</div>
<div align="center"><p><img src="http://img.dahe.cn/2010/09-10/100462533.jpg" border="0" /> </p>
</div>
<div align="center"><p>9��10����ȫ����26����ʦ�ڣ�֣�ݲ��ִ�ѧУ԰��Ļ��������쳣�𱬡�ѧ���Ƿ׷����ʻ�����ʦ���Դ˱���Լ�����ʦ�ĸж�֮�顣��3�¸��� �ν� �� </p>
</div>
<div align="center"><p><img src="http://img.dahe.cn/2010/09-10/100462534.jpg" border="0" /> </p>
</div>
<div align="center"><p>9��8�գ��������������ѧУ��ѧ������ʦ�Ǵ��ϻ�������ʦ���ٽ�����Уѧ���Է���չ����ʦ���������顱��������������������ֹ���Ʒ���������͸���ʦ��������ʦ�ǵĽ���ף������3�߳� ������ �� </p>
</div>
<div align="center"><p><img src="http://img.dahe.cn/2010/09-10/100462535.jpg" border="0" /> </p>
</div>
<div align="center"><p>9��9�գ������۱���������������ĵ�����˸�����������Ļ�����̼�ؿ��͸���ʦ����ʦ������֮�ʣ������ĵ�С�����þɹ����Ȳ����Ƴɻ����ؿ����͸��Լ�����ʦ���ں���ע�⻷����ͬʱףԸ��ʦ���տ��֡���� ��� �� </p>
</div>
<p>�������߰� </p>
<p>��������ĽŲ�����������26����ʦ��Ҳ�ѵ�������ʦ����������ٵ�ְҵ�����������ķ羰��ֻ��վ�ڽ�̨�ϵ���һ˲�䣬�����Դ��������Ʒ����������ѧ�������ϵ��𺳺͸ж����˶�˵ʦ��������������ÿ���˶��ԣ�����Ƥ��ͯ����ɬ�����ٵ��绪��������������У���ʦ��������һ����ֵ�����غ͸ж����ˣ��ڽ�ʦ��������𾴣����������ĵض���ʦ��˵�������տ��֣� </p>
<p>����<strong>110��԰�����������߽�̨</strong> </p>
<p>���������߷�ܿ�������ƣ�����Ϊ����9��9�գ����ߴ�ʡ�������˽⵽��Ŀǰ����ʡ���½�����ҵ��ר�ν�ʦ�Ѵ�110���ˡ� </p>
<p>����ͳ����ʾ��ȫʡ�ֹ�����Сѧר�ν�ʦ87.2���ˣ���Уר�ν�ʦ7.15���ˣ���ְר�ν�ʦ5.95���ˣ�ѧǰ����ר�ν�ʦ5.83���ˣ�����ר�ν�ʦ3����ˡ�ȫʡСѧ��ʦ�о���ר�Ƽ�����ѧ��������Ϊ35.16���ˣ�����Ϊ71.88%����ͨ���н�ʦ�о��б��Ƽ�����ѧ��������Ϊ12.72���ˣ�����Ϊ45.74%����ͨ���н�ʦ�о��б��Ƽ�����ѧ��������Ϊ9.88���ˣ�����Ϊ93.98%�� </p>
<p>����Ϊ�ٽ��������ⷢչ��ȫʡ������չ�����ʦ֧Ԯũ����������ͳ�ƣ�2000��������ȫʡ��֯�����ʦ��ũ��ѧУ�ν�13.5�����˴Ρ� </p>
<p>����ȫʡ��У����ʵʩ���˲�ǿУ���̡���������һ��Эͬ���صĽ�ѧ�����д����Ŷӡ�Ŀǰ���ں���ʡ��У�����ġ���Ժ��Ժʿ�Ѵ�111�ˣ�ר�ν�ʦ�о��и��߼�����ְ�Ƶ�2.36���ˣ�ռ32.98%�������о���������ѧ����2.96���ˣ����в�ʿѧ��5910�ˣ���ռ41.43%����6 </p>
<p>����<strong>��ʦ��֮��Ե������ </strong></p>
<p>����<strong>�����ѣ���ɽ�ӽ�42�� </strong></p>
<p>����9��7�գ���λ����ɽ���Ĳ�����կ�����״�Сѧ����������ʦ���ڸ���һ�꼶Сѧ��д�֡�����59����ĸ�������ʦ�Ǹ�УΨһ��һ����ʦ��1968��ոճ��б�ҵ�ĸ����ѣ�������һ��ɽ���ʦ����һ�ɾ���42�ꡣΪ�ı�ɽ�����ӵ����ˣ���������ʦΪɽ���Ľ�����ҵĬĬ�ط��׳����Լ����ഺ�껪����3��ȫ�� </p>
<p>����<strong>����Ӣ����УΪ���Լ�ΪУ</strong> </p>
<p>��������Ӣ�Ǻ���ʡ�����к�ˮ��ж��ƽСѧ��һ����ͨ��ɽ��Ů��ʦ����ʮ����������ʮ����УΪ�ң�ʮ�����Լ�ΪУ������������ĬĬ���ס����Լ�������ڹ���ŶԽ�ʦ�������⡢���ֿ�����޻�׷�� </p>
<p>����<strong>��ʮ����УΪ�ҡ�����һ�������ѧ</strong> </p>
<p>����1956�꣬��������ж��ƽ��ӵ���ƽ��Ȼ�壬����ʮ����ƶ����ʱһ��С�����֢��ʹ�����²м��������Ժ�ǿ������һ������ѧ���顣������־�򣬳���һ����ʦ���ô���ĺ��Ӷ�����ѧ���ڸ�ĸ���ѵ�֧���£�������ǿ���������ڷܿ̿࣬���ڶ����˸��У�����1974�꿼ȡ������ʦ��ʵ�����Լ���Ը���� </p>
<p>����λ��̫��ɽ����ж��ƽ����Ȼ�����ǳ������ɽ·��᫣���ͨ���㡣1978��6�£������¸���ͣ���ƾɵ�У���Ѿ������ڷ絲�꣬Ϊ�˺����ǵİ�ȫ����ֻ���ú����ǻؼҡ�Ϊ�˲��������ǵ�ѧϰ��20������������ж�󡢷��ж༱�������Ųм����ȣ�ÿ�����ܱ�ȫ�壬���Ұ�����ÿ��ѧ�������ϿΣ���������һ�����ӡ� </p>
<p>����Ϊ���Ӱ��Ľ�����ҵ����ʮ��Ľ�ѧ�������ʮ����УΪ�ң�����û����������ǵ�ѧϰ�� </p>
<p>����<strong>ʮ�����Լ�ΪУ��Ϊ�����ǳ���һ����� </strong></p>
<p>����1993�꣬һ�����������ƾɲ����Ľ��ҡ�����ȴ�Ҳ���һ�������¼�ʮ��ѧ���ķ��ݣ�����ί���½�У�����ò���Ǯ������֮�£��������Ѻ������쵽�Լ�����ȥ�ϿΡ��Ӵˣ����ļұ����ѧ���Ľ��ҡ� </p>
<p>�������Լ�ΪУ�������Ϊ�˸�ѧ���������õ�ѧϰ�����������Ӣһ���˽�����ʳ��ÿ��ʰ���ջ���������Ұ�˳伢�� </p>
<p>����20����УΪ�ң�10�����Լ�ΪУ������ѧ�������˴�ѧ����ʮ��ѧ�������˸��У���������֪ʶ�����Ļ��ı�ҵ���ڸı��ż���ƶ��������ò����Ϊ�ˣ�����Ӣ��Թ�޻ڡ������»���֣��9��9�յ磩 </p>
<p>����<strong>�����������������ؽ�̨ </strong></p>
<p>����9��9�գ������Ա���ƽ�޴�Сѧ��ʦ��������У԰���ѧ�����Ⱞ������������������ľ��֪ʶ������ǰ����������ȷ��Ϊ������˥�������ڣ���һ���벡ħ��������һ�߼������Լ�ϲ���Ľ�̨�ϡ���3������� </p>
<p>����<strong>������ҷ�����ж� </strong></p>
<p>����<strong>��Ὺչ����Աлʦ�����</strong> </p>
<p>��������Ѷ���������ͨѶԱ������������ĸУ��ʦдһ���������е��ţ�ΪĸУʦ������ȥѧϰ��������Ʒ������ʦ������֮�ʣ��������֯��չ��������Աлʦ������������Ա�Ǵ�ͷ��ȫ����������ʦ�ؽ̵ĸ߳��� </p>
<p>�����ڽ�ʦ������֮�ʣ�������ԡ�лʦ��������Ϊ���壬�ƽ��������Ż���뿪չ���Ⱥ���֯�����ˡ�������ǡ��ֳ��ö�ʦ������лʦ�����ı���������лʦ�����Ŵ���������������л��������ʦ���ݽ������ȷḻ��ʡ����������Ļ�����ȫ����������ʦ�ؽ̵ĸ߳�������Ŀǰ�����ظ�������֯���յ���лʦ��������1240��ƪ���ֻ�����8600������56����ֱ��λ��֯�Ѿ���֯���ݽ�ѡ��������11 </p>
<p>����<strong>��ԫ�����ؽ������ʦ </strong></p>
<p>��������Ѷ���������ͨѶԱ�����ż�ʤ�����ڵ�26����ʦ�ڵ���֮�ʣ�9��6�գ���ԫ����Ӫ��ҵ�ҡ����Ͽ�ɽ���ؼ��Ŷ��³������һ�����ó�35��Ԫ��������ԫһ����ѡ����10����ѫ��ʦ��160�������ʦ�� </p>
<p>���������˵���������ĺ��Ͽ�ɽ����һֱ�ѷ�ƶ�������������Ļ�������֧����ṫ����Ϊ�岻�ݴǵ����κ�ʹ����ʼ�հ���ѧ���̡���ʦ�ؽ̷�����ҵ���ε���Ҫλ�ã�ϣ��ͨ����ѧ���̻������ʦ����������ᡢ��ҵ�ľ���֮�ģ��������Ż����Ѫ�������˵���ʦ��һ�ݾ��⡣ </p>
<p>����<strong>��ʦ����ȥʦ������ </strong></p>
<p>����<strong>��˿�¾���δ�� </strong></p>
<p>����<strong>����׷��̫���ػ�����ѧУ������</strong> </p>
<p>���������������ž�����ͨѶԱ۬�� </p>
<p>�������Ǻ���ȼ���Լ�������ݷݷѧ��·�����Ǵ��ϣ��¾����һ��˿��֯��һ������У԰����Щ���ӣ���Ȼ������̫���ػ�����ѧУ�������������˸л��� </p>
<p>������7��26�������ڸ�ѧ���͸���¼ȡ֪ͨ���·��ͻ����֢������񣬼���ÿ�춼������ǰ�̹���ѧ����������ͬ����Ѷ��ȫ�����شҴҸ������ڱ�ʹ��һ�����������ĵ��εΣ���Ѱ���������ڻ��е������ۼ��� </p>
<p>����43�꣬5��У�����ġ������ޱ�����Ϊ��ҵ��Ϊѧ��������һ���� </p>
<p>����2005��8�����յ����б���ʱ��ѧУ��Ŀ�Ͻ�ʣ��6��8��Ǯ������Ƿˮ��ѣ�ѧУˮ�綼ͣ�ˣ�ȫУ46����ʦ��ѧ��ȴֻ��110���ˡ��������һ������̯�ӡ�����û�������� </p>
<p>�����в���ѧ�������վͺ���ʦ��һ����Ͻ����������������ׯ�ҷá��������ڣ����߷���200����ͥ�� </p>
<p>����ʦ���������������ν�ʦ�٣����վ������ְ��ѧ������С����Ҫ�������ģ�����ÿ�����絽У��������У�� </p>
<p>�������նԼҳ��ĳ�ŵ���ǡ���ͷ֧Ʊ��������һ�꣬����У԰�ڵ������ؾ�ȫ��Ӳ��������ֹ���100����ѧ��˫�˴�����ס��������2008�꣬�����ֿ�ʼ���½�ѧ¥�������Ͷ��ʹ�á� </p>
<p>����������������͸�����һ������ѧ������˵��2008��10��5���糿�����θо��е㷢�ա�������Ѳ�ӵ�����֪�������������г������͵�ѧУ����һ����������������Һһֱ������9��࣬������Ȼ�غ�������ߡ����������϶�û�Է���һֱ�������տ��㡭��������ҽ����̾�Ŷ�����˵��������������ֹ��ס���������������Ĺ��£���Ϥ�����ˣ���ڶ���˵���ܶࡣ </p>
<p>�������ϵ���˿����������ɻ���ʼ�ɡ����������У�������ʦ��δ�뿪�� </p>

        </div><!--main-->

    </div>

    	<!-- �ֲ𲹳����ϲ��� End -->

    
      <DIV class=dConR id=sideBar><IFRAME id=iframe1 name=iframe1 marginWidth=0 
marginHeight=0 src="����ר�ν�ʦ��110����%20�ر�İ����ر����-�����_files/index-ilist.htm" 
frameBorder=0 width=320 scrolling=no height=1950 
allowTransparency></IFRAME></DIV>
    </div>
    <div class="mft"></div>
</div>




    </form>
</body>
</html>
