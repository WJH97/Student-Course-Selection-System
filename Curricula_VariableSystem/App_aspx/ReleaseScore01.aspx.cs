using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Curricula_VariableSystem.App_aspx
{
    public partial class ReleaseScore01 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Label1.Text = "欢迎你，" + Session["Uname"] + "!";
                string strtitle = Request.QueryString[0].ToString();
                Session["Cname"] = strtitle;
                Label2.Text = strtitle;
                string res = "SELECT * FROM Course,StudentCourse,StudentData,Major WHERE 课程名称 like '%" + strtitle + "%' and 教师工号 like '%" + Session["Unum"] + "%'and Course.课程编号=StudentCourse.课程编号 and StudentCourse.学号=StudentData.学号 and StudentData.专业编号=Major.专业编号";
                SqlDataSource1.SelectCommand = res;
                GridView1.DataSourceID = "SqlDataSource1";
                GridView1.DataBind();
            }

        }
    }
}