using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using KAILAS_CS.Core.Entity;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using KAILAS_CS;
using KAILAS_CS.Core.Entity.DL;
namespace KAILAS_CS.Core.Src.User
{
    public partial class MarriageCertificate : System.Web.UI.Page
    {
        CommonFunctions COMMONFUNCTIONS = new CommonFunctions();
        DL_Admin ADMIN = new DL_Admin();
        DL_User USER = new DL_User();
        DataSet dss = new DataSet();
        string Time = "";
        Guid BookingGuid = Guid.Empty;
        DataSet MarriageDetails = new DataSet();
        private const Int64 eventId = 1; // For getting Marriage Details
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Guid.Empty != SavedSession.UserGuid)
                {
                    if (!IsPostBack)
                    {
                        ViewState["UserGuid"] = SavedSession.UserGuid;
                        LoadPageDefaults();
                       
                        //  string[] filePaths = Directory.GetFiles(Server.MapPath("~/Core/Document/"));

                    }
                }
                else
                    Response.Redirect("/Core/Src/Public/Login.aspx", true);


            }
            btn_Print.Attributes.Add("onclick", "CallPrint()");
        }
        #region Event Calendar
        private void LoadPageDefaults()
        {
            ViewState["ID"] = null;
            ViewState["Booking"] = null;
            txt_EventDate.Text = System.DateTime.Now.ToString("dd/MM/yyyy");
            ECalendar_Function.EventStartDateColumnName = "EventStartDate";
            ECalendar_Function.EventEndDateColumnName = "EventStartDate";
            ECalendar_Function.EventDescriptionColumnName = "EventDescription";
            ECalendar_Function.EventHeaderColumnName = "EventHeader";
            ECalendar_Function.EventBackColorName = "EventBackColor";
            ECalendar_Function.EventForeColorName = "EventForeColor";
            ECalendar_Function.EventSource = GetEvents();
            LblRptHead.Text = "KAILAS AUDITORIUM, IRIYANNI";
            LblRptHead2.Text = "IRIYANNI POST, MULIYAR VIA, KASARAGOD DIST.-671542, KERALA";
            LblRpthead1.Text = "Ph : 04994 250300, 252300";
            LblRptHead3.Text = "MARRIAGE CERTIFICATE";
            ImgRpt.ImageUrl = "~/" + Application["defaultLogo"].ToString();
            lbl_Manager.Text = "MANAGER";
            lbl_Place.Text = "Iriyanni";
        }
        protected DataTable GetEvents()
        {
            DataSet DS = new DataSet();
            DataTable dt = new DataTable();
           // DS = ADMIN.GetEventsList(eventId);
            DS = USER.GetEventsList((Guid) ViewState["UserGuid"],eventId);
            if (DS.Tables[0].Rows.Count > 0)
            {
                dt = DS.Tables[0];
                ViewState["EventStartDate"] = DS.Tables[0];
            }
            else
                ViewState["EventStartDate"] = null;

            return dt;
        }

        protected void ECalendar_Function_SelectionChanged(object sender, EventArgs e)
        {
            //Locals
            bool isFreezed = false;

            SelectedDatesCollection theDates = ECalendar_Function.SelectedDates;
            DataTable dtSelectedDateEvents = ECalendar_Function.EventSource;
            txt_EventDate.Text = ECalendar_Function.SelectedDate.ToString("dd/MM/yyyy");
            DateTime FDate = Convert.ToDateTime(txt_EventDate.Text);

            MarriageDetails = ADMIN.Get_MarriageDetails(Convert.ToString(FDate));
            ViewState["Eventdate"] = FDate;
            if (MarriageDetails.Tables[0].Rows.Count > 0)
            {
                isFreezed = Convert.ToBoolean(MarriageDetails.Tables[0].Rows[0]["IsFreezed"]);
                if (isFreezed)
                    BindDetails(MarriageDetails);
                else
                    BindMarriageDetails();
            }

            else
                COMMONFUNCTIONS.ScriptMsgForAjax("Please Select a Valid Date ", this);
        }

        protected void ECalendar_Function_DayRender(object sender, DayRenderEventArgs e)
        {

            if (e.Day.Date <= DateTime.Today)
            {
                e.Day.IsSelectable = false;
                if (e.Day.Date < DateTime.Today)
                {
                    e.Cell.BackColor = System.Drawing.Color.Wheat;
                }
            }
            if (e.Day.Date.DayOfWeek == DayOfWeek.Sunday)
            {
                e.Cell.ForeColor = System.Drawing.Color.Red;
            }
            e.Day.IsSelectable = false;
            if (ViewState["EventStartDate"] != null)
            {
                DataTable dt_Date = (DataTable)ViewState["EventStartDate"];
                for (int i = 0; i < dt_Date.Rows.Count; i++)
                {
                    DateTime FunctionDate = Convert.ToDateTime(dt_Date.Rows[i]["EventStartDate"]);
                    if (e.Day.Date.Equals(FunctionDate.Date))
                    {
                        e.Day.IsSelectable = true;
                        e.Cell.BackColor = System.Drawing.Color.Orange;
                        e.Cell.ForeColor = System.Drawing.Color.Green;
                    }
                }
            }
        }
        #endregion

        public void BindDetails(Int64 ID)
        {
            DataSet Ds_BillNo = ADMIN.GetBill_No(ID);
            if (Ds_BillNo.Tables[0].Rows.Count > 0)
            {
                txt_BillNo.Text = Convert.ToString(Ds_BillNo.Tables[0].Rows[0]["BillNumber"]);
            }
        }
        public void Save()
        {
            try
            {

                DataSet MarriageBookingDetails = new DataSet();
                MarriageBookingDetails = ADMIN.Get_MarriageDetails(txt_EventDate.Text);
                Guid BookingGuid = (Guid)(MarriageBookingDetails.Tables[0].Rows[0]["BookingGuid"]);
                ViewState["BookingGuid"] = BookingGuid;


                Int64 ID = Convert.ToInt64(MarriageBookingDetails.Tables[0].Rows[0]["BookingID"]);


                DataTable dtMarriage = new DataTable();

                dtMarriage.Columns.Add("BookingGuid");
                dtMarriage.Columns.Add("TIME");
                dtMarriage.Columns.Add("MERIDIEM");
                dtMarriage.Columns.Add("B_NAME");
                dtMarriage.Columns.Add("B_PARENT");
                dtMarriage.Columns.Add("B_DOB");
                dtMarriage.Columns.Add("B_CASTE");
                dtMarriage.Columns.Add("B_RELIGION");
                dtMarriage.Columns.Add("B_OCCUPATION");
                dtMarriage.Columns.Add("B_MOTHER");
                dtMarriage.Columns.Add("B_AGE");
                dtMarriage.Columns.Add("B_ADDRESS1");
                dtMarriage.Columns.Add("B_ADDRESS2");
                dtMarriage.Columns.Add("B_CITY");
                dtMarriage.Columns.Add("B_STATE");
                dtMarriage.Columns.Add("B_COUNTRY");
                dtMarriage.Columns.Add("B_DISTRICT");
                dtMarriage.Columns.Add("B_PIN");
                dtMarriage.Columns.Add("B_MOBILE");
                dtMarriage.Columns.Add("B_EMAIL");
                dtMarriage.Columns.Add("B_PERSON");
                dtMarriage.Columns.Add("B_RELATION");
                dtMarriage.Columns.Add("B_WITNESS");

                dtMarriage.Columns.Add("G_NAME");
                dtMarriage.Columns.Add("G_PARENT");
                dtMarriage.Columns.Add("G_DOB");
                dtMarriage.Columns.Add("G_CASTE");
                dtMarriage.Columns.Add("G_RELIGION");
                dtMarriage.Columns.Add("G_OCCUPATION");
                dtMarriage.Columns.Add("G_MOTHER");
                dtMarriage.Columns.Add("G_AGE");
                dtMarriage.Columns.Add("G_ADDRESS1");
                dtMarriage.Columns.Add("G_ADDRESS2");
                dtMarriage.Columns.Add("G_CITY");
                dtMarriage.Columns.Add("G_STATE");
                dtMarriage.Columns.Add("G_COUNTRY");
                dtMarriage.Columns.Add("G_DISTRICT");
                dtMarriage.Columns.Add("G_PIN");
                dtMarriage.Columns.Add("G_MOBILE");
                dtMarriage.Columns.Add("G_EMAIL");
                dtMarriage.Columns.Add("G_PERSON");
                dtMarriage.Columns.Add("G_RELATION");
                dtMarriage.Columns.Add("G_WITNESS");
                dtMarriage.Columns.Add("BillNo");
                dtMarriage.Columns.Add("EventDate");

                DataRow dr1 = dtMarriage.NewRow();
                dr1["BookingGuid"] = BookingGuid;
                dr1["TIME"] = float.Parse(txt_time.Text);
                dr1["MERIDIEM"] = ddl_Time.SelectedValue;
                dr1["B_NAME"] = txt_BrideName.Text;
                dr1["B_PARENT"] = txt_BrideFather.Text;
                dr1["B_DOB"] = txt_BrideBirthDate.Text;
                dr1["B_CASTE"] = txt_BCaste.Text;
                dr1["B_RELIGION"] = txt_BReligion.Text;
                dr1["B_OCCUPATION"] = txt_BOccupation.Text;
                dr1["B_MOTHER"] = txt_BMother.Text;

                dr1["B_AGE"] = txt_BAge.Text;
                dr1["B_ADDRESS1"] = txt_BAddress1.Text;
                dr1["B_ADDRESS2"] = txt_BAddress2.Text;
                dr1["B_CITY"] = txt_BCity.Text;
                dr1["B_DISTRICT"] = txt_BDistrict.Text;
                dr1["B_STATE"] = txt_BState.Text;
                dr1["B_COUNTRY"] = txt_BCountry.Text;
                dr1["B_PIN"] = txt_BPin.Text;
                dr1["B_MOBILE"] = txt_BMobile.Text;
                dr1["B_EMAIL"] = txt_Email.Text;
                dr1["B_PERSON"] = txt_BPerson.Text;
                dr1["B_RELATION"] = txt_BRelation.Text;
                dr1["B_WITNESS"] = txt_BWitness.Text;

                dr1["G_NAME"] = txt_BrideGroomName.Text;
                dr1["G_PARENT"] = txt_BridegroomFather.Text;
                dr1["G_DOB"] = txt_BirdeGroomBirthDate.Text;
                dr1["G_CASTE"] = txt_BGCaste.Text;
                dr1["G_RELIGION"] = txt_BGReligion.Text;
                dr1["G_OCCUPATION"] = txt_BGOccupation.Text;
                dr1["G_MOTHER"] = txt_BGMother.Text;
                dr1["G_AGE"] = txt_BGAge.Text;
                dr1["G_ADDRESS1"] = txt_BGHomeAddress.Text;
                dr1["G_ADDRESS2"] = txt_BGPersonaladdress.Text;
                dr1["G_CITY"] = txt_BGCity.Text;
                dr1["G_DISTRICT"] = txt_BGDistrict.Text;
                dr1["G_STATE"] = txt_BGState.Text;
                dr1["G_COUNTRY"] = txt_BGCountry.Text;
                dr1["G_PIN"] = txt_BPin.Text;
                dr1["G_MOBILE"] = txt_BMobile.Text;
                dr1["G_EMAIL"] = txt_Email.Text;
                dr1["G_PERSON"] = txt_BGPerson.Text;
                dr1["G_RELATION"] = txt_BGRelation.Text;
                dr1["G_WITNESS"] = txt_BGWitness.Text;
                dr1["BillNo"] = txt_BillNo.Text;

                dr1["EventDate"] = txt_EventDate.Text;
                dtMarriage.Rows.Add(dr1);
                int i = ADMIN.UpdaetBookingDetails(dtMarriage);
                if (i > 0)
                {
                    DateTime date1 = Convert.ToDateTime(ViewState["Eventdate"]);
                    DataSet MarriageBookingData = new DataSet();
                    MarriageBookingData = ADMIN.Get_MarriageDetails(Convert.ToString(date1));
                    BindDetails(MarriageBookingData);
                }


            }
            catch (Exception ex)
            {
            }
        }
        #region Age
        private static int CalculateAge(DateTime dateOfBirth)
        {
            int age = 0;
            age = DateTime.Now.Year - dateOfBirth.Year;
            if (DateTime.Now.DayOfYear < dateOfBirth.DayOfYear)
                age = age - 1;

            return age;
        }

        #endregion

        public void BindMarriageDetails()
        {
            Panel_Certificate.Visible = false;
            try
            {

                if (MarriageDetails.Tables.Count > 0)
                {
                    DateTime date = Convert.ToDateTime(ViewState["Eventdate"]);
                    Guid BookingGuid = (Guid)(MarriageDetails.Tables[0].Rows[0]["BookingGuid"]);

                    if ((string.IsNullOrEmpty(Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BrideSignature"]))) || (string.IsNullOrEmpty(Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BridegroomSignature"]))))
                    {
                        Response.Redirect("Signature.aspx?BookingGuid=" + BookingGuid);
                    }
                    else
                    {
                        //if (MarriageDetails.Tables[0].Rows[0][" BillStatus"] == null)
                        //{
                        //    COMMONFUNCTIONS.ScriptMsgForAjax("Please pay Your Bill.......", Page);

                            
                        //}
                        //else
                        //{

                            Int64 ID = Convert.ToInt64(MarriageDetails.Tables[0].Rows[0]["BookingID"]);


                            txt_time.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["Time"]);
                            ddl_Time.SelectedValue = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["Meridiem"]);

                            txt_BillNo.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BillNo"]);
                            txt_BrideName.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BrideName"]);
                            txt_BAge.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BrideAge"]);

                            txt_BAddress1.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BrideAddress1"]);
                            txt_BAddress2.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BrideAddress2"]);
                            txt_BCaste.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BrideCaste"]);
                            txt_BCity.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BrideCity"]);
                            txt_BCountry.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BrideCountry"]);
                            txt_BDistrict.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BrideDistrict"]);
                            txt_BEmail.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BrideEmail"]);
                            txt_BMobile.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BrideMobile"]);
                            txt_BOccupation.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BrideOccupation"]);
                            txt_BMother.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BrideMother"]);
                            txt_BPerson.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BridePerson"]);
                            txt_BPin.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BridePin"]);
                            txt_BRelation.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BridePRelation"]);
                            txt_BReligion.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BrideReligion"]);
                            txt_BrideBirthDate.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BirthDate"]);
                            txt_BrideFather.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BrideFather"]);
                            txt_BState.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BrideState"]);
                            txt_BWitness.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BrideWitness"]);

                            // txt_BEmail.Text=Convert.ToString((MarriageDetails.Tables[0].Rows[0]["BrideCity"]);



                            txt_BrideGroomName.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BridegroomName"]);
                            txt_BGAge.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BridegroomAge"]);
                            txt_BGCaste.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BridegroomCaste"]);
                            txt_BGHomeAddress.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BridegroomAddress1"]);
                            txt_BGPersonaladdress.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BridegroomAddress2"]);
                            // txt_BGCaste.Text=Convert.ToString((MarriageDetails.Tables[0].Rows[0]["BrideCaste"]);
                            txt_BGCity.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BridegroomCity"]);
                            txt_BGCountry.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BridegroomCountry"]);
                            txt_BGDistrict.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BridegroomDistrict"]);
                            txt_Email.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BridegroomEmail"]);
                            txt_BGMobile.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BridegroomMobile"]);
                            txt_BGOccupation.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BridegroomOccupation"]);
                            txt_BGMother.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BridegroomMother"]);
                            txt_BGPerson.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BridegroomPerson"]);
                            txt_BGPin.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BridegroomPin"]);
                            txt_BGRelation.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BridegroomRelation"]);
                            txt_BGReligion.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BridegroomReligion"]);
                            txt_BirdeGroomBirthDate.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BridegroomBirthDate"]);
                            txt_BridegroomFather.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BridegroomFather"]);
                            txt_BGState.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BridegroomState"]);
                            txt_BGWitness.Text = Convert.ToString(MarriageDetails.Tables[0].Rows[0]["BridegroomWitness"]);

                            DIV_MarriageDetails.Visible = true;
                       // }
                    }
                }

            }
            catch (Exception ex)
            {

                String s = ex.Message;
            }
        }



        public void BindDetails(DataSet Dt)
        {
            Panel_Certificate.Visible = true;
            Guid BookingGuid = (Guid)(Dt.Tables[0].Rows[0]["BookingGuid"]);
            string BrideWitnessName = Convert.ToString(Dt.Tables[0].Rows[0]["BrideWitness"]);
            string BridegroomWitnessSign = Convert.ToString(Dt.Tables[0].Rows[0]["BridegroomWitness"]);
            string BrideName = Convert.ToString(Dt.Tables[0].Rows[0]["BrideName"]);
            string BridegroomName = Convert.ToString(Dt.Tables[0].Rows[0]["BridegroomName"]);
            DateTime date = Convert.ToDateTime(ViewState["Eventdate"]);
            Time = Convert.ToString(txt_time.Text + ' ' + ddl_Time.SelectedValue);

            lbl_BillNo.Text = Convert.ToString(Dt.Tables[0].Rows[0]["BillNo"]);

            lbl_MarriageTime.Text = Convert.ToString(Time);
            lbl_BillDate.Text = System.DateTime.Now.ToString("dd/MM/yyyy");
            lbl_MarriageDate.Text = Convert.ToString(date);
            lbl_BrideAddr1.Text = Convert.ToString(Dt.Tables[0].Rows[0]["BrideAddress1"]);
            lbl_BrideAddr2.Text = Convert.ToString(Dt.Tables[0].Rows[0]["BrideAddress2"]);
            //  lbl_BrideAge.Text = Convert.ToString(Dt.Tables[0].Rows[0]["BrideAge"]);
            lbl_BrideDOB.Text = Convert.ToString(Dt.Tables[0].Rows[0]["BirthDate"]);
            lbl_BrideCaste.Text = Convert.ToString(Dt.Tables[0].Rows[0]["BrideCaste"]);
            lbl_BrideFather.Text = Convert.ToString(Dt.Tables[0].Rows[0]["BrideFather"]);
            lbl_BrideMother.Text = Convert.ToString(Dt.Tables[0].Rows[0]["BrideMother"]);
            lbl_BrideName.Text = Convert.ToString(Dt.Tables[0].Rows[0]["BrideName"]);
            lbl_BrideOccupation.Text = Convert.ToString(Dt.Tables[0].Rows[0]["BrideOccupation"]);
            lbl_BridePerson.Text = Convert.ToString(Dt.Tables[0].Rows[0]["BridePerson"]);
            lbl_BrideRelation.Text = Convert.ToString(Dt.Tables[0].Rows[0]["BridePRelation"]);
            lbl_BrideReligion.Text = Convert.ToString(Dt.Tables[0].Rows[0]["BrideReligion"]);

            lbl_BrideWitness1.Text = Convert.ToString(Dt.Tables[0].Rows[0]["BrideWitness"]);

            img_BrideSign.ImageUrl = "~/Core/Document/BridewitnessSign/" + BookingGuid + BrideWitnessName + ".jpg";
            img_BrWitSign.ImageUrl = ("~/Core/Document/BridewitnessSign/") + BookingGuid + BrideWitnessName + ".jpg";


            lbl_BridegoomFather.Text = Convert.ToString(Dt.Tables[0].Rows[0]["BridegroomFather"]);
            lbl_BridegroomAddr1.Text = Convert.ToString(Dt.Tables[0].Rows[0]["BridegroomAddress1"]);
            lbl_BridegroomAddr2.Text = Convert.ToString(Dt.Tables[0].Rows[0]["BridegroomAddress2"]);
            // lbl_BridegroomAge.Text = Convert.ToString(Dt.Tables[0].Rows[0]["BridegroomAge"]);
            lbl_BridegroomCaste.Text = Convert.ToString(Dt.Tables[0].Rows[0]["BridegroomState"]);
            lbl_BridegroomDOB.Text = Convert.ToString(Dt.Tables[0].Rows[0]["BridegroomBirthDate"]);

            lbl_BridegroomMother.Text = Convert.ToString(Dt.Tables[0].Rows[0]["BridegroomMother"]);
            lbl_BridegroomName.Text = Convert.ToString(Dt.Tables[0].Rows[0]["BridegroomName"]);
            lbl_BridegroomOccup.Text = Convert.ToString(Dt.Tables[0].Rows[0]["BridegroomOccupation"]);
            lbl_BridegroomPerson.Text = Convert.ToString(Dt.Tables[0].Rows[0]["BridegroomPerson"]);
            lbl_BridegroomRelation.Text = Convert.ToString(Dt.Tables[0].Rows[0]["BridegroomRelation"]);
            lbl_BridegroomReligion.Text = Convert.ToString(Dt.Tables[0].Rows[0]["BridegroomReligion"]);

            lbl_BridegroomWitness1.Text = Convert.ToString(Dt.Tables[0].Rows[0]["BridegroomWitness"]);
            string path = Convert.ToString(Dt.Tables[0].Rows[0]["BridegroomSignature"]);

            img_Brgsign.ImageUrl = ("~/Core/Document/BridegmWitnessSign/") + BookingGuid + BridegroomWitnessSign + ".jpg";// fileName)
            img_BrgWitsign.ImageUrl = ("~/Core/Document/BridewitnessSign/") + BookingGuid + BridegroomWitnessSign + ".jpg";

        }

        protected void btn_Print_Click(object sender, EventArgs e)
        {


        }

        protected void btn_Save_Click(object sender, EventArgs e)
        {
            try
            {
                Save();
                DIV_MarriageDetails.Visible = false;
                COMMONFUNCTIONS.ScriptMsgForAjax("Successfully Updated.......",Page);

            }
            catch (Exception ex)
            {

            }

        }
        protected void ClearControls()
        {

        }

       
    }
}