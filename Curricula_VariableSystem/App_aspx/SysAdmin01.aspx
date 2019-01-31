<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SysAdmin01.aspx.cs" Inherits="Curricula_VariableSystem.App_aspx.SysAdmin00" %>

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
                    <h2 style="text-align:center">添加公告信息</h2>

                <table style="width: 100%; ">
            <tr>
                <td class="auto-style3">公告标题：<asp:TextBox ID="TextBox1" runat="server" style="vertical-align:middle;" ></asp:TextBox>
                    *</td>
                <td class="auto-style5">发布时间：<asp:TextBox ID="TextBox2" runat="server" style="vertical-align:middle;" TextMode="Date" ></asp:TextBox>*(****年-**月-**日)</td>
            </tr><tr><td></td></tr>
            <tr>
                <td class="auto-style1">发布单位：<asp:ListBox ID="ListBox1" runat="server" style="vertical-align:middle;" Rows="1">
                    <asp:ListItem>教务处</asp:ListItem>
                    <asp:ListItem>校长办公室</asp:ListItem>
                    </asp:ListBox>*</td>
                <td class="auto-style1">有效期限：<asp:TextBox ID="TextBox3" runat="server" style="vertical-align:middle;" TextMode="Date" ></asp:TextBox>*(****年-**月-**日)</td>
            </tr><tr><td></td></tr>
            <tr>
                <td>发布内容：<asp:TextBox ID="TextBox4" runat="server" style="vertical-align:top;" TextMode="MultiLine" Height="234px" Width="414px"></asp:TextBox></td>
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
