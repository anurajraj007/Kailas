using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KAILAS_CS.Core.Entity.DL;
using KAILAS_CS.Core.Entity;

namespace KAILAS_CS.Core.Masters
{
    public partial class User : System.Web.UI.MasterPage
    {
        DL_Common COMMON = new DL_Common();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Guid.Empty != SavedSession.UserGuid)
            {
                if (!IsPostBack)
                {
                }
            }
            else if (SavedSession.UserGuid == Guid.Empty)
            {
                COMMON.cleanSavedUserSessions();
                Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
                Response.Cache.SetCacheability(HttpCacheability.NoCache);
                Response.Cache.SetNoStore();
                Response.Redirect("Login.aspx", false);
            }
        }
    }
}