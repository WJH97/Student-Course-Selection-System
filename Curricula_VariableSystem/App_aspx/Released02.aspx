<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Released02.aspx.cs" Inherits="Curricula_VariableSystem.App_aspx.Released02" %>

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
        .auto-style2 {
            height: 27px;
            text-align: left;
            width: 380px;
        }
        .auto-style3 {
            text-align: left;
            width: 380px;
        }
        .auto-style5 {
            width: 409px;
        }
        .auto-style6 {
            height: 27px;
            width: 409px;
        }
        .auto-style7 {
            width: 380px;
        }
    </style>
</head>
<body>

    <form id="form1" runat="server" >
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
            <asp:ListItem Value="SysTeacher.aspx">公告</asp:ListItem>
            <asp:ListItem Value="ReleaseCourse.aspx"> 发布课程</asp:ListItem>    
            <asp:ListItem Value="Released.aspx">查看发布课程</asp:ListItem>
            <asp:ListItem Value="ReleaseScore.aspx">成绩</asp:ListItem>
            <asp:ListItem Value="TCourse.aspx">查看个人课表</asp:ListItem>
        </asp:BulletedList><br/>
        <h2 style="text-align:center">修改发布课程信息</h2>
        <table style="width: 100%; ">
            <tr>
                <td class="auto-style3">课程编号：<asp:TextBox ID="TextBox1" runat="server" style="vertical-align:middle;" AutoPostBack="True" ></asp:TextBox>
                    *</td>
                <td class="auto-style5">课程名称：<asp:TextBox ID="TextBox2" runat="server" style="vertical-align:middle;" ></asp:TextBox>*
                    </td>
                <td>课程类别：<asp:TextBox ID="TextBox5" runat="server" style="vertical-align:middle;" ReadOnly="True"></asp:TextBox>
                    <br />
                    修&nbsp; 改： <asp:ListBox ID="ListBox1" runat="server" style="vertical-align:middle;" Rows="1" >
                    <asp:ListItem>请选择课程类型</asp:ListItem>
                    <asp:ListItem>公共基础课</asp:ListItem>
                    <asp:ListItem>专业核心课</asp:ListItem>
                    <asp:ListItem>专业选修课</asp:ListItem>
                    <asp:ListItem>素质教育课</asp:ListItem>
                    <asp:ListItem>体育课</asp:ListItem>
                    </asp:ListBox>*
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="ListBox1" ErrorMessage="选择错误" ForeColor="Red" Operator="NotEqual" ValueToCompare="请选择课程类型"></asp:CompareValidator>
                </td>
            </tr><tr><td class="auto-style7"></td></tr>
            <tr>
                <td class="auto-style2">学&nbsp;&nbsp;分：<asp:TextBox ID="TextBox6" runat="server" ReadOnly="True" style="vertical-align:middle;"></asp:TextBox>
                    <br />
                    修&nbsp;&nbsp;改：<asp:ListBox ID="ListBox2" runat="server" style="vertical-align:middle;" Rows="1" >
                    <asp:ListItem>请选择学分</asp:ListItem>
                    <asp:ListItem>0.5</asp:ListItem>
                    <asp:ListItem>1.0</asp:ListItem>
                    <asp:ListItem>1.5</asp:ListItem>
                    <asp:ListItem>2.0</asp:ListItem>
                    <asp:ListItem>3.0</asp:ListItem>
                    <asp:ListItem>4.0</asp:ListItem>
                    </asp:ListBox>
                    *<asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="ListBox2" ErrorMessage="选择错误" ForeColor="Red" Operator="NotEqual" ValueToCompare="请选择学分"></asp:CompareValidator>
                </td>
                <td class="auto-style6">上课时间：<asp:TextBox ID="TextBox7" runat="server" style="vertical-align:middle;" ReadOnly="True"></asp:TextBox>
                    <br />
                    修&nbsp; 改： <asp:ListBox ID="ListBox3" runat="server" style="vertical-align:middle;" Rows="1" >
                    <asp:ListItem>请选择日期</asp:ListItem>
                    <asp:ListItem>星期一</asp:ListItem>
                    <asp:ListItem>星期二</asp:ListItem>
                    <asp:ListItem>星期三</asp:ListItem>
                    <asp:ListItem>星期四</asp:ListItem>
                    <asp:ListItem>星期五</asp:ListItem>
                    <asp:ListItem>星期六</asp:ListItem>
                    <asp:ListItem>星期日</asp:ListItem>
                    </asp:ListBox>
                    <asp:ListBox ID="ListBox4" runat="server" style="vertical-align:middle;" Rows="1" Width="78px" >
                    <asp:ListItem>请选择</asp:ListItem>
                    <asp:ListItem>1-2</asp:ListItem>
                    <asp:ListItem>3-4</asp:ListItem>
                    <asp:ListItem>5-6</asp:ListItem>
                    <asp:ListItem>7-8</asp:ListItem>
                    <asp:ListItem>9-10</asp:ListItem>
                    <asp:ListItem>1-4</asp:ListItem>
                    <asp:ListItem>5-8</asp:ListItem>
                        <asp:ListItem>1-3</asp:ListItem>
                        <asp:ListItem>5-7</asp:ListItem>
                        <asp:ListItem>9-11</asp:ListItem>
                    </asp:ListBox>
                    *<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="ListBox3" ErrorMessage="选择错误" ForeColor="Red" Operator="NotEqual" ValueToCompare="请选择日期"></asp:CompareValidator>
