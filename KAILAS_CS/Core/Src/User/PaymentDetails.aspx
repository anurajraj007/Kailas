<%@ Page Title="" Language="C#" MasterPageFile="~/Core/Masters/User.Master" AutoEventWireup="true" CodeBehind="PaymentDetails.aspx.cs" Inherits="KAILAS_CS.Core.Src.User.PaymentDetails" %>
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
                             <div data-toggle="collapse" data-parent="#accordion" href="#DIV_BookingDetails">Payment Details</div>
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
                                 <label>Hall&Decoration</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_HallRent" 
                                         placeholder="HallRent" class="form-control" 
                                         ontextchanged="txt_HallRent_TextChanged" AutoPostBack="true" disabled="true"></asp:TextBox>
                                 </div>
                              </div>
                             
                             
                               <div class="form-group">
                                 <label>Food</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_Food" placeholder="Food charge" 
                                         class="form-control" ontextchanged="txt_Food_TextChanged"  AutoPostBack="true" disabled="true"></asp:TextBox>
                                 </div>
                              </div>
                               <div class="form-group">
                                 <label>Cleaning</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_Cleaning" placeholder="Cleaning" 
                                         class="form-control" ontextchanged="txt_Cleaning_TextChanged" AutoPostBack="true" disabled="true"></asp:TextBox>
                                 </div>
                              </div>
                               <div class="form-group">
                                 <label>Water Bill</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_Water" placeholder="WaterBill" 
                                         class="form-control" ontextchanged="txt_Water_TextChanged"  AutoPostBack="true" disabled="true"></asp:TextBox>
                                 </div>
                              </div>
                               <div class="form-group">
                                 <label>Tax</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_Tax" placeholder="Tax" class="form-control" 
                                         ontextchanged="txt_Tax_TextChanged"  AutoPostBack="true" disabled="true"></asp:TextBox>
                                 </div>
                              </div>
                              </div>
                            <div class="col-lg-6">
                               <div class="form-group">
                                       <label>Bill No</label>
                                       <div class="form-group input-group">
                                          <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                          <asp:TextBox runat="Server" ID="txt_BillNo" placeholder="Bill No" class="form-control" disabled= "true"  ></asp:TextBox>
                                       </div>
                                    </div>
                               <div class="form-group">
                                 <label>Catering Services</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_Catering" 
                                         placeholder="Catering Service charge" class="form-control" 
                                         ontextchanged="txt_Catering_TextChanged" disabled="true"></asp:TextBox>
                                 </div>
                              </div>
                               <div class="form-group">
                                 <label>ExtraDecoration</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_ExtraDecoration" 
                                         placeholder="Extra Decoration charge" class="form-control" 
                                         ontextchanged="txt_ExtraDecoration_TextChanged"  AutoPostBack="true" disabled="true"></asp:TextBox>
                                 </div>
                              </div>
                               <div class="form-group">
                                 <label>ServiceCharge</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_Service" placeholder="Service charge" 
                                         class="form-control" ontextchanged="txt_Service_TextChanged"  AutoPostBack="true" disabled="true"></asp:TextBox>
                                 </div>
                              </div>
                               <div class="form-group">
                                 <label>Electricity Bill</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_Electricity" placeholder="Electricity Bill" 
                                         class="form-control" ontextchanged="txt_Electricity_TextChanged"  AutoPostBack="true" disabled="true"></asp:TextBox>
                                 </div>
                              </div>
                               <div class="form-group">
                                 <label>Others</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_Others" placeholder="Others" 
                                         class="form-control" ontextchanged="txt_Others_TextChanged"  AutoPostBack="true" disabled="true"></asp:TextBox>
                                 </div>
                              </div>
                              </div>
                               
                                <div class="col-lg-4">
                               <div class="form-group">
                                 <label>Advance</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_Advance" placeholder="Advance" 
                                         class="form-control" ontextchanged="txt_Advance_TextChanged"  AutoPostBack="true" disabled="true"></asp:TextBox>
                                 </div>
                              </div>
                              </div>
                               <div class="col-lg-4">
                               <div class="form-group">
                                 <label>Payable Amount</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_Payable" placeholder="Payable amount" class="form-control" disabled="true" ></asp:TextBox>
                                 </div>
                              </div>
                              </div>
                                <div class="col-lg-4">
                               <div class="form-group">
                                 <label>Total</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_Total" placeholder="Total" class="form-control" disabled="true"  ></asp:TextBox>
                                 </div>
                              </div>
                              </div>
                              </div>

                       
                        <%--    </div>--%>
                             <div class="form-group">
                              <div class="form-group input-group">
                                  
                                <%-- <asp:Button runat="server" ID="btn_Delete" Text="Cancel" 
                                    style="margin-left: 184px; margin-top: 15px"/>--%>
                                    <%--  <asp:Button runat="server" ID="btn_IsClosed" Text="Bill Closed" 
                                    style="margin-left: 184px; margin-top: 15px" onclick="btn_IsClosed_Click"/>--%>
                                     <asp:Button runat="server" ID="btn_OK" Text="OK" 
                                    style="margin-left: 184px; margin-top: 15px" onclick="btn_OK_Click"/>
                            </div>
                              </div>
                           </div>

                          </div>

                        </div>
                     </div>
                  
               <!-- /.row -->
               <div id="Panel_Payments" runat="server" class="row" visible="false">

              <div ID="DIV_Payment" runat="server" align="center" class="grid"  style="width:100%; margin:auto;">
                <div ID="DIV_Billdetails"  runat="server" align="center" >
                <fieldset style="border-color: ButtonHighlight; border-width: thin; ">
                <div align="center">
                    <br />
                    <asp:Image ID="ImgRpt"  runat="server" Height="70px" Width="100px" />
                </div>
                <div align="center">
                    <asp:Label ID="LblRptHead" runat="server" Font-Bold="True" Font-Size="Large" 
                        style="color: #000000; font-family: 'Times New Roman', Times, serif; font-size: xx-large"></asp:Label>
                    <br />
                    <asp:Label ID="LblRptHead2" runat="server" Font-Bold="True" Font-Size="Medium" 
                        style="font-size: small; color: #000000; font-family: 'Segoe UI';" 
                        Font-Names="Times New Roman"></asp:Label>
                </div>
                <div align="center">
                    <asp:Label ID="LblRpthead1" runat="server" Font-Bold="True" 
                        Font-Names="Times New Roman" style="color: #000000; font-family: 'Segoe UI'"></asp:Label>
                    <br />
                    <asp:Label ID="LblRpthead4" runat="server" Font-Bold="True" 
                        Font-Names="Times New Roman" style="color: #000000; font-family: 'Segoe UI'"></asp:Label>
                    <br />
                    <asp:Label ID="LblRptHead3" runat="server" Font-Bold="True" 
                        Font-Names="Times New Roman" Font-Size="X-Large" 
                        style="text-decoration: underline; color: #000000; font-family: 'Segoe UI';"></asp:Label>
                    <br />
                    <br />
                </div>
       <div align="center">
                    <table style="color: #000000; font-size: medium; font-family: 'Times New Roman', Times, serif">
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label1" runat="server" Text="No"></asp:Label>
                            </td>
                            <td align="left">
                                <strong>:</strong></td>
                            <td align="left">
                                <asp:Label ID="lbl_BillNo" runat="server" 
                                    style="color: #FF0000; font-weight: 700"></asp:Label>
                            </td>

                           
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label2" runat="server" Text="Function Date "></asp:Label>
                            </td>
                            <td align="left">
                                <strong>:</strong></td>
                            <td align="left">
                                <asp:Label ID="lbl_FunctionDate" runat="server"></asp:Label>
                            </td>
                        
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label5" runat="server" Text="Hall & Decoration"></asp:Label>
                            </td>
                            <td align="left">
                                <strong>:</strong></td>
                            <td align="left">
                                <asp:Label ID="lbl_HallandDecoration" runat="server"></asp:Label>
                            </td>
                          
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label6" runat="server" Text="Food"></asp:Label>
                            </td>
                            <td align="left">
                                <strong>:</strong></td>
                            <td align="left">
                                <asp:Label ID="lbl_Food" runat="server"></asp:Label>
                            </td>
                           
                        </tr>
                         <tr>
                            <td align="left">
                                <asp:Label ID="Label26" runat="server" Text=" Cleaning"></asp:Label>
                            </td>
                            <td align="left">
                                <strong>:</strong></td>
                            <td align="left">
                                <asp:Label ID="lbl_Cleaning" runat="server"></asp:Label>
                            </td>
                          
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label8" runat="server" Text="Catering Service"></asp:Label>
                            </td>
                            <td align="left">
                                <strong>:</strong></td>
                            <td align="left">
                                <asp:Label ID="lbl_Catering" runat="server"></asp:Label>
                            </td>
                           
                        </tr>
                           <tr>
                            <td align="left">
                                <asp:Label ID="Label28" runat="server" Text="Extra Decoration"></asp:Label>
                            </td>
                            <td align="left">
                                <strong>:</strong></td>
                            <td align="left">
                                <asp:Label ID="lbl_ExtraDecoration" runat="server"></asp:Label>
                            </td>
                           
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label10" runat="server" Text="Srvice Charge"></asp:Label>
                            </td>
                            <td align="left">
                                <strong>:</strong></td>
                            <td align="left">
                                <asp:Label ID="lbl_Service" runat="server"></asp:Label>
                            </td>
                       
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label12" runat="server" Text="Electricity Bill"></asp:Label>
                            </td>
                            <td align="left">
                                <strong>:</strong></td>
                            <td align="left">
                                <asp:Label ID="lbl_Electricity" runat="server"></asp:Label>
                            </td>
                           
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label14" runat="server" Text="Water"></asp:Label>
                            </td>
                            <td align="left">
                                <strong>:</strong></td>
                            <td align="left">
                                <asp:Label ID="lbl_Water" runat="server"></asp:Label>
                            </td>
                         
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label15" runat="server" Text="Tax"></asp:Label>
                            </td>
                            <td align="left">
                                <strong>:</strong></td>
                            <td align="left">
                                <asp:Label ID="lbl_Tax" runat="server"></asp:Label>
                            </td>
                           
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label18" runat="server" Text="Others"></asp:Label>
                            </td>
                            <td align="left">
                                <strong>:</strong></td>
                            <td align="left">
                                <asp:Label ID="lbl_Others" runat="server"></asp:Label>
                            </td>
                         
                        </tr>
                          
                    
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label21" runat="server" Text="Total"></asp:Label>
                            </td>
                            <td align="left">
                                <strong>:</strong></td>
                            <td align="left">
                                <asp:Label ID="lbl_Total" runat="server"></asp:Label>
                            </td>
                            
                        </tr>
                       
                        <tr>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td class="style12">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td class="style12">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label31" runat="server" Text="Place"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left">
                                <asp:Label ID="lbl_Place" runat="server"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td class="style12">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td class="style12">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label32" runat="server" Text="Date"></asp:Label>
                            </td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left">
                                <asp:Label ID="lbl_Date" runat="server"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td class="style12">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                            <td class="style12">
                                <asp:Label ID="lbl_Manager" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <br />
                </div>
                          </fieldset>
