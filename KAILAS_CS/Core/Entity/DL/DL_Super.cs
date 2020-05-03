using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace KAILAS_CS.Core.Entity.DL
{
    public class DL_Super
    {
        private string AccountRegistration_Insert = "pAccountRegistration_Insert";
        private string SuperAutoEnrollment = "pSuperAutoRegistration";
        private string strSqlConnection = null;

        #region CONNECTION

        public string GetConnectionString()
        {
            strSqlConnection = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;
            return strSqlConnection;
        }

        #endregion

        public int SaveAccountRegistration(DataTable dt)
        {
            int result = 0;
            using (SqlConnection conSQL = new SqlConnection(GetConnectionString()))
            {
                SqlParameter paramReturnValue;
                conSQL.Open();
                SqlCommand cmd = new SqlCommand(AccountRegistration_Insert, conSQL);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@Name", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["NAME"]);
                cmd.Parameters.Add("@Designation", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["DESIGNATION"]);
                cmd.Parameters.Add("@Remarks", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["REMARKS"]);
                cmd.Parameters.Add("@Description", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["DESCRIPTION"]);
                cmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["EMAIL"]);
                cmd.Parameters.Add("@Mobile", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["MOBILE"]);
                paramReturnValue = cmd.Parameters.Add("RETURN_VALUE", SqlDbType.Int);
                paramReturnValue.Direction = ParameterDirection.ReturnValue;
                cmd.ExecuteNonQuery();
                result = System.Convert.ToInt32(cmd.Parameters["RETURN_VALUE"].Value);

            }
            return result;
        }

        public int SuperAutoRegistration(string Email)
        {
            int result = 0;
            using (SqlConnection conSQL = new SqlConnection(GetConnectionString()))
            {
                SqlParameter paramReturnValue;
                conSQL.Open();
                SqlCommand cmd = new SqlCommand(SuperAutoEnrollment, conSQL);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = Email;
                paramReturnValue = cmd.Parameters.Add("RETURN_VALUE", SqlDbType.Int);
                paramReturnValue.Direction = ParameterDirection.ReturnValue;
                cmd.ExecuteNonQuery();
                result = System.Convert.ToInt32(cmd.Parameters["RETURN_VALUE"].Value);

            }
            return result;
        }

    }
}