&nbsp;
                    <asp:CompareValidator ID="CompareValidator4" runat="server" ControlToValidate="ListBox4" ErrorMessage="选择错误" ForeColor="Red" Operator="NotEqual" ValueToCompare="请选择"></asp:CompareValidator>
                </td>
                <td class="auto-style1">上课地点：
                     
                    <asp:TextBox ID="TextBox8" runat="server" style="vertical-align:middle;" ReadOnly="True"></asp:TextBox>
                    <br />
                    修&nbsp;改：&nbsp;
                     <asp:DropDownList ID="DropDownList1" runat="server" style="vertical-align:middle;" >
                        <asp:ListItem>请选择教学楼</asp:ListItem>
                        <asp:ListItem>博学北楼</asp:ListItem>
                        <asp:ListItem>博学南楼</asp:ListItem>
                        <asp:ListItem>笃行北楼</asp:ListItem>
                        <asp:ListItem>笃行南楼</asp:ListItem>
                        <asp:ListItem>行知楼</asp:ListItem>
                    </asp:DropDownList>

                    <asp:ListBox ID="ListBox5" runat="server" style="vertical-align:middle;" Rows="1" Height="17px" >
                        <asp:ListItem>请选择楼号</asp:ListItem>
                        <asp:ListItem>A</asp:ListItem>
                        <asp:ListItem>B</asp:ListItem>
                        <asp:ListItem>C</asp:ListItem>
                    </asp:ListBox>
                    <asp:ListBox ID="ListBox6" runat="server" style="vertical-align:middle;" Rows="1">
                        <asp:ListItem>请选择教室号</asp:ListItem>
                        <asp:ListItem>101</asp:ListItem>
                        <asp:ListItem>102</asp:ListItem>
                        <asp:ListItem>103</asp:ListItem>
                        <asp:ListItem>201</asp:ListItem>
                        <asp:ListItem>202</asp:ListItem>
                        <asp:ListItem>203</asp:ListItem>
                        <asp:ListItem>301</asp:ListItem>
                        <asp:ListItem>302</asp:ListItem>
                        <asp:ListItem>303</asp:ListItem>
                    </asp:ListBox>
                    *<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:CompareValidator ID="CompareValidator5" runat="server" ControlToValidate="DropDownList1" ErrorMessage="选择错误" ForeColor="Red" Operator="NotEqual" ValueToCompare="请选择教学楼"></asp:CompareValidator>
                &nbsp;&nbsp;&nbsp;
                    <asp:CompareValidator ID="CompareValidator6" runat="server" ControlToValidate="ListBox5" ErrorMessage="选择错误" ForeColor="Red" Operator="NotEqual" ValueToCompare="请选择楼号"></asp:CompareValidator>
                &nbsp;&nbsp;
                    <asp:CompareValidator ID="CompareValidator7" runat="server" ControlToValidate="ListBox6" ErrorMessage="选择错误" ForeColor="Red" Operator="NotEqual" ValueToCompare="请选择教室号"></asp:CompareValidator>
                </td>
            </tr><tr><td class="auto-style7"></td></tr>
            <tr>
                <td class="auto-style7">人数上限：<asp:TextBox ID="TextBox3" runat="server" style="vertical-align:middle;" TextMode="Number" ></asp:TextBox>*<br />
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox3" ErrorMessage="错误输入，请输入0-200间的数字！" ForeColor="Red" MaximumValue="200" MinimumValue="0" Type="Integer"></asp:RangeValidator>
                </td>
                <td class="auto-style5">课程介绍：<asp:TextBox ID="TextBox4" runat="server" style="vertical-align:middle;" Height="185px" TextMode="MultiLine" ></asp:TextBox></td>                
            </tr>
            <tr>
                <td class="auto-style7"></td>
            </tr>
            <tr>
                <td class="auto-style7"></td>
                <td>
                    <asp:Button ID="Button1" runat="server" Text="修 改" Width="98px" OnClick="Button1_Click" /></td>
                <td><asp:Button ID="Button2" runat="server" Text="取 消" Width="98px" OnClick="Button2_Click"  /></td>
            </tr>
        </table>
    </form>
</body>
</html>

