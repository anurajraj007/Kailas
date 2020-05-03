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


namespace KAILAS_CS.Core.Src.User
{
    public partial class BookingHistory : System.Web.UI.Page
    {
        CommonFunctions COMMONFUNCTIONS = new CommonFunctions();
        DL_Admin ADMIN = new DL_Admin();
        DL_User USER = new DL_User();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Guid.Empty != SavedSession.UserGuid)
            {
                if (!IsPostBack)
                {
                   // LoadPageDefaults();
                    BindEventTypes();
                }
            }
            else
                Response.Redirect("/Core/Src/Public/Login.aspx", true);
            

            //if (!IsPostBack)
            //{
            //    BindEventTypes();
            //}
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
                dtBooking.Columns.Add("UserGuid");

                DataRow dr = dtBooking.NewRow();
                dr["EVENT_TYPE"] = ddl_Event.SelectedValue;
                dr["EVENT_DATE"] = txt_EventDate.Text;
                dr["BOOKING_DATE"] = txt_BookingDate.Text;
                dr["NAME"] = txt_Name.Text;
                dr["BRIDE_NAME"] = txt_Bride.Text;
                dr["BRIDEGROOM_NAME"] = txt_BrideGroom.Text;

                dr["UserGuid"] = Convert.ToString(SavedSession.UserGuid);
                dtBooking.Rows.Add(dr);
                ds_Result = USER.GetBookingDetails(dtBooking);

              //  ds_Result = ADMIN.GetBookingDetails(dtBooking);
                dt_Result = (ds_Result.Tables[0].Rows.Count > 0) ? ds_Result.Tables[0] : null;
                BindBookingHistory(dt_Result);
                ClearControls();
            }
            catch (Exception ex)
            {
                string s = ex.Message;
            }
        }
        #endregion

        protected void btn_Show_Click(object sender, EventArgs e)
        {
            try
            {
                Show();
            }
            catch (Exception ex)
            {

            }
        }


        #region ShowDetails
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
                    gdHistory.DataBind();
                }

            }
            catch (Exception ex)
            {

            }
        }
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
    }
}