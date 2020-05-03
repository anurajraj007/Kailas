using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using KAILAS_CS;
using System.IO;
using System.Web.UI;

namespace KAILAS_CS.Core.Entity
{
    public class CommonFunctions
    {
        protected SqlConnection conSQL;
        DataSet ds = new DataSet();
        string strConnectionStrings;


        public static SqlConnection GetConnection()
        {
            string str = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;
            SqlConnection Sql = new SqlConnection(str);
            return Sql;
        }

        #region CONNECTION
        public string GetConnectionString()
        {
            strConnectionStrings= System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;
            return strConnectionStrings;
        }
        #endregion

        #region GET_DATASET
        public DataSet GetDataset(string strCommandText, SqlConnection conSQL)
        {
            SqlDataAdapter daAdapter;

            DataSet dsData;
            dsData = new DataSet();
            daAdapter = new SqlDataAdapter(strCommandText, conSQL);
            conSQL.Open();
            daAdapter.Fill(dsData);
            conSQL.Close();
            return dsData;

        }
        #endregion

        #region MESSAGE
        public void ScriptMsgForAjax(String Str, Page WebInstance)
        {
            String StrScript = "window.alert('" + Str + "');";
            ScriptManager.RegisterStartupScript(WebInstance, this.GetType(), "clientscript", StrScript, true);
        }
        public void ScriptMsg(string str, Page webpageinstance)
        {

            string strScript = "<script language=JavaScript runat=server> window.alert('" + str + "')</script>";
            if (!webpageinstance.ClientScript.IsStartupScriptRegistered("clientScript"))
            {
                webpageinstance.ClientScript.RegisterStartupScript(typeof(Page), "clientScript", strScript);
            }
        }
        #endregion
    }
}