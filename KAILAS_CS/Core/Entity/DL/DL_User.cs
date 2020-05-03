using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;
using KAILAS_CS;

namespace KAILAS_CS.Core.Entity.DL
{
    
    public class DL_User
    {
        CommonFunctions COMMONFUNCTIONS = new CommonFunctions();
        DL_Admin ADMIN = new DL_Admin();
        DataSet dss = new DataSet();
       #region procedure
        string Registration = "pUser_Registration";
        string UserProfile = "pUserProfile_GetDetails";
        string UserProfileUpdate="pUserProfileUpdate";
        string User_Booking="pUserInsert";
        string GetUserBKingHistory = "pUserBookingHistory";
        string GetUserDetails = "pGetUserBookingDetails";
        string UserEventsList="pUserGetEvents_List";
       #endregion
        #region CONNECTION
        private string GetConnectionString()
        {
            return COMMONFUNCTIONS.GetConnectionString();
        }
        #endregion

        public int RegistrationDetails(DataTable dt)
        {
            int result = 0;
            using (SqlConnection conSQL = new SqlConnection(GetConnectionString()))
            {
                SqlParameter paramReturnValue;
                conSQL.Open();
                SqlCommand cmd = new SqlCommand(Registration, conSQL);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@FIRSTNAME", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["FIRSTNAME"]);
                cmd.Parameters.Add("@LASTNAME", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["LASTNAME"]);
                cmd.Parameters.Add("@EMAIL", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["EMAIL"]);
                cmd.Parameters.Add("@MOBILE", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["MOBILE"]);
                paramReturnValue = cmd.Parameters.Add("RETURN_VALUE", SqlDbType.Int);
                paramReturnValue.Direction = ParameterDirection.ReturnValue;
                cmd.ExecuteNonQuery();
                result = System.Convert.ToInt32(cmd.Parameters["RETURN_VALUE"].Value);
            }
            return result;
            
        }
#region USER_PROFILE_UPDATE
        public int UpdateUserProfile(DataTable dt)
        {
            int result = 0;
            using (SqlConnection conSQL = new SqlConnection(GetConnectionString()))
            {
                SqlParameter paramReturnValue;
                conSQL.Open();
                SqlCommand cmd = new SqlCommand(UserProfileUpdate, conSQL);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@FirstName", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["FirstName"]);
                cmd.Parameters.Add("@LastName", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["LastName"]);
                cmd.Parameters.Add("@Gender", SqlDbType.VarChar).Value = Convert.ToString(dt.Rows[0]["Gender"]);
                cmd.Parameters.Add("@PersonalAddress", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["PersonalAddress"]);
                cmd.Parameters.Add("@BusinessAddress", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["BusinessAddress"]);
                cmd.Parameters.Add("@City", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["City"]);
                cmd.Parameters.Add("@District", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["District"]);
                cmd.Parameters.Add("@Pin", SqlDbType.VarChar).Value = Convert.ToString(dt.Rows[0]["Pin"]);
                cmd.Parameters.Add("@Phone", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["Phone"]);
                cmd.Parameters.Add("@Mobile", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["Mobile"]);
                cmd.Parameters.Add("@State", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["State"]);
                cmd.Parameters.Add("@BirthDate", SqlDbType.DateTime).Value = Convert.ToDateTime(dt.Rows[0]["BirthDate"]);
                cmd.Parameters.Add("@Country", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["Country"]);
                cmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["Email"]);
           
                cmd.Parameters.Add("@UserGuid", SqlDbType.UniqueIdentifier).Value = Guid.Parse(Convert.ToString(dt.Rows[0]["UserGuid"]));
             
                paramReturnValue = cmd.Parameters.Add("RETURN_VALUE", SqlDbType.Int);
                paramReturnValue.Direction = ParameterDirection.ReturnValue;
                cmd.ExecuteNonQuery();
                result = System.Convert.ToInt32(cmd.Parameters["RETURN_VALUE"].Value);

            }
            return result;

        }
#endregion