<%--                  </div>--%>
                <br />
            </fieldset>
            <br />
            <br />
            </div>
            
        </div>
         
                </div>
                <div id="Div_Print" runat="server" visible="false" >
                 <div class="form-group">
                              <div class="form-group input-group">
                             <asp:Button runat="server" ID="btn_Print" Text="Print" align="center" class="btn btn-outline btn-success"
                                       style="margin-left: 103px; margin-top: 15px" 
                                       onclick="btn_Print_Click"  />
                              </div>
              </div>
              </div>
            </ContentTemplate>
         </asp:UpdatePanel>
      </form>
   </div>
   <script type="text/javascript">
       function CallPrint() {
           var res = document.getElementById('<%=Panel_Payments.ClientID%>');
           var contentFormat = "<style>td{font-family:verdana;font-size:10px }th{font-family:Times New Roman;font-size:11px;font-weight:bold font-color:Red}</style><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td align=\"center\" valign=\"top\" style= </div>\"font-family:verdana; font-size:14px; font-weight:normal\">" + "</td></tr><tr><td align=\"left\" valign=\"top\" style=\"font-family:verdana; font-size:12px;height:24px; font-weight:normal\"> " + "</td></tr><tr><td align=\"left\" valign=\"top\"><h2>" + document.getElementById('<%=btn_Print.ClientID%>').innerHTML + '</h2><br />' + res.innerHTML + "</td></tr></table>"
           var WinPrint = window.open('', '', 'scrollbars,left=0,top=0,width=1024,height=700,status=0');
           WinPrint.document.write(contentFormat);
           WinPrint.document.close();
           WinPrint.focus();
           WinPrint.print();

       }
   </script>
</asp:Content>
