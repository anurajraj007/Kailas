<%@ Page Title="" Language="C#" MasterPageFile="~/Core/Masters/Admin.Master" AutoEventWireup="true" CodeBehind="CancellBooking.aspx.cs" Inherits="KAILAS_CS.Core.Src.Admin.CancellBooking" %>
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
                     <h1 class="page-header">Search Details</h1>
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
                                    style="margin-left: 184px; margin-top: 15px" onclick="btn_Cancel_Click"/>
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
                              <asp:GridView ID="gdHistory" runat="server" 
                                   class="table table-striped table-bordered table-hover" 
                                   AutoGenerateColumns = "false" onrowcommand="gdHistory_RowCommand"  
                                   ForeColor="#663300" GridLines="None" ShowFooter="True"  >
                                  <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                              <Columns>
                                <asp:BoundField DataField="EventDate" HeaderText="EventDate" />
                                <%-- <asp:BoundField DataField="EventType" HeaderText="EventType" />--%>
                                  <asp:BoundField DataField="BookingDate" HeaderText="BookingDate" />
                                   <asp:BoundField DataField="FirstName" HeaderText="Name" />
                                     <asp:TemplateField>
                                     <ItemTemplate>
                                      <asp:LinkButton ID="LinkSelect" runat="server" CommandName="SelectRequest" CommandArgument='<%#Eval("BookingGUID") %>' Text="select"> 
                                      </asp:LinkButton>
                                   </ItemTemplate>
                                   </asp:TemplateField>
                                </Columns>
                                 <EditRowStyle BackColor="#999999" />
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="#FF99FF" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                              </asp:GridView>
                           </div>
                        </div>
                     </div>
                 <%--    me--%>
                 <div id="DIV_BookingDetails" class="panel panel-info" runat="server" visible="false">
                        <div class="panel-heading">
                           <h4 class="panel-title">
                             <div data-toggle="collapse" data-parent="#accordion" href="#DIV_BookingDetails">
                                 Booking Details</div>
                            <h4>
                            </h4>
                            <h4>
                            </h4>
                               <h4>
                               </h4>
                               <h4>
                               </h4>
                               <h4>
                               </h4>
                               <h4>
                               </h4>
                               <h4>
                               </h4>
                               <h4>
                               </h4>
                               <h4>
                               </h4>
                               <h4>
                               </h4>
                               <h4>
                               </h4>
                               <h4>
                               </h4>
                               <h4>
                               </h4>
                               <h4>
                               </h4>
                               <h4>
                               </h4>
                               <h4>
                               </h4>
                               <h4>
                               </h4>
                               <h4>
                               </h4>
                        </h4>
                         </div>
                    <%-- <div id="Div_BookingData" class="panel-collapse collapse">--%>
                        <div class="panel-body">
                           <!-- /. Left Panel -->
                           <div class="col-lg-6">
                               <div class="form-group">
                                 <label>EventDate</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_EventDate2" placeholder="Event Date" class="form-control"  disabled="true"></asp:TextBox>
                                 </div>
                              </div>
                              
                               <div class="form-group">
                                 <label>EventType</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_EventType" placeholder="EventType" class="form-control"  disabled="true"></asp:TextBox>
                                 </div>
                              </div>
                              </div>
                              
                           <div class="col-lg-6">
                           <div class="form-group">
                                 <label>Name</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_FullName" placeholder="EventType" class="form-control"  disabled="true"></asp:TextBox>
                                 </div>
                              </div>
                                      <div class="form-group">
                                       <label>Status</label>
                                       <asp:DropDownList ID="ddl_Status" runat="server" class="form-control">
                                      <%-- <asp:ListItem Value="-1"   >-1</asp:ListItem>--%>
                                          <asp:ListItem Value="Booked" Selected= "True">Booked</asp:ListItem>
                                          <asp:ListItem Value="Cancelled">Cancel</asp:ListItem>
                                       </asp:DropDownList>
                                    </div>                          
                              

                                 </div>      
                               

                       
                     
                           </div>
                                   <div class="panel-footer">
                                   <div class="form-group">
                                   <div class="form-group input-group">
                                   <asp:Button runat="server" ID="btn_Ok" Text="Ok" 
                                    style="margin-left: 184px; margin-top: 15px" onclick="btn_Ok_Click"/>
                                   <asp:Button runat="server" ID="btn_Cance" Text="Cancel" 
                                    style="margin-left: 184px; margin-top: 15px"/>
                              </div>
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
