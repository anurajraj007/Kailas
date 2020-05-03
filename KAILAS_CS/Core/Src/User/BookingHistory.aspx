<%@ Page Title="" Language="C#" MasterPageFile="~/Core/Masters/User.Master" AutoEventWireup="true" CodeBehind="BookingHistory.aspx.cs" Inherits="KAILAS_CS.Core.Src.User.BookingHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 <div id="page_wrapper" runat="server" class="page-wrapper" style="min-height: 364px;">
      <form runat="server" id="form1">
         <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
         <asp:UpdatePanel ID="update_panel1"  runat="server">
            <contenttemplate>
               <div class="row">
                  <div class="col-lg-12">
                     <h1 class="page-header">Booking History</h1>
                  </div>
                  <!-- /.col-lg-12 -->
               </div>
               <!-- /.row -->
               <div class="row">
                  <div class="col-lg-12">
                     <div class="panel panel-info">
                        <div class="panel-heading">
                           <i class="glyphicon glyphicon-pencil"></i> Event Details
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                           <!-- /. Left Panel -->
                           <div class="col-lg-6">
                              <div class="panel-body">
                                 <div class="form-group">
                                    <asp:DropDownList ID="ddl_Event" runat="server" AutoPostBack="true" 
                                       class="form-control" style="margin-left: 1px">
                                    </asp:DropDownList>
                                 </div>
                                 <div class="form-group">
                                    <div class='input-group date' id='bookingDate'   data-provide="datepicker" data-date-format="dd/mm/yyyy" data-date-autoclose="true">
                                       <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                       <asp:TextBox runat="Server" ID="txt_BookingDate" placeholder="Booking Date" 
                                          class="form-control" ></asp:TextBox>
                                    </div>
                                 </div>
                                 <div class="form-group">
                                    <div class='input-group date' id='eventDate'   data-provide="datepicker" data-date-format="dd/mm/yyyy" data-date-autoclose="true">
                                       <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                       <asp:TextBox runat="Server" ID="txt_EventDate" placeholder="Event  Date" 
                                          class="form-control"></asp:TextBox>
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
                                       <asp:TextBox runat="Server" ID="txt_Name" placeholder="Name" class="form-control"></asp:TextBox>
                                    </div>
                                 </div>
                                 <div class="form-group">
                                    <div class="form-group input-group">
                                       <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                       <asp:TextBox runat="Server" ID="txt_BrideGroom" placeholder="Bridegroom Name" class="form-control" ></asp:TextBox>
                                    </div>
                                 </div>
                                 <div class="form-group">
                                    <div class="form-group input-group">
                                       <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                       <asp:TextBox runat="Server" ID="txt_Bride" placeholder="Bride Name" class="form-control" ></asp:TextBox>
                                    </div>
                                 </div>
                              </div>
                              <!-- /.panel-body -->
                           </div>
                           <!-- /. Right Panel -->
                        </div>
                        <!-- /.panel-body -->
                        <!-- / Panel Footer-->
                        <div class="panel-footer">
                           <div class="form-group">
                              <div class="form-group input-group">
                                 <asp:Button runat="server" ID="btn_Show" Text="Show" 
                                    style="margin-left: 184px; margin-top: 15px" onclick="btn_Show_Click"/>
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
               <div id="Panel_BookingHistory" class="row" runat="server">
                  <div class="col-lg-12">
                     <div class="panel panel-info">
                        <div class="panel-heading">
                           <i class="glyphicon glyphicon-list"></i> Booking Details
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                           <div class="table-responsive">
                              <%-- <GridView class="table table-striped table-bordered table-hover" id="gd_Details">--%>
                              <asp:GridView ID="gdHistory" runat="server" class="table table-striped table-bordered table-hover" >
                              </asp:GridView>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <!-- /.row -->
            </ContentTemplate>
         </asp:UpdatePanel>
      </form>
   </div>
</asp:Content>
