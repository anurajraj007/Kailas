using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace KAILAS_CS.Core.Entity.DL
{


    public class DL_Admin
    {
        CommonFunctions COMMONFUNCTIONS = new CommonFunctions();
        string strConnectionString;
       
        DataSet dsBooking = new DataSet();
        DataSet dsMarriagedetails = new DataSet();

        #region PROCEDURE LIST

        private const string BookingMaster_List = "pBookingMaster_List";
        private const string EventTypes_List = "pEvents_List";
        private const string Events_List = "pGetEvents_List";
        private const string GetBillNo = "pGetBillNumber";
        private const string GetMarriageDetails = "pGetMarriageDetails";
        private const string GetBookingHistoryList="pGetBookingHistory_List";
        private const string Booking_Update = "pAdminBooking_Update";
        private const string BookingHistoryUser = "pGetUserBookingDetails";
        private const string BillData_Update = "pBillingData_Insert";
        private const string UserDetailsList = "pGetUserDetailsList";
        private const string UserProfile = "pUserProfile_GetDetails";
        private const string UserProfileUpdate = "pUserUpdateStatus";
        private const string GetMarriageData = "pGetMarriageData";
        private const string SignatureUpload = "pMarriageSignature";

        #endregion

        #region BOOKING_DETAILS

        private string GetConnectionString()
        {
            strConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["SqlConnection"].ConnectionString;
            return strConnectionString;
        }
        #endregion
        public int bookingdetails(DataTable dt, DataTable dt1)
        {
            int result = 0;
            using (SqlConnection conSQL = new SqlConnection(GetConnectionString()))
            {
                SqlParameter parmReturnValue;
                conSQL.Open();
                SqlCommand cmd = new SqlCommand("pAdminBooking_Insert", conSQL);
                cmd.CommandType = CommandType.StoredProcedure;
                // cmd.CommandType = CommandType.StoredProcedure;
                //  cmd.Parameters.Add("@ID", SqlDbType.BigInt).Value = Convert.ToInt64(dt.Rows[0]["ID"]);
               // cmd.Parameters.Add("@Row_ID", SqlDbType.BigInt).Value = Convert.ToInt64(dt.Rows[0]["RowID"]);
                cmd.Parameters.Add("@EventType", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["EVENT_TYPE"]);
                cmd.Parameters.Add("@EventDate", SqlDbType.DateTime).Value = Convert.ToDateTime(dt.Rows[0]["DATE"]);

              //  cmd.Parameters.Add("@EventDate", SqlDbType.DateTime).Value = DateTime.ParseExact(Convert.ToString(dt.Rows[0]["DATE"]), @"d/M/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                cmd.Parameters.Add("@SessionType", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["SESSION_TYPE"]);
                cmd.Parameters.Add("@Facilities", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["FACILITIES"]);
                cmd.Parameters.Add("@GuestCount", SqlDbType.Int).Value = Convert.ToInt32(dt.Rows[0]["NO_OF_GUESTS"]);
                cmd.Parameters.Add("@Description", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["DESCRIPTION"]);
                //  cmd.Parameters.Add("@EventDate", SqlDbType.DateTime).Value = Convert.ToDateTime(dt.Rows[0]["DATE"]);

                //  cmd.Parameters.Add("@PAYMENT", SqlDbType.Int).Value = Convert.ToInt32(dt.Rows[0]["PAYMENT"]);
                cmd.Parameters.Add("@FirstName", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["FIRSTNAME"]);
                cmd.Parameters.Add("@LastName", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["LASTNAME"]);

                cmd.Parameters.Add("@Mobile", SqlDbType.VarChar).Value = Convert.ToString(dt.Rows[0]["MOBILE"]);
                cmd.Parameters.Add("@Email", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["EMAIL"]);
                cmd.Parameters.Add("@Advance", SqlDbType.Float).Value = Convert.ToDouble(dt.Rows[0]["ADVANCE"]);
                //  cmd.Parameters.Add("@IsPaymentSettled", SqlDbType.Bit).Value = Convert.ToInt16 (dt.Rows[0]["IS_paymentsettled"]);
                // cmd.Parameters.Add("@IsFreezed", SqlDbType.Bit).Value = Convert.ToInt16(dt.Rows[0]["ISFREEZED"]);
                if ((Convert.ToString(dt.Rows[0]["EVENT_TYPE"]) == "1"))
                {


                    cmd.Parameters.Add("@B_Name", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["B_NAME"]);
                    cmd.Parameters.Add("@B_Father", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["B_FATHER"]);
                    cmd.Parameters.Add("@B_DOB", SqlDbType.Date).Value = Convert.ToDateTime(dt1.Rows[0]["B_DOB"]);
                    cmd.Parameters.Add("@B_Age", SqlDbType.Int).Value = Convert.ToInt32(dt1.Rows[0]["B_AGE"]);
                    //   cmd.Parameters.Add("@B_DOB", SqlDbType.DateTime).Value = DateTime.ParseExact(Convert.ToString(dt1.Rows[0]["B_DOB"]), @"d/M/yyyy", System.Globalization.CultureInfo.InvariantCulture);

                    cmd.Parameters.Add("@G_Name", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["G_NAME"]);
                    cmd.Parameters.Add("@G_Father", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["G_FATHER"]);
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

        public DataSet GetBookingDetails(DataTable dt)
        {
            DataSet dsBooking = new DataSet();
            using (SqlConnection conSQL = new SqlConnection(GetConnectionString()))
            {
                //SqlParameter parmReturnValue;
                conSQL.Open();
                SqlCommand cmd = new SqlCommand(GetBookingHistoryList, conSQL);
                SqlDataAdapter daBooking = new SqlDataAdapter();
                cmd.CommandType = CommandType.StoredProcedure;


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

        public DataSet GetEventsList(Int64 eventId = 0)
        {
            DataSet dsEvents = new DataSet();
            using (SqlConnection conSQL = new SqlConnection(GetConnectionString()))
            {
                conSQL.Open();
                SqlCommand commandEvents = new SqlCommand(Events_List, conSQL);
                SqlDataAdapter daEvents = new SqlDataAdapter();
                commandEvents.CommandType = CommandType.StoredProcedure;
                if (eventId > 0)
                    commandEvents.Parameters.AddWithValue("@EventID", eventId);
                daEvents.SelectCommand = commandEvents;
                daEvents.Fill(dsEvents);

            }
            return dsEvents;
        }

        public DataSet GetEventTypes()
        {
            DataSet dsEevents = new DataSet();
            using (SqlConnection conSQL = new SqlConnection(GetConnectionString()))
            {
                conSQL.Open();
                SqlCommand commandEvents = new SqlCommand(EventTypes_List, conSQL);
                SqlDataAdapter daEvents = new SqlDataAdapter();
                commandEvents.CommandType = CommandType.StoredProcedure;

                daEvents.SelectCommand = commandEvents;
                daEvents.Fill(dsEevents);

            }
            return dsEevents;
        }
        #region GetBillNumber
        public DataSet GetBill_No(Int64 id)
        {
            DataSet dss = new DataSet();
            using (SqlConnection conSQL = new SqlConnection(GetConnectionString()))
            {
                conSQL.Open();
                SqlCommand cmd = new SqlCommand(GetBillNo, conSQL);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@ID", SqlDbType.Int).Value = id;

                SqlDataAdapter daa = new SqlDataAdapter();
                daa.SelectCommand = cmd;
                daa.Fill(dss);
                return dss;
            }
        }
        #endregion
        public int UpdaetBookingDetails(DataTable dt1)
        {
            int result = 0;
            using (SqlConnection conSQL = new SqlConnection(GetConnectionString()))
            {
                SqlParameter parmReturnValue;

                conSQL.Open();

                SqlCommand cmd = new SqlCommand(Booking_Update, conSQL);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@BookingGuid", SqlDbType.UniqueIdentifier).Value = Guid.Parse(Convert.ToString(dt1.Rows[0]["BookingGuid"]));
             //    cmd.Parameters.Add("@BookingID", SqlDbType.BigInt).Value = Convert.ToInt64(dt1.Rows[0]["BookingID"]);
              cmd.Parameters.Add("@EventDate", SqlDbType.DateTime).Value = Convert.ToDateTime(dt1.Rows[0]["EventDate"]);//   cmd.Parameters.Add("@ID", SqlDbType.BigInt).Value = Convert.ToInt64(dt1.Rows[0]["ID"]);
                // cmd.Parameters.Add("@iCase", SqlDbType.Int).Value = Convert.ToInt32(dt1.Rows[0]["iCase"]);
                cmd.Parameters.Add("@B_NAME", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["B_NAME"]);
                cmd.Parameters.Add("@B_PARENT", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["B_PARENT"]);
                cmd.Parameters.Add("@B_DOB", SqlDbType.Date).Value = Convert.ToDateTime(dt1.Rows[0]["B_DOB"]);
                //  cmd.Parameters.Add("@B_DOB", SqlDbType.DateTime).Value = DateTime.ParseExact(Convert.ToString(dt1.Rows[0]["B_DOB"]), @"d/M/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                cmd.Parameters.Add("@B_CASTE", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["B_CASTE"]);
                cmd.Parameters.Add("@B_RELIGION", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["B_RELIGION"]);

                cmd.Parameters.Add("@B_OCCUPATION", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["B_OCCUPATION"]);
                cmd.Parameters.Add("@B_MOTHER", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["B_MOTHER"]);
                //cmd.Parameters.Add("@B_DOB", SqlDbType.DateTime).Value = Convert.ToDateTime(dt1.Rows[0]["B_DOB"]);
                 cmd.Parameters.Add("@B_AGE", SqlDbType.VarChar).Value = Convert.ToString(dt1.Rows[0]["B_AGE"]);
                cmd.Parameters.Add("@B_ADDRESS1", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["B_ADDRESS1"]);
                cmd.Parameters.Add("@B_ADDRESS2", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["B_ADDRESS2"]);
                cmd.Parameters.Add("@B_CITY", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["B_CITY"]);
                cmd.Parameters.Add("@B_DISTRICT", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["B_DISTRICT"]);
                cmd.Parameters.Add("@B_STATE", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["B_STATE"]);
                cmd.Parameters.Add("@B_COUNTRY", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["B_COUNTRY"]);
                cmd.Parameters.Add("@B_PIN", SqlDbType.VarChar).Value = Convert.ToString(dt1.Rows[0]["B_PIN"]);
                cmd.Parameters.Add("@B_MOBILE", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["B_MOBILE"]);
                cmd.Parameters.Add("@B_EMAIL", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["B_EMAIL"]);
                cmd.Parameters.Add("@B_PERSON", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["B_PERSON"]);
                cmd.Parameters.Add("@B_RELATION", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["B_RELATION"]);
                cmd.Parameters.Add("@B_WITNESS", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["B_WITNESS"]);

                cmd.Parameters.Add("@G_NAME", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["G_NAME"]);
                cmd.Parameters.Add("@G_PARENT", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["G_PARENT"]);
                cmd.Parameters.Add("@G_DOB", SqlDbType.Date).Value = Convert.ToDateTime(dt1.Rows[0]["G_DOB"]);
                // cmd.Parameters.Add("@G_DOB", SqlDbType.DateTime).Value = DateTime.ParseExact(Convert.ToString(dt1.Rows[0]["G_DOB"]), @"d/M/yyyy", System.Globalization.CultureInfo.InvariantCulture);
                cmd.Parameters.Add("@G_CASTE", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["G_CASTE"]);
                cmd.Parameters.Add("@G_RELIGION", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["G_RELIGION"]);

                //cmd.Parameters.Add("@G_DOB", SqlDbType.DateTime).Value = Convert.ToDateTime(dt1.Rows[0]["G_DOB"]);
                cmd.Parameters.Add("@G_AGE", SqlDbType.VarChar).Value = Convert.ToString(dt1.Rows[0]["G_AGE"]);
                cmd.Parameters.Add("@G_OCCUPATION", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["G_OCCUPATION"]);
                cmd.Parameters.Add("@G_MOTHER", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["G_MOTHER"]);
                cmd.Parameters.Add("@G_PIN", SqlDbType.VarChar).Value = Convert.ToString(dt1.Rows[0]["G_PIN"]);
                cmd.Parameters.Add("@G_MOBILE", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["G_MOBILE"]);
                cmd.Parameters.Add("@G_ADDRESS1", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["G_ADDRESS1"]);
                cmd.Parameters.Add("@G_ADDRESS2", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["G_ADDRESS2"]);
                cmd.Parameters.Add("@G_CITY", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["G_CITY"]);
                cmd.Parameters.Add("@G_STATE", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["G_STATE"]);
                cmd.Parameters.Add("@G_DISTRICT", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["G_DISTRICT"]);
                cmd.Parameters.Add("@G_COUNTRY", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["G_COUNTRY"]);
                cmd.Parameters.Add("@G_EMAIL", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["G_EMAIL"]);
                cmd.Parameters.Add("@G_PERSON", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["G_PERSON"]);
                cmd.Parameters.Add("@G_RELATION", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["G_RELATION"]);
                cmd.Parameters.Add("@G_WITNESS", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["G_WITNESS"]);
                cmd.Parameters.Add("@BillNo", SqlDbType.NVarChar).Value = Convert.ToString(dt1.Rows[0]["BillNo"]);
                 cmd.Parameters.Add("@Time", SqlDbType.Float).Value = Convert.ToDouble(dt1.Rows[0]["TIME"]);
                 cmd.Parameters.Add("@Meridiem", SqlDbType.VarChar).Value = Convert.ToString(dt1.Rows[0]["MERIDIEM"]);
                // cmd.Parameters.Add("@G_SIGN", SqlDbType.NVarChar).Value = Convert.ToString( file);
                parmReturnValue = cmd.Parameters.Add("RETURN_VALUE", SqlDbType.Int);
                parmReturnValue.Direction = ParameterDirection.ReturnValue;
                cmd.ExecuteNonQuery();
                result = System.Convert.ToInt32(cmd.Parameters["RETURN_VALUE"].Value);
            }
            return result;

        }
        public DataSet Get_MarriageDetails(string FDate)
        {
            using (SqlConnection conSQL = new SqlConnection(GetConnectionString()))
            {
                conSQL.Open();
                SqlCommand cmd = new SqlCommand(GetMarriageDetails, conSQL);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@EventDate", SqlDbType.DateTime).Value = FDate;
              

                SqlDataAdapter daa = new SqlDataAdapter();
                daa.SelectCommand = cmd;
                daa.Fill(dsMarriagedetails);
                return dsMarriagedetails;
            }
        }
     
        public DataSet GetBookingData(Guid BookingGuid)
        {
            DataSet dss = new DataSet();
            using (SqlConnection conSQL = new SqlConnection(GetConnectionString()))
            {
                conSQL.Open();
                SqlCommand cmd = new SqlCommand(BookingHistoryUser, conSQL);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@BookingGuid", SqlDbType.UniqueIdentifier).Value = BookingGuid;
                SqlDataAdapter daa = new SqlDataAdapter();
                daa.SelectCommand = cmd;
                daa.Fill(dss);
                return dss;
            }
        }
        #region view
        public DataSet GetUserProfile(Guid UserGuid)
        {
            DataSet dss = new DataSet();
            using (SqlConnection conSQL = new SqlConnection(GetConnectionString()))
            {
                conSQL.Open();
                SqlCommand cmd = new SqlCommand(UserProfile, conSQL);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@UserGuid", SqlDbType.UniqueIdentifier).Value = UserGuid;
                SqlDataAdapter daa = new SqlDataAdapter();
                daa.SelectCommand = cmd;
                daa.Fill(dss);
                return dss;
            }
        }
        #endregion
        public int UpdateBillDetails(DataTable dt)
        {
            int result = 0;
            using (SqlConnection conSQL = new SqlConnection(GetConnectionString()))
            {
                SqlParameter parmReturnValue;
                conSQL.Open();
                SqlCommand cmd = new SqlCommand(BillData_Update, conSQL);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@BookingGuid", SqlDbType.UniqueIdentifier).Value = Guid.Parse(Convert.ToString(dt.Rows[0]["BookingGUID"]));
                cmd.Parameters.Add("@BillNo", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["BillNo"]);
                 if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["HallRent"])))
                     cmd.Parameters.Add("@HallRent", SqlDbType.Float).Value = Convert.ToDouble(dt.Rows[0]["HallRent"]);
                  if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["Food"])))
                
                cmd.Parameters.Add("@Food", SqlDbType.Float).Value = Convert.ToDouble(dt.Rows[0]["Food"]);
                  if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["Cleaning"])))
                cmd.Parameters.Add("@Cleaning", SqlDbType.Float).Value = Convert.ToDouble(dt.Rows[0]["Cleaning"]);
                  if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["Catering"])))
                cmd.Parameters.Add("@Catering", SqlDbType.Float).Value = Convert.ToDouble(dt.Rows[0]["Catering"]);
                  if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["Water"])))
                cmd.Parameters.Add("@Water", SqlDbType.Float).Value = Convert.ToDouble(dt.Rows[0]["Water"]);
                  if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["Electricity"])))
                cmd.Parameters.Add("@Electricity", SqlDbType.Float).Value =Convert.ToDouble(dt.Rows[0]["Electricity"]);
                  if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["Tax"])))
                cmd.Parameters.Add("@Tax", SqlDbType.Float).Value = Convert.ToDouble(dt.Rows[0]["Tax"]);
                  if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["Advance"])))
                cmd.Parameters.Add("@Advance", SqlDbType.Float).Value =Convert.ToDouble(dt.Rows[0]["Advance"]);
                  if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["ExtraDecoration"])))
                cmd.Parameters.Add("@ExtraDecoration", SqlDbType.Float).Value = Convert.ToDouble(dt.Rows[0]["ExtraDecoration"]);
                  if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["ServiceCharge"])))
                cmd.Parameters.Add("@ServiceCharge", SqlDbType.Float).Value = Convert.ToDouble(dt.Rows[0]["ServiceCharge"]);
                  if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["Total"])))
                cmd.Parameters.Add("@Total", SqlDbType.Float).Value = Convert.ToDouble(dt.Rows[0]["Total"]);
                  if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["Others"])))
                cmd.Parameters.Add("@Others", SqlDbType.Float).Value = Convert.ToDouble(dt.Rows[0]["Others"]);

                parmReturnValue = cmd.Parameters.Add("RETURN_VALUE", SqlDbType.Int);
                parmReturnValue.Direction = ParameterDirection.ReturnValue;
                cmd.ExecuteNonQuery();
                result = System.Convert.ToInt32(cmd.Parameters["RETURN_VALUE"].Value);
            }
            return result;
        }

        #region GetUserDetails
        public DataSet GetUserDetailsList(DataTable dt)
        {
            DataSet dsUserdetails = new DataSet();
            using (SqlConnection conSQL = new SqlConnection(GetConnectionString()))
            {
              
                conSQL.Open();
                SqlCommand cmd = new SqlCommand(UserDetailsList, conSQL);
                SqlDataAdapter daUserData = new SqlDataAdapter();
                cmd.CommandType = CommandType.StoredProcedure;


                if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["FirstName"])))
                {

                    cmd.Parameters.Add("@FirstName", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["FirstName"]);
                }
                if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["LastName"])))
                {
                    cmd.Parameters.Add("@LastName", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["LastName"]);                 

                }
                if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["RegistrationDate"])))
                {
                    cmd.Parameters.Add("@RegistrationDate", SqlDbType.Date).Value = Convert.ToDateTime(dt.Rows[0]["RegistrationDate"]);
                }
                if (!string.IsNullOrEmpty(Convert.ToString(dt.Rows[0]["Mobile"])))
                {
                    cmd.Parameters.Add("@Mobile", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["Mobile"]);

                }
               

                daUserData.SelectCommand = cmd;
                daUserData.Fill(dsUserdetails);

            }
            return dsUserdetails;
        }
        #endregion

        public int UpdateUserStatusDetails(DataTable dt)
        {
            int result = 0;
            using (SqlConnection conSQL = new SqlConnection(GetConnectionString()))
            {
                SqlParameter parmReturnValue;
                conSQL.Open();
                SqlCommand cmd = new SqlCommand(UserProfileUpdate, conSQL);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@UserGuid", SqlDbType.UniqueIdentifier).Value = Guid.Parse(Convert.ToString(dt.Rows[0]["UserGUID"]));
                cmd.Parameters.Add("@Status",SqlDbType.NVarChar).Value=Convert.ToString(dt.Rows[0]["Status"]);
               
                parmReturnValue = cmd.Parameters.Add("RETURN_VALUE", SqlDbType.Int);
                parmReturnValue.Direction = ParameterDirection.ReturnValue;
                cmd.ExecuteNonQuery();
                result = System.Convert.ToInt32(cmd.Parameters["RETURN_VALUE"].Value);
            }
            return result;
        }

        public DataSet GetBookingDatas(Guid BookingGuid)
        {
            DataSet dss = new DataSet();
            using (SqlConnection conSQL = new SqlConnection(GetConnectionString()))
            {
                conSQL.Open();
                SqlCommand cmd = new SqlCommand(GetMarriageData, conSQL);
                cmd.CommandType = CommandType.StoredProcedure;

                cmd.Parameters.Add("@BookingGuid", SqlDbType.UniqueIdentifier).Value = BookingGuid;
                SqlDataAdapter daa = new SqlDataAdapter();
                daa.SelectCommand = cmd;
                daa.Fill(dss);
                return dss;
            }
        }
        public int Signature(DataTable dt)
        {
            int result = 0;
            using (SqlConnection conSQL = new SqlConnection(GetConnectionString()))
            {
                SqlParameter parmReturnValue;
                conSQL.Open();
                SqlCommand cmd = new SqlCommand(SignatureUpload, conSQL);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@BookingGuid", SqlDbType.UniqueIdentifier).Value = Guid.Parse(Convert.ToString(dt.Rows[0]["BookingGuid"]));
                cmd.Parameters.Add("@BRSign", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["BrideSign"]);// Convert.ToString(dt.Rows[0]["BrideSign"]);
                  cmd.Parameters.Add("@BGRSign", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["BridegmSign"]);
                   cmd.Parameters.Add("@BRWitSign", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["BrideWitSign"]);
                   cmd.Parameters.Add("@BGRWitSign", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["BridegmWitSign"]);
                 cmd.Parameters.Add("@BRName", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["BrideName"]);
                 cmd.Parameters.Add("@BGRName", SqlDbType.NVarChar).Value = Convert.ToString(dt.Rows[0]["BridegmName"]);
                parmReturnValue = cmd.Parameters.Add("RETURN_VALUE", SqlDbType.Int);
                parmReturnValue.Direction = ParameterDirection.ReturnValue;
                cmd.ExecuteNonQuery();
                result = System.Convert.ToInt32(cmd.Parameters["RETURN_VALUE"].Value);
            }
            return result;
        }
        public Int32 Freeze(byte IsFreezed, Guid BookingId)
        {
            int result = 0;
            using (SqlConnection conSQL = new SqlConnection(GetConnectionString()))
            {
                SqlParameter parmReturnValue;
                conSQL.Open();
                SqlCommand cmd = new SqlCommand("pFreezed", conSQL);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@BookingGuid", SqlDbType.UniqueIdentifier).Value = Guid.Parse(Convert.ToString(BookingId));
                cmd.Parameters.Add("@IsFreezed", SqlDbType.Bit).Value = IsFreezed;
                parmReturnValue = cmd.Parameters.Add("RETURN_VALUE", SqlDbType.Int);
                parmReturnValue.Direction = ParameterDirection.ReturnValue;
                cmd.ExecuteNonQuery();
                result = System.Convert.ToInt32(cmd.Parameters["RETURN_VALUE"].Value);
            }
            return result;
        }
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
