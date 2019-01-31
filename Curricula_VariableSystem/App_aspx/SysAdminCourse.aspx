<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SysAdminCourse.aspx.cs" Inherits="Curricula_VariableSystem.App_aspx.SysAdminCourse" %>
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
                <asp:ListItem Value="SysControl.aspx">选课控制</asp:ListItem>
        </asp:BulletedList>
                    <h2 style="text-align:center">课程信息</h2>
                 <div dir="ltr"  >
                     &nbsp;&nbsp;&nbsp; &nbsp;课程名称：<asp:TextBox ID="TextBox1" runat="server" style="vertical-align:middle; " Height="27px" ></asp:TextBox>
                     &nbsp;
                     <asp:Button ID="Button1" runat="server" Text="查询" style="vertical-align:middle; " Width="66px" OnClick="Button1_Click"/>
            &nbsp;</div><br/>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" Width="100%">
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="课程名称" DataNavigateUrlFormatString="SysAdminCourse00.aspx?课程名称={0}" DataTextField="课程名称" HeaderText="课程名称" />
                <asp:BoundField DataField="课程类别" HeaderText="课程类别" SortExpression="课程类别" />
            </Columns>
            <RowStyle HorizontalAlign="Center" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CVSDBConnectionString2 %>" DeleteCommand="DELETE FROM Course FROM Course INNER JOIN Teacher ON Course.教师工号 = Teacher.教师工号 INNER JOIN Dept ON Course.学院编号 = Dept.学院编号" SelectCommand="SELECT Course.课程名称, Course.课程类别 FROM Course INNER JOIN Teacher ON Course.教师工号 = Teacher.教师工号 INNER JOIN Dept ON Teacher.学院编号 = Dept.学院编号 WHERE (Course.发布状态 = @发布状态)" UpdateCommand="UPDATE Course SET 课程编号 =, 课程名称 =, 课程类别 =, 学分 =, 上课时间 =, 上课地点 =, 人数上限 =, 课程介绍 = FROM Course INNER JOIN Dept ON Course.学院编号 = Dept.学院编号 INNER JOIN Teacher ON Course.教师工号 = Teacher.教师工号">
            <SelectParameters>
                <asp:Parameter DefaultValue="1" Name="发布状态" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
