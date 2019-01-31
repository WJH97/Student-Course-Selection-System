using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Curricula_VariableSystem.App_aspx
{
    public partial class SysAdminTeacher00 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "欢迎你，" + Session["Uname"] + "!";
            string strtitle = Request.QueryString[0].ToString();
            string res = "SELECT * FROM Teacher,Dept WHERE 教师工号 like '%" + strtitle + "%'and Teacher.学院编号=Dept.学院编号";
            SqlDataSource1.SelectCommand = res;
            GridView1.DataSourceID = "SqlDataSource1";
            GridView1.DataBind();

        }
    }
}