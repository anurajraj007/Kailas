<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="KAILAS_CS.Core.Src.Public.Feedback" %>
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
        <div class="form-group">
            <div class="form-group input-group">
                <asp:Button runat="server" ID="btn_Submit" Text="Submit" class="btn btn-outline btn-success btn-lg btn-block"
                    style="margin-top: 15px" data-toggle="modal" data-target="#compose-modal" 
                    onclick="btn_Submit_Click" />
                <br /><br />
            </div>
        </div>
         <div class="modal fade" id="compose_modal" tabindex="-1" role="dialog" aria-hidden="true">
            <div class="modal-dialog">
               <div class="modal-content">
                  <div class="modal-header">
                     <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                     <h4 class="modal-title"><i class="fa fa-envelope-o"></i> Compose New Message</h4>
                  </div>
                  <div class="modal-body">
                     <div class="form-group">
                        <div class="input-group">
                           <span class="input-group-addon">TO:</span>
                           <input name="email_to" type="email" class="form-control" placeholder="Email TO">
                        </div>
                     </div>
                     <div class="form-group">
                        <div class="input-group">
                           <span class="input-group-addon">CC:</span>
                           <input name="email_to" type="email" class="form-control" placeholder="Email CC">
                        </div>
                     </div>
                     <div class="form-group">
                        <div class="input-group">
                           <span class="input-group-addon">BCC:</span>
                           <input name="email_to" type="email" class="form-control" placeholder="Email BCC">
                        </div>
                     </div>
                     <div class="form-group">
                        <textarea name="message" id="email_message" class="form-control" placeholder="Message" style="height: 120px;"></textarea>
                     </div>
                     <div class="form-group">
                        <div class="btn btn-success btn-file">
                           <i class="fa fa-paperclip"></i> Attachment
                           <input type="file" name="attachment"/>
                        </div>
                        <p class="help-block">Max. 32MB</p>
                     </div>
                  </div>
                  <div class="modal-footer clearfix">
                     <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fa fa-times"></i> Discard</button>
                     <button type="submit" class="btn btn-primary pull-left"><i class="fa fa-envelope"></i> Send Message</button>
                  </div>
               </div>
               <!-- /.modal-content -->
            </div>
            <!-- /.modal-dialog -->
         </div>
      </form>
   </body>
</html>