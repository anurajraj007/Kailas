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
    public partial class PaymentSection : System.Web.UI.Page
    {
        CommonFunctions COMMONFUNCTIONS = new CommonFunctions();
        DL_Admin ADMIN = new DL_Admin();
        DL_User USER = new DL_User();
        //  Guid BookingGUID = Guid.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Guid.Empty != SavedSession.UserGuid)
                {
                    if (!IsPostBack)
                    {

                        BindEventTypes();
                       
                        DateTime Date = Convert.ToDateTime((Request.QueryString["EventDate"]));
                        if ( Date !=null)
                        {
                            COMMONFUNCTIONS.ScriptMsgForAjax("Please pay Your Bill.......", Page);
                            txt_EventDate.Text = Convert.ToString( Date);
                            Show();

                        }
                       
                       
                    }
                }
                else
                    Response.Redirect("/Core/Src/Public/Login.aspx", false);

            }

            btn_Print.Attributes.Add("onclick", "CallPrint()");
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
             bool isClosed = false;

                try
                {
                    if (e.CommandName == "SelectRequest")
                    {
                        DataSet Booking_Data = new DataSet();
                        Guid BookingGUID = Guid.Parse(Convert.ToString(e.CommandArgument.ToString()));
                        ViewState["id"] = BookingGUID;
                       // Booking_Data = USER.GetBookingDetails(BookingGUID);
                        Booking_Data = ADMIN.GetBookingData(BookingGUID);
                        if (Booking_Data.Tables[0].Rows.Count > 0)
                        {
                            isClosed = Convert.ToBoolean(Booking_Data.Tables[0].Rows[0]["IsClosed"]);
                             if (isClosed)
                             {
                                 DIV_BookingDetails.Visible = false;
                                 Panel_Payments.Visible = true;
                                 BillDetailsBind();
                             }
                             else
                             {
                                 DIV_BookingDetails.Visible = true;
                                 Int64 ID = Convert.ToInt64(Booking_Data.Tables[0].Rows[0]["BookingID"]);  //.Tables[0].Rows[0]["BookingID"]);
                                 BindDetails(ID);
                                 BindDatas(Booking_Data);

                             }

                        }
                    }

                }
                catch (Exception Ex)
                {
                    String str = Ex.Message;
                }

            
        }

        public void BindDetails(Int64 ID)
        {
            DataSet Ds_BillNo = new DataSet();
            Ds_BillNo = ADMIN.GetBill_No(ID);
            // DataSet Ds_BillNo = BOOKING_BAL.Booking_Search(BOOKIN_ID, FDate, TDate, 5);
            if (Ds_BillNo.Tables[0].Rows.Count > 0)
            {
                txt_BillNo.Text = Convert.ToString(Ds_BillNo.Tables[0].Rows[0]["BillNumber"]);
            }
        }
        public void BindDatas(DataSet Dt)
        {
            // Advance,HallRent,Catering,ExtraDecoration,WaterBill,ElectricityBill,ServiceCharge,Tax,Others,Total,
            txt_EventDate2.Text = Convert.ToString(Dt.Tables[0].Rows[0]["EventDate"]);
            txt_Advance.Text = Convert.ToString(Dt.Tables[0].Rows[0]["Advance"]);
            txt_Catering.Text = Convert.ToString(Dt.Tables[0].Rows[0]["Catering"]);
            txt_Cleaning.Text = Convert.ToString(Dt.Tables[0].Rows[0]["Cleaning"]);
            txt_Electricity.Text = Convert.ToString(Dt.Tables[0].Rows[0]["ElectricityBill"]);
            txt_ExtraDecoration.Text = Convert.ToString(Dt.Tables[0].Rows[0]["ExtraDecoration"]);
            txt_Food.Text = Convert.ToString(Dt.Tables[0].Rows[0]["Food"]);
            txt_HallRent.Text = Convert.ToString(Dt.Tables[0].Rows[0]["HallRent"]);
            txt_Others.Text = Convert.ToString(Dt.Tables[0].Rows[0]["Others"]);
            // txt_Payable.Text=Convert.ToString(Dt.Tables[0].Rows[0]["Catering"]);
            txt_Service.Text = Convert.ToString(Dt.Tables[0].Rows[0]["ServiceCharge"]);
            txt_Tax.Text = Convert.ToString(Dt.Tables[0].Rows[0]["Tax"]);
            txt_Total.Text = Convert.ToString(Dt.Tables[0].Rows[0]["Total"]);
            txt_Water.Text = Convert.ToString(Dt.Tables[0].Rows[0]["WaterBill"]);

        }
        public void Total()
        {
            // Locals
            float a = 0, b = 0, c = 0, d = 0, e = 0, f = 0, g = 0, h = 0, i = 0, j = 0, total = 0;

            if (!string.IsNullOrEmpty(txt_HallRent.Text))
                a = float.Parse(txt_HallRent.Text);
            if (!string.IsNullOrEmpty(txt_Food.Text))
                b = float.Parse(txt_Food.Text);
            if (!string.IsNullOrEmpty(txt_ExtraDecoration.Text))
                c = float.Parse(txt_ExtraDecoration.Text);
            if (!string.IsNullOrEmpty(txt_Service.Text))
                d = float.Parse(txt_Service.Text);
            if (!string.IsNullOrEmpty(txt_Tax.Text))
                e = float.Parse(txt_Tax.Text);
            if (!string.IsNullOrEmpty(txt_Water.Text))
                f = float.Parse(txt_Water.Text);
            if (!string.IsNullOrEmpty(txt_Others.Text))
                g = float.Parse(txt_Others.Text);
            if (!string.IsNullOrEmpty(txt_Electricity.Text))
                h = float.Parse(txt_Electricity.Text);
            if (!string.IsNullOrEmpty(txt_Cleaning.Text))
                i = float.Parse(txt_Cleaning.Text);
            if (!string.IsNullOrEmpty(txt_Catering.Text))
                j = float.Parse(txt_Catering.Text);

            float Advance = float.Parse(txt_Advance.Text);
            total = (a) + b + c + d + e + f + g + h + i + j;
            float balance = total - Advance;
            txt_Payable.Text = (balance > 0) ? Convert.ToString(balance) : "0";
            txt_Total.Text = Convert.ToString(total);
        }

        public void Save()
        {
            try
            {

                DataTable dtBill = new DataTable();
                dtBill.Columns.Add("BillNo");
                dtBill.Columns.Add("HallRent");
                dtBill.Columns.Add("Food");
                dtBill.Columns.Add("Cleaning");
                dtBill.Columns.Add("Water");
                dtBill.Columns.Add("Electricity");
                dtBill.Columns.Add("Tax");
                dtBill.Columns.Add("Advance");

                dtBill.Columns.Add("ExtraDecoration");
                dtBill.Columns.Add("ServiceCharge");
                dtBill.Columns.Add("Others");
                dtBill.Columns.Add("Catering");
                dtBill.Columns.Add("Total");
                dtBill.Columns.Add("BookingGUID");


                DataRow dr = dtBill.NewRow();
                Guid G = (Guid)(ViewState["id"]);
                dr["BillNo"] = txt_BillNo.Text;
                dr["HallRent"] = txt_HallRent.Text;
                dr["Food"] = txt_Food.Text;
                dr["Cleaning"] = txt_Cleaning.Text;
                dr["Catering"] = txt_Catering.Text;
                dr["Water"] = txt_Water.Text;
                dr["Electricity"] = txt_Electricity.Text;
                dr["Tax"] = txt_Tax.Text;
                dr["Advance"] = txt_Advance.Text;
                dr["ExtraDecoration"] = txt_ExtraDecoration.Text;
                dr["ServiceCharge"] = txt_Service.Text;
                dr["Others"] = txt_Others.Text;
                dr["Total"] = txt_Total.Text;
                dr["BookingGUID"] = G;
                dtBill.Rows.Add(dr);
                int i = ADMIN.UpdateBillDetails(dtBill);
                if (i > 0)
                {
                  // COMMONFUNCTIONS.ScriptMsgForAjax(" .......", Page);
                    //int Value=ADMIN.PaymentClosed(1,G);
                    //if(Value>0)
                    //BillDetailsBind();
                     ClearControls();
                }

            }
            catch (Exception ex)
            {

            }
        }

        
        private int IsClosed()
        {
            //Locals
            int isClosed = 0;
             Guid G = (Guid)(ViewState["id"]);
            if (!string.IsNullOrEmpty((Convert.ToString(ViewState["id"]))))
                isClosed = ADMIN.PaymentClosed(1,G);
            return isClosed;
        }

        protected void txt_Food_TextChanged(object sender, EventArgs e)
        {
            try
            {

                Total();
            }
            catch (Exception ex)
            {
            }
        }

        protected void btn_Save_Click(object sender, EventArgs e)
        {
            Save();
        }

        protected void txt_HallRent_TextChanged(object sender, EventArgs e)
        {
            try
            {

                Total();
            }
            catch (Exception ex)
            {
            }
        }

        protected void txt_Cleaning_TextChanged(object sender, EventArgs e)
        {
            try
            {

                Total();
            }
            catch (Exception ex)
            {
            }
        }

        protected void txt_Water_TextChanged(object sender, EventArgs e)
        {
            try
            {

                Total();
            }
            catch (Exception ex)
            {
            }
        }

        protected void txt_Tax_TextChanged(object sender, EventArgs e)
        {
            try
            {

                Total();
            }
            catch (Exception ex)
            {
            }
        }

        protected void txt_Catering_TextChanged(object sender, EventArgs e)
        {
            try
            {

                Total();
            }
            catch (Exception ex)
            {
            }
        }

        protected void txt_ExtraDecoration_TextChanged(object sender, EventArgs e)
        {
            try
            {

                Total();
            }
            catch (Exception ex)
            {
            }
        }

        protected void txt_Service_TextChanged(object sender, EventArgs e)
        {
            try
            {

                Total();
            }
            catch (Exception ex)
            {
            }
        }

        protected void txt_Electricity_TextChanged(object sender, EventArgs e)
        {
            try
            {

                Total();
            }
            catch (Exception ex)
            {
            }
        }

        protected void txt_Others_TextChanged(object sender, EventArgs e)
        {
            try
            {

                Total();
            }
            catch (Exception ex)
            {
            }
        }

        protected void txt_Advance_TextChanged(object sender, EventArgs e)
        {
            try
            {
                DataSet BookingData = new DataSet();
                BookingData = ADMIN.GetBookingData((Guid)(ViewState["id"]));
                double old_Advance = Convert.ToDouble(BookingData.Tables[0].Rows[0]["Advance"]);
                float new_Advance = float.Parse(txt_Advance.Text);
                if (new_Advance > old_Advance)
                    txt_Advance.Text = Convert.ToString(new_Advance);
                else
                    txt_Advance.Text = Convert.ToString(old_Advance);
                Total();

            }
            catch (Exception ex)
            {
            }
        }

        protected void btn_Cancel_Click(object sender, EventArgs e)
        {
            ClearControls();
        }

        protected void btn_Print_Click(object sender, EventArgs e)
        {
           // btn_Print.Visible = false;
        }

        public void BillDetailsBind()
        {
            DataSet BillData = new DataSet();
            if (!string.IsNullOrEmpty((Convert.ToString(ViewState["id"]))))
                BillData = ADMIN.GetBookingData((Guid)ViewState["id"]);


            if (BillData.Tables[0].Rows.Count > 0)
            {
                Panel_BookingHistory.Visible = false;
                Panel_Payments.Visible = true;
                Div_Print.Visible = true;
               // DIV_Payment.Visible = true;
                LblRptHead.Text = "KAILAS AUDITORIUM, IRIYANNI";
                LblRptHead2.Text = "IRIYANNI POST, MULIYAR VIA, KASARAGOD DIST.-671542, KERALA";
                LblRpthead1.Text = "Ph : 04994 250300, 252300";
                LblRptHead3.Text = "BILL";
                ImgRpt.ImageUrl = "~/" + Application["defaultLogo"].ToString();
                lbl_Manager.Text = "MANAGER";
                lbl_Place.Text = "Iriyanni";
                lbl_BillNo.Text = Convert.ToString(BillData.Tables[0].Rows[0]["BillNo"]);
                lbl_Catering.Text = Convert.ToString(BillData.Tables[0].Rows[0]["Catering"]);
                lbl_Cleaning.Text = Convert.ToString(BillData.Tables[0].Rows[0]["Cleaning"]);
                lbl_Date.Text = System.DateTime.Now.ToString("dd/MM/yyyy");
                lbl_Electricity.Text = Convert.ToString(BillData.Tables[0].Rows[0]["ElectricityBill"]);
                lbl_ExtraDecoration.Text = Convert.ToString(BillData.Tables[0].Rows[0]["ExtraDecoration"]);
                lbl_Food.Text = Convert.ToString(BillData.Tables[0].Rows[0]["Food"]);
                lbl_FunctionDate.Text = Convert.ToString(BillData.Tables[0].Rows[0]["EventDate"]);
                lbl_HallandDecoration.Text = Convert.ToString(BillData.Tables[0].Rows[0]["HallRent"]);
                lbl_Others.Text = Convert.ToString(BillData.Tables[0].Rows[0]["Others"]);
                lbl_Service.Text = Convert.ToString(BillData.Tables[0].Rows[0]["ServiceCharge"]);
                lbl_Tax.Text = Convert.ToString(BillData.Tables[0].Rows[0]["Tax"]);
                lbl_Total.Text = Convert.ToString(BillData.Tables[0].Rows[0]["Total"]);
                lbl_Water.Text = Convert.ToString(BillData.Tables[0].Rows[0]["WaterBill"]);





                //    Int64 ID = Convert.ToInt64(Booking_Data.Tables[0].Rows[0]["BookingID"]);  //.Tables[0].Rows[0]["BookingID"]);
                //    BindDetails(ID);
                //    BindDatas(Booking_Data);



                //}
            }



        }

        protected void btn_IsClosed_Click(object sender, EventArgs e)
        {
            int Closed = IsClosed();
            if (Closed > 0)
            {
                DIV_BookingDetails.Visible = false;
                Panel_Payments.Visible = true;
                BillDetailsBind();
                COMMONFUNCTIONS.ScriptMsgForAjax("Payment Closed Successfully..........", Page);
            }
        }
    }
}
