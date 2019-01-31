using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
namespace Curricula_VariableSystem.App_aspx
{
    public partial class Released02 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                Label1.Text = "欢迎你，" + Session["Uname"] + "!";
                string strnum = Request.QueryString[0].ToString();
                string SqlConn = System.Configuration.ConfigurationManager.AppSettings["SqlConn"];
                SqlConnection Conn = new SqlConnection(SqlConn);
                Conn.Open();
                SqlCommand cmdcname = new SqlCommand("select 课程名称 from Course where 课程编号='" + strnum + "'", Conn);
                SqlCommand cmdctype = new SqlCommand("select 课程类别 from Course where 课程编号='" + strnum + "'", Conn);
                SqlCommand cmdccredit = new SqlCommand("select 学分 from Course where 课程编号='" + strnum + "'", Conn);
                SqlCommand cmdcsmax = new SqlCommand("select 人数上限 from Course where 课程编号='" + strnum + "'", Conn);
                SqlCommand cmdctime = new SqlCommand("select 上课时间 from Course where 课程编号='" + strnum + "'", Conn);
                SqlCommand cmdcplace = new SqlCommand("select 上课地点 from Course where 课程编号='" + strnum + "'", Conn);
                string Ct = ListBox3.Text + ListBox4.Text;
                string Cp = DropDownList1.Text + ListBox5.Text + ListBox6.Text;
                string Cname = (string)cmdcname.ExecuteScalar();
                string Ctype = (string)cmdctype.ExecuteScalar();
                string Ccredit = cmdccredit.ExecuteScalar().ToString();
                string Csmax = cmdcsmax.ExecuteScalar().ToString();
                string Cstime = cmdctime.ExecuteScalar().ToString();
                string Csplace = cmdcplace.ExecuteScalar().ToString();

                Conn.Close();
                TextBox1.Text = strnum;
                TextBox2.Text = Cname;
                TextBox5.Text= Ctype;
                TextBox6.Text = Ccredit;
                TextBox7.Text = Cstime;
                TextBox8.Text = Csplace;
                TextBox3.Text = Csmax;
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text != string.Empty && TextBox2.Text != string.Empty && ListBox1.Text != "请选择课程类型" && ListBox2.Text != "请选择学分" && ListBox3.Text != "请选择日期" && ListBox4.Text != "请选择" && DropDownList1.Text != "请选择教学楼" && ListBox5.Text != "请选择楼号" && ListBox6.Text != "请选择教室号" && TextBox3.Text != string.Empty)
            {
                string SqlConn = System.Configuration.ConfigurationManager.AppSettings["SqlConn"];
                SqlConnection Conn = new SqlConnection(SqlConn);
                if (Session["Unum"] != null)
                {


                        Conn.Open();
                        string Ct = ListBox3.Text + ListBox4.Text;
                        string Cp = DropDownList1.Text + ListBox5.Text + ListBox6.Text;
                        SqlCommand cmd = new SqlCommand("UPDATE Course SET 课程名称='" + TextBox2.Text + "',课程类别='" + ListBox1.Text + "',学分='" + ListBox2.Text + "',上课时间='" + Ct + "',上课地点='" + Cp + "',人数上限='" + TextBox3.Text + "',课程介绍='" + TextBox4.Text + "'WHERE 课程编号='" + TextBox1.Text + "'", Conn);
                        if (cmd.ExecuteNonQuery() > 0)
                            Response.Write("<script languge='javascript'>alert('修改成功！'); window.location.href='ReleaseCourse.aspx'</script>");
                        Conn.Close();
                }
            }
            else
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('存在必填项未填！');</script>");

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Released.aspx");
        }
    }

}