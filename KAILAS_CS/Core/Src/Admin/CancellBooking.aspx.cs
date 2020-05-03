using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using KAILAS_CS.Core.Entity.DL;
using KAILAS_CS.Core.Entity;
using KAILAS_CS.Core;


namespace KAILAS_CS.Core.Src.Admin
{
    public partial class CancellBooking : System.Web.UI.Page
    {
         CommonFunctions COMMONFUNCTIONS = new CommonFunctions();
        DL_Admin ADMIN = new DL_Admin();
        DL_User USER = new DL_User();
         protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Guid.Empty != SavedSession.UserGuid)
                {
                    if (!IsPostBack)
                    {
                        BindEventTypes();
                    }
                }
                else
                    Response.Redirect("/Core/Src/Public/Login.aspx", false);

            }

          
        }

        #region Methods

        protected void BindEventTypes()
        {
            try
            {
                DataSet DS = new DataSet();
                DS = ADMIN.GetEventTypes();
                if (DS.Tables[0].Rows.Count > 0)
                {
                    ddl_Event.DataValueField = "EventID";
                    ddl_Event.DataTextField = "EventDescription";
                    ddl_Event.DataSource = DS;
                    ddl_Event.DataBind();
                    ddl_Event.Items.Insert(0, new ListItem("Select an Event", "-1"));
                    ddl_Event.SelectedIndex = 0;
                }
                else
                {
                    ddl_Event.DataSource = null;
                    ddl_Event.DataBind();
                    ddl_Event.Items.Insert(0, new ListItem("Select an Event", "-1"));
                    ddl_Event.SelectedIndex = 0;
                }
            }
            catch (Exception ex)
            {
                string s = ex.Message;
            }
        }
#endregion
        public void BindBookingHistory(DataTable dt_Result)
        {
            try
            {
                if (dt_Result.Rows.Count > 0)
                {
                    Panel_BookingHistory.Visible = true;
                    gdHistory.DataSource = dt_Result;
                    gdHistory.DataBind();

                }
                else
                {
                    Panel_BookingHistory.Visible = false;
                    gdHistory.DataSource = null;
                    // gdHistory.DataBind();
                }

            }
            catch (Exception ex)
            {

            }
        }


         public void Show()
        {
            try
            {
                //Locals
                DataTable dt_Result = new DataTable();
                DataSet ds_Result = new DataSet();
                DataTable dtBooking = new DataTable();

                dtBooking.Columns.Add("EVENT_TYPE");
                dtBooking.Columns.Add("EVENT_DATE");
                dtBooking.Columns.Add("BOOKING_DATE");
                dtBooking.Columns.Add("NAME");
                dtBooking.Columns.Add("BRIDE_NAME");
                dtBooking.Columns.Add("BRIDEGROOM_NAME");

                DataRow dr = dtBooking.NewRow();
                dr["EVENT_TYPE"] = ddl_Event.SelectedValue;
                dr["EVENT_DATE"] = txt_EventDate.Text;
                dr["BOOKING_DATE"] = txt_BookingDate.Text;
                dr["NAME"] = txt_Name.Text;
                dr["BRIDE_NAME"] = txt_Bride.Text;
                dr["BRIDEGROOM_NAME"] = txt_BrideGroom.Text;
                dtBooking.Rows.Add(dr);

                ds_Result = ADMIN.GetBookingDetails(dtBooking);
                dt_Result = (ds_Result.Tables[0].Rows.Count > 0) ? ds_Result.Tables[0] : null;
                BindBookingHistory(dt_Result);


            }
            catch (Exception ex)
            {
                string s = ex.Message;
            }
        }

        #region ShowDetails

        #endregion
        public void ClearControls()
        {
            ddl_Event.SelectedValue = "-1";
            txt_BookingDate.Text = "";
            txt_Bride.Text = "";
            txt_BrideGroom.Text = "";
            txt_EventDate.Text = "";
            txt_Name.Text = "";

        }

        protected void gdHistory_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            

            try
            {
                if (e.CommandName == "SelectRequest")
                {
                    DataSet Booking_Data = new DataSet();
                    Guid BookingGUID = Guid.Parse(Convert.ToString(e.CommandArgument.ToString()));
                    ViewState["id"] = BookingGUID;
                    Booking_Data = ADMIN.GetBookingData(BookingGUID);
                    if (Booking_Data.Tables[0].Rows.Count > 0)
                    {
                        BindDatas(Booking_Data);  
                    }
                }

            }
            catch (Exception Ex)
            {
                String str = Ex.Message;
            }


        }

      
        public void BindDatas(DataSet Dt)
        {
            DIV_BookingDetails.Visible = true;
            
            txt_EventDate2.Text = Convert.ToString(Dt.Tables[0].Rows[0]["EventDate"]);
            txt_BookingDate.Text = Convert.ToString(Dt.Tables[0].Rows[0]["BookingDate"]);
            txt_FullName.Text = Convert.ToString(Dt.Tables[0].Rows[0]["Name"]);
           

        }
      

        protected void btn_Cancel_Click(object sender, EventArgs e)
        {
            ClearControls();
        }

        protected void btn_Ok_Click(object sender, EventArgs e)
        {
            DataTable dtBookingDetailsUpdate = new DataTable();
            dtBookingDetailsUpdate.Columns.Add("BookingGuid");
            dtBookingDetailsUpdate.Columns.Add("Status");

            DataRow dr = dtBookingDetailsUpdate.NewRow();
            dr["BookingGuid"] = ViewState["id"];
            dr["Status"] = ddl_Status.SelectedValue;
            dtBookingDetailsUpdate.Rows.Add(dr);
            Int64 i = ADMIN.UpdateUserBookingStatus(dtBookingDetailsUpdate);
           
            if (i > 0)
            {

                string name = txt_FullName.Text;

                string st = name + " Cancelled Booking on " +txt_EventDate2.Text;
                COMMONFUNCTIONS.ScriptMsgForAjax(st, Page);
                //DataSet UserBooking_Data = new DataSet();
              //  UserBooking_Data = ADMIN.GetUserProfile((Guid)ViewState["id"]);
                //UserBooking_Data = ADMIN.GetBookingData((Guid)ViewState["id"]);
                //if (UserBooking_Data.Tables[0].Rows.Count > 0)
                //{
                //    if (Convert.ToString(UserBooking_Data.Tables[0].Rows[0]["BookingStatus"]) == "Cancel")
                //        COMMONFUNCTIONS.ScriptMsgForAjax(st, Page);
                
                //   // ClearControls();
                //}
            }
        }

        protected void btn_Show_Click(object sender, EventArgs e)
        {
            Show();
        }
    }
}