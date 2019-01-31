<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Curricula_VariableSystem.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>安徽大学选课系统</title>
    <style type="text/css">
        .style1 
        {
        height:65px; background:url(images/Login-bg.gif) left top repeat-x #fff; font-family:Tahoma, Geneva, sans-serif; font-size:100%; line-height:1.125em; color:#1c2328;
        }
 
        .auto-style1 {
            text-align: left;
        }
 
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="style1">    </div>
        <div style="font-family: '微软雅黑 Light'; font-size: 65px; color: #0066CC;">      
             <asp:Image ID="Image1" runat="server" ImageUrl="~/images/AHULogo.jpg" BorderStyle="None" Height="97px" Width="360px" ImageAlign="TextTop" />
             选课系统</div>
        <div style="background-image: url('http://localhost:63375/images/login1.jpg');  top: 180px; left: 110px; height: 380px; width: 394px; margin-left: 284px; position: absolute;">
            </div>
        <div style="border: medium double #669999; margin-left: 787px; margin-top: 0px; height: 383px; background-image: url('http://localhost:63375/images/login2.jpg'); width: 457px;" class="auto-style1" dir="ltr" > 
<br /><br /><br /> <br /><br /><br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="UnameText" runat="server" style="margin-top: 5px" height="18px" width="188px" BackColor="#FFFFCC" Font-Names="黑体" Font-Size="Large"></asp:TextBox> 
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:TextBox ID="UpswText" runat="server" style="margin-top: 8px" height="18px" width="188px" BackColor="#FFFFCC" Font-Names="黑体" TextMode="Password" Font-Size="Large"></asp:TextBox> 
            <br />
            <br />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:RadioButton ID="RadioButton1" runat="server" Height="18px" Width="20px" GroupName="status" />
            &nbsp;
            <asp:RadioButton ID="RadioButton2" runat="server" Height="18px" Width="20px" GroupName="status" />
            &nbsp;
            <asp:RadioButton ID="RadioButton3" runat="server" Height="18px" Width="20px" GroupName="status" />
            <br />
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="LButton" runat="server" BackColor="#99CCFF" BorderColor="#669999" BorderStyle="Double" CssClass="style1" Font-Bold="False" Font-Names="微软雅黑" height="35px" Text="登陆" width="54px" OnClick="LButton_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="RButton" runat="server" BackColor="#99CCFF" BorderColor="#669999" BorderStyle="Double" CssClass="style1" Font-Names="微软雅黑" height="35px" Text="重置" width="54px" OnClick="RButton_Click" />
        </div>
    </form>
</body>
</html>
