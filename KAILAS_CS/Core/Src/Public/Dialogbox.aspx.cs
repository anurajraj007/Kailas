using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace KAILAS_CS.Core.Src.Public
{
    public partial class Dialogbox : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type='text/javascript'>\n");
            sb.Append("$('#dialogModal').modal('show');\n");
            sb.Append("</script>");
            ScriptManager.RegisterStartupScript(this, this.GetType(), "LaunchServerSide", sb.ToString(), false);
        }
        private void ShowDialog()
        {
            try
            {
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("<script type='text/javascript'>\n");
                sb.Append("$('#dialogModal').modal('show');\n");
                sb.Append("</script>");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "LaunchServerSide", sb.ToString(), false);
            }
            catch (Exception ex)
            {
                string exception = ex.Message;
            }
        }
        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            ShowDialog();
        }
    }
}