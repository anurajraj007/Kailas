using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using KAILAS_CS.Core.Entity;
using KAILAS_CS;
using KAILAS_CS.Core.Entity.DL;
using System.Configuration;

namespace KAILAS_CS.Core.Src.User
{
    public partial class UserProfile : System.Web.UI.Page
    {
        CommonFunctions COMMONFUNCTIONS = new CommonFunctions();
        DL_Common COMMON = new DL_Common();
        DL_Admin ADMIN = new DL_Admin();
        DL_User USER = new DL_User();
        string Firstname, LastName, Gender, Personal_Addr, Business_Addr, City, district, state, Country, Pin, Phone, Mobile;
        string BirthDate;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Guid.Empty != SavedSession.UserGuid)
            {
                if (!IsPostBack)
                {
                    BindUserDetails();

                }
            }
            else
                Response.Redirect("/Core/Src/Public/Login.aspx", true);
        }
        #region METHODS
        public void BindUserDetails()
        {
            //Locals
            DataSet DS = new DataSet();
            try
            {
                DS = (DataSet)SavedSession.UserDataSet;
                if (DS.Tables[0].Rows.Count > 0)
                {
                    txt_FirstName.Text = Convert.ToString(DS.Tables[0].Rows[0]["FirstName"]);
                    txt_LastName.Text = Convert.ToString(DS.Tables[0].Rows[0]["LastName"]);
                    txt_Email.Text = Convert.ToString(DS.Tables[0].Rows[0]["Email"]);
                    txt_Mobile.Text = Convert.ToString(DS.Tables[0].Rows[0]["Mobile"]);

                }

            }
            catch (Exception ex)
            {

                String s = ex.Message;
            }
        }
        #endregion

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            try
            {
                Save();
            }
            catch (Exception ex)
            {
            }
        }


        public void Save()
        {

            try
            {

                DataTable dtUserProfile = new DataTable();
                dtUserProfile.Columns.Add("UserGuid");
                dtUserProfile.Columns.Add("FirstName");
                dtUserProfile.Columns.Add("LastName");
                dtUserProfile.Columns.Add("Gender");
                dtUserProfile.Columns.Add("BirthDate");
                dtUserProfile.Columns.Add("PersonalAddress");
                dtUserProfile.Columns.Add("BusinessAddress");
                dtUserProfile.Columns.Add("City");
                dtUserProfile.Columns.Add("District");
                dtUserProfile.Columns.Add("State");
                dtUserProfile.Columns.Add("Country");
                dtUserProfile.Columns.Add("Pin");
                dtUserProfile.Columns.Add("Phone");
                dtUserProfile.Columns.Add("Mobile");
                dtUserProfile.Columns.Add("Email");
                DataRow dr1 = dtUserProfile.NewRow();
                dr1["UserGuid"] = Convert.ToString(SavedSession.UserGuid);

                dr1["FirstName"] = txt_FirstName.Text;
                dr1["LastName"] = txt_LastName.Text;
                dr1["Gender"] = ddl_Gender.SelectedValue;
                dr1["BirthDate"] = txt_BirthDate.Text;
                dr1["PersonalAddress"] = txt_HomeAddress.Text;
                dr1["BusinessAddress"] = txt_Businessaddress.Text;
                dr1["City"] = txt_City.Text;
                dr1["District"] = txt_District.Text;
                dr1["State"] = txt_State.Text;
                dr1["Country"] = txt_Country.Text;
                dr1["Pin"] = txt_Pin.Text;
                dr1["Phone"] = txt_Phone.Text;
                dr1["Mobile"] = txt_Mobile.Text;
                dr1["Email"] = txt_Email.Text;
                dtUserProfile.Rows.Add(dr1);
                //     int i = ADMIN.bookingdetails(dtBooking, dtMarriage);
                int i = USER.UpdateUserProfile(dtUserProfile);

                if (i > 0)
                {
                    Clear_controls();
                    Response.Redirect("~/Core/Src/User/Dashboard.aspx",true);
                }

            }
            catch (Exception ex)
            {
            }
        }

        protected void btn_Cancel_Click(object sender, EventArgs e)
        {

            setUserDefaults(false);

        }
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
            if (txt_HomeAddress.Text != "" && txt_HomeAddress.Text != null)
                val = true;
            else
            {
                COMMONFUNCTIONS.ScriptMsgForAjax("Please Enter your Home Address", Page);
                return false;
            }
            if (txt_City.Text != "" && txt_City.Text != null)
                val = true;
            else
            {
                COMMONFUNCTIONS.ScriptMsgForAjax("Please Enter  Your City", Page);
                return false;
            }
            if (txt_State.Text != "" && txt_State.Text != null)
                val = true;
            else
            {
                COMMONFUNCTIONS.ScriptMsgForAjax("Please Enter  Your State", Page);
                return false;
            }

            if (txt_Pin.Text != "" && txt_Pin.Text != null)
                val = true;
            else
            {
                COMMONFUNCTIONS.ScriptMsgForAjax("Please Enter  Your Pin ", Page);
                return false;
            }


            if (txt_Email.Text != "" && txt_Email.Text != null)
                val = true;
            else
            {
                COMMONFUNCTIONS.ScriptMsgForAjax("Please Enter Your Email Address", Page);
                return false;
            }
            if (txt_LastName.Text != "" && txt_LastName.Text != null)
                val = true;
            else
            {
                COMMONFUNCTIONS.ScriptMsgForAjax("Please Enter Last Name", Page);
                return false;
            }
            if (txt_Businessaddress.Text != "" && txt_Businessaddress.Text != null)
                val = true;
            else
            {
                COMMONFUNCTIONS.ScriptMsgForAjax("Please Enter Business Address", Page);
                return false;
            }
            if (txt_District.Text != "" && txt_District.Text != null)
                val = true;
            else
            {
                COMMONFUNCTIONS.ScriptMsgForAjax("Please Enter District", Page);
                return false;
            }
            if (txt_Country.Text != "" && txt_Country.Text != null)
                val = true;
            else
            {
                COMMONFUNCTIONS.ScriptMsgForAjax("Please Enter Your Country ", Page);
                return false;
            }
            if (txt_Phone.Text != "" && txt_Phone.Text != null)
                val = true;
            else
            {
                COMMONFUNCTIONS.ScriptMsgForAjax("Please Enter Your Phone ", Page);
                return false;
            }
            if (txt_Mobile.Text != "" && txt_Mobile.Text != null)
                val = true;
            else
            {
                COMMONFUNCTIONS.ScriptMsgForAjax("Please Enter your Mobile ", Page);
                return false;
            }

            if (txt_BirthDate.Text != "" && txt_BirthDate.Text != null)
                val = true;
            else
            {
                COMMONFUNCTIONS.ScriptMsgForAjax("Please Enter your BirthDate ", Page);
                return false;
            }

                //Check_Value();
            
            return val;


        }

         private void setUserDefaults(bool isLoad = true)
         {
             //Locals
             bool isActive = false;
             string accountUrl = string.Empty;
             string key = string.Empty;
             try
             {
                 isActive = COMMON.setLoggedUserSession(SavedSession.UserGuid);
                 key = isLoad ? "LockedUser" : "logoutUrl";
                 if (!isActive)
                 {
                     AppSettingsReader appSettingsReader = new AppSettingsReader();
                     accountUrl = Convert.ToString(appSettingsReader.GetValue(key, typeof(string)));
                     if (!string.IsNullOrEmpty(accountUrl))
                         Response.Redirect(accountUrl, true);
                 }
             }
             catch (Exception ex)
             {
                 string s = ex.Message;
             }
         }

        #region ClearControls
         public void Clear_controls()
         {
             txt_FirstName.Text = "";
             txt_LastName.Text = "";
             ddl_Gender.SelectedValue = "-1";
             txt_HomeAddress.Text = "";
             txt_Businessaddress.Text = "";
             txt_BirthDate.Text = "";
             txt_City.Text = "";
             txt_Country.Text = "";
             txt_District.Text = "";
             txt_Email.Text = "";
             txt_Mobile.Text = "";
             txt_Phone.Text = "";
             txt_Pin.Text = "";
             txt_State.Text = "";
            
         }
        #endregion
    }
    }

