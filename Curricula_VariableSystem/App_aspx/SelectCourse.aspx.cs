using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Curricula_VariableSystem.App_aspx
{
    public partial class SelectCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "欢迎你，" + Session["Uname"] + "!";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string res = "SELECT * FROM Course WHERE 课程类别 like '%专业核心课%' ";
            SqlDataSource1.SelectCommand = res;
            GridView1.DataSourceID = "SqlDataSource1";
            GridView1.DataBind();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string res = "SELECT * FROM Course WHERE 课程类别 like '%专业选修课%' ";
            SqlDataSource1.SelectCommand = res;
            GridView1.DataSourceID = "SqlDataSource1";
            GridView1.DataBind();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            string res = "SELECT * FROM Course WHERE 课程类别 like '%公共基础课%' ";
            SqlDataSource1.SelectCommand = res;
            GridView1.DataSourceID = "SqlDataSource1";
            GridView1.DataBind();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            string res = "SELECT * FROM Course WHERE 课程类别 like '%素质教育课%' ";
            SqlDataSource1.SelectCommand = res;
            GridView1.DataSourceID = "SqlDataSource1";
            GridView1.DataBind();
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            string res = "SELECT * FROM Course WHERE 课程名称 like '%" + TextBox1.Text + "%'";
            SqlDataSource1.SelectCommand = res;
            GridView1.DataSourceID = "SqlDataSource1";
            GridView1.DataBind();
        }
    }
}