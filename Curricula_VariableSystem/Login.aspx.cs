using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;

namespace Curricula_VariableSystem
{
    public partial class Login : System.Web.UI.Page
    {
        protected void LButton_Click(object sender, EventArgs e)
        {
            if (RadioButton1.Checked)
            {
                string SqlConn = System.Configuration.ConfigurationManager.AppSettings["SqlConn"];
                SqlConnection Conn = new SqlConnection(SqlConn);
                SqlCommand cmd = new SqlCommand("select 姓名 from Teacher where 教师工号='" + UnameText.Text + "' and 密码='" + UpswText.Text + "'", Conn);
                Conn.Open();
                string name = null;
                name = (string)cmd.ExecuteScalar();
                Conn.Close();
                if (name != null)
                {
                    Session["Uname"] = name;
                    Session["Unum"] = UnameText.Text;
                    Response.Write("<script languge='javascript'>alert('登录成功！'); window.location.href='App_aspx/SysTeacher.aspx'</script>");
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('账号或密码错误！请重新输入！');</script>");
                    UpswText.Text = "";
                }
            }
            else if (RadioButton2.Checked)
            {
                string SqlConn = System.Configuration.ConfigurationManager.AppSettings["SqlConn"];
                SqlConnection Conn = new SqlConnection(SqlConn);
                SqlCommand cmd = new SqlCommand("select 姓名 from StudentData where 学号='" + UnameText.Text + "' and 密码='" + UpswText.Text + "'", Conn);
                Conn.Open();
                string name = null;
                 name=(string)cmd.ExecuteScalar();
                Conn.Close();
                if (name!=null)
                {
                    Session["Uname"]= name;
                    Session["Unum"] = UnameText.Text;
                    Response.Write("<script languge='javascript'>alert('登录成功！'); window.location.href='App_aspx/SysStudent.aspx'</script>");                  
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('账号或密码错误！请重新输入！');</script>");
                    UpswText.Text = "";
                }
            }
            else if (RadioButton3.Checked)
            {
                string SqlConn = System.Configuration.ConfigurationManager.AppSettings["SqlConn"];
                SqlConnection Conn = new SqlConnection(SqlConn);
                SqlCommand cmd = new SqlCommand("select 姓名 from Admin where 账号='" + UnameText.Text + "' and 密码='" + UpswText.Text + "'", Conn);
                Conn.Open();
                string name = null;
                name = (string)cmd.ExecuteScalar();
                Conn.Close();
                if (name != null)
                {
                    Session["Uname"] = name;
                    Session["Unum"] = UnameText.Text;
                    Response.Write("<script languge='javascript'>alert('登录成功！'); window.location.href='App_aspx/SysAdmin.aspx'</script>");
                }
                else
                {
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('账号或密码错误！请重新输入！');</script>");
                    UpswText.Text = "";
                }

            }
            else
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('未选择用户类型！');</script>");

        }

        protected void RButton_Click(object sender, EventArgs e)
        {
            UnameText.Text = "";
            UpswText.Text = "";
        }
    }
}