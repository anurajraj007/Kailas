<%@ Page Title="" Language="C#" MasterPageFile="~/Core/Masters/Admin.Master" AutoEventWireup="true" CodeBehind="Signature.aspx.cs" Inherits="KAILAS_CS.Core.Src.Admin.Signature" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div id="page_wrapper" runat="server" class="page-wrapper" style="min-height: 364px;">
  <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
       <div class="row">
                  <div class="col-lg-12">
                     <h1 class="page-header">Upload Signature</h1>
                  </div>
                  <!-- /.col-lg-12 -->
               </div>
               <!-- /.row -->
               <div class="row">
                  <div class="col-lg-12">
                     <div class="panel panel-info">
                        <div class="panel-heading">
                           <i class="glyphicon glyphicon-pencil"></i> Signature
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                           <!-- /. Left Panel -->
                           <div class="col-lg-6">
                              <div class="panel-body">
                               <div class="form-group">
                                    <div class="form-group input-group">
                                       <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                       <asp:TextBox runat="Server" ID="txt_EventDate" placeholder="EventDate" class="form-control" ></asp:TextBox>
                                    </div>
                                 </div>
                               <div class="form-group">
                                    <div class="form-group input-group">
                                       <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                       <asp:TextBox runat="Server" ID="txt_BrideGroom" placeholder="Bridegroom Name" class="form-control" ></asp:TextBox>
                                    </div>
                                 </div>
                                   <div class="form-group">
                                   <label>Brigegroom Sign </label>
                                    <div class="form-group input-group">
                                      <%-- <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>--%>
                                       <asp:FileUpload ID="FileUpload1" runat="server" /> <%--<asp:Button ID="btnUpload" runat="server" Text="Upload" OnClick="" />--%>
                                    </div>
                                 </div>
                                   <div class="form-group">
                                    <div class="form-group input-group">
                                       <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                       <asp:TextBox runat="Server" ID="txt_BridegroomWitName" placeholder=" Witness Name" class="form-control" ></asp:TextBox>
                                    </div>
                                 </div>
                                  <div class="form-group">
                                  <label>Bridegroom witness sign </label>
                                    <div class="form-group input-group">
                                      <%-- <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>--%>
                                       <asp:FileUpload ID="FileUpload4" runat="server" />
                                       <%-- <asp:Button ID="Button2" runat="server" Text="Upload" OnClick="UploadBridegmWitSign" />--%>
                                    </div>
                                 </div>
                               
                              </div>
                              <!-- /.panel-body -->
                           </div>
                           <!-- /. Left Panel -->
                           <!-- /. Right Panel -->
                           <div class="col-lg-6">
                              <div class="panel-body">
                             
                                <div class="form-group">
                                    <div class="form-group input-group">
                                       <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                       <asp:TextBox runat="Server" ID="txt_Bookingdate" placeholder="BookingDate" class="form-control" ></asp:TextBox>
                                    </div>
                                 </div>
                                 <div class="form-group">
                                    <div class="form-group input-group">
                                       <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                       <asp:TextBox runat="Server" ID="txt_Bride" placeholder="Bride Name" class="form-control" ></asp:TextBox>
                                    </div>
                                 </div>
                                  <div class="form-group">
                                  <label>Brides Sign </label>
                                    <div class="form-group input-group">
                                      <%-- <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>--%>
                                       <asp:FileUpload ID="FileUpload2" runat="server" />
                                       <%-- <asp:Button ID="btnUpload2" runat="server" Text="Upload" OnClick="UploadBrideSign" />--%>
                                    </div>
                                 </div>
                                   <div class="form-group">
                                    <div class="form-group input-group">
                                       <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                       <asp:TextBox runat="Server" ID="txt_BrideWitnesss" placeholder="Witness Name" class="form-control" ></asp:TextBox>
                                    </div>
                                 </div>
                                  <div class="form-group">
                                  <label>Brides Witness Sign </label>
                                    <div class="form-group input-group">
                                     <%--  <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>--%>
                                       <asp:FileUpload ID="FileUpload3" runat="server" />
                                       <%-- <asp:Button ID="Button1" runat="server" Text="Upload" OnClick="UploadBrideWitSign" />--%>
                                    </div>
                                 </div>

                              </div>
                              <!-- /.panel-body -->
                           </div>
                            <div class="form group">
                                   <div class="form-group input-group">
                                  <asp:Image ID="img"   runat="server" />
                                 <%--  <img  id="img1" src= '<%#img1() %>' />--%>
                               <%--    </div>
                                 </div>--%>
                           <!-- /. Right Panel -->
                        </div>
                        <!-- /.panel-body -->
                        <!-- / Panel Footer-->
                        <div class="panel-footer">
                           <div class="form-group">
                              <div class="form-group input-group">
                               <asp:Button runat="server" ID="btn_UploadSign" Text="Upload" 
                                    style="margin-left: 184px; margin-top: 15px" 
                                      onclick="btn_UploadSign_Click"  />

                               <%--  <asp:Button runat="server" ID="btn_Save" Text="Save" 
                                    style="margin-left: 184px; margin-top: 15px" onclick="btn_Save_Click" />--%>
                                 <asp:Button runat="server" ID="btn_Cancel" Text="Cancel" 
                                    style="margin-left: 184px; margin-top: 15px"/>
                              </div>
                           </div>
                        </div>
                        <!-- / Panel Footer-->
                     </div>
                     <!-- /.panel -->
                  </div>
               </div>
               <!-- /.row -->
   

</form>
</div>
 
                        
</asp:Content>
