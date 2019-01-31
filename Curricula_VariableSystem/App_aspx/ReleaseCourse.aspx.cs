using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
namespace Curricula_VariableSystem.App_aspx
{
    public partial class ReleaseCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Label1.Text = "欢迎你，" + Session["Uname"] + "!";
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            string SqlConn = System.Configuration.ConfigurationManager.AppSettings["SqlConn"];
            SqlConnection Conn = new SqlConnection(SqlConn);
            SqlCommand selectednum = new SqlCommand("SELECT * FROM Course WHERE 课程编号 like'%" + TextBox1.Text + "%'", Conn);
            Conn.Open();
            SqlDataReader SqlRenum = selectednum.ExecuteReader();
            bool reboolnum = SqlRenum.Read();
            Conn.Close();
            if (reboolnum)
            {
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('该编号已存在！');</script>");
                TextBox1.Text = "";
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("ReleaseCourse.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            //string res = "INSERT INTO StudentCourse(学号,课程编号) VALUES('%" + Session["Unum"] + "%','%" + Cnum + "%')";
            //SqlDataSource1.InsertCommand = res;
            if (TextBox1.Text != string.Empty && TextBox2.Text != string.Empty && ListBox1.Text != "请选择课程类型" && ListBox2.Text != "请选择学分" && ListBox3.Text != "请选择日期" && ListBox4.Text != "请选择" && DropDownList1.Text != "请选择教学楼" && ListBox5.Text != "请选择楼号" && ListBox6.Text != "请选择教室号" && TextBox3.Text != string.Empty)
            {
                string SqlConn = System.Configuration.ConfigurationManager.AppSettings["SqlConn"];
                SqlConnection Conn = new SqlConnection(SqlConn);
                if (Session["Unum"] != null)
                {
                    SqlCommand selectednum = new SqlCommand("SELECT * FROM Course WHERE 课程编号 like'%" + TextBox1.Text + "%'", Conn);
                    SqlCommand selectedname = new SqlCommand("SELECT * FROM Course WHERE 课程名称 like'%" + TextBox2.Text + "%'", Conn);
                    Conn.Open();
                    SqlDataReader SqlRenum = selectednum.ExecuteReader();
                    bool reboolnum = SqlRenum.Read();
                    Conn.Close();
                    Conn.Open();
                    SqlDataReader SqlRename = selectedname.ExecuteReader();
                    bool reboolname = SqlRename.Read();
                    Conn.Close();
                    if (!reboolnum && !reboolname)
                    {
                        Conn.Open();
                        SqlCommand cmdnum = new SqlCommand("select 学院编号 from Teacher where 教师工号='" + Session["Unum"] + "'", Conn);
                        string Dnum = null;
                        string Ct = ListBox3.Text + ListBox4.Text;
                        string Cp = DropDownList1.Text + ListBox5.Text + ListBox6.Text;
                        Dnum = (string)cmdnum.ExecuteScalar();
                        SqlCommand cmd = new SqlCommand("INSERT INTO Course(课程编号,课程名称,课程类别,教师工号,学分,上课时间,上课地点,人数上限,课程介绍,发布状态,已选人数) VALUES('" + TextBox1.Text + "','" + TextBox2.Text + "','" + ListBox1.Text + "','" + Session["Unum"] + "','" + ListBox2.Text + "','" + Ct + "','" + Cp + "','" + TextBox3.Text + "','" + TextBox4.Text + "','0','0')", Conn);
                        if (cmd.ExecuteNonQuery() > 0)
                            Response.Write("<script languge='javascript'>alert('提交成功！'); window.location.href='ReleaseCourse.aspx'</script>");
                        Conn.Close();
                    }
                    else
                        Response.Write("<script languge='javascript'>alert('该课程已存在！'); window.location.href='ReleaseCourse.aspx'</script>");

                }
            }
            else
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('存在必填项未填！');</script>");

        }






    }
}