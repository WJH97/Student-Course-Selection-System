<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SysControl.aspx.cs" Inherits="Curricula_VariableSystem.App_aspx.Syscontrol" %>

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
                <asp:Panel ID="Panel1" runat="server" Height="298px" style="margin-top: 18px" Width="100%">
            <hr/> 
            <h2 style="text-align:center">排课</h2>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="选课编号" DataSourceID="SqlDataSource1" Width="100%">
                        <Columns>
                            <asp:BoundField DataField="选课编号" HeaderText="选课编号" InsertVisible="False" ReadOnly="True" SortExpression="选课编号" />
                            <asp:BoundField DataField="学号" HeaderText="学号" SortExpression="学号" />
                            <asp:BoundField DataField="课程编号" HeaderText="课程编号" SortExpression="课程编号" />
                            <asp:BoundField DataField="成绩" HeaderText="成绩" SortExpression="成绩" />
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                        </Columns>
                        <RowStyle HorizontalAlign="Center" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CVSDBConnectionString %>" DeleteCommand="DELETE FROM [StudentCourse] WHERE [选课编号] = @选课编号" InsertCommand="INSERT INTO [StudentCourse] ([学号], [课程编号], [成绩]) VALUES (@学号, @课程编号, @成绩)" SelectCommand="SELECT * FROM [StudentCourse]" UpdateCommand="UPDATE [StudentCourse] SET [学号] = @学号, [课程编号] = @课程编号, [成绩] = @成绩 WHERE [选课编号] = @选课编号">
                        <DeleteParameters>
                            <asp:Parameter Name="选课编号" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Name="学号" Type="String" />
                            <asp:Parameter Name="课程编号" Type="String" />
                            <asp:Parameter Name="成绩" Type="Int16" />
                        </InsertParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="学号" Type="String" />
                            <asp:Parameter Name="课程编号" Type="String" />
                            <asp:Parameter Name="成绩" Type="Int16" />
                            <asp:Parameter Name="选课编号" Type="Int32" />
                        </UpdateParameters>
                    </asp:SqlDataSource>
<br/>

            <br/>
        </asp:Panel><br/><br/><br/><br/>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp<asp:Button ID="Button1" runat="server" Text="开启选课" OnClick="Button1_Click" OnClientClick="return confirm('确认要开启吗？');"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="Button2" runat="server" Text="关闭选课" OnClientClick="return confirm('确认要关闭吗？');" OnClick="Button2_Click"/>
        </form>
    </body>
    </html>