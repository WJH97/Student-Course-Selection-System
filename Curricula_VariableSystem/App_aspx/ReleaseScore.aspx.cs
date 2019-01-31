using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Curricula_VariableSystem.App_aspx
{
    public partial class ReleaseScore : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = "欢迎你，" + Session["Uname"] + "!";
        }
    }
}