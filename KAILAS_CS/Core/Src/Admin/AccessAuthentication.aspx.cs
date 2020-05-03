using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using KAILAS_CS.Core.Entity.DL;
using KAILAS_CS.Core.Entity;
using KAILAS_CS.Core;

namespace KAILAS_CS.Core.Src.Admin
{
    public partial class AccessAuthentication : System.Web.UI.Page
    {
        CommonFunctions COMMONFUNCTIONS = new CommonFunctions();
        DL_Admin ADMIN = new DL_Admin();
        DL_User USER = new DL_User();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Guid.Empty != SavedSession.UserGuid)
                {
                    if (!IsPostBack)
                    {
                       // BindDetails();
                    }
                }
                else
                    Response.Redirect("/Core/Src/Public/Login.aspx", true);

            }
          

        }
        public void BindUserHistory(DataTable dt_Result)
        {
            try
            {
                if (dt_Result.Rows.Count > 0)
                {
                    Panel_UserHistory.Visible = true;
                    gdUserHistory.DataSource = dt_Result;
                    gdUserHistory.DataBind();
                   
                }
                else
                {
                    Panel_UserHistory.Visible = false;
                    gdUserHistory.DataSource = null;
                    gdUserHistory.DataBind();
                 }

            }
            catch (Exception ex)
            {

            }
        }
      

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            try
            {
                Show();
            }
            catch (Exception ex)
            {
            }
           // BindBookingHistory();
        }
        public void Show()
        {
            try
            {
                //Locals
                DataTable dt_Result = new DataTable();
                DataSet ds_Result = new DataSet();
                DataTable dtUserDetails = new DataTable();

                dtUserDetails.Columns.Add("FirstName");
                dtUserDetails.Columns.Add("LastName");
                dtUserDetails.Columns.Add("RegistrationDate");
                dtUserDetails.Columns.Add("Mobile");
               

                DataRow dr = dtUserDetails.NewRow();
                dr["FirstName"] = txt_FirstName.Text;
                dr["LastName"] = txt_LastName.Text;
                dr["RegistrationDate"] = txt_RegDate.Text;
                dr["Mobile"] = txt_Mobile.Text;
               
                dtUserDetails.Rows.Add(dr);

                ds_Result = ADMIN.GetUserDetailsList(dtUserDetails);
               // ds_Result = ADMIN.GetBookingDetails(dtBooking);
                dt_Result = (ds_Result.Tables[0].Rows.Count > 0) ? ds_Result.Tables[0] : null;
                BindUserHistory(dt_Result);
                //ClearControls();

            }
            catch (Exception ex)
            {
                string s = ex.Message;
            }
        }
        

        protected void gdUserHistory_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            {

                try
                {
                    if (e.CommandName == "SelectRequest")
                    {
                        DataSet User_Data = new DataSet();
                        Guid UserGUID = Guid.Parse(Convert.ToString(e.CommandArgument.ToString()));
                        ViewState["id"] = UserGUID;
                        User_Data = ADMIN.GetUserProfile(UserGUID);
                        if (User_Data.Tables[0].Rows.Count > 0)
                        {
                          //  Panel_UserHistory.Visible = false;
                            DIV_UserDetails.Visible = true;
                            txt_UserFirstName.Text = Convert.ToString(User_Data.Tables[0].Rows[0]["FirstName"]);
                            txt_UserLastName.Text = Convert.ToString(User_Data.Tables[0].Rows[0]["LastName"]);
                            txt_UserMobile.Text = Convert.ToString(User_Data.Tables[0].Rows[0]["Mobile"]);
                            ddl_Status.SelectedValue = Convert.ToString(User_Data.Tables[0].Rows[0]["Status"]);
                        }
                   
                    }

                }
                catch (Exception Ex)
                {
                    String str = Ex.Message;
                }

            }
        }

        protected void btn_Ok_Click(object sender, EventArgs e)
        {
            // string name= txt_FirstName.Text+txt_LastName.Text;
            DataTable dtUserDetailsUpdate = new DataTable();
            dtUserDetailsUpdate.Columns.Add("UserGuid");
            dtUserDetailsUpdate.Columns.Add("Status");

            DataRow dr = dtUserDetailsUpdate.NewRow();
            dr["UserGuid"] = ViewState["id"];
            dr["Status"] = ddl_Status.SelectedValue;
            dtUserDetailsUpdate.Rows.Add(dr);
            Int64 i = ADMIN.UpdateUserStatusDetails(dtUserDetailsUpdate);
            if (i > 0)
            {
               // ViewState["id"] = UserGUID;
                string name = txt_FirstName.Text + txt_LastName.Text;
                string str=name+" Approved..........!";
                string st=name +" Rejected...........!";

                DataSet User_Data = new DataSet();
                User_Data = ADMIN.GetUserProfile((Guid)ViewState["id"]);
                if (User_Data.Tables[0].Rows.Count > 0)
                {
                    if (Convert.ToString(User_Data.Tables[0].Rows[0]["Status"]) == "Rejected")
                        COMMONFUNCTIONS.ScriptMsgForAjax( st, Page);
                    if (Convert.ToString(User_Data.Tables[0].Rows[0]["Status"]) == "Approved")
                        COMMONFUNCTIONS.ScriptMsgForAjax(str, Page);
                    ClearControls();
                }
            }
        }
        public void ClearControls()
        {
            txt_UserFirstName.Text = "";
            txt_UserLastName.Text = "";
            txt_UserMobile.Text = "";
            ddl_Status.SelectedValue="-1";
        }
    }

}