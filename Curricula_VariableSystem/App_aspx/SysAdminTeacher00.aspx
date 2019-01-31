<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SysAdminTeacher00.aspx.cs" Inherits="Curricula_VariableSystem.App_aspx.SysAdminTeacher00" %>

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
        </asp:BulletedList>
                    <h2 style="text-align:center">教师信息</h2><br/>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="教师工号" DataSourceID="SqlDataSource1" Width="100%">
            <Columns>
                <asp:BoundField DataField="教师工号" HeaderText="教师工号" ReadOnly="True" SortExpression="教师工号" />
                <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
                <asp:BoundField DataField="性别" HeaderText="性别" SortExpression="性别" />
                <asp:BoundField DataField="手机号码" HeaderText="手机号码" SortExpression="手机号码" />
                <asp:BoundField DataField="邮箱" HeaderText="邮箱" SortExpression="邮箱" />
                <asp:BoundField DataField="学院名称" HeaderText="学院名称" SortExpression="学院名称" />
                <asp:BoundField DataField="密码" HeaderText="密码" SortExpression="密码" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
            <RowStyle HorizontalAlign="Center" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CVSDBConnectionString2 %>" DeleteCommand="DELETE FROM Teacher FROM Teacher INNER JOIN Dept ON Teacher.学院编号 = Dept.学院编号" SelectCommand="SELECT Teacher.教师工号, Teacher.姓名, Teacher.性别, Teacher.手机号码, Teacher.邮箱, Dept.学院名称, Teacher.密码 FROM Teacher INNER JOIN Dept ON Teacher.学院编号 = Dept.学院编号" UpdateCommand="UPDATE Teacher SET 教师工号 =, 学院编号 =, 姓名 =, 性别 = FROM Teacher INNER JOIN Dept ON Teacher.学院编号 = Dept.学院编号"></asp:SqlDataSource>
    </form>
</body>
</html>