        #region view
        public DataSet GetUserProfile( Guid UserGuid)
        {
            using (SqlConnection conSQL = new SqlConnection(GetConnectionString()))
            {
                conSQL.Open();
                SqlCommand cmd = new SqlCommand(UserProfile, conSQL);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@id", SqlDbType.UniqueIdentifier).Value = UserGuid;
                SqlDataAdapter daa = new SqlDataAdapter();
                daa.SelectCommand = cmd;
                daa.Fill(dss);
                return dss;
            }
        }
        #endregion
        public Int32 PaymentClosed(byte IsCloed, Guid BookingId)
        {
            int result = 0;
            using (SqlConnection conSQL = new SqlConnection(GetConnectionString()))
            {
                SqlParameter parmReturnValue;
                conSQL.Open();
                SqlCommand cmd = new SqlCommand("pPaymebtClosed", conSQL);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@BookingGuid", SqlDbType.UniqueIdentifier).Value = Guid.Parse(Convert.ToString(BookingId));
                cmd.Parameters.Add("@IsClosed", SqlDbType.Bit).Value = IsCloed;
                parmReturnValue = cmd.Parameters.Add("RETURN_VALUE", SqlDbType.Int);
                parmReturnValue.Direction = ParameterDirection.ReturnValue;
                cmd.ExecuteNonQuery();
                result = System.Convert.ToInt32(cmd.Parameters["RETURN_VALUE"].Value);
            }
            return result;
        }
        #region BOOKING
        public int Booking(DataTable dt, DataTable dt1)
        {
            int result = 0;
            using (SqlConnection conSQL = new SqlConnection(GetConnectionString()))
            {
                SqlParameter parmReturnValue;
                conSQL.Open();
                SqlCommand cmd = new SqlCommand(User_Booking, conSQL);
                cmd.CommandType = CommandType.StoredProcedure;
                 // cmd.Parameters.Add("@RowID", SqlDbType.BigInt).Value = Convert.ToInt64(dt.Rows[0]["RowID"]);
                cmd.Parameters.Add("@UserGuid", SqlDbType.UniqueIdentifier).Value = Guid.Parse(Convert.ToString(dt.Rows[0]["UserGuid"]));
                cmd.Parameters.Add("@EventType", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["EVENT_TYPE"]);
                cmd.Parameters.Add("@SessionType", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["SESSION_TYPE"]);
                cmd.Parameters.Add("@Facilities", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["FACILITIES"]);
                cmd.Parameters.Add("@GuestCount", SqlDbType.Int).Value = Convert.ToInt32(dt.Rows[0]["NO_OF_GUESTS"]);
                cmd.Parameters.Add("@Description", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["DESCRIPTION"]);
                cmd.Parameters.Add("@EventDate", SqlDbType.DateTime).Value = Convert.ToDateTime(dt.Rows[0]["DATE"]);

                if ((Convert.ToString(dt.Rows[0]["EVENT_TYPE"]) == "1"))
                {
                    cmd.Parameters.Add("@B_Name", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["B_NAME"]);
                    cmd.Parameters.Add("@B_Father", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["B_FATHER"]);
                    cmd.Parameters.Add("@B_DOB", SqlDbType.Date).Value = Convert.ToDateTime(dt1.Rows[0]["B_DOB"]);
                    cmd.Parameters.Add("@B_DOB", SqlDbType.Date).Value = Convert.ToDateTime(dt1.Rows[0]["B_DOB"]);
                    cmd.Parameters.Add("@B_Age", SqlDbType.Int).Value = Convert.ToInt32(dt1.Rows[0]["B_AGE"]);

                    cmd.Parameters.Add("@G_Name", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["G_NAME"]);
                    cmd.Parameters.Add("@G_Father", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["G_FATHER"]);
                    cmd.Parameters.Add("@G_DOB", SqlDbType.Date).Value = Convert.ToDateTime(dt1.Rows[0]["G_DOB"]);
                    cmd.Parameters.Add("@G_DOB", SqlDbType.Date).Value = Convert.ToDateTime(dt1.Rows[0]["G_DOB"]);
                    cmd.Parameters.Add("@G_Age", SqlDbType.Int).Value = Convert.ToInt32(dt1.Rows[0]["G_AGE"]);
                }
                parmReturnValue = cmd.Parameters.Add("RETURN_VALUE", SqlDbType.Int);
                parmReturnValue.Direction = ParameterDirection.ReturnValue;
                cmd.ExecuteNonQuery();
                result = System.Convert.ToInt32(cmd.Parameters["RETURN_VALUE"].Value);
            }
            return result;
        }
        #endregion

#region GetUserBookingHistory
        public DataSet GetBookingDetails(DataTable dt)
        {
            DataSet dsBooking = new DataSet();
            using (SqlConnection conSQL = new SqlConnection(GetConnectionString()))
            {
                //SqlParameter parmReturnValue;
                conSQL.Open();
                SqlCommand cmd = new SqlCommand(GetUserBKingHistory, conSQL);
                SqlDataAdapter daBooking = new SqlDataAdapter();
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@UserGuid", SqlDbType.UniqueIdentifier).Value = Guid.Parse(Convert.ToString(dt.Rows[0]["UserGuid"]));
                if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["EVENT_TYPE"])) && Convert.ToInt64(dt.Rows[0]["EVENT_TYPE"]) > 0)
                {

                    cmd.Parameters.Add("@EventType", SqlDbType.BigInt).Value = Convert.ToInt64(dt.Rows[0]["EVENT_TYPE"]);
                }
                if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["EVENT_DATE"])))
                {
                    cmd.Parameters.Add("@EventDate", SqlDbType.DateTime).Value = Convert.ToDateTime(dt.Rows[0]["EVENT_DATE"]);
                    //   cmd.Parameters.Add("@EventDate", SqlDbType.DateTime).Value = DateTime.ParseExact(Convert.ToString(dt.Rows[0]["EVENT_DATE"]), @"d/m/yyyy", System.Globalization.CultureInfo.InvariantCulture);

                }
                if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["BOOKING_DATE"])))
                {
                    cmd.Parameters.Add("@Booking_Date", SqlDbType.Date).Value = Convert.ToDateTime(dt.Rows[0]["BOOKING_DATE"]);
                }
                if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["NAME"])))
                {
                    cmd.Parameters.Add("@Name", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["NAME"]);

                }
                if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["BRIDE_NAME"])))
                {
                    cmd.Parameters.Add("@Bride_Name", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["BRIDE_NAME"]);

                }
                if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["BRIDEGROOM_NAME"])))
                {
                    cmd.Parameters.Add("@BrideGroom_Name", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["BRIDEGROOM_NAME"]);
                }


                daBooking.SelectCommand = cmd;
                daBooking.Fill(dsBooking);

            }
            return dsBooking;
        }

