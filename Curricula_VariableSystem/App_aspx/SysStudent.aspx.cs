using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Curricula_VariableSystem
{
    public partial class SysStudent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "欢迎你，"+Session["Uname"]+"!";
            string SqlConn = System.Configuration.ConfigurationManager.AppSettings["SqlConn"];
            SqlConnection Conn = new SqlConnection(SqlConn);
            Conn.Open();
            SqlCommand cmd = new SqlCommand("select * from Controler where 选课状态=0 ", Conn);
            SqlDataReader SqlRe = cmd.ExecuteReader();
            bool rebool = SqlRe.Read();
            Conn.Close();
            if (rebool) {
                BulletedList1.Items[1].Enabled = false;
                BulletedList1.Items[2].Enabled = false;
            }
        }


    }
    }
