using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;
using System.Data.SqlClient;
using KAILAS_CS;
using KAILAS_CS.Core.Entity;
using KAILAS_CS.Core.Entity.DL;

namespace KAILAS_CS.Core.Src.Admin
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        CommonFunctions COMMONFUNCTIONS = new CommonFunctions();
        DL_Common COMMON = new DL_Common();
        DL_Admin ADMIN = new DL_Admin();
        DL_User USER = new DL_User();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Guid.Empty != SavedSession.UserGuid)
            {
                if (!IsPostBack)
                {
                    // LoadPageDefaults();
                }
            }
            else
                Response.Redirect("/Core/Src/Public/Login.aspx", true);

        }
        public void Change_Password()
        {
            //  Int32 RowID = Convert.ToInt32(Session["RowID"]);
            try
            {

                string OldPassword = txt_OldPassword.Text;
                string Newpassword = txt_NewPassword.Text;

                int i = COMMON.ChangePassword(SavedSession.UserGuid, OldPassword, Newpassword);
                if (i > 0)
                {
                    ClearControls();
                }
            }
            catch (Exception ex)
            {

            }
        }

        public void ClearControls()
        {
            txt_OldPassword.Text = "";
            txt_NewPassword.Text = "";
        }

        private bool CheckFields()
        {
            bool val = false;

            if (!string.IsNullOrEmpty(txt_NewPassword.Text))
                val = true;
            else
            {
                COMMONFUNCTIONS.ScriptMsgForAjax("Please Enter New Password", Page);
                return false;
            }
            if (!string.IsNullOrEmpty(txt_OldPassword.Text))
                val = true;
            else
            {
                COMMONFUNCTIONS.ScriptMsgForAjax("Please Enter Old Password", Page);
                return false;
            }

            //Check_Value();

            return val;


        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            Change_Password();
        }

        protected void btn_Cancel_Click(object sender, EventArgs e)
        {
            ClearControls();
        }
    }
}