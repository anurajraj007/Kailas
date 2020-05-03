using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using KAILAS_CS.Core.Entity.DL;
using KAILAS_CS.Core.Entity;
using KAILAS_CS;
namespace KAILAS_CS.Core.Src.Public
{
    public partial class Registration : System.Web.UI.Page
    {
        CommonFunctions COMMONFUNCTIONS = new CommonFunctions();
        DL_Admin ADMIN = new DL_Admin();
        DL_User USER = new DL_User();
        protected void Page_Load(object sender, EventArgs e)
        {
            //Int64 ID = Convert.ToInt64(Session["RowID"]);
        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            try
            {
                Save();
            }
            catch (Exception ex)
            {
                string s = ex.Message;
            }
        }
        public void Save()
        {
            try
            {
                DataTable dtRegistration = new DataTable();
                dtRegistration.Columns.Add("FIRSTNAME");
                dtRegistration.Columns.Add("LASTNAME");
                dtRegistration.Columns.Add("EMAIL");
                dtRegistration.Columns.Add("MOBILE");


                DataRow dr = dtRegistration.NewRow();



                dr["FIRSTNAME"] = txt_FirstName.Text;
                dr["LASTNAME"] = txt_LastName.Text;
                dr["EMAIL"] = txt_Email.Text;
                dr["MOBILE"] = txt_Mobile.Text;

                dtRegistration.Rows.Add(dr);
                
                bool Flag = false;
                Flag = CheckFields();
                if (Flag)
                {

                    int i = USER.RegistrationDetails(dtRegistration);
                    if (i > 0)
                    {
                        Clear_Controls();
                    }
                }
              
            }
            catch (Exception ex)
            {
                string s = ex.Message;
            }
        }


        protected void btn_Cancel_Click(object sender, EventArgs e)
        {
            Clear_Controls();
        }
        #region CLEAR_CONTROLS
        public void Clear_Controls()
        {
            txt_Email.Text = "";
            txt_FirstName.Text = "";
            txt_LastName.Text = "";
            txt_Mobile.Text = "";
        }
        #endregion
        private bool CheckFields()
        {
            bool val = false;
            
            if (txt_FirstName.Text != "" && txt_FirstName.Text != null)
                val = true;
            else
            {
                COMMONFUNCTIONS.ScriptMsgForAjax("Please Enter First Name", Page);
                return false;
            }
            if (txt_LastName.Text != "" && txt_LastName.Text != null)
                val = true;
            else
            {
                COMMONFUNCTIONS.ScriptMsgForAjax("Please Enter Last Name", Page);
                return false;
            }
            if (txt_Mobile.Text != "" && txt_Mobile.Text != null)
                val = true;
            else
            {
                COMMONFUNCTIONS.ScriptMsgForAjax("Please Enter  Your Mobile Number", Page);
                return false;
            }
            if (txt_Email.Text != "" && txt_Email.Text != null)
                val = true;
            else
            {
                COMMONFUNCTIONS.ScriptMsgForAjax("Please Enter Your Email Address", Page);
                return false;
            }


                //Check_Value();
            
            return val;


        }

    }
}