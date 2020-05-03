<%@ Page Title="" Language="C#" MasterPageFile="~/Core/Masters/Admin.Master" AutoEventWireup="true" CodeBehind="AccessAuthentication.aspx.cs" Inherits="KAILAS_CS.Core.Src.Admin.AccessAuthentication" %>
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
                     <h1 class="page-header">User Details</h1>
                  </div>
                  <!-- /.col-lg-12 -->
               </div>
               <!-- /.row -->
               <div class="row">
                  <div class="col-lg-12">
                     <div class="panel panel-info">
                        <div class="panel-heading">
                           <i class="glyphicon glyphicon-pencil"></i> User Details
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                           <!-- /. Left Panel -->
                           <div class="col-lg-6">
                              <div class="panel-body">
       
                                 <div class="form-group">
                                 <label>First Name </label>
                                    <div class="form-group input-group">
                                       <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                       <asp:TextBox runat="Server" ID="txt_FirstName" placeholder="First Name" class="form-control"></asp:TextBox>
                                    </div>
                                 </div>
                                   <div class="form-group">
                                   <label>Registration Date </label>
                                    <div class='input-group date' id='RegDate'   data-provide="datepicker" data-date-format="dd/mm/yyyy" data-date-autoclose="true">
                                       <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                       <asp:TextBox runat="Server" ID="txt_RegDate" placeholder="Registration Date" 
                                          class="form-control" ></asp:TextBox>
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
                                 <label>Last Name </label>
                                    <div class="form-group input-group">
                                       <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                       <asp:TextBox runat="Server" ID="txt_LastName" placeholder="Last Name" class="form-control"></asp:TextBox>
                                    </div>
                                 </div>
                                 <div class="form-group">
                                 <label>Mobile </label>
                                   <div class="form-group input-group">
                                       <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                       <asp:TextBox runat="Server" ID="txt_Mobile" placeholder="Mobile" class="form-control"></asp:TextBox>
                                    </div>

                                  </div>
                               <%--  <div class="form-group">
                                     <label>Satus </label>
                                       <asp:DropDownList ID="ddl_Status" runat="server" class="form-control">
                                          <asp:ListItem Value="Accepted" Selected="True">Accepted</asp:ListItem>
                                          <asp:ListItem Value="Rejected">Rejected</asp:ListItem>
                                       </asp:DropDownList>
                                 </div>--%>
                                
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
                                 <asp:Button runat="server" ID="btn_Submit" Text="Submit" 
                                    style="margin-left: 184px; margin-top: 15px" onclick="btn_Submit_Click" />
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
                    <div id="Panel_UserHistory" class="row" runat="server">
                  <div class="col-lg-12">
                     <div class="panel panel-info">
                        <div class="panel-heading">
                           <i class="glyphicon glyphicon-list"></i> User Details
                        </div>
                        <!-- /.panel-heading -->
                        <div class="panel-body">
                           <div class="table-responsive">
                              <%-- <GridView class="table table-striped table-bordered table-hover" id="gd_Details">--%>
                              <asp:GridView ID="gdUserHistory" runat="server" 
                                   class="table table-striped table-bordered table-hover" 
                                   AutoGenerateColumns="false" onrowcommand="gdUserHistory_RowCommand" >
                             
                                 <Columns>
                                <asp:BoundField DataField="FirstName" HeaderText="FirstName" />
                                <%-- <asp:BoundField DataField="EventType" HeaderText="EventType" />--%>
                                  <asp:BoundField DataField="LastName" HeaderText="LastName" />

                                  
                                     <asp:TemplateField>
                                     <ItemTemplate>
                                      <asp:LinkButton ID="LinkSelect" runat="server" CommandName="SelectRequest" CommandArgument='<%#Eval("GUID") %>' Text="select"> 
                                      </asp:LinkButton>
                                   </ItemTemplate>
                                   </asp:TemplateField>
                                </Columns>
                                 </asp:GridView>
                           </div>
                        </div>

                     </div>
                            <div id="DIV_UserDetails" class="panel panel-info" runat="server" visible="false">
                        <div class="panel-heading">
                           <h4 class="panel-title">
                             <div data-toggle="collapse" data-parent="#accordion" href="#DIV_BookingDetails">User Details</div>
                            <h4>
                            </h4>
                            </div>

                    <%-- <div id="Div_BookingData" class="panel-collapse collapse">--%>
                        <div class="panel-body">
                           <!-- /. Left Panel -->
                           <div class="col-lg-6">
                             
                          <div class="form-group">
                                 <label>FirstName</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_UserFirstName" placeholder="First Name" 
                                         class="form-control" disabled="true" ></asp:TextBox>
                                 </div>
                              </div>
                               <div class="form-group">
                                 <label> Mobile</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_UserMobile" placeholder=" Mobile" 
                                         class="form-control" disabled="true" ></asp:TextBox>
                                 </div>
                              </div>
                           
                              </div>
                             
                            
                            <div class="col-lg-6">
                               <div class="form-group">
                                       <label>Last Name</label>
                                       <div class="form-group input-group">
                                          <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                          <asp:TextBox runat="Server" ID="txt_UserLastName" placeholder="Last Name" class="form-control" disabled="true" ></asp:TextBox>
                                       </div>
                                    </div>
                                      <div class="form-group">
                                       <label>Status</label>
                                       <asp:DropDownList ID="ddl_Status" runat="server" class="form-control">
                                       <asp:ListItem Value="-1"  Selected= "True" >-1</asp:ListItem>
                                          <asp:ListItem Value="Approved" >Approved</asp:ListItem>
                                          <asp:ListItem Value="Rejected">Rejected</asp:ListItem>
                                       </asp:DropDownList>
                                    </div>                         
                            
                              </div>

                               
                               
                              </div>
                                   <div class="panel-footer">
                                   <div class="form-group">
                                   <div class="form-group input-group">
                                   <asp:Button runat="server" ID="btn_Ok" Text="Ok" 
                                    style="margin-left: 184px; margin-top: 15px" onclick="btn_Ok_Click" />
                                   <asp:Button runat="server" ID="btn_Cance" Text="Cancel" 
                                    style="margin-left: 184px; margin-top: 15px"/>
                              </div>
                           </div>
                        </div>

<%--                            </div>--%>

                  </div>
               </div>
               <!-- /.row -->
               
                    <%-- me--%>
                  </div>
               </div>
               <!-- /.row -->
            </ContentTemplate>
         </asp:UpdatePanel>
      </form>
   </div>
</asp:Content>
