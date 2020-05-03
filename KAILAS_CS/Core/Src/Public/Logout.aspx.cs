using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using KAILAS_CS.Core.Entity;
using KAILAS_CS.Core;
using KAILAS_CS;
using KAILAS_CS.Core.Entity.DL;

namespace KAILAS_CS.Core.Src.Public
{
    public partial class Logout : System.Web.UI.Page
    {
        CommonFunctions COMMONFUNCTIONS = new CommonFunctions();
        DL_Common COMMON = new DL_Common();
        

        protected void Page_Load(object sender, EventArgs e)
        {
           
            COMMON.cleanSavedUserSessions();
         
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();
            Response.Redirect("Login.aspx",false);
           
            //BindLogout();
        }
       
       
       
    }
}