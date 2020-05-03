<%@ Page Title="" Language="C#" MasterPageFile="~/Core/Masters/User.Master" AutoEventWireup="true" CodeBehind="MarriageCertificate.aspx.cs" Inherits="KAILAS_CS.Core.Src.User.MarriageCertificate" %>
<%@ Register TagPrefix="ECalendar" Namespace="ExtendedControls" Assembly="EventCalendar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page_wrapper" runat="server" class="page-wrapper" style="min-height: 364px;">
      <form runat="server" id="form1">
         <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
         <asp:UpdatePanel ID="update_panel1" runat="server">
            <contenttemplate>
               <div class="row">
                  <div class="col-lg-12">
                     <h1 class="page-header">Marriage Certificates</h1>
                  </div>
                  <!-- /.col-lg-12 -->
               </div>
               <!-- /.row-->
               <div class="row">
                  <div class="panel panel-info">
                     <div class="panel-heading">
                        <i class="glyphicon glyphicon-calendar"></i> Event Calendar
                     </div>
                     <!-- /.panel-heading -->
                     <div class="panel-body">
                        <div>
                           <ECalendar:EventCalendar ID="ECalendar_Function" CssClass="event-calendar-month-header" runat="server" BackColor="White" BorderStyle="Solid" CellSpacing="1" BorderColor="Black" Font-Size="Large" ForeColor="Black" Height="250px" Width="100%" SelectedDayStyle-BackColor="Cyan" OnDayRender="ECalendar_Function_DayRender" FirstDayOfWeek="Monday" NextMonthText="Next &gt;" NextPrevFormat="FullMonth" ShowDescriptionAsToolTip="True" EventDateColumnName="Function_Date" EventDescriptionColumnName="Function_Type" EventHeaderColumnName="" OnSelectionChanged="ECalendar_Function_SelectionChanged" CaptionAlign="Top" DayNameFormat="Full" Font-Bold="True" Font-Names="Times New Roman" ToolTip="Calendar">
                              <DayHeaderStyle CssClass="event-calendar-day-header" />
                              <DayStyle BackColor="#CCCCCC" />
                              <NextPrevStyle CssClass="event-calendar-next-prev" Font-Bold="True" Font-Size="Large" VerticalAlign="Middle" ForeColor="White" />
                              <OtherMonthDayStyle ForeColor="#999999" />
                              <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                              <TitleStyle BackColor="SkyBlue" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
                              <TodayDayStyle BackColor="Goldenrod" ForeColor="White" />
                           </ECalendar:EventCalendar>
                        </div>
                     </div>
                     <!-- /.panel-body -->
                  </div>
                  <!-- /.panel -->
               </div>
               <div ID="DIV_MarriageDetails" runat="Server" class="row" visible="false">
               <div id="DIV_Dada">
                  <div class="row">
                     <div class="col-lg-12">
                        <div class="panel panel-info">
                           <div class="panel-heading">
                              <i class="glyphicon glyphicon-edit"></i> Event Details
                           </div>
                           <!-- /.panel-heading -->
                           <div class="panel-body">
                              <!-- /. Left Panel -->
                              <div class="col-lg-6">
                                 <div class="panel-body">
                                    <div class="form-group">
                                       <label>Bill No</label>
                                       <div class="form-group input-group">
                                          <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                          <asp:TextBox runat="Server" ID="txt_BillNo" placeholder="Bill No" class="form-control" disabled= "true" Required></asp:TextBox>
                                       </div>
                                    </div>
                                    <div class="form-group">
                                       <label>Event Date</label>
                                       <div class="form-group input-group">
                                          <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                          <asp:TextBox runat="Server" ID="txt_EventDate" placeholder="" class="form-control" disabled="true" Required></asp:TextBox>
                                       </div>
                                    </div>
                                    <!-- /.panel-body -->
                                 </div>
                              </div>
                              <!-- /. Left Panel -->
                              <!-- /. Right Panel -->
                              <div class="col-lg-6">
                                 <div class="panel-body">
                                    <div class="form-group">
                                       <label>Time</label>
                                       <div class="form-group input-group">
                                          <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                          <asp:TextBox runat="Server" ID="txt_time" placeholder="Time" Text='0.0' 
                                               class="form-control" Required TextMode="Number"></asp:TextBox>
                                       </div>
                                    </div>
                                    <div class="form-group">
                                       <label>Meridiem</label>
                                       <asp:DropDownList ID="ddl_Time" runat="server" class="form-control">
                                          <asp:ListItem Value="AM" Selected="True">AM</asp:ListItem>
                                          <asp:ListItem Value="PM">PM</asp:ListItem>
                                       </asp:DropDownList>
                                    </div>
                                 </div>
                                 <!-- /.panel-body -->
                              </div>
                              <!-- /. Right Panel -->
                           </div>
                           <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                     </div>
                  </div>
                  <div class="row">
                     <!-- /. Left Panel -->
                     <div class="col-lg-6">
                        <div class="panel panel-info">
                           <div class="panel-heading">
                              <i class="fa fa-clock-o fa-fw"></i> Bridegroom Details
                           </div>
                           <!-- /.panel-heading -->
                           <div class="panel-body">
                              <div class="form-group">
                                 <label>Bridegroom Name</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BrideGroomName" placeholder="Bridegroom Name" class="form-control" Required></asp:TextBox>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label>Age</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BGAge" placeholder="Bridegroom Age" 
                                         class="form-control" Required MaxLength="10" TextMode="Number"></asp:TextBox>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label> Home Address</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BGHomeAddress" placeholder="BrideGroom's Home Address" class="form-control" TextMode="MultiLine" Required></asp:TextBox>
                                    <%--<textarea rows="3" class="form-control" style="width: 429px; height: 40px;"></textarea>--%>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label>Personal address</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BGPersonaladdress" placeholder="BrideGroom's Personal Address" class="form-control" TextMode="MultiLine" Required></asp:TextBox>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label> City</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BGCity" placeholder="City" class="form-control" Required></asp:TextBox>
                                 </div>
                              </div>
                               <div class="form-group">
                                 <label> District</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BGDistrict" placeholder="District" class="form-control" Required></asp:TextBox>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label>State</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BGState" placeholder="State" class="form-control" Required></asp:TextBox>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label>Country</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BGCountry" placeholder="Country" class="form-control" required></asp:TextBox>
                                 </div>
                              </div>
                               <div class="form-group">
                                 <label>Pin</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BGPin" placeholder="Pin" 
                                         class="form-control" Required MaxLength="10" TextMode="Number"></asp:TextBox>
                                 </div>
                              </div>
                               <div class="form-group">
                                 <label>Mobile</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BGMobile" placeholder="Mobile" 
                                         class="form-control" Required MaxLength="10"></asp:TextBox>
                                 </div>
                              </div>
                               <div class="form-group">
                                 <label>Email</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_Email" placeholder="Email" class="form-control" Required></asp:TextBox>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label> Father's Name</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BridegroomFather" placeholder="Bridegroom's Father Name" class="form-control"  Required></asp:TextBox>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label>Mother's Name</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BGMother" placeholder="Bridegroom's Mother's Name" class="form-control" Required></asp:TextBox>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label>Birth Date</label>
                                 <div class='input-group date' id='bridegroomBirthDate' data-provide="datepicker" data-date-format="dd/mm/yyyy" data-date-autoclose="true">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BirdeGroomBirthDate" placeholder="Bridegroom's Birth Date" type='text' class="form-control" Required></asp:TextBox>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label>Occupation</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BGOccupation" placeholder="Occupation" class="form-control" Required></asp:TextBox>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label>Religion</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BGReligion" placeholder="Religion" class="form-control" Required></asp:TextBox>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label>Caste</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BGCaste" placeholder="Caste" class="form-control" Required></asp:TextBox>
                                 </div>
                              </div>
                              
                             
                            
                              <div class="form-group">
                                 <label>Person</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BGPerson" placeholder="Person" class="form-control" Required></asp:TextBox>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label>Relation</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BGRelation" placeholder="Relation" class="form-control" Required></asp:TextBox>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label>Witness</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BGWitness" placeholder="Witness" class="form-control" Required></asp:TextBox>
                                 </div>
                              </div>
                              <!-- /.panel-body -->
                           </div>
                        </div>
                     </div>
                     <!-- /. Left Panel -->
                     <!-- /. Right Panel -->
                     <div class="col-lg-6">
                        <div class="panel panel-info">
                           <div class="panel-heading">
                              <i class="fa fa-clock-o fa-fw"></i> Bride Details
                           </div>
                           <!-- /.panel-heading -->
                           <div class="panel-body">
                              <div class="form-group">
                                 <label>Bride Name</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BrideName" placeholder="Bride Name" class="form-control"></asp:TextBox>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label>Age</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BAge" placeholder="Age" class="form-control" 
                                         TextMode="Number"></asp:TextBox>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label> Home Address</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BAddress1" placeholder="Bride Home Address" class="form-control" TextMode="MultiLine"></asp:TextBox>
                                    <%--<textarea rows="3" class="form-control" style="width: 429px; height: 40px;"></textarea>--%>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label>Personal address</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BAddress2" placeholder="Bride Personal Address" class="form-control" TextMode="MultiLine"></asp:TextBox>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label> City</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BCity" placeholder="City" class="form-control"></asp:TextBox>
                                 </div>
                              </div>
                               <div class="form-group">
                                 <label> District</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BDistrict" placeholder="District" class="form-control"></asp:TextBox>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label>State</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BState" placeholder="State" class="form-control"></asp:TextBox>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label>Country</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BCountry" placeholder="Country" class="form-control"></asp:TextBox>
                                 </div>
                              </div>
                               <div class="form-group">
                                 <label>Pin</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BPin" placeholder="Pin" class="form-control" 
                                         MaxLength="6" TextMode="Number"></asp:TextBox>
                                 </div>
                              </div>
                               <div class="form-group">
                                 <label>Mobile</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BMobile" placeholder="Mobile" 
                                         class="form-control" MaxLength="10" TextMode="Number"></asp:TextBox>
                                 </div>
                              </div>
                               <div class="form-group">
                                 <label>Email</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BEmail" placeholder="Email" 
                                         class="form-control" TextMode="Email"></asp:TextBox>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label>Father's Name</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BrideFather" placeholder="Bride's Father Name" class="form-control"></asp:TextBox>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label>Mother's Name</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BMother" placeholder="Bride's Mother's Name" class="form-control"></asp:TextBox>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label>Birth Date</label>
                                 <div class='input-group date' id='brideBirthDate' data-provide="datepicker" data-date-format="dd/mm/yyyy" data-date-autoclose="true">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BrideBirthDate" placeholder="Bride's Birth Date" class="form-control"></asp:TextBox>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label>Occupation</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BOccupation" placeholder="Occupation" class="form-control"></asp:TextBox>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label>Religion</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BReligion" placeholder="Religion" class="form-control"></asp:TextBox>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label>Caste</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BCaste" placeholder="Caste" class="form-control"></asp:TextBox>
                                 </div>
                              </div>

                              <div class="form-group">
                              <div class="form-group">
                                 <label>Person</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BPerson" placeholder="Person" class="form-control"></asp:TextBox>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label>Religion</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BRelation" placeholder="Relation" class="form-control"></asp:TextBox>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label>Witness</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BWitness" placeholder="Witness" class="form-control"></asp:TextBox>
                                 </div>
                              </div>
                           </div>
                           <!-- /.panel-body -->
                        </div>
                        <!-- /.panel -->
                     </div>
                     <!-- /. Right Panel -->
                  </div>
               
                   </div>
                    <div class="row">
                           <div class="col-lg-3">
                           </div>
                           <div class="col-lg-6">
                              <div class="form-group">
                                 <div class="form-group input-group">
                                  <asp:Button runat="server" ID="btn_Save" Text="Save" class="btn btn-outline btn-success"
                                       style="margin-left: 103px; margin-top: 15px" onclick="btn_Save_Click" />

                                 <%--   <asp:Button runat="server" ID="btn_isfreezed" Text="IsFreezed" class="btn btn-outline btn-success"
                                       style="margin-left: 103px; margin-top: 15px" onclick="btn_isfreezed_Click" />--%>
                                  <%--  <asp:Button runat="server" ID="Button2" Text="Cancel" class="btn btn-outline btn-danger"
                                       style="margin-top: 15px; margin-left: 35px;" />--%>
                                 </div>
                              </div>
                           </div>
                           <div class="col-lg-3">
                           </div>
                        </div>
                        </div>
                </div>
            <div id="Panel_Certificate" runat="server" class="row" visible="false">

              <div ID="DIV_Certificate" runat="server" align="center" class="grid"  style="width:100%; margin:auto;">
                <div ID="DIV_MarriageCertificate"  runat="server" align="center" >
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
                            <td align="left" style="text-align: right">
                                &nbsp;</td>
                            <td align="left">
                                &nbsp;</td>
                            <td align="left" style="text-align: right">
                                &nbsp;</td>
                            <td class="style12">
                                <asp:Label ID="lbl_BillType" runat="server" 
                                    style="color: #FF0000; font-weight: 700"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label2" runat="server" Text="Date of Marriage "></asp:Label>
                            </td>
                            <td align="left">
                                <strong>:</strong></td>
                            <td align="left">
                                <asp:Label ID="lbl_MarriageDate" runat="server"></asp:Label>
                            </td>
                            <td align="left" style="text-align: right">
                                &nbsp;</td>
                            <td align="left">
                                <asp:Label ID="Label3" runat="server" Text="Function Time"></asp:Label>
                            </td>
                            <td align="left" style="text-align: right">
                                <strong>:</strong></td>
                            <td class="style12">
                                <asp:Label ID="lbl_MarriageTime" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label5" runat="server" Text="Name of Bride"></asp:Label>
                            </td>
                            <td align="left">
                                <strong>:</strong></td>
                            <td align="left">
                                <asp:Label ID="lbl_BrideName" runat="server"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td class="style12">
                                <asp:Label ID="Label4" runat="server" Text="Name of Bridegroom"></asp:Label>
                            </td>
                            <td style="text-align: right">
                                <strong>:</strong></td>
                            <td class="style12">
                                <asp:Label ID="lbl_BridegroomName" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label6" runat="server" Text=" Date of Birth"></asp:Label>
                            </td>
                            <td align="left">
                                <strong>:</strong></td>
                            <td align="left">
                                <asp:Label ID="lbl_BrideDOB" runat="server"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td class="style12">
                                <asp:Label ID="Label7" runat="server" Text=" Date of Birth"></asp:Label>
                            </td>
                            <td>
                                <strong>:</strong></td>
                            <td class="style12">
                                <asp:Label ID="lbl_BridegroomDOB" runat="server"></asp:Label>
                            </td>
                        </tr>
                         <tr>
                            <td align="left">
                                <asp:Label ID="Label26" runat="server" Text=" Age"></asp:Label>
                            </td>
                            <td align="left">
                                <strong>:</strong></td>
                            <td align="left">
                                <asp:Label ID="lbl_BrideAge" runat="server"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td class="style12">
                                <asp:Label ID="Label33" runat="server" Text=" Age"></asp:Label>
                            </td>
                            <td>
                                <strong>:</strong></td>
                            <td class="style12">
                                <asp:Label ID="lbl_BridegroomAge" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label8" runat="server" Text="Address1"></asp:Label>
                            </td>
                            <td align="left">
                                <strong>:</strong></td>
                            <td align="left">
                                <asp:Label ID="lbl_BrideAddr1" runat="server"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td class="style12">
                                <asp:Label ID="Label9" runat="server" Text="Address1"></asp:Label>
                            </td>
                            <td>
                                <strong>:</strong></td>
                            <td class="style12">
                                <asp:Label ID="lbl_BridegroomAddr1" runat="server"></asp:Label>
                            </td>
                        </tr>
                           <tr>
                            <td align="left">
                                <asp:Label ID="Label28" runat="server" Text="Address2"></asp:Label>
                            </td>
                            <td align="left">
                                <strong>:</strong></td>
                            <td align="left">
                                <asp:Label ID="lbl_BrideAddr2" runat="server"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td class="style12">
                                <asp:Label ID="Label35" runat="server" Text="Address2"></asp:Label>
                            </td>
                            <td>
                                <strong>:</strong></td>
                            <td class="style12">
                                <asp:Label ID="lbl_BridegroomAddr2" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label10" runat="server" Text="Religion"></asp:Label>
                            </td>
                            <td align="left">
                                <strong>:</strong></td>
                            <td align="left">
                                <asp:Label ID="lbl_BrideReligion" runat="server"></asp:Label>
                            </td>
                            <td>
                            </td>
                            <td class="style12">
                                <asp:Label ID="Label11" runat="server" Text="Religion"></asp:Label>
                            </td>
                            <td>
                                <strong>:</strong></td>
                            <td class="style12">
                                <asp:Label ID="lbl_BridegroomReligion" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label12" runat="server" Text="Caste"></asp:Label>
                            </td>
                            <td align="left">
                                <strong>:</strong></td>
                            <td align="left">
                                <asp:Label ID="lbl_BrideCaste" runat="server"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td class="style12">
                                <asp:Label ID="Label13" runat="server" Text="Caste"></asp:Label>
                            </td>
                            <td>
                                <strong>:</strong></td>
                            <td class="style12">
                                <asp:Label ID="lbl_BridegroomCaste" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label14" runat="server" Text="Occupation"></asp:Label>
                            </td>
                            <td align="left">
                                <strong>:</strong></td>
                            <td align="left">
                                <asp:Label ID="lbl_BrideOccupation" runat="server"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td class="style12">
                                <asp:Label ID="Label16" runat="server" Text="Occupation"></asp:Label>
                            </td>
                            <td>
                                <strong>:</strong></td>
                            <td class="style12">
                                <asp:Label ID="lbl_BridegroomOccup" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label15" runat="server" Text="Name of Father"></asp:Label>
                            </td>
                            <td align="left">
                                <strong>:</strong></td>
                            <td align="left">
                                <asp:Label ID="lbl_BrideFather" runat="server"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td class="style12">
                                <asp:Label ID="Label17" runat="server" Text="Name of Father"></asp:Label>
                            </td>
                            <td>
                                <strong>:</strong></td>
                            <td class="style12">
                                <asp:Label ID="lbl_BridegoomFather" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label18" runat="server" Text="Mother"></asp:Label>
                            </td>
                            <td align="left">
                                <strong>:</strong></td>
                            <td align="left">
                                <asp:Label ID="lbl_BrideMother" runat="server"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td class="style12">
                                <asp:Label ID="Label19" runat="server" Text="Mother"></asp:Label>
                            </td>
                            <td>
                                <strong>:</strong></td>
                            <td class="style12">
                                <asp:Label ID="lbl_BridegroomMother" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="7" class="style12">
                                <asp:Label ID="Label22" runat="server" 
                                    Text="Name and Relation of Person Performed the Marriage Ceremony" 
                                    style="color: #0099FF; font-weight: 700"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label21" runat="server" Text="Name"></asp:Label>
                            </td>
                            <td align="left">
                                <strong>:</strong></td>
                            <td align="left">
                                <asp:Label ID="lbl_BridePerson" runat="server"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td class="style12">
                                <asp:Label ID="Label20" runat="server" Text="Name"></asp:Label>
                            </td>
                            <td>
                                <strong>:</strong></td>
                            <td class="style12">
                                <asp:Label ID="lbl_BridegroomPerson" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label23" runat="server" Text="Relation "></asp:Label>
                            </td>
                            <td align="left">
                                <strong>:</strong></td>
                            <td align="left">
                                <asp:Label ID="lbl_BrideRelation" runat="server"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td class="style12">
                                <asp:Label ID="Label24" runat="server" Text="Relation "></asp:Label>
                            </td>
                            <td>
                                <strong>:</strong></td>
                            <td class="style12">
                                <asp:Label ID="lbl_BridegroomRelation" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label25" runat="server" Text="Signature of Bride"></asp:Label>
                            </td>
                            <td align="left">
                                <strong>:</strong></td>
                            <td align="left">
                                 <asp:Image runat="server" ID="img_BrideSign" ImageUrl="" CssClass="kailas-certificate-img-sign" />
                            </td>
                            <td>
                                &nbsp;</td>
                            <td class="style12">
                                <asp:Label ID="Label27" runat="server" Text="Signature of Bridegroom"></asp:Label>
                            </td>
                            <td>
                                <strong>:</strong></td>
                            <td class="style12">
                                 
                                     <asp:Image ID="img_Brgsign" runat="server" CssClass="kailas-certificate-img-sign" />
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label29" runat="server" Text="Witness 1)"></asp:Label>
                            </td>
                            <td align="left">
                                <strong>:</strong></td>
                            <td align="left">
                             <asp:Label ID="lbl_BrideWitness1" runat="server"></asp:Label>
                            </td>
                            <td>
                                &nbsp;</td>
                            <td class="style12">
                                <asp:Label ID="Label30" runat="server" Text="Witness    2)"></asp:Label>
                            </td>
                            <td>
                                <strong>:</strong></td>
                            <td class="style12">
                                <asp:Label ID="lbl_BridegroomWitness1" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="left">
                                <asp:Label ID="Label42" runat="server" Text="Signature"></asp:Label>
                            </td>
                            <td align="left">
                                <strong>:</strong></td>
                            <td align="left">
                               <asp:Image ID="img_BrWitSign" runat="server" ImageUrl="" CssClass="kailas-certificate-img-sign" />
                            </td>
                            <td>
                                &nbsp;</td>
                            <td class="style12">
                                <asp:Label ID="Label43" runat="server" Text="Signature"></asp:Label>
                            </td>
                            <td>
                                <strong>:</strong></td>
                            <td class="style12">
                                <asp:Image ID="img_BrgWitsign" runat="server" CssClass="kailas-certificate-img-sign" />
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
                                <asp:Label ID="lbl_BillDate" runat="server"></asp:Label>
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
                  </div>
                <br />
            </fieldset>
            <br />
            <br />
             <asp:Button runat="server" ID="btn_Print" Text="Print" align="center" class="btn btn-outline btn-success"
                                       style="margin-left: 103px; margin-top: 15px" onclick="btn_Print_Click" />
        </div>
         
                </div>
            </ContentTemplate>
         </asp:UpdatePanel>
      </form>
   </div>
   <script type="text/javascript">
       function CallPrint() {
           var res = document.getElementById('<%=Panel_Certificate.ClientID%>');
           var contentFormat = "<style>td{font-family:verdana;font-size:10px }th{font-family:Times New Roman;font-size:11px;font-weight:bold font-color:Red}</style><table width=\"100%\" cellpadding=\"0\" cellspacing=\"0\"><tr><td align=\"center\" valign=\"top\" style= </div>\"font-family:verdana; font-size:14px; font-weight:normal\">" + "</td></tr><tr><td align=\"left\" valign=\"top\" style=\"font-family:verdana; font-size:12px;height:24px; font-weight:normal\"> " + "</td></tr><tr><td align=\"left\" valign=\"top\"><h2>" + document.getElementById('<%=btn_Print.ClientID%>').innerHTML + '</h2><br />' + res.innerHTML + "</td></tr></table>"
           var WinPrint = window.open('', '', 'scrollbars,left=0,top=0,width=1024,height=700,status=0');
           WinPrint.document.write(contentFormat);
           WinPrint.document.close();
           WinPrint.focus();
           WinPrint.print();

       }
   </script> 
</asp:Content>
