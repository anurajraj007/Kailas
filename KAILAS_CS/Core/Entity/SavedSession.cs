using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace KAILAS_CS.Core.Entity
{
    public static class SavedSession
    {
        public static int UserId
        {
            get
            {
                if (HttpContext.Current.Session["UserId"] == null)
                    HttpContext.Current.Session["UserId"] = 0;
                return (int)HttpContext.Current.Session["UserId"];
            }
            set { HttpContext.Current.Session["UserId"] = value; }
        }
        public static Guid UserGuid
        {
            get
            {
                if (HttpContext.Current.Session["UserGuid"] == null)
                    HttpContext.Current.Session["UserGuid"] = Guid.Empty;
                return (Guid)HttpContext.Current.Session["UserGuid"];
            }
            set { HttpContext.Current.Session["UserGuid"] = value; }
        }
        public static  DataSet UserDataSet
        {
            get
            {
                if (HttpContext.Current.Session["UserDataSet"] == null)
                    HttpContext.Current.Session["UserDataSet"] = null;
                return (DataSet)HttpContext.Current.Session["UserDataSet"];
            }
            set { HttpContext.Current.Session["UserDataSet"] = value; }
        }
    }

}