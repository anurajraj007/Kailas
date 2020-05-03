<%@ Page Title="" Language="C#" MasterPageFile="~/Core/Masters/Public.Master" AutoEventWireup="true" CodeBehind="UserProfileDetails.aspx.cs" Inherits="KAILAS_CS.Core.Src.User.UserProfileDetails" %>
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
                <div class="panel panel-info">
                        
                    <div class="panel-heading">
                        <i class="fa fa-clock-o fa-fw"></i> Contact Details
                    </div>
                    <!-- /.panel-heading -->
                    <div class="panel-body">
                        <!-- /. Left Panel -->
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label>First Name</label>
                                <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_FirstName" placeholder="First Name" class="form-control" Required></asp:TextBox>
                                </div>
                            </div>

                             <div class="form-group">
                                <label>Home Address</label>
                                <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_HomeAddress" placeholder="Home address" class="form-control"  Required></asp:TextBox>
                                    <%--<textarea rows="3" class="form-control" style="width: 429px; height: 40px;"></textarea>--%>
                                </div>
                            </div>
                         
                            <div class="form-group">
                                <label>City</label>
                                <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_City" placeholder="City" class="form-control" Required></asp:TextBox>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label>State</label>
                                <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_State" placeholder="State" class="form-control" Required></asp:TextBox>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label>Pin</label>
                                <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_Pin" placeholder="Pin" 
                                        class="form-control"  MinLength="6" MaxLength="6" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                             
                            <div class="form-group">
                                <label>Email</label>
                                <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_Email" placeholder="Email" 
                                        class="form-control" disabled="true" TextMode="Email"></asp:TextBox>
                                </div>
                            </div>
                      
                             <div class="form-group">
                                <label>Gender</label>
                                <asp:DropDownList ID="ddl_Gender" runat="server" class="form-control">
                                    <asp:ListItem Value="-1">Select</asp:ListItem>
                                    <asp:ListItem Value="Male">Male</asp:ListItem>
                                    <asp:ListItem Value="Female">Female</asp:ListItem>
                                  
                                </asp:DropDownList>
                            </div>
                            </div>
                    
                        <!-- /. Left Panel -->

                        <!-- /. Right Panel -->
                        <div class="col-lg-6">
                            <div class="form-group">
                                <label>Last Name</label>
                                <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_LastName" placeholder="Last Name" class="form-control" Required></asp:TextBox>
                                </div>
                            </div>
                         
                            
                             
                             <div class="form-group">
                                <label>Business Address</label>
                                <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_Businessaddress" 
                                        placeholder="Business address" class="form-control"  ></asp:TextBox>
                                    <%--<textarea rows="3" class="form-control" style="width: 429px; height: 40px;"></textarea>--%>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label>District</label>
                                <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_District" placeholder="District" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                            
                            <div class="form-group">
                                <label>Country</label>
                                <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_Country" placeholder="Country" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                          
                            <div class="form-group">
                                <label>Phone</label>
                                <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_Phone" placeholder="Phone" 
                                        class="form-control" MinLength="10" MaxLength="10" TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                           
                            <div class="form-group">
                                <label>Mobile</label>
                                <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_Mobile" placeholder="Mobile" 
                                        class="form-control"  MinLength="10" MaxLength="10" Reguired TextMode="Number"></asp:TextBox>
                                </div>
                            </div>
                              <div class="form-group">
                                <label> Birth Date</label>
                                                
                                 <div class='input-group date' id='brideBirthDate' data-provide="datepicker" data-date-format="dd/mm/yyyy" data-date-autoclose="true">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-calendar"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_BirthDate" placeholder="Bride's Birth Date" class="form-control"></asp:TextBox>
                                 </div>
                            </div>
                        </div>
                        <!-- /. Right Panel -->
                    </div>
                    <!-- /.panel-body -->
               </div>
                <!-- /.panel -->
        
       
         <div class="panel-footer">
   <div class="form-group">
            <div class="form-group input-group">
                <asp:Button runat="server" ID="btn_Submit" Text="Submit"  
                    style="margin-left: 184px; margin-top: 15px" 
                   class="btn btn-outline btn-success btn-lg" onclick="btn_Submit_Click" data-toggle="modal" data-target="#compose-modal" />
                     <asp:Button runat="server" ID="btn_Cancel" Text="Cancel" 
                    style="margin-left: 184px; margin-top: 15px" 
                    class="btn btn-outline btn-success btn-lg" onclick="btn_Cancel_Click" data-toggle="modal" data-target="#compose-modal" />
            </div>
        </div>
                        </div>
                        </div>
                        </div>
                        </div>
                       
                        
         </ContentTemplate>
  </asp:UpdatePanel>
    </form>
    
    </div>
</asp:Content>
