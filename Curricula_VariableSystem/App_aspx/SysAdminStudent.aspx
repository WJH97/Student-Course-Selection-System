<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SysAdminStudent.aspx.cs" Inherits="Curricula_VariableSystem.App_aspx.SysAdminStudent" %>

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
                    <h2 style="text-align:center">学生信息</h2>
         <div dir="ltr"  >
                    &nbsp;&nbsp;&nbsp;
                    &nbsp;学号：<asp:TextBox ID="TextBox1" runat="server" style="vertical-align:middle; " Height="27px" ></asp:TextBox>
            &nbsp;
                    <asp:Button ID="Button5" runat="server" Text="查询" style="vertical-align:middle; " OnClick="Button5_Click" Width="66px"/>
            </div>
                <div style="float:right">
        <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/App_aspx/SysAdminStudent01.aspx">添加学生</asp:LinkButton></div>
<br/>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="学号" DataSourceID="SqlDataSource1" Width="100%">
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="学号" DataNavigateUrlFormatString="SysAdminStudent00.aspx?学号={0}" DataTextField="学号" HeaderText="学号" />
                <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
            </Columns>
            <RowStyle HorizontalAlign="Center" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CVSDBConnectionString2 %>" DeleteCommand="DELETE FROM StudentData WHERE (学号 = @学号)" InsertCommand="INSERT INTO StudentData(姓名, 性别, 学号, 专业编号, 密码) VALUES (,,,,)" SelectCommand="SELECT StudentData.学号, StudentData.姓名 FROM StudentData INNER JOIN Major ON StudentData.专业编号 = Major.专业编号 INNER JOIN Dept ON Major.学院编号 = Dept.学院编号" UpdateCommand="UPDATE StudentData SET 学号 =, 姓名 =, 性别 =, 密码 = FROM StudentData INNER JOIN Major ON StudentData.专业编号 = Major.专业编号 INNER JOIN Dept ON Major.学院编号 = Dept.学院编号">
            <DeleteParameters>
                <asp:Parameter Name="学号" />
            </DeleteParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
