<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="jianli_xiangdao.aspx.cs" Inherits="����.jianli_xiangdao" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>����ע����</title>
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
    <div class="navLinks"><a href="http://id.qq.com/">��½</a><span>|</span><a href="http://im.qq.com">�˳�</a></div>
</div>


    <div class="insideNav">

      <div class="padder"> <a class="active">ע�����</a> <a href="http://haoma.qq.com/" target="_blank">�����޸�</a> <span>|</span> <a href="http://freeqqm.qq.com/cgi-bin/freeqqwl_0">�������</a> </div>

    </div>

    <div class="steps"> <span class="step1_active">��д��Ϣ</span><span class="step2">�޸ĳɹ�</span> </div>

    <div class="stepSplit"><!--ע������ȫ���Ǳ����� -->
    </div>
      <div  class="stepSplit2">
           <asp:Wizard ID="Wizard1" runat="server" ActiveStepIndex="0" BackColor="#EFF3FB" 
            BorderColor="#B5C7DE" BorderWidth="1px" Font-Names="Verdana" Font-Size="0.8em" 
            Height="306px" Width="534px">
            <StepStyle Font-Size="0.8em" ForeColor="#333333" />
            <WizardSteps>
                <asp:WizardStep ID="WizardStep1" runat="server" Title="������Ϣ">
                    <h3>
                        ������Ϣ</h3>
                    <table border="0" cellpadding="0" cellspacing="2">
                        <tr>
                            <td>
                                ������</td>
                            <td>
                                <input type="text" /></td>
                            <td>
                                �������£�</td>
                            <td>
                                <select name="select">
                                    <option>2010</option>
                                    <option>2011</option>
                                    <option>2012</option>
                                    <option>2013</option>
                                </select> �� 
                                <select name="D1">
                                    <option>1</option>
                                    <option>2</option>
                                    <option>3</option>
                                    <option>4</option>
                                </select>�� 
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
                                ���֤�ţ�</td>
                            <td>
                                <input type="text" /></td>
                            <td>
                                ���᣺</td>
                            <td>
                                <input type="text" /></td>
                        </tr>
                        <tr>
                            <td>
                                �ֻ����룺</td>
                            <td>
                                <input type="text" value="" /></td>
                            <td>
                                �־�ס�أ�</td>
                            <td>
                                <input type="text" /></td>
                        </tr>
                    </table>
                </asp:WizardStep>
                <asp:WizardStep ID="WizardStep2" runat="server" Title="��������">
                    <h3>
                        ��������</h3>
                    <table>
                        <tr>
                            <td>
                                ��ҵԺУ</td>
                            <td>
                                <input type="text" /></td>
                            <td>
                                ��ѧרҵ</td>
                            <td>
                                <input type="text" /></td>
                        </tr>
                    </table>
                </asp:WizardStep>
                <asp:WizardStep ID="WizardStep3" runat="server" Title="��������">
                    <h3>
                        ��������</h3>
                    <div>
                        <textarea name="S1" style="height: 100px; width: 252px"></textarea></div>
                </asp:WizardStep>
                <asp:WizardStep ID="WizardStep4" runat="server" Title="ӦƸְλ">
                    <h3>
                        ӦƸְλ</h3>
                    <table>
                        <tr>
                            <td>
                                ӦƸְλ</td>
                            <td>
                                <input type="text" /></td>
                            <td>
                                ��������</td>
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

      <label for="radio">���������ΪQQ�ʺ�</label>
 
      <input type="radio" name="choice" id="radio2" value="EMAIL" />

      <label for="radio2">����ʹ��Email��ΪQQ�ʺ�</label>

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
