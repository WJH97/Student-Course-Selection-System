﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SelectCourse.aspx.cs" Inherits="Curricula_VariableSystem.App_aspx.SelectCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
         <title>安徽大学选课系统</title>
    <style type="text/css">
        .style1 
        {
        height:65px; background:url(../images/Login-bg.gif) left top repeat-x #fff; font-family:Tahoma, Geneva, sans-serif; font-size:100%; line-height:1.125em; color:#1c2328;
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
    </style>
</head>
<body>
    <form id="form2" runat="server" dir="ltr">
          <div style="float:right;">
           <asp:LinkButton ID="LinkButton1" runat="server"  Font-Names="黑体" Font-Size="Small" style="text-decoration:none" PostBackUrl="~/Login.aspx">退出登录</asp:LinkButton><asp:Label  ID="Label1" runat="server" Font-Names="黑体" Font-Size="Small" ></asp:Label></div>
     <div class=" style1">
         <br/><div style="font-family: '微软雅黑 Light'; font-size: 45px; color: #0066CC;">      
             <asp:Image ID="Image1" runat="server" ImageUrl="~/images/AHULogo2.png" Height="57px" Width="250px" ImageAlign="TextTop" />
             选课系统</div><br/> 
     </div>
        <br/>
        <br/>
<asp:BulletedList ID="BulletedList1" runat="server" DisplayMode="HyperLink"  CssClass="style2" Height="45px" Width="100%" BorderStyle="NotSet">
            <asp:ListItem Value="SysStudent.aspx">公告</asp:ListItem>
            <asp:ListItem Value="SelectCourse.aspx"> 选课</asp:ListItem>    
            <asp:ListItem Value="StudentCourse.aspx">查看已选课程</asp:ListItem>
            <asp:ListItem Value="PersonalCourse.aspx">查看个人课表</asp:ListItem>
            <asp:ListItem Value="StudentScore.aspx">查看成绩</asp:ListItem>
        </asp:BulletedList>
         <br/><br/>
                <div dir="ltr"  >
                    &nbsp;&nbsp;&nbsp;
                    &nbsp;课程名称：<asp:TextBox ID="TextBox1" runat="server" style="vertical-align:middle; " Height="27px" ></asp:TextBox>
            &nbsp;
                    <asp:Button ID="Button5" runat="server" Text="查询" style="vertical-align:middle; " OnClick="Button5_Click" Width="66px"/>
            </div>
        <br/>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%" AllowPaging="True">
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="课程名称" DataNavigateUrlFormatString="SelectCourse01.aspx?课程名称={0}" DataTextField="课程名称" HeaderText="课程名称" />
                <asp:BoundField DataField="课程类别" HeaderText="课程类别" SortExpression="课程类别"  />
                <asp:BoundField DataField="学分" HeaderText="学分" SortExpression="学分"  />              
            </Columns>
            <RowStyle HorizontalAlign="Center" />
        </asp:GridView>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CVSDBConnectionString %>" SelectCommand="SELECT DISTINCT 课程名称, 课程类别, 学分 FROM Course WHERE (发布状态 = @发布状态)">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="发布状态" Type="Int32" />
            </SelectParameters>
          </asp:SqlDataSource>
        <div style="float:right;">
            <asp:Button ID="Button1" runat="server" Text="专业核心课" OnClick="Button1_Click" />&nbsp;<asp:Button ID="Button2" runat="server" Text="专业选修课" OnClick="Button2_Click" />&nbsp;<asp:Button ID="Button3" runat="server" Text="公共基础课" Height="27px" OnClick="Button3_Click" />&nbsp; <asp:Button ID="Button4" runat="server" Text="素质教育课" Height="27px" OnClick="Button4_Click" /></div>
    </form>
</body>
</html>
