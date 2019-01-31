using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
namespace Curricula_VariableSystem.App_aspx
{
    public partial class SysAdmin00 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text != string.Empty && TextBox2.Text != string.Empty && ListBox1.Text != string.Empty &&  TextBox3.Text != string.Empty)
            {
                string SqlConn = System.Configuration.ConfigurationManager.AppSettings["SqlConn"];
                SqlConnection Conn = new SqlConnection(SqlConn);
                if (Session["Unum"] != null)
                {
                    SqlCommand selectednum = new SqlCommand("SELECT * FROM Notice WHERE 公告标题 like'" + TextBox1.Text + "'", Conn);
                    Conn.Open();
                    SqlDataReader SqlRenum = selectednum.ExecuteReader();
                    bool reboolnum = SqlRenum.Read();
                    Conn.Close();
                    if (!reboolnum)
                    {
                        Conn.Open();
                        SqlCommand cmd = new SqlCommand("INSERT INTO Notice(公告标题,发布单位,发布时间,有效期限,发布内容) VALUES('" + TextBox1.Text + "','" + ListBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "')", Conn);
                        if (cmd.ExecuteNonQuery() > 0)
                            Response.Write("<script languge='javascript'>alert('提交成功！'); window.location.href='SysAdminStudent.aspx'</script>");
                        Conn.Close();
                    }
                    else
                        Response.Write("<script languge='javascript'>alert('该公告已存在！'); window.location.href='SysAdminStudent.aspx'</script>");

                }
            }
            else
                Page.ClientScript.RegisterStartupScript(this.GetType(), "alert", "<script>alert('存在必填项未填！');</script>");

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("SysAdmin01.aspx");
        }
    }
}