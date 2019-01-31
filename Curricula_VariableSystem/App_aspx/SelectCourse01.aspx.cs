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
                string res = "SELECT * FROM Course,Dept,Teacher WHERE 课程名称 = '" + strtitle + "'and Course.教师工号=Teacher.教师工号 and Teacher.学院编号=Dept.学院编号";
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
                    string SqlConn = System.Configuration.ConfigurationManager.AppSettings["SqlConn"];
                     SqlConnection Conn = new SqlConnection(SqlConn);
                    if (Session["Unum"] != null)
                    {
                        SqlCommand selected= new SqlCommand("SELECT * FROM StudentCourse WHERE 学号 ='" + Session["Unum"] + "'AND 课程编号 ='" + Cnum + "'", Conn);
                        Conn.Open();
                        SqlDataReader SqlRe = selected.ExecuteReader();
                        bool rebool = SqlRe.Read();
                        Conn.Close();


                        SqlCommand Snumber = new SqlCommand("SELECT 已选人数,人数上限,学分,上课时间,课程类别 FROM Course WHERE 课程编号 ='" + Cnum + "'", Conn);
                        Conn.Open();
                        SqlDataReader SnumberRead = Snumber.ExecuteReader();
                        SnumberRead.Read();
                        int snumber = SnumberRead.GetInt32(0);
                        int smnumber = SnumberRead.GetInt32(1);
                        double score = Convert.ToDouble(SnumberRead.GetDouble(2));
                        string coursetime = SnumberRead.GetString(3);
                        string coursetypes= SnumberRead.GetString(4);
                        Conn.Close();

                        SqlCommand CourseTime = new SqlCommand("SELECT * FROM StudentCourse,Course where  StudentCourse.课程编号=Course.课程编号 and 学号='" + Session["Unum"] + "'and 上课时间 like'" + coursetime.Substring(0, 5) + "%'", Conn);
                        Conn.Open();
                        SqlDataReader curenttime = CourseTime.ExecuteReader();
                        bool tbool = curenttime.Read();
                        Conn.Close();

                        bool ctbool=false;
                        if (coursetypes == "素质教育课" || coursetypes == "体育课  ")
                        {
                            SqlCommand CourseType = new SqlCommand("SELECT * FROM StudentCourse,Course where  StudentCourse.课程编号=Course.课程编号 and 学号='" + Session["Unum"] + "'and 课程类别 ='" + coursetypes + "'", Conn);
                            Conn.Open();
                            SqlDataReader coursetype = CourseType.ExecuteReader();
                            ctbool = coursetype.Read();
                            Conn.Close();
                        }
                        if (!rebool)
                        {
                            if (!ctbool)
                            {
                                if (!tbool)
                                {
                                    if (snumber < smnumber)
                                    {
                                        SqlCommand Scoresum = new SqlCommand("select Sum(学分) from StudentCourse,Course where StudentCourse.课程编号=Course.课程编号 and 学号='" + Session["Unum"] + "'", Conn);
                                        Conn.Open();
                                        SqlDataReader scoresum = Scoresum.ExecuteReader();
                                        scoresum.Read();
                                        double scoresumnum = Convert.ToDouble(scoresum.GetDouble(0));
                                        Conn.Close();

                                        SqlCommand Scoremax = new SqlCommand("select 学分上限 from StudentData,Major where StudentData.专业编号=Major.专业编号 and 学号='" + Session["Unum"] + "'", Conn);
                                        Conn.Open();
                                        SqlDataReader scoremax = Scoremax.ExecuteReader();
                                        scoremax.Read();
                                        double scoremaxnum = Convert.ToDouble(scoremax.GetDouble(0));
                                        Conn.Close();

                                        if (score + scoresumnum <= scoremaxnum)
                                        {
                                            Conn.Open();
                                            SqlCommand cmd = new SqlCommand("INSERT INTO StudentCourse(学号,课程编号) VALUES('" + Session["Unum"] + "','" + Cnum + "')", Conn);
                                            if (cmd.ExecuteNonQuery() > 0)
                                                Response.Write("<script languge='javascript'>alert('选定成功!'); window.location.href='SelectCourse.aspx'</script>");
                                            Conn.Close();
                                            Conn.Open();
                                            SqlCommand cmdadd = new SqlCommand("update Course set 已选人数=已选人数+1 WHERE 课程编号 like'%" + Cnum + "%'", Conn);
                                            cmdadd.ExecuteNonQuery();
                                            Conn.Close();
                                        }
                                        else
                                            Response.Write("<script languge='javascript'>alert('学分超过限制！'); window.location.href='SelectCourse.aspx'</script>");

                                    }
                                    else
                                        Response.Write("<script languge='javascript'>alert('课程已满！'); window.location.href='SelectCourse.aspx'</script>");

                                }
                                else
                                    Response.Write("<script languge='javascript'>alert('时间冲突！'); window.location.href='SelectCourse.aspx'</script>");
                            }
                            else
                                Response.Write("<script languge='javascript'>alert('超过数量限制！'); window.location.href='SelectCourse.aspx'</script>");

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