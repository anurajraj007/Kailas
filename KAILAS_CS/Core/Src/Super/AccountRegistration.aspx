<%@ Page Title="" Language="C#" MasterPageFile="~/Core/Masters/Super.Master" AutoEventWireup="true" CodeBehind="AccountRegistration.aspx.cs" Inherits="KAILAS_CS.Core.Src.Super.AccountRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div id="page_wrapper" runat="server" class="page-wrapper" style="min-height: 364px;">
      <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
      <asp:UpdatePanel ID="update_panel1"  runat="server">
         <contenttemplate>
            <div class="row">
               <div class="col-lg-12">
                  <h1 class="page-header">Account Registration</h1>
               </div>
               <!-- /.col-lg-12 -->
            </div>
            <!-- /.row -->
            <div class="row">
               <div class="col-lg-12">
                  <div class="panel panel-info">
                     <div class="panel-heading">
                        <i class="glyphicon glyphicon-edit"></i> Admin Details
                     </div>
                     <!-- /.panel-heading -->
                     <div class="panel-body">
                        <!-- /. Left Panel -->
                        <div class="col-lg-6">
                           <div class="panel-body">
                              <div class="form-group">
                                 <label>Designation</label>
                                 <div class="form-group">
                                    <asp:DropDownList ID="ddl_Designation" runat="server" AutoPostBack="true" 
                                       class="form-control" style="margin-left: 1px">
                                       <asp:ListItem Selected="True" Text="Select Designation" Value="-1"></asp:ListItem>
                                       <asp:ListItem Value="1" Text="Admin. Officer"></asp:ListItem>
                                       <asp:ListItem Value="2" Text="Asst. Admin. Officer"></asp:ListItem>
                                       <asp:ListItem Value="3" Text="Accounts Officer"></asp:ListItem>
                                       <asp:ListItem Value="4" Text="Manager"></asp:ListItem>
                                       <asp:ListItem Value="5" Text="Office Executive"></asp:ListItem>
                                       <asp:ListItem Value="6" Text="Clerk"></asp:ListItem>
                                    </asp:DropDownList>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label>Email</label>
                                 <div class='input-group input-group'>
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_Email" placeholder="Official Email" class="form-control" Required></asp:TextBox>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label>Nature of Works</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_Remarks" placeholder="Remarks" class="form-control" TextMode="MultiLine" Required></asp:TextBox>
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
                                 <label>Position Name</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_Name" placeholder="Name" class="form-control" Required></asp:TextBox>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label>Mobile</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_Mobile" placeholder="Official Mobile Number" class="form-control" Required ></asp:TextBox>
                                 </div>
                              </div>
                              <div class="form-group">
                                 <label>Description</label>
                                 <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_Description" placeholder="Description" class="form-control" TextMode="MultiLine" Required></asp:TextBox>
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
                        <div class="row">
                           <div class="col-lg-12">
                              <div class="form-group">
                                 <asp:Button runat="server" ID="btn_Cancel" Text="Cancel" 
                                      class="btn btn-outline btn-danger pull-left" onclick="btn_Cancel_Click" />
                                 <asp:Button runat="server" ID="btn_Submit" Text="Save" 
                                      class="btn btn-outline btn-success pull-right" onclick="btn_Submit_Click" />
                              </div>
                           </div>
                        </div>
                     </div>
                     <!-- / Panel Footer-->
                  </div>
                  <!-- /.panel -->
               </div>
            </div>
            <!-- /.row -->
         </ContentTemplate>
      </asp:UpdatePanel>
   </div>
</asp:Content>