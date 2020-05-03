﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KAILAS_CS.Core.Src.Public
{
    public partial class Feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type='text/javascript'>\n");
            sb.Append("$('#compose_modal').modal('show');\n");
            sb.Append("</script>");
            ScriptManager.RegisterStartupScript(this, this.GetType(), "LaunchServerSide", sb.ToString(), false);
        }
    }
}