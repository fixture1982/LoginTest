<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="程序.WebForm2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:Wizard ID="Wizard1" runat="server" Height="214px" Width="469px" 
            BackColor="#EFF3FB" BorderColor="#B5C7DE" BorderWidth="1px" 
            Font-Names="Verdana" Font-Size="0.8em">
            <StepStyle Font-Size="0.8em" ForeColor="#333333" />
            <WizardSteps>
                <asp:WizardStep ID="WizardStep1" runat="server" Title="个人信息">
                </asp:WizardStep>
                <asp:WizardStep ID="WizardStep2" runat="server" Title="教育背景">
                </asp:WizardStep>
                <asp:WizardStep runat="server" Title="工作经验">
                </asp:WizardStep>
                <asp:WizardStep runat="server" Title="应聘职位">
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
    </form>
</body>
</html>
