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
using System.Configuration;

namespace KAILAS_CS.Core.Src.Super
{
    public partial class Dashboard : System.Web.UI.Page
    {
        CommonFunctions COMMONFUNCTIONSFUNCTION = new CommonFunctions();
        DL_Common COMMON = new DL_Common();
        DL_Admin ADMIN = new DL_Admin();
        DL_User USER = new DL_User();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Guid.Empty != SavedSession.UserGuid)
            {
                if (!IsPostBack)
                {
                    setUserDefaults();
                }
            }
            else
                Response.Redirect("Login.aspx", true);
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
        //private void setUserDefaults(bool isLoad = true)
        //{
        //    //Locals
        //    bool isActive = false;
        //    string accountUrl = string.Empty;
        //    string key = string.Empty;
        //    try
        //    {
        //        // isActive = COMMON.setLoggedUserSession(SavedSession.UserGuid);
        //        // key = isLoad ? "LockedUser" : "logoutUrl";
        //        // if (!isActive)
        //        //{
        //        AppSettingsReader appSettingsReader = new AppSettingsReader();
        //        accountUrl = Convert.ToString(appSettingsReader.GetValue(key, typeof(string)));
        //        if (!string.IsNullOrEmpty(accountUrl))
        //            Response.Redirect(accountUrl, true);
        //        //}
        //    }
        //    catch (Exception ex)
        //    {
        //        string s = ex.Message;
        //    }
        //}
    }
}