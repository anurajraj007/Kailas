using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using KAILAS_CS.Core.Entity.DL;
using System.Net.Mail;
using System.Security;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Text;
using System.Text.RegularExpressions;
using System.IO;
using KAILAS_CS;
using KAILAS_CS.Core.Entity;


namespace KAILAS_CS.Core.Src.Admin
{
    public partial class Booking : System.Web.UI.Page
    {
        CommonFunctions COMMONFUNCTIONS = new CommonFunctions();
        DL_Admin ADMIN = new DL_Admin();

        protected void Page_Load(object sender, EventArgs e)
        {
           // Int32 RowID = Convert.ToInt32(Session["RowID"]);
            if (!IsPostBack)
            {
                if (Guid.Empty != SavedSession.UserGuid)
                {
                    if (!IsPostBack)
                    {
                        LoadPageDefaults();
                    }
                }
                else
                    Response.Redirect("/Core/Src/Public/Login.aspx", true);
            
               
            }
        }

        protected void ddl_Event_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddl_Event.SelectedValue == "1")
                DIV_MarriageDetails.Visible = true;
            else
                DIV_MarriageDetails.Visible = false;
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
                    ddl_Event.Items.Insert(0,new ListItem("Select","-1"));
                    ddl_Event.SelectedIndex = 0;
                }
                else
                {
                    ddl_Event.DataSource = null;
                    ddl_Event.DataBind();
                    ddl_Event.Items.Insert(0, new ListItem("Select", "-1"));
                    ddl_Event.SelectedIndex = 0;
                }
            }
            catch (Exception ex)
            {
                string s = ex.Message;
            }
        }

        private void Save()
        {
            //Locals
            String Recipient = String.Empty;
            String ReceiverMailID = string.Empty;

            try
            {

                DataTable dtBooking = new DataTable();
              //  dtBooking.Columns.Add("RowID");
                dtBooking.Columns.Add("EVENT_TYPE");
                dtBooking.Columns.Add("DATE");
                dtBooking.Columns.Add("SESSION_TYPE");
                dtBooking.Columns.Add("FACILITIES");
                dtBooking.Columns.Add("NO_OF_GUESTS");
                dtBooking.Columns.Add("DESCRIPTION");
                dtBooking.Columns.Add("FIRSTNAME");
                dtBooking.Columns.Add("LASTNAME");
                dtBooking.Columns.Add("MOBILE");
                dtBooking.Columns.Add("EMAIL");
                dtBooking.Columns.Add("ADVANCE");
                 
                DataRow dr = dtBooking.NewRow();

               // dr["RowID"] = Convert.ToInt64(Session["RowID"]);
                dr["EVENT_TYPE"] = ddl_Event.SelectedValue;
                dr["DATE"] = txt_EventDate.Text;
                dr["SESSION_TYPE"] = ddl_Session.SelectedValue;
                dr["FACILITIES"] = ddl_Facility.SelectedValue;
                dr["NO_OF_GUESTS"] = txt_GuestCount.Text;
                dr["DESCRIPTION"] = txt_Description.Text;
                dr["FIRSTNAME"] = txt_FirstName.Text;
                dr["LASTNAME"] = txt_LastName.Text;
                dr["MOBILE"] = txt_Mobile.Text;
                dr["EMAIL"] = txt_Email.Text;
                dr["ADVANCE"] = float.Parse(txt_Advance.Text);
              
                dtBooking.Rows.Add(dr);

                DataTable dtMarriage = new DataTable();
                if (ddl_Event.SelectedValue =="1")
                {
                    int brideAge = CalculateAge(Convert.ToDateTime( txt_BrideBirthDate.Text));
                    int BridegroomAge = CalculateAge(Convert.ToDateTime( txt_BirdeGroomBirthDate.Text));
                    dtMarriage.Columns.Add("G_NAME");
                    dtMarriage.Columns.Add("G_FATHER");
                    dtMarriage.Columns.Add("G_DOB");
                    dtMarriage.Columns.Add("B_NAME");
                    dtMarriage.Columns.Add("B_FATHER");
                    dtMarriage.Columns.Add("B_DOB");
                    dtMarriage.Columns.Add("B_AGE");
                    dtMarriage.Columns.Add("G_AGE");

                    DataRow dr1 = dtMarriage.NewRow();

                    dr1["B_NAME"] = txt_BrideName.Text;
                    dr1["B_FATHER"] = txt_BrideFather.Text;
                    dr1["B_DOB"] = txt_BrideBirthDate.Text;
                    dr1["G_NAME"] = txt_BrideGroomName.Text;
                    dr1["G_FATHER"] = txt_BridegroomFather.Text;
                    dr1["G_DOB"] = txt_BirdeGroomBirthDate.Text;
                    dr1["B_Age"] = brideAge;
                    dr1["G_AGE"] = BridegroomAge;
                    dtMarriage.Rows.Add(dr1);
                }

                    bool Flag = false;
                    Flag = CheckFields();
                    if (Flag)
                    {
                      int i = ADMIN.bookingdetails(dtBooking, dtMarriage);
                      if (i > 0)
                      {
                          ReceiverMailID = txt_Email.Text;
                          Recipient = txt_FirstName.Text + txt_LastName.Text;
                          SendMail(Recipient,ReceiverMailID);
                          COMMONFUNCTIONS.ScriptMsgForAjax(" Successessful Booking .......",Page);
                          ClearControls();
                          Clear_Div();
                          LoadPageDefaults();
                      }
                      else if (i == -1)
                       {
                            COMMONFUNCTIONS.ScriptMsgForAjax("Already Booked, Please Select another Date", Page);
                       }
                       else if (i == -2)
                        {
                            COMMONFUNCTIONS.ScriptMsgForAjax("Booking Date Should be greater than Today, Please Select another Date", Page);
                        }
                    }

                }

            
            catch (Exception e)
            {

            }
        }
        
        #endregion

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
            BindEventTypes();
        }
        protected DataTable GetEvents()
        {
            DataSet DS=new DataSet();
            DataTable dt = new DataTable();
            DS = ADMIN.GetEventsList();
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
            SelectedDatesCollection theDates = ECalendar_Function.SelectedDates;
            DataTable dtSelectedDateEvents = ECalendar_Function.EventSource;
        
            txt_EventDate.Text = ECalendar_Function.SelectedDate.ToString("dd/MM/yyyy");
            DateTime FDate = Convert.ToDateTime(txt_EventDate.Text);
            if (FDate > System.DateTime.Now)
            {
                if (ViewState["EventStartDate"] != null)
                {
                    DataTable dt_Date = (DataTable)ViewState["EventStartDate"];
                    for (int i = 0; i < dt_Date.Rows.Count; i++)
                    {
                        int flag = 0;
                        foreach (DataRow row in dt_Date.Rows)
                        {
                            DateTime FunctionDate = Convert.ToDateTime(row["EventStartDate"].ToString());
                            if (FunctionDate.Date.Equals(ECalendar_Function.SelectedDate))
                            {
                                flag = 1;
                                break;
                            }
                        }

                        if (flag == 1)
                        {
                            //DIV_Main.Visible = false;
                            //DIV_Calendar.Visible = true;
                            COMMONFUNCTIONS.ScriptMsgForAjax("Already Booked,Please Select another Date ", this);
                        }
                        else if (flag == 0)
                        {
                            //DIV_Main.Visible = true;
                            //DIV_Calendar.Visible = false;
                        }
                    }
                }
                else if (ViewState["EventStartDate"] == null)
                {
                    //DIV_Main.Visible = true;
                    //DIV_Calendar.Visible = false;
                }
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
                    //e.Cell.BackColor = System.Drawing.Color.FromArgb(10, 99, 30);
                }
            }

            // Change the fore color of the days in the month to Red.
            if (e.Day.Date.DayOfWeek == DayOfWeek.Sunday)
                e.Cell.ForeColor = System.Drawing.Color.Red;


            if (ViewState["EventStartDate"] != null)
            {
                DataTable dt_Date = (DataTable)ViewState["EventStartDate"];
                for (int i = 0; i < dt_Date.Rows.Count; i++)
                {
                    DateTime FunctionDate = Convert.ToDateTime(dt_Date.Rows[i]["EventStartDate"]);
                    if (e.Day.Date.Equals(FunctionDate.Date))
                    {
                        e.Day.IsSelectable = false;
                        e.Cell.BackColor = System.Drawing.Color.Orange;
                        e.Cell.ForeColor = System.Drawing.Color.Green;
                    }
                }
            }
        }
        #endregion


        #region SEND_MAIL
        public void SendMail(String Recipient, String ReceiverMailID)
        {
            try
            {
                if (!string.IsNullOrEmpty(Recipient) && !string.IsNullOrEmpty(ReceiverMailID))
                {
                    MailMessage mail = new MailMessage();
                    SmtpClient SmtpServer = new SmtpClient("smtp.gmail.com");
                    mail.From = new MailAddress("akprojectemail@gmail.com");
                    //mail.To.Add("palavalappil.rahul474@gmail.com,dipurajp@gmail.com,arungopkkm@gmail.com");
                    mail.To.Add(ReceiverMailID);
                    String Message = "Dear " + Recipient.ToString() + " ,We have Recieved Your Request,Please Visit Our Office asap and ensure that you have paid the advance Payment,otherwise the booking will be cancel automatically .Wishing You All the Best. Kailas Auditorium, Iriyanni";
                    mail.Subject = "Confirmation Mail From KAILAS Auditorium, Iriyanni";
                    mail.Body = Message.ToString();

                    SmtpServer.Port = 587;
                    SmtpServer.Credentials = new System.Net.NetworkCredential("akprojectemail", "emailproject");
                    SmtpServer.EnableSsl = true;
                    SmtpServer.Send(mail);
                    COMMONFUNCTIONS.ScriptMsgForAjax("Booking Session was Successful, a confirmation mail has  sent to the email id you specify here", this);
                }

            }
            catch (Exception ex)
            {
                string s = ex.Message;
            }
        }
        #endregion

        #region CLEAR_CONTROLS
        public void ClearControls()
        {
            txt_BirdeGroomBirthDate.Text = "";
            txt_BrideBirthDate.Text = "";
            txt_BrideFather.Text = "";
            txt_BridegroomFather.Text = "";
            txt_BrideGroomName.Text = "";
            txt_BrideName.Text = "";
            txt_Description.Text = "";
            txt_Email.Text = "";
            txt_EventDate.Text = "";
            txt_FirstName.Text = "";
            txt_GuestCount.Text = "";
            txt_LastName.Text = "";
            txt_Mobile.Text = "";
            txt_Advance.Text = "";

         }
        public void Clear_Div()
        {
            DIV_MarriageDetails.Visible = false;
            ddl_Event.SelectedValue = "-1";
            ddl_Facility.SelectedValue = "-1";
            ddl_Session.SelectedValue = "-1";
        }
        #endregion
        #region AgeCalculation
        private static int CalculateAge(DateTime dateOfBirth)
        {
            int age = 0;
            age = DateTime.Now.Year - dateOfBirth.Year;
            if (DateTime.Now.DayOfYear < dateOfBirth.DayOfYear)
                age = age - 1;

            return age;
        }

        #endregion

        #region BUTTON CLICK

        protected void btn_Submit_Click(object sender, EventArgs e)
        {
            try
            {
                Save();
            }
            catch (Exception ex)
            {
                string s = ex.Message;
            }
        }

        protected void btn_Cancel_Click(object sender, EventArgs e)
        {
            Clear_Div();
            ClearControls();
            DIV_MarriageDetails.Visible = false;
        }

        #endregion

        #region Validation

        //private static int CalculateAge(DateTime dateOfBirth)
        //{
        //    int age = 0;
        //    age = DateTime.Now.Year - dateOfBirth.Year;
        //    if (DateTime.Now.DayOfYear < dateOfBirth.DayOfYear)
        //        age = age - 1;

        //    return age;
        //}
        /*
        private bool CheckValue()
        {
            bool flag = false;
            int age = 0;
            DateTime BG_DOB, B_DOB;
            DateTime date = System.DateTime.Today;
            if (CalendarB_DOB.DateTextFromValue != "" && CalendarB_DOB.DateTextFromValue != null)
            {
                flag = true;
                //B_DOB = Convert.ToDateTime(CalendarB_DOB.DateTextFromValue);
                B_DOB = DateTime.ParseExact(CalendarB_DOB.DateTextFromValue, @"d/M/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            }
            else
            {
                COMMONFUNCTIONS.ScriptMsgForAjax("Please Select  Bride's Date of Birth", Page);
                return false;
            }
            if (CalendarBG_DOB.DateTextFromValue != "" && CalendarBG_DOB.DateTextFromValue != null)
            {
                flag = true;
                //BG_DOB = Convert.ToDateTime(CalendarBG_DOB.DateTextFromValue);
                BG_DOB = DateTime.ParseExact(CalendarBG_DOB.DateTextFromValue, @"d/M/yyyy", System.Globalization.CultureInfo.InvariantCulture);

            }
            else
            {
                COMMONFUNCTIONS.ScriptMsgForAjax("Please Select Bridegroom's Date of Birth", Page);
                return false;
            }
            if (CalendarB_DOB.DateTextFromValue != "")
                //flag = checkValidation(date, B_DOB);
                age = CalculateAge(DateTime.ParseExact(CalendarB_DOB.DateTextFromValue, @"d/M/yyyy", System.Globalization.CultureInfo.InvariantCulture));

            if (age >= 18)
            {
                if (CalendarBG_DOB.DateTextFromValue != "")
                    //flag = checkValidation(date,BG_DOB);
                    age = CalculateAge(DateTime.ParseExact(CalendarBG_DOB.DateTextFromValue, @"d/M/yyyy", System.Globalization.CultureInfo.InvariantCulture));
                if (age >= 18)
                {
                    flag = true;
                }
                else
                {
                    COMMONFUNCTIONS.ScriptMsgForAjax("Age Should be greater than 17 Years", Page);
                    return false;
                }
            }
            else
            {
                COMMONFUNCTIONS.ScriptMsgForAjax("Age Should be greater than 17 Years", Page);
                return false;
            }


            return flag;
        }
        private bool checkValidation(DateTime B_DOB, DateTime BG_DOB)
        {
            try
            {

                int result = Convert.ToInt32(Convert.ToInt64(B_DOB.Year) - Convert.ToInt64(BG_DOB.Year));
                if (result > 17)
                {
                    return true;
                }
                else
                {
                    return false;
                }

            }
            catch (Exception ex)
            {
                COMMON.ScriptMsg(ex.Message, Page);
                //COMMON.WriteLogFile(this.GetType().Name.ToString(), System.Reflection.MethodBase.GetCurrentMethod().Name, ex.Message.ToString());
            }
            return true;
        }*/

        private bool CheckFields()
        {
            bool val = false;
            if(ddl_Event.SelectedValue!="-1")
                 val = true;
            else
            {
                COMMONFUNCTIONS.ScriptMsgForAjax("Please Select a Fuction Type", Page);
                return false;
            }
            if (txt_FirstName.Text != "" && txt_FirstName.Text != null)
                val = true;
            else
            {
                COMMONFUNCTIONS.ScriptMsgForAjax("Please Enter a Name", Page);
                return false;
            }
             if ( txt_LastName.Text != "" && txt_LastName.Text != null)
                val = true;
            else
            {
                COMMONFUNCTIONS.ScriptMsgForAjax("Please Enter a Name", Page);
                return false;
            }
            if (txt_Mobile.Text != "" && txt_Mobile.Text != null)
                val = true;
            else
            {
                COMMONFUNCTIONS.ScriptMsgForAjax("Please Enter  Your Mobile Number", Page);
                return false;
            }
            if (txt_Email.Text != "" && txt_Email.Text != null)
                val = true;
            else
            {
                COMMONFUNCTIONS.ScriptMsgForAjax("Please Enter Your Email Address", Page);
                return false;
            }
          

            if (ddl_Session.SelectedValue != "-1")
                val = true;
            else
            {
                COMMONFUNCTIONS.ScriptMsgForAjax("Please Select Session", Page);
                return false;
            }
            if (ddl_Facility.SelectedValue != "-1")
                val = true;
            else
            {
                COMMONFUNCTIONS.ScriptMsgForAjax("Please Select Facilities Required", Page);
                return false;
            }
            if (ddl_Event.SelectedValue == "1")
            {
                val = false;
                 if(txt_BrideName.Text != "" && txt_BrideName.Text != null)
                val = true;
            else
            {
                COMMONFUNCTIONS.ScriptMsgForAjax("Please Enter Bride Name", Page);
                return false;
            }
            if (txt_BrideFather.Text != "" && txt_BrideFather.Text != null)
                val = true;
            else
            {
                COMMONFUNCTIONS.ScriptMsgForAjax("Please Enter Your Bride's Father's Name", Page);
                return false;
            }
            if (txt_BrideBirthDate.Text != "" && txt_BrideBirthDate.Text != null)
                val = true;
            else
            {
                COMMONFUNCTIONS.ScriptMsgForAjax("Please Enter Bride's Birth Date", Page);
                return false;
            }
              if(txt_BrideGroomName.Text != "" && txt_BrideGroomName.Text!= null)
                val = true;
            else
            {
                COMMONFUNCTIONS.ScriptMsgForAjax("Please Enter Bridegroom Name", Page);
                return false;
            }
            if (txt_BridegroomFather.Text != "" && txt_BridegroomFather.Text!= null)
                val = true;
            else
            {
                COMMONFUNCTIONS.ScriptMsgForAjax("Please Enter Bridegroom father's Name", Page);
                return false;
            }
            if (txt_BirdeGroomBirthDate.Text != "" && txt_BirdeGroomBirthDate.Text  != null)
                val = true;
            else
            {
                COMMONFUNCTIONS.ScriptMsgForAjax("Please Enter  Bridegroom Birth Date", Page);
                return false;
            }
                //Check_Value();
            }
            return val;


        }
       
        #endregion
    }
}