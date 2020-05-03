using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;

namespace KAILAS_CS.App_Start
{

    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            #region JS/ SCRIPT

            bundles.Add(new ScriptBundle("~/bundles/jQuery").Include(
                        "~/Plugins/Scripts/jquery-1.9.1.min.js",
                        "~/Plugins/Scripts/bootstrap.min.js",
                        "~/Plugins/Scripts/moment.min.js",
                        "~/Plugins/Scripts/moment-with-locales.min.js",
                        "~/Plugins/Scripts/bootstrap-datetimepicker.min.js",
                        "~/Plugins/Scripts/bootstrap-datepicker.js",
                        "~/Plugins/Scripts/bootbox.min.js",
                        "~/Plugins/Scripts/jquery.validate.min.js",
                        "~/Core/Scripts/CommonScripts.js"));

            #endregion


            #region CSS/ STYLES

            bundles.Add(new StyleBundle("~/Content/BootstrapCss").Include(
                      "~/Plugins/Content/jquery.ui.core.css",
                      "~/Plugins/Content/jquery-ui.css",
                      "~/Plugins/Content/bootstrap.css",
                      "~/Plugins/Content/bootstrap-theme.css",
                      "~/Plugins/Content/bootstrap-datetimepicker.css",
                      "~/Plugins/Content/datepicker.css"));

            bundles.Add(new StyleBundle("~/Core/KailasCSS").Include(
                      "~/Core/CSS/kailas-bootstrap.css",
                      "~/Core/CSS/kailas-dashboard.css"));

            #endregion
        }
    }
}