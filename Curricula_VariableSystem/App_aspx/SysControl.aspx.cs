using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Curricula_VariableSystem.App_aspx
{
    public partial class Syscontrol : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "欢迎你，" + Session["Uname"] + "!";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string SqlConn = System.Configuration.ConfigurationManager.AppSettings["SqlConn"];
            SqlConnection Conn = new SqlConnection(SqlConn);

            Conn.Open();
            SqlCommand cmd = new SqlCommand("update Controler set 选课状态=1", Conn);
            if (cmd.ExecuteNonQuery() > 0)
                Response.Write("<script languge='javascript'>alert('选课已开启!'); window.location.href='SysControl.aspx'</script>");
            Conn.Close();

        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            string SqlConn = System.Configuration.ConfigurationManager.AppSettings["SqlConn"];
            SqlConnection Conn = new SqlConnection(SqlConn);

            Conn.Open();
            SqlCommand cmd = new SqlCommand("update Controler set 选课状态=0", Conn);
            if (cmd.ExecuteNonQuery() > 0)
                Response.Write("<script languge='javascript'>alert('选课已关闭!'); window.location.href='SysControl.aspx'</script>");
            Conn.Close();
        }
    }
}