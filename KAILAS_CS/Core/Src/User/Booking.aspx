<%@ Page Title="" Language="C#" MasterPageFile="~/Core/Masters/User.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="KAILAS_CS.Core.Src.User.Booking" %>
<%@ Register TagPrefix="ECalendar" Namespace="ExtendedControls" Assembly="EventCalendar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="page_wrapper" runat="server" class="page-wrapper" style="min-height: 364px;">
        <form runat="server" id="form1">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
        <asp:UpdatePanel ID="update_panel1"  runat="server">
        <contenttemplate>
        <div >
           <div class="row">
            <div class="col-lg-12">
                <h1 class="page-header">Booking</h1>
            </div>
            <!-- /.col-lg-12 -->
          </div>
          <!-- /.row -->
          <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <i class="fa fa-clock-o fa-fw"></i> Event Details
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <div>
                              <ECalendar:EventCalendar ID="ECalendar_Function" CssClass="event-calendar-month-header" runat="server" BackColor="White"  
                                  BorderStyle="Solid" CellSpacing="1"  BorderColor="Black"  
                                    Font-Size="Large" ForeColor="Black" Height="250px" Width="100%"  
                                  SelectedDayStyle-BackColor="Cyan" OnDayRender="ECalendar_Function_DayRender" 
                                 FirstDayOfWeek="Monday" NextMonthText="Next &gt;"  
                                  NextPrevFormat="FullMonth" ShowDescriptionAsToolTip="True" 
                                 EventDateColumnName="Function_Date" 
                                  EventDescriptionColumnName="Function_Type"   EventHeaderColumnName=""  OnSelectionChanged="ECalendar_Function_SelectionChanged"  
                                  CaptionAlign="Top" DayNameFormat="Full" Font-Bold="True" 
                                  Font-Names="Times New Roman" ToolTip="Calendar">
                                  <DayHeaderStyle CssClass="event-calendar-day-header" />
                                  <DayStyle BackColor="#CCCCCC" />
                                  <NextPrevStyle CssClass="event-calendar-next-prev" Font-Bold="True" Font-Size="Large" VerticalAlign="Middle" ForeColor="White" />
                                  <OtherMonthDayStyle ForeColor="#999999" />
                                  <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                  <TitleStyle BackColor="SkyBlue" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" 
                                  Font-Size="12pt" ForeColor="White" Height="12pt" />
                                <TodayDayStyle BackColor="Goldenrod" ForeColor="White" />
                            </ECalendar:EventCalendar>
                        </div>
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
        </div>
          <!-- /.row -->
          
          <div class="row">
            <div class="col-lg-12">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <i class="fa fa-clock-o fa-fw"></i> Booking Details
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <!-- /. Left Panel -->
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label>Select Event</label>
                                <asp:DropDownList ID="ddl_Event" runat="server" AutoPostBack="true" 
                                    class="form-control" onselectedindexchanged="ddl_Event_SelectedIndexChanged">
                                    <asp:ListItem Value="-1">Select</asp:ListItem>
                                    <asp:ListItem Value="1">Wedding Ceremony</asp:ListItem>
                                    <asp:ListItem Value="2">Wedding Reception</asp:ListItem>
                                    <asp:ListItem Value="3">Engagement Function</asp:ListItem>
                                    <asp:ListItem Value="4">Meeting</asp:ListItem>
                                    <asp:ListItem Value="5">Other</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label>Select Session</label>
                                <asp:DropDownList ID="ddl_Session" runat="server" class="form-control">
                                    <asp:ListItem Value="-1">Select</asp:ListItem>
                                    <asp:ListItem Value="Morning">Morning Session</asp:ListItem>
                                    <asp:ListItem Value="Evening_Session">Evening Session</asp:ListItem>
                                    <asp:ListItem Value="Full_Day_Session">Full Day Session</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="form-group">
                                <label>Select Facility</label>
                                <asp:DropDownList ID="ddl_Facility" runat="server" class="form-control">
                                    <asp:ListItem Value="-1">Select</asp:ListItem>
                                    <asp:ListItem Value="Hall">Hall</asp:ListItem>
                                    <asp:ListItem Value="Hall&Food">Hall & Food</asp:ListItem>
                                </asp:DropDownList>
                            </div>

                        </div>
                        <!-- /. Left Panel -->

                        <!-- /. Right Panel -->
                        <div class="col-lg-6">
                             <div class="form-group">
                                <label>Event Date</label>
                                <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_EventDate" placeholder="" class="form-control" disabled></asp:TextBox>
                                </div>
                            </div>
                             <div class="form-group">
                                <label>Expected Guests</label>
                                <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_GuestCount" placeholder="No of Guests" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                             <div class="form-group">
                                <label>Description</label>
                                <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_Description" placeholder="Description if any..." class="form-control" ></asp:TextBox>
                                    <%--<textarea rows="3" class="form-control" style="width: 429px; height: 40px;"></textarea>--%>
                                </div>
                            </div>
                        </div>
                        <!-- /. Right Panel -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
        </div>
          <!-- /.row -->
          <div ID="DIV_MarriageDetails" runat="Server" class="row" visible="false">
            <div class="col-lg-12">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <i class="fa fa-clock-o fa-fw"></i> Marriage Details
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <!-- /. Left Panel -->
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label>Bridegroom Name</label>
                                <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BrideGroomName" placeholder="Bridegroom Name" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Bridegroom's Father Name</label>
                                <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BridegroomFather" placeholder="Bridegroom's Father Name" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Bridgroom's Birth Date</label>
                               <%-- <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BirdeGroomBirthDate" placeholder="" 
                                        class="form-control" TextMode="Date" ></asp:TextBox>
                                </div>--%> 
                                 <div class='input-group date' id='Div2' data-provide="datepicker" data-date-format="dd/mm/yyyy" data-date-autoclose="true">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BirdeGroomBirthDate" placeholder="Bride's Birth Date" class="form-control"></asp:TextBox>
                                 </div>
                            </div>
                        </div>
                        <!-- /. Left Panel -->

                        <!-- /. Right Panel -->
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label>Bride Name</label>
                                <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BrideName" placeholder="Bride Name" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Bride's Father Name</label>
                                <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BrideFather" placeholder="Bride's Father Name" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            <div class="form-group">
                                <label>Bride's Birth Date</label>

                                 <div class='input-group date' id='Div1' data-provide="datepicker" data-date-format="dd/mm/yyyy" data-date-autoclose="true">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BrideBirthDate" placeholder="Bride's Birth Date" class="form-control"></asp:TextBox>
                                 </div>
                            </div>
                        </div>
                        <!-- /. Right Panel -->
                    </div>
                    <!-- /.panel-body -->
                </div>
                <!-- /.panel -->
            </div>
        </div>
        <!-- /.row -->
                            <div class="form-group">
                             <div class="form-group input-group">
                             <asp:Button runat="server" ID="btn_Submit" Text="Submit"  class="btn btn-outline btn-success btn-lg"
                              style="margin-left: 184px; margin-top: 15px" onclick="btn_Submit_Click" data-toggle="modal" data-target="#compose-modal" />
                             <asp:Button runat="server" ID="btn_Cancel" Text="Cancel"   class="btn btn-outline btn-success btn-lg"
                              style="margin-left: 184px; margin-top: 15px" onclick="btn_Cancel_Click" data-toggle="modal" data-target="#compose-modal" />
                             </div>
                            </div>
        </div>
        </ContentTemplate>

        <Triggers>
        <asp:AsyncPostBackTrigger ControlID="ddl_Event" EventName="SelectedIndexChanged" />
        </Triggers>
        </asp:UpdatePanel>
    </form>
    </div>
</asp:Content>
