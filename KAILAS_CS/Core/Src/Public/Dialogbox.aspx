<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dialogbox.aspx.cs" Inherits="KAILAS_CS.Core.Src.Public.Dialogbox" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<!-- Names Space -->
<%@ Import Namespace="System.Web.Optimization" %>
<html xmlns="http://www.w3.org/1999/xhtml">
   <head id="Head1" runat="server">
      <title>Kailas</title>
      <%-- Style Section --%>
      <%: Styles.Render("~/Content/BootstrapCss")%> 
      <%: Styles.Render("~/Core/KailasCSS")%>
      <%-- Scripts Sections--%>
      <%: Scripts.Render("~/bundles/jQuery")%> 
   </head>
   <body>
      <form id="form1" runat="server">
         <div class="modal fade" id="dialogModal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                     <h4 class="modal-title">
                        <span class="glyphicon glyphicon-info-sign yellow"></span>
                        <asp:Label CssClass="alert-info" ID="lbl_ModlTitle" runat="server">Title</asp:Label>
                     </h4>
                  </div>
                  <!-- dialog body -->
                  <div class="modal-body">
                     <asp:Label runat="server" ID="lbl_ModalMesssage"></asp:Label>
                  </div>
                  <!-- dialog buttons -->
                  <div class="modal-footer clearfix">
                     <button type="button" data-dismiss="modal"  class="btn btn-outline btn-primary pull-right" data-toggle="tooltip" data-placement="bottom" data-original-title="Click here to close the Dialog">
                     <span class="glyphicon glyphicon-ok-sign"></span></button>
                  </div>
               </div>
            </div>
         </div>
         <!-- /.modal-dialog -->
         <div class="form-group">
            <div class="form-group input-group">
               <asp:Button runat="server" ID="btn_Submit" Text="Submit" class="btn btn-outline btn-success btn-lg btn-block"
                  style="margin-top: 15px" data-toggle="modal" data-target="#compose-modal" 
                  onclick="btn_Submit_Click" />
               <br /><br />
            </div>
         </div>
      </form>
      <script type="text/javascript">
          $(document).ready(function () {
              $('[data-toggle="tooltip"]').tooltip();
          });
      </script>
   </body>
</html>