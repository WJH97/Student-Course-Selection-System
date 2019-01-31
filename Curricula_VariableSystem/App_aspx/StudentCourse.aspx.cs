using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
namespace Curricula_VariableSystem.App_aspx
{
    public partial class StudentCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "欢迎你，" + Session["Uname"] + "!";
        }



        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string SqlConn = System.Configuration.ConfigurationManager.AppSettings["SqlConn"];
            SqlConnection Conn = new SqlConnection(SqlConn);
            Conn.Open();
            SqlCommand cmdadd = new SqlCommand("update Course set 已选人数=已选人数-1 WHERE 课程编号 like'%" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "%'", Conn);
            cmdadd.ExecuteNonQuery();
            Conn.Close();
            string res = "DELETE FROM StudentCourse WHERE 学号 like '%" + Session["Unum"] + "%'AND 课程编号 like'%" + GridView1.DataKeys[e.RowIndex].Value.ToString() + "%'";
            SqlDataSource1.DeleteCommand = res;
            GridView1.DataSourceID = "SqlDataSource1";
            GridView1.DataBind();
        }
    }
}