#endregion
        #region GetUserBookingDetails
        public DataSet GetBookingDatas(DataTable dt)
        {
            DataSet dsBooking = new DataSet();
            using (SqlConnection conSQL = new SqlConnection(GetConnectionString()))
            {
                //SqlParameter parmReturnValue;
                conSQL.Open();
                SqlCommand cmd = new SqlCommand(GetUserDetails, conSQL);
                SqlDataAdapter daBooking = new SqlDataAdapter();
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@UserGuid", SqlDbType.UniqueIdentifier).Value = Guid.Parse(Convert.ToString(dt.Rows[0]["UserGuid"]));
                if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["EVENT_TYPE"])) && Convert.ToInt64(dt.Rows[0]["EVENT_TYPE"]) > 0)
                {

                    cmd.Parameters.Add("@EventType", SqlDbType.BigInt).Value = Convert.ToInt64(dt.Rows[0]["EVENT_TYPE"]);
                }
                if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["EVENT_DATE"])))
                {
                    cmd.Parameters.Add("@EventDate", SqlDbType.DateTime).Value = Convert.ToDateTime(dt.Rows[0]["EVENT_DATE"]);
                    //   cmd.Parameters.Add("@EventDate", SqlDbType.DateTime).Value = DateTime.ParseExact(Convert.ToString(dt.Rows[0]["EVENT_DATE"]), @"d/m/yyyy", System.Globalization.CultureInfo.InvariantCulture);

                }
                if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["BOOKING_DATE"])))
                {
                    cmd.Parameters.Add("@Booking_Date", SqlDbType.Date).Value = Convert.ToDateTime(dt.Rows[0]["BOOKING_DATE"]);
                }
                if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["NAME"])))
                {
                    cmd.Parameters.Add("@Name", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["NAME"]);

                }
                if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["BRIDE_NAME"])))
                {
                    cmd.Parameters.Add("@Bride_Name", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["BRIDE_NAME"]);

                }
                if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["BRIDEGROOM_NAME"])))
                {
                    cmd.Parameters.Add("@BrideGroom_Name", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["BRIDEGROOM_NAME"]);
                }


                daBooking.SelectCommand = cmd;
                daBooking.Fill(dsBooking);

            }
            return dsBooking;
        }

        #endregion
       // pUserGetEvents_List
        public DataSet GetEventsList(Guid UserGuid, Int64 eventId = 0)
        {
            DataSet dsEvents = new DataSet();
            using (SqlConnection conSQL = new SqlConnection(GetConnectionString()))
            {
                conSQL.Open();
                SqlCommand commandEvents = new SqlCommand(UserEventsList, conSQL);
                SqlDataAdapter daEvents = new SqlDataAdapter();
                commandEvents.CommandType = CommandType.StoredProcedure;
                if (eventId > 0)
                    commandEvents.Parameters.AddWithValue("@EventID", eventId);
                commandEvents.Parameters.Add("@UserGuid", SqlDbType.UniqueIdentifier).Value = UserGuid;
                daEvents.SelectCommand = commandEvents;
                daEvents.Fill(dsEvents);

            }
            return dsEvents;
        }
        public int UpdateUserBookingStatus(DataTable dt)
        {
            int result = 0;
            using (SqlConnection conSQL = new SqlConnection(GetConnectionString()))
            {
                SqlParameter parmReturnValue;
                conSQL.Open();
                SqlCommand cmd = new SqlCommand("pBookingUpdateStatus", conSQL);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@BookingGuid", SqlDbType.UniqueIdentifier).Value = Guid.Parse(Convert.ToString(dt.Rows[0]["BookingGUID"]));
                cmd.Parameters.Add("@Status", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["Status"]);

                parmReturnValue = cmd.Parameters.Add("RETURN_VALUE", SqlDbType.Int);
                parmReturnValue.Direction = ParameterDirection.ReturnValue;
                cmd.ExecuteNonQuery();
                result = System.Convert.ToInt32(cmd.Parameters["RETURN_VALUE"].Value);
            }
            return result;
        }


    }
}