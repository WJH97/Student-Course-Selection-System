using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
namespace Curricula_VariableSystem.App_aspx
{
   
    public partial class Released01 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            { 
                Label1.Text = "欢迎你，" + Session["Uname"] + "!";
                string strtitle = Request.QueryString[0].ToString(); 
                Session["Cname"]= strtitle;
                Label2.Text= strtitle;
                string res = "SELECT * FROM Course,StudentCourse,StudentData,Major WHERE 课程名称 like '%" + strtitle + "%' and 教师工号 like '%" + Session["Unum"] + "%'and Course.课程编号=StudentCourse.课程编号 and StudentCourse.学号=StudentData.学号 and StudentData.专业编号=Major.专业编号";
                SqlDataSource1.SelectCommand = res;
                GridView1.DataSourceID = "SqlDataSource1";
                GridView1.DataBind();
            }

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string SqlConn = System.Configuration.ConfigurationManager.AppSettings["SqlConn"];
            SqlConnection Conn = new SqlConnection(SqlConn);
            Conn.Open();
            SqlCommand cmd = new SqlCommand("select StudentCourse.课程编号 from StudentCourse,Course where 课程名称='" + Session["Cname"] + "'and StudentCourse.课程编号=Course.课程编号", Conn);
            string str = (string)cmd.ExecuteScalar();
            Conn.Close();
            Conn.Open();
            SqlCommand cmdadd = new SqlCommand("update Course set 已选人数=已选人数-1 WHERE 课程名称 like'%" + Session["Cname"] + "%'AND 教师工号 like'%" +Session["Unum"]+ "%'", Conn);
            cmdadd.ExecuteNonQuery();
            Conn.Close();
            string res = "DELETE FROM StudentCourse WHERE 学号 like '%" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "%'AND 课程编号 like'%" + str + "%'";
            SqlDataSource1.DeleteCommand = res;
            GridView1.DataSourceID = "SqlDataSource1";
            GridView1.DataBind();
        }
    }
}
