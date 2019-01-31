<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SysAdminTeacher.aspx.cs" Inherits="Curricula_VariableSystem.App_aspx.SysAdminTeacher" %>

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
                    <h2 style="text-align:center">教师信息</h2>
             <div dir="ltr"  >
                    &nbsp;&nbsp;&nbsp;
                    &nbsp;教师工号：<asp:TextBox ID="TextBox1" runat="server" style="vertical-align:middle; " Height="27px" ></asp:TextBox>
            &nbsp;
                    <asp:Button ID="Button5" runat="server" Text="查询" style="vertical-align:middle; " OnClick="Button5_Click" Width="66px"/>
            </div><br/>

        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="教师工号" DataSourceID="SqlDataSource1" Width="100%">
            <Columns>
                <asp:HyperLinkField DataNavigateUrlFields="教师工号" DataNavigateUrlFormatString="SysAdminTeacher00.aspx?教师工号={0}" DataTextField="教师工号" HeaderText="教师工号" />
                <asp:BoundField DataField="姓名" HeaderText="姓名" SortExpression="姓名" />
            </Columns>
            <RowStyle HorizontalAlign="Center" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CVSDBConnectionString2 %>" DeleteCommand="DELETE FROM Teacher FROM Teacher INNER JOIN Dept ON Teacher.学院编号 = Dept.学院编号" SelectCommand="SELECT Teacher.教师工号, Teacher.姓名 FROM Teacher INNER JOIN Dept ON Teacher.学院编号 = Dept.学院编号" UpdateCommand="UPDATE Teacher SET 教师工号 =, 学院编号 =, 姓名 =, 性别 = FROM Teacher INNER JOIN Dept ON Teacher.学院编号 = Dept.学院编号"></asp:SqlDataSource>
        <br />
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="专业编号" DataSourceID="SqlDataSource2" Width="100%">
            <Columns>
                <asp:BoundField DataField="专业编号" HeaderText="专业编号" ReadOnly="True" SortExpression="专业编号" />
                <asp:BoundField DataField="学院编号" HeaderText="学院编号" SortExpression="学院编号" />
                <asp:BoundField DataField="专业名称" HeaderText="专业名称" SortExpression="专业名称" />
                <asp:BoundField DataField="年级" HeaderText="年级" SortExpression="年级" />
                <asp:BoundField DataField="辅导员" HeaderText="辅导员" SortExpression="辅导员" />
                <asp:BoundField DataField="联系方式" HeaderText="联系方式" SortExpression="联系方式" />
                <asp:BoundField DataField="学分上限" HeaderText="学分上限" SortExpression="学分上限" />
                <asp:CommandField ShowEditButton="True" />
            </Columns>
            <RowStyle HorizontalAlign="Center" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:CVSDBConnectionString %>" DeleteCommand="DELETE FROM [Major] WHERE [专业编号] = @专业编号" InsertCommand="INSERT INTO [Major] ([专业编号], [学院编号], [专业名称], [年级], [辅导员], [联系方式], [学分上限]) VALUES (@专业编号, @学院编号, @专业名称, @年级, @辅导员, @联系方式, @学分上限)" SelectCommand="SELECT * FROM [Major]" UpdateCommand="UPDATE [Major] SET [学院编号] = @学院编号, [专业名称] = @专业名称, [年级] = @年级, [辅导员] = @辅导员, [联系方式] = @联系方式, [学分上限] = @学分上限 WHERE [专业编号] = @专业编号">
            <DeleteParameters>
                <asp:Parameter Name="专业编号" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="专业编号" Type="String" />
                <asp:Parameter Name="学院编号" Type="String" />
                <asp:Parameter Name="专业名称" Type="String" />
                <asp:Parameter Name="年级" Type="Int32" />
                <asp:Parameter Name="辅导员" Type="String" />
                <asp:Parameter Name="联系方式" Type="String" />
                <asp:Parameter Name="学分上限" Type="Double" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="学院编号" Type="String" />
                <asp:Parameter Name="专业名称" Type="String" />
                <asp:Parameter Name="年级" Type="Int32" />
                <asp:Parameter Name="辅导员" Type="String" />
                <asp:Parameter Name="联系方式" Type="String" />
                <asp:Parameter Name="学分上限" Type="Double" />
                <asp:Parameter Name="专业编号" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
