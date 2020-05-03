using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using KAILAS_CS;
using KAILAS_CS.Core.Entity;
using KAILAS_CS.Core.Entity.DL;
using System.Data;
using System.Configuration;
using System.Net.Mail;
using System.Net;
namespace KAILAS_CS.Core.Src.Public
{
    public partial class Login : System.Web.UI.Page
    {
        CommonFunctions COMMONFUNCTIONS = new CommonFunctions();
        DL_Common COMMON = new DL_Common(); DL_Admin ADMIN = new DL_Admin();
        DL_User USER = new DL_User();
        DL_Super Super = new DL_Super();
        DataSet DS;
        string UserName, Password;

        protected void Page_Load(object sender, EventArgs e)
        {
          

            if (!IsPostBack)
            {
                SuperAutoRegistration();
            }
        }
        private void SuperAutoRegistration()
        {
            //Locals
            string email = string.Empty;
            try
            {
                email = Convert.ToString(ConfigurationManager.AppSettings["Email"]);
                int result = Super.SuperAutoRegistration(email);
                if (result > 0)
                    sendMail(email);
            }
            catch (Exception ex)
            {
            }
        }
        private bool sendMail(string recieverMail)
        {
            SmtpClient smtp = new SmtpClient();

            try
            {
                AppSettingsReader appSettingsReader = new AppSettingsReader();
                string email = Convert.ToString(appSettingsReader.GetValue("FromEmail", typeof(string)));
                string password = Convert.ToString(appSettingsReader.GetValue("Password", typeof(string))); 
                smtp.Credentials = new NetworkCredential(email, password);
                smtp.Port = 587;
                smtp.Host = "smtp.gmail.com";
                smtp.EnableSsl = true;
                //smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                MailMessage message = new MailMessage();
                message.From = new MailAddress(email);
                message.To.Add(recieverMail);
                message.Subject = "Password Changed";
                message.Body = "<b>Your password has been changed successfully.</b>  <br/><br>Name: <br/><br> Email Address: <br/><br> ContactNo: <br/><br>Comments:<br>";
                message.IsBodyHtml = true;
                smtp.Send(message);
                return true;
            }
            catch (Exception ex)
            {
                string s = "Exxor Occured:" + ex.Message.ToString();
                return false;
            }
        }

        protected void btn_Login_Click(object sender, EventArgs e)
        {
            //Locals
            string modalTitle = string.Empty;
            string modalMessage = string.Empty;

            try
            {
                DataSet dsLogin = new DataSet();
                UserName = txt_Email.Text;
                Password = txt_Password.Text;
                dsLogin = COMMON.AccessAuthentication(UserName, Password);
           
                if (dsLogin.Tables.Count > 0)
                {
                    GetUserCredentails(dsLogin);   
                }
               
                else
                {
                    COMMONFUNCTIONS.ScriptMsgForAjax("Login Failed ",Page);
                    modalTitle = "Login Failed!";
                    modalMessage = "Invalid Credentials! Please try again";
                    ShowDialog(modalTitle, modalMessage);

                }
            }
            catch (Exception ex)
            {

            }
        }

        private void SetUserSessionDetails(DataSet dsDetails)
        {

            try
            {
                SavedSession.UserGuid = (Guid)dsDetails.Tables[0].Rows[0]["LoginGUID"];
            }
            catch (Exception ex)
            {
                string s = ex.Message;
            }
        }

        private void GetUserCredentails(DataSet dsDetails)
        {
            //Locals
            string loggedUserType = string.Empty;
            string accountUrl = string.Empty;
            try
            {
                loggedUserType = Convert.ToString(dsDetails.Tables[0].Rows[0]["UserType"]);
                AppSettingsReader appSettingsReader = new AppSettingsReader();
                if (!string.IsNullOrEmpty(loggedUserType))
                {
                    accountUrl = Convert.ToString(appSettingsReader.GetValue(loggedUserType, typeof(string)));
                    SetUserSessionDetails(dsDetails);
                }
                if (!string.IsNullOrEmpty(accountUrl))
                    Response.Redirect(accountUrl, false);
            }
            catch (Exception ex)
            {
                string s = ex.Message;
            }
        }

        private void ShowDialog(string modalTitle, string modalMessage)
        {
            try
            {

                //lbl_ModlTitle.Text = modalTitle;
                //lbl_ModalMesssage.Text = modalMessage;
                //System.Text.StringBuilder sb = new System.Text.StringBuilder();
                //sb.Append("<script type='text/javascript'>\n");
                //sb.Append("$('#dialogModal').alert('show');\n");
                //sb.Append("</script>");
                //ScriptManager.RegisterStartupScript(this, this.GetType(), "", sb.ToString(), false);
                /*
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("<script type='text/javascript'>\n");
                sb.Append("bootbox.alert('" + modalMessage + "', function () {});\n");
                sb.Append("</script>");
                ScriptManager.RegisterStartupScript(this, this.GetType(), "", sb.ToString(), false);
                */
                Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript", "PopupDialog('" + modalMessage + "');", true);
            }
            catch (Exception ex)
            {
                string exception = ex.Message;
            }
        }

    }
}