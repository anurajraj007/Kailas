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
    public partial class Signature : System.Web.UI.Page
    {
        CommonFunctions COMMONFUNCTIONS = new CommonFunctions();
        DL_Admin ADMIN = new DL_Admin();
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {

                Guid BookGuid = new Guid(Request.QueryString["BookingGuid"]);
                ViewState["BookGuid"] = BookGuid;

                DataSet Data = new DataSet();
                Data = ADMIN.GetBookingDatas(BookGuid);

                if (Data.Tables[0].Rows.Count > 0)
                    BindData(Data);
            }
        }

        public void BindData(DataSet Data)
        {
            txt_Bookingdate.Text = Convert.ToString(Data.Tables[0].Rows[0]["BookingDate"]);
            txt_Bride.Text = Convert.ToString(Data.Tables[0].Rows[0]["BrideName"]);
            txt_BrideGroom.Text = Convert.ToString(Data.Tables[0].Rows[0]["BridegroomName"]);
            txt_BridegroomWitName.Text = Convert.ToString(Data.Tables[0].Rows[0]["BridegroomWitness"]);
            txt_BrideWitnesss.Text = Convert.ToString(Data.Tables[0].Rows[0]["BrideWitness"]);
            txt_EventDate.Text = Convert.ToString(Data.Tables[0].Rows[0]["EventDate"]);
        }

        public void image_Upload()
        {
            Guid g = (Guid)ViewState["BookGuid"];
            // string[] filePathBride = Directory.GetFiles(Server.MapPath ("~/Core/Document/BrideSign/") );
            string BrideSign = Path.GetFullPath(Server.MapPath(("~/Core/Document/BrideSign/")) + (ViewState["BookGuid"]) + (txt_Bride.Text) + ".jpg");
            string BridegroomSign = Path.GetFullPath(Server.MapPath(("~/Core/Document/BridegroomSign/")) + (ViewState["BookGuid"]) + (txt_BrideGroom.Text) + ".jpg");//+ fileName  ););
            string BridewitnessSign = Path.GetFullPath(Server.MapPath("~/Core/Document/BridewitnessSign/") + (ViewState["BookGuid"]) + (txt_BrideWitnesss.Text) + ".jpg");// fileName);;//+ fileName  ););
            string BridegmWitnessSign = Path.GetFullPath(Server.MapPath("~/Core/Document/BridegmWitnessSign/") + (ViewState["BookGuid"]) + (txt_BridegroomWitName.Text) + ".jpg");
            // Im(BrideSign);
            DataTable dtSign = new DataTable();
            // DataSet dtSign = new DataSet();
            dtSign.Columns.Add("BrideSign");
            dtSign.Columns.Add("BridegmSign");
            dtSign.Columns.Add("BrideWitSign");
            dtSign.Columns.Add("BridegmWitSign");
            dtSign.Columns.Add("BrideName");
            dtSign.Columns.Add("BridegmName");
            dtSign.Columns.Add("BookingGuid");


            DataRow dr = dtSign.NewRow();

            // dr["RowID"] = Convert.ToInt64(Session["RowID"]);
            dr["BrideSign"] = BrideSign;
            dr["BridegmSign"] = BridegroomSign;
            dr["BrideWitSign"] = BridewitnessSign;
            dr["BridegmWitSign"] = BridegmWitnessSign;
            dr["BookingGuid"] = g;//(Guid)( ViewState["BookGuid"]);
            dr["BrideName"] = txt_Bride.Text;
            dr["BridegmName"] = txt_BrideGroom.Text;
            dtSign.Rows.Add(dr);

            Int64 i = ADMIN.Signature(dtSign);
            if (i > 0)
            {
                Upload();
                // Response.Redirect("Certificate.aspx",true);
            }
        }

        protected void btn_UploadSign_Click(object sender, EventArgs e)
        {
            image_Upload();
            Response.Redirect("MarriageCertificate.aspx", true);
        }

        public void Upload()
        {

            if (FileUpload4.HasFile)
                SignUpload(FileUpload4, "BridegmWitnessSign/", txt_BridegroomWitName.Text);
            if (FileUpload3.HasFile)
                SignUpload(FileUpload3, "BridewitnessSign/", (txt_BrideWitnesss.Text));
            if (FileUpload2.HasFile)
                SignUpload(FileUpload2, "BrideSign/", (txt_Bride.Text));
            if (FileUpload1.HasFile)
                SignUpload(FileUpload1, "BridegroomSign/", (txt_BrideGroom.Text));

        }

        public void SignUpload(FileUpload FileUp, string Folder, string Name)
        {

            string Folde = "~/Core/document/" + (Folder);
            string fileName = Path.GetFileName(FileUp.PostedFile.FileName);
            FileUp.PostedFile.SaveAs((Server.MapPath(Folde)) + (ViewState["BookGuid"]) + (Name) + ".jpg");
        }
    }
}