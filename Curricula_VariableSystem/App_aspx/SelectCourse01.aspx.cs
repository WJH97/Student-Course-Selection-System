using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
namespace Curricula_VariableSystem.App_aspx
{
    public partial class SelectCourse01 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Label1.Text = "欢迎你，" + Session["Uname"] + "!";
                string strtitle = Request.QueryString[0].ToString();
                string res = "SELECT * FROM Course,Dept,Teacher WHERE 课程名称 like '%" + strtitle + "%'and Course.教师工号=Teacher.教师工号 and Teacher.学院编号=Dept.学院编号";
                SqlDataSource1.SelectCommand = res;
                GridView1.DataSourceID = "SqlDataSource1";
                GridView1.DataBind();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            for (int i = 0; i <GridView1.Rows.Count; i++)
            {
               
                CheckBox cb = (CheckBox)GridView1.Rows[i].FindControl("ChkItem");
                if (cb.Checked)
                {
                    string Cnum = GridView1.Rows[i].Cells[0].Text;
                    //string res = "INSERT INTO StudentCourse(学号,课程编号) VALUES('%" + Session["Unum"] + "%','%" + Cnum + "%')";
                    //SqlDataSource1.InsertCommand = res;
                    string SqlConn = System.Configuration.ConfigurationManager.AppSettings["SqlConn"];
                     SqlConnection Conn = new SqlConnection(SqlConn);
                    if (Session["Unum"] != null)
                    {
                        SqlCommand selected= new SqlCommand("SELECT * FROM StudentCourse WHERE 学号 like'%" + Session["Unum"] + "%'AND 课程编号 like'%" + Cnum + "%'", Conn);
                        Conn.Open();
                        SqlDataReader SqlRe = selected.ExecuteReader();
                        bool rebool = SqlRe.Read();
                        Conn.Close();
                        if (!rebool)
                        {
                            Conn.Open();
                            SqlCommand cmd = new SqlCommand("INSERT INTO StudentCourse(学号,课程编号) VALUES('%" + Session["Unum"] + "%','%" + Cnum + "%')", Conn);
                            if (cmd.ExecuteNonQuery() > 0)
                                Response.Write("<script languge='javascript'>alert('选定成功！'); window.location.href='SelectCourse.aspx'</script>");
                            Conn.Close();
                            Conn.Open();
                            SqlCommand cmdadd = new SqlCommand("update Course set 已选人数=已选人数+1 WHERE 课程编号 like'%" + Cnum + "%'", Conn);
                            cmdadd.ExecuteNonQuery();
                            Conn.Close();
                        }
                        else
                            Response.Write("<script languge='javascript'>alert('该课程已选！'); window.location.href='SelectCourse.aspx'</script>");

                    }
                    else
                        Response.Write("<script languge='javascript'>alert('选定失败！'); window.location.href='SelectCourse.aspx'</script>");

                }
            }
        }
    }
}