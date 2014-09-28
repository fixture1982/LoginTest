<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jianli_xiangdao.aspx.cs" Inherits="程序.jianli_xiangdao" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>简历注册向导</title>
    <link href="number.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    td{ font-size:12px;}
    </style>
    
</head>
<body lang="en">
    <form id="form1" runat="server">
    
<%--                <asp:SiteMapPath ID="SiteMapPath1" ShowToolTips="true" runat="server" Font-Names="Verdana" Font-Size="12" PathSeparator="<<">
        </asp:SiteMapPath>--%>
  <div id="load_complete" style="display:block;">

    <div class="header">
	<a href="http://im.qq.com" class="imqq"><img src="chr_logo_news.gif" /></a>
    <div class="navLinks"><a href="http://id.qq.com/">登陆</a><span>|</span><a href="http://im.qq.com">退出</a></div>
</div>


    <div class="insideNav">

      <div class="padder"> <a class="active">注册简历</a> <a href="http://haoma.qq.com/" target="_blank">简历修改</a> <span>|</span> <a href="http://freeqqm.qq.com/cgi-bin/freeqqwl_0">管理简历</a> </div>

    </div>

    <div class="steps"> <span class="step1_active">填写信息</span><span class="step2">修改成功</span> </div>

    <div class="stepSplit"><!--注：以下全部是必填项 -->
    </div>
      <div  class="stepSplit2">
           <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" BackColor="#EFF3FB" 
            BorderColor="#B5C7DE" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" 
            Height="306px" Width="534px">
            <StepStyle Font-Size="0.8em" ForeColor="#333333" />
            <WizardSteps>
                <asp:WizardStep ID="WizardStep1" runat="server" Title="个人信息">
                    <h3>
                        个人信息</h3>
                    <table border="0" cellpadding="0" cellspacing="2">
                        <tr>
                            <td>
                                姓名：</td>
                            <td>
                                <input type="text" /></td>
                            <td>
                                出生年月：</td>
                            <td>
                                <select name="select">
                                    <option>2010</option>
                                    <option>2011</option>
                                    <option>2012</option>
                                    <option>2013</option>
                                </select> 年 
                                <select name="D1">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                </select>月 
                                <select name="D2">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                身份证号：</td>
                            <td>
                                <input type="text" /></td>
                            <td>
                                籍贯：</td>
                            <td>
                                <input type="text" /></td>
                        </tr>
                        <tr>
                            <td>
                                手机号码：</td>
                            <td>
                                <input type="text" value="" /></td>
                            <td>
                                现居住地：</td>
                            <td>
                                <input type="text" /></td>
                        </tr>
                    </table>
                </asp:WizardStep>
                <asp:WizardStep ID="WizardStep2" runat="server" Title="教育背景">
                    <h3>
                        教育背景</h3>
                    <table>
                        <tr>
                            <td>
                                毕业院校</td>
                            <td>
                                <input type="text" /></td>
                            <td>
                                所学专业</td>
                            <td>
                                <input type="text" /></td>
                        </tr>
                    </table>
                </asp:WizardStep>
                <asp:WizardStep ID="WizardStep3" runat="server" Title="工作经验">
                    <h3>
                        工作经验</h3>
                    <div>
                        <textarea name="S1" style="height: 100px; width: 252px"></textarea></div>
                </asp:WizardStep>
                <asp:WizardStep ID="WizardStep4" runat="server" Title="应聘职位">
                    <h3>
                        应聘职位</h3>
                    <table>
                        <tr>
                            <td>
                                应聘职位</td>
                            <td>
                                <input type="text" /></td>
                            <td>
                                期望工资</td>
                            <td>
                                <input type="text" /></td> 
                        </tr>
                    </table>
                </asp:WizardStep>
            </WizardSteps>
            <SideBarButtonStyle BackColor="#507CD1" Font-Names="Verdana" 
                ForeColor="White" />
            <NavigationButtonStyle BackColor="White" BorderColor="#507CD1" 
                BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" 
                ForeColor="#284E98" />
            <SideBarStyle BackColor="#507CD1" Font-Size="0.9em" VerticalAlign="Top" />
            <HeaderStyle BackColor="#284E98" BorderColor="#EFF3FB" BorderStyle="Solid" 
                BorderWidth="2px" Font-Bold="True" Font-Size="0.9em" ForeColor="White" 
                HorizontalAlign="Center" />
        </asp:Wizard>
      </div>
    <div class="accountType" style="display:none">

      <input type="radio" name="choice" id="radio" value="QQ" checked="checked" />

      <label for="radio">申请号码作为QQ帐号</label>
 
      <input type="radio" name="choice" id="radio2" value="EMAIL" />

      <label for="radio2">申请使用Email作为QQ帐号</label>

    </div>
    <!--errorClew -->

    <!--<div class="errorClew" id="errorClew"></div> -->

    <!--otherClew -->

</div>


  </div>
<input name="id" type="hidden" value="123456789" />
    </form>
</body>
</html>
