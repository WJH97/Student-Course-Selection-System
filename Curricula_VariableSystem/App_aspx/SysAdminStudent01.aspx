<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SysAdminStudent01.aspx.cs" Inherits="Curricula_VariableSystem.App_aspx.SysAdminStudent01" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <title>安徽大学选课系统</title>
    <style type="text/css">
        .style1 
        {
        height:75px; background:url(../images/Login-bg.gif) left top repeat-x #fff; font-family:Tahoma, Geneva, sans-serif; font-size:100%; line-height:1.125em; color:#1c2328;
        }
 
        .style2 {
            margin:0px;padding:0px;
            border-bottom:1px solid #ccc;border-top:1px solid #ccc;
            background-image:url(../images/Login-bg.gif);
        }
            .style2 li {
              display:inline-block;  
            padding:15px 30px 15px 30px;
            border-right:1px solid #ddd;
            }
            .style2 a {
            color:#666;
            text-decoration:none;
            }
             .style2 a:hover 
                {
                    color: cadetblue;
                }
        .style3 {
        float:right;
        }
        .auto-style1 {
            height: 27px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
     <div class=" style1">
       <div style="float:right;">
           <asp:LinkButton ID="LinkButton1" runat="server"  Font-Names="黑体" Font-Size="Small" style="text-decoration:none" PostBackUrl="~/Login.aspx">退出登录</asp:LinkButton><asp:Label  ID="Label1" runat="server" Font-Names="黑体" Font-Size="Small" ></asp:Label></div>
         <br/><div style="font-family: '微软雅黑 Light'; font-size: 45px; color: #0066CC;">      
             <asp:Image ID="Image1" runat="server" ImageUrl="~/images/AHULogo2.png" Height="57px" Width="250px" ImageAlign="TextTop" />
             选课系统</div><br/> 
     </div>
        <br/>
        <br/>
<asp:BulletedList ID="BulletedList1" runat="server" DisplayMode="HyperLink"  CssClass="style2" Height="45px" Width="100%" BorderStyle="NotSet">
            <asp:ListItem Value="SysAdmin.aspx">公告</asp:ListItem>
            <asp:ListItem Value="SysAdminStudent.aspx"> 学生信息管理</asp:ListItem>    
            <asp:ListItem Value="SysAdminTeacher.aspx">教师信息管理</asp:ListItem>
            <asp:ListItem Value="SysAdminCourse.aspx">课程信息管理</asp:ListItem>
            <asp:ListItem Value="SysAdminRelease.aspx">发布课程管理</asp:ListItem>
        </asp:BulletedList>
                    <h2 style="text-align:center">添加学生信息</h2>

                <table style="width: 100%; ">
            <tr>
                <td class="auto-style3">学&nbsp;&nbsp;号：<asp:TextBox ID="TextBox1" runat="server" style="vertical-align:middle;" ></asp:TextBox>
                    *</td>
                <td class="auto-style5">姓&nbsp;&nbsp;名：<asp:TextBox ID="TextBox2" runat="server" style="vertical-align:middle;" ></asp:TextBox>*</td>
            </tr><tr><td></td></tr>
            <tr>
                <td class="auto-style2">性&nbsp;&nbsp;别：<asp:ListBox ID="ListBox1" runat="server" style="vertical-align:middle;" Rows="1">
                    <asp:ListItem>男</asp:ListItem>
                    <asp:ListItem>女</asp:ListItem>
                    </asp:ListBox>*</td>
                <td class="auto-style1">年&nbsp;&nbsp;级：<asp:ListBox ID="ListBox2" runat="server" style="vertical-align:middle;" Rows="1" >
                    <asp:ListItem>请选择年级</asp:ListItem>
                    <asp:ListItem>16</asp:ListItem>
                    <asp:ListItem>15</asp:ListItem>
                    <asp:ListItem>14</asp:ListItem>
                    <asp:ListItem>13</asp:ListItem>
                    <asp:ListItem>12</asp:ListItem>
                    <asp:ListItem>11</asp:ListItem>
                    </asp:ListBox>
                    *</td>
            </tr><tr><td></td></tr>
            <tr>
                <td class="auto-style1">学&nbsp;&nbsp;院：
                    <asp:DropDownList ID="DropDownList1" runat="server" style="vertical-align:middle;" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                        <asp:ListItem>请选择学院</asp:ListItem>
                        <asp:ListItem>数学科学学院</asp:ListItem>
                        <asp:ListItem>计算机科学与技术学院</asp:ListItem>
                        <asp:ListItem>外语学院</asp:ListItem>
                        <asp:ListItem>艺术学院</asp:ListItem>
                    </asp:DropDownList>

                    专&nbsp;&nbsp;业：<asp:ListBox ID="ListBox3" runat="server" style="vertical-align:middle;" Rows="1" >
                        <asp:ListItem>请选择专业</asp:ListItem>
                    </asp:ListBox>
                    *</td>
                <td class="auto-style1">密&nbsp;&nbsp;码：<asp:TextBox ID="TextBox3" runat="server" style="vertical-align:middle;" ></asp:TextBox>*</td>                
            </tr>
            <tr>
                <td></td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="提 交" Width="98px" OnClick="Button1_Click" /></td>
                <td>
                    <asp:Button ID="Button2" runat="server" Text="重 置" Width="98px" OnClick="Button2_Click"  /></td>
            </tr>
        </table>
    </form>
</body>
</html>
