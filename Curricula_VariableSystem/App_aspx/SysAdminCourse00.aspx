<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SysAdminCourse00.aspx.cs" Inherits="Curricula_VariableSystem.App_aspx.SysAdminCourse00" %>

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
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="课程编号" DataSourceID="SqlDataSource1" Width="100%" AllowPaging="True">
            <Columns>
                <asp:BoundField DataField="课程编号" HeaderText="课程编号" ReadOnly="True" SortExpression="课程编号" />
                <asp:BoundField DataField="课程名称" HeaderText="课程名称" SortExpression="课程名称" />
                <asp:BoundField DataField="课程类别" HeaderText="课程类别" SortExpression="课程类别" />
                <asp:BoundField DataField="教师工号" HeaderText="教师工号" SortExpression="教师工号" />
                <asp:BoundField DataField="学分" HeaderText="学分" SortExpression="学分" />
                <asp:BoundField DataField="上课时间" HeaderText="上课时间" SortExpression="上课时间" />
                <asp:BoundField DataField="上课地点" HeaderText="上课地点" SortExpression="上课地点" />
                <asp:BoundField DataField="人数上限" HeaderText="人数上限" SortExpression="人数上限" />
                <asp:BoundField DataField="已选人数" HeaderText="已选人数" SortExpression="已选人数" />
                <asp:BoundField DataField="课程介绍" HeaderText="课程介绍" SortExpression="课程介绍" />
                <asp:BoundField DataField="发布状态" HeaderText="发布状态" SortExpression="发布状态" />
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            </Columns>
            <RowStyle HorizontalAlign="Center" />
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CVSDBConnectionString2 %>" DeleteCommand="DELETE FROM [Course] WHERE [课程编号] = @课程编号" SelectCommand="SELECT * FROM [Course]" UpdateCommand="UPDATE [Course] SET [课程名称] = @课程名称, [课程类别] = @课程类别, [教师工号] = @教师工号, [学分] = @学分, [上课时间] = @上课时间, [上课地点] = @上课地点, [人数上限] = @人数上限, [已选人数] = @已选人数, [课程介绍] = @课程介绍, [发布状态] = @发布状态 WHERE [课程编号] = @课程编号" InsertCommand="INSERT INTO [Course] ([课程编号], [课程名称], [课程类别], [教师工号], [学分], [上课时间], [上课地点], [人数上限], [已选人数], [课程介绍], [发布状态]) VALUES (@课程编号, @课程名称, @课程类别, @教师工号, @学分, @上课时间, @上课地点, @人数上限, @已选人数, @课程介绍, @发布状态)">
            <DeleteParameters>
                <asp:Parameter Name="课程编号" Type="String" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="课程编号" Type="String" />
                <asp:Parameter Name="课程名称" Type="String" />
                <asp:Parameter Name="课程类别" Type="String" />
                <asp:Parameter Name="教师工号" Type="String" />
                <asp:Parameter Name="学分" Type="Double" />
                <asp:Parameter Name="上课时间" Type="String" />
                <asp:Parameter Name="上课地点" Type="String" />
                <asp:Parameter Name="人数上限" Type="Int32" />
                <asp:Parameter Name="已选人数" Type="Int32" />
                <asp:Parameter Name="课程介绍" Type="String" />
                <asp:Parameter Name="发布状态" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="课程名称" Type="String" />
                <asp:Parameter Name="课程类别" Type="String" />
                <asp:Parameter Name="教师工号" Type="String" />
                <asp:Parameter Name="学分" Type="Double" />
                <asp:Parameter Name="上课时间" Type="String" />
                <asp:Parameter Name="上课地点" Type="String" />
                <asp:Parameter Name="人数上限" Type="Int32" />
                <asp:Parameter Name="已选人数" Type="Int32" />
                <asp:Parameter Name="课程介绍" Type="String" />
                <asp:Parameter Name="发布状态" Type="Int32" />
                <asp:Parameter Name="课程编号" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
