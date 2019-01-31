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
    public partial class SysAdminStudent01 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "欢迎你，" + Session["Uname"] + "!";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text != string.Empty && TextBox2.Text != string.Empty && ListBox1.Text != string.Empty && ListBox2.Text != string.Empty && ListBox3.Text != string.Empty && DropDownList1.Text != string.Empty &&   TextBox3.Text != string.Empty)
            {
                string SqlConn = System.Configuration.ConfigurationManager.AppSettings["SqlConn"];
                SqlConnection Conn = new SqlConnection(SqlConn);
                if (Session["Unum"] != null)
                {
                    SqlCommand selectednum = new SqlCommand("SELECT * FROM StudentData WHERE 学号 like'" + TextBox1.Text + "'", Conn);
                    Conn.Open();
                    SqlDataReader SqlRenum = selectednum.ExecuteReader();
                    bool reboolnum = SqlRenum.Read();
                    Conn.Close();
                    if (!reboolnum )
                    {
                        Conn.Open();
                        SqlCommand cmdnum = new SqlCommand("select 专业编号 from Major where 专业名称='" + ListBox3.Text + "'and 年级='" + ListBox2.Text + "'", Conn);
                        string Dnum = null;
                        Dnum = (string)cmdnum.ExecuteScalar();
                        SqlCommand cmd = new SqlCommand("INSERT INTO StudentData(学号,姓名,性别,专业编号,密码) VALUES('" + TextBox1.Text + "','" + TextBox2.Text + "','" + ListBox1.Text + "','" + Dnum + "','" + TextBox3.Text + "')", Conn);
                        if (cmd.ExecuteNonQuery() > 0)
                            Response.Write("<script languge='javascript'>alert('提交成功！'); window.location.href='SysAdminStudent.aspx'</script>");
                        Conn.Close();
                    }
                    else
                        Response.Write("<script languge='javascript'>alert('该学生已存在！'); window.location.href='SysAdminStudent.aspx'</script>");

                }
            }
            else
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('存在必填项未填！');</script>");

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (DropDownList1.SelectedItem.Text == "数学科学学院")
            {
                ArrayList ListBoxValue = new ArrayList();
                ListBoxValue.Add("请选择专业");
                ListBoxValue.Add("数学与应用数学");
                ListBoxValue.Add("信息与计算科学");
                ListBoxValue.Add("应用统计学"); 
                ListBoxValue.Add("金融数学");
                ListBox3.DataSource = ListBoxValue;
                ListBox3.DataBind();
            }
            if (DropDownList1.SelectedItem.Text == "计算机科学与技术学院")
            {
                ArrayList ListBoxValue = new ArrayList();
                ListBoxValue.Add("请选择专业");
                ListBoxValue.Add("计算机科学与技术");
                ListBoxValue.Add("软件工程");
                ListBoxValue.Add("网络工程");
                ListBoxValue.Add("信息安全");
                ListBoxValue.Add("数字媒体");
                ListBox3.DataSource = ListBoxValue;
                ListBox3.DataBind();
            }
            if (DropDownList1.SelectedItem.Text == "外语学院")
            {
                ArrayList ListBoxValue = new ArrayList();
                ListBoxValue.Add("请选择专业");
                ListBoxValue.Add("英语");
                ListBoxValue.Add("俄语");
                ListBoxValue.Add("日语");
                ListBoxValue.Add("法语");
                ListBox3.DataSource = ListBoxValue;
                ListBox3.DataBind();
            }
            if (DropDownList1.SelectedItem.Text == "艺术学院")
            {
                ArrayList ListBoxValue = new ArrayList();
                ListBoxValue.Add("请选择专业");
                ListBoxValue.Add("视觉传达设计");
                ListBoxValue.Add("环境设计");
                ListBoxValue.Add("绘画");
                ListBoxValue.Add("戏剧影视导演");
                ListBoxValue.Add("音乐表演");
                ListBox3.DataSource = ListBoxValue;
                ListBox3.DataBind();
            }

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("SysAdminStudent01.aspx");
        }
    }
}