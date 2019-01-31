<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SysAdmin.aspx.cs" Inherits="Curricula_VariableSystem.App_aspx.SysAdmin" %>

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
                <asp:Panel ID="Panel1" runat="server" Height="298px" style="margin-top: 18px">
            <hr/> 
            <h2 style="text-align:center">公告</h2>
             <div style="float:right">
        <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/App_aspx/SysAdmin01.aspx">添加公告</asp:LinkButton></div>
<br/>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="公告标题" DataSourceID="SqlDataSource1" EnableModelValidation="False" GridLines="None" style="margin-left: 5px" Width="100%">
                <Columns>
                    <asp:HyperLinkField DataTextField="公告标题" HeaderText="公告标题"  DataNavigateUrlFormatString="SysAdminCont.aspx?公告标题={0}" DataNavigateUrlFields="公告标题" /> 
                    <asp:BoundField DataField="发布单位" HeaderText="发布单位" SortExpression="发布单位" />
                    <asp:BoundField DataField="发布时间" HeaderText="发布时间" SortExpression="发布时间" />
                    <asp:BoundField DataField="有效期限" HeaderText="有效期限" SortExpression="有效期限" />
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
                <RowStyle HorizontalAlign="Center" />
            </asp:GridView>
            <br/>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:CVSDBConnectionString %>" SelectCommand="SELECT [公告标题], [发布单位], [发布时间], [有效期限] FROM [Notice]" DeleteCommand="DELETE FROM [Notice] WHERE [公告标题] = @公告标题" InsertCommand="INSERT INTO [Notice] ([公告标题], [发布单位], [发布时间], [有效期限]) VALUES (@公告标题, @发布单位, @发布时间, @有效期限)" UpdateCommand="UPDATE [Notice] SET [发布单位] = @发布单位, [发布时间] = @发布时间, [有效期限] = @有效期限 WHERE [公告标题] = @公告标题" >
                <DeleteParameters>
                    <asp:Parameter Name="公告标题" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="公告标题" Type="String" />
                    <asp:Parameter Name="发布单位" Type="String" />
                    <asp:Parameter DbType="Date" Name="发布时间" />
                    <asp:Parameter DbType="Date" Name="有效期限" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="发布单位" Type="String" />
                    <asp:Parameter DbType="Date" Name="发布时间" />
                    <asp:Parameter DbType="Date" Name="有效期限" />
                    <asp:Parameter Name="公告标题" Type="String" />
                </UpdateParameters>
                    </asp:SqlDataSource>
        </asp:Panel>
        </form>
    </body>
    </html>