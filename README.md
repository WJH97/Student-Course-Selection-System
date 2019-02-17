#### 基于VS2015 +sql server 2016开发
使用ASP.net4.5 框架, WebForm
[需求分析](https://zqyhome.xyz/2017/09/12/%E9%80%89%E8%AF%BE%E7%B3%BB%E7%BB%9F%E7%9A%84%E6%95%B4%E4%BD%93%E8%AE%BE%E8%AE%A1/#more)
#### 配置
数据库在Mydb\CSVDB.mdf

webconfig修改
```html
  <connectionStrings>
    <add name="CVSDBConnectionString" connectionString="Data Source=你的服务器名;Initial Catalog=数据库名;User ID=登录名;Password=密码"
      providerName="System.Data.SqlClient" />
  </connectionStrings>
```

```html
  <appSettings>
    <add key="SqlConn" value="Server=服务器名;;DataBase=数据库名;UID=登录名;PWD=密码"></add>
  </appSettings>
```
#### 功能
用户 | 功能
:---: | :---
学生 | 1.选课：查看已发布的课程，可以选择课程添加进入课表 <br> 2. 退课：将已选的课程从自己的课表中删除 <br> 3. 查看课表：查看已经选择的课程 <br> 4.查看成绩:查看自己课程成绩
教师 | 1.	申请课程：申请开放新的自己的课程，可供学生选课，但申请需要管理员的同意。<br> 2.	查看个人课表：老师可以查看自己所有课程已经有多少学生选择 <br> 3.	成绩：老师可以对选择自己课程的学生进行成绩打分
管理员 | 1.	增加删除学生教师：管理员可以对学生和教师进行操作，增加新的人员，删除不需要的。<br> 2.	对申请课程进行操作：管理员可以对教师申请的课程进行操作，进行同意或拒绝 <br> 3.	对课程信息进行修改：管理员可以直接对课程信息进行修改，如课程教室、人数上限等等。<br>4.对相关课程进行排课以及选课时间的控制

#### 相关功能
功能 | 实现  | 备注 
:---: | :---: |:---
选课(学生)| ![k12GjS.png](https://s2.ax1x.com/2019/01/31/k12GjS.png) |
选课 | ![k12vCt.png](https://s2.ax1x.com/2019/01/31/k12vCt.png) |人数限制 <br> 学分限制 <br> 素质教育课限制 <br> 体育课限制 <br> 时间冲突
退课 | ![k1RlVJ.png](https://s2.ax1x.com/2019/01/31/k1RlVJ.png) |
申请课程(教师) | ![k1RUKO.png](https://s2.ax1x.com/2019/01/31/k1RUKO.png) | 数据验证和控制 <br> 必要项的限制
相关查课 | ![k1RDIA.png](https://s2.ax1x.com/2019/01/31/k1RDIA.png) |申请课程的修改 <br> 未通过课程修改 <br> 所选查课学生 <br> 申课的取消
查课 | ![k1R6RP.png](https://s2.ax1x.com/2019/01/31/k1R6RP.png) |
课程打分 | ![k1R5Is.png](https://s2.ax1x.com/2019/01/31/k1R5Is.png) |
相关信息管理(管理员) | ![k1RqMT.png](https://s2.ax1x.com/2019/01/31/k1RqMT.png) |


