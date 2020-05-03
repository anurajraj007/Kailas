using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using KAILAS_CS.Core.Entity.DL;
using KAILAS_CS.Core.Entity;

namespace KAILAS_CS.Core.Src.Super
{
    public partial class AccountRegistration : System.Web.UI.Page
    {
        DL_Super Super = new DL_Super();
        CommonFunctions COMMONFUNCTIONS = new CommonFunctions();
        
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            Save();
        }

        protected void btn_Cancel_Click(object sender, EventArgs e)
        {

        }

        #region METHODS
        public void Save()
        {
            try
            {
                DataTable dtAdminDetails = new DataTable();
                dtAdminDetails.Columns.Add("NAME");
                dtAdminDetails.Columns.Add("DESIGNATION");
                dtAdminDetails.Columns.Add("EMAIL");
                dtAdminDetails.Columns.Add("MOBILE");
                dtAdminDetails.Columns.Add("DESCRIPTION");
                dtAdminDetails.Columns.Add("REMARKS");
                dtAdminDetails.Columns.Add("ROWID");

                DataRow dr = dtAdminDetails.NewRow();

                dr["NAME"] = txt_Name.Text;
                dr["DESIGNATION"] = txt_Remarks.Text;
                dr["EMAIL"] = txt_Email.Text;
                dr["MOBILE"] = txt_Mobile.Text;
                dr["DESCRIPTION"] = txt_Description.Text;
                dr["REMARKS"] = txt_Remarks.Text;
                dr["RowID"] = Convert.ToInt64(Session["RowID"]);

                dtAdminDetails.Rows.Add(dr);

                int i = Super.SaveAccountRegistration(dtAdminDetails);
                if (i > 0)
                {
                    ClearControls();

                    //ClearControls();
                }
                else if (i == -1)
                {
                    COMMONFUNCTIONS.ScriptMsgForAjax("Already Booked, Please Select another Date", Page);
                }
                else if (i == -2)
                {
                    COMMONFUNCTIONS.ScriptMsgForAjax("Booking Date Should be greater than Today, Please Select another Date", Page);
                }

            }
            catch (Exception e)
            {

            }
        }
        #endregion
        public void ClearControls()
        {
            txt_Description.Text = "";
            txt_Email.Text = "";
            txt_Mobile.Text = "";
            txt_Name.Text = "";
            txt_Remarks.Text = "";
        }
    }
}