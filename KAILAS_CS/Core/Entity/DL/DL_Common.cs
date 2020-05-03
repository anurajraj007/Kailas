using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using KAILAS_CS;
using System.Configuration;
namespace KAILAS_CS.Core.Entity.DL
{
    public class DL_Common
    {
        CommonFunctions COMMONFUNCTIONS = new CommonFunctions();
        #region CONNECTION
        private string GetConnectionString()
        {
            return COMMONFUNCTIONS.GetConnectionString();
        }
        #endregion

        #region PROCEDURES

        private  string Changepassword = "pChangePassword";
        private string AccessAuthentication_Details = "pAccessAuthentication";
        private string LoggedUser_Details = "pGetLoggedUser_Details";

        #endregion

        #region AccessAuthentication

        public DataSet AccessAuthentication(string Username, string password)
        {
            DataSet ds = new DataSet();
            using (SqlConnection conSQL = new SqlConnection(GetConnectionString()))
            {
                conSQL.Open();
                SqlCommand cm = new SqlCommand(AccessAuthentication_Details, conSQL);
                cm.CommandType = CommandType.StoredProcedure;
                cm.Parameters.Add("@Username", SqlDbType.NVarChar).Value = Username;
                cm.Parameters.Add("@Password", SqlDbType.NVarChar).Value = password;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cm;
                da.Fill(ds);
                return ds;
            }
        }

        #endregion

        public DataSet GetLoggedUserDetails(Guid UserGuid)
        {
            DataSet ds = new DataSet();
            using (SqlConnection conSQL = new SqlConnection(GetConnectionString()))
            {
                conSQL.Open();
                SqlCommand cm = new SqlCommand(LoggedUser_Details, conSQL);
                cm.CommandType = CommandType.StoredProcedure;
                cm.Parameters.Add("@LoggedGuid", SqlDbType.UniqueIdentifier).Value = UserGuid;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cm;
                da.Fill(ds);
                return ds;


            }
        }
        public bool setLoggedUserSession(Guid UserGuid)
        {
            //Locals
            bool isActive = false;
            DataSet ds_User = new DataSet();
            try
            {

                ds_User = GetLoggedUserDetails(UserGuid);
                if (ds_User.Tables.Count > 0)
                {
                    SavedSession.UserDataSet = ds_User;
                    isActive = Convert.ToBoolean(ds_User.Tables[0].Rows[0]["IsActive"]);
                }
            }
            catch (Exception ex)
            {
                string s = ex.Message;
            }
            return isActive;
        }

        public void cleanSavedUserSessions()
        {
            try
            {

                SavedSession.UserGuid = Guid.Empty;
                SavedSession.UserDataSet = null;
                SavedSession.UserId = 0;
               
                
            }
            catch (Exception ex)
            {
                string s = ex.Message;
            }
        }

        #region CHANGE_PASSWORD
        public int ChangePassword(Guid UserGuid, string oldPassword, string newPassword)
        {
            int result = 0;
            using (SqlConnection conSQL = new SqlConnection(GetConnectionString()))
            {
                SqlParameter paramReturnValue;
                conSQL.Open();
                SqlCommand cmd = new SqlCommand(Changepassword, conSQL);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@UserGuid", SqlDbType.UniqueIdentifier).Value = UserGuid;
                cmd.Parameters.Add("@OldPassword", SqlDbType.NVarChar).Value = Convert.ToString(oldPassword);
                cmd.Parameters.Add("@NewPassword", SqlDbType.NVarChar).Value = Convert.ToString(newPassword);

                paramReturnValue = cmd.Parameters.Add("RETURN_VALUE", SqlDbType.Int);
                paramReturnValue.Direction = ParameterDirection.ReturnValue;
                cmd.ExecuteNonQuery();
                result = System.Convert.ToInt32(cmd.Parameters["RETURN_VALUE"].Value);

            }
            return result;

        }
        #endregion
    }
}