<%@ Page Title="" Language="C#" MasterPageFile="~/Core/Masters/User.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="KAILAS_CS.Core.Src.User.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div id="page_wrapper" runat="server" class="page-wrapper" style="min-height: 364px;">
        <form runat="server" id="form1">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnablePageMethods="true"></asp:ScriptManager>
        <asp:UpdatePanel ID="update_panel1"  runat="server">
        <contenttemplate>   
          <div class="container">
        <div class="row">
            <div class="col-md-6 col-md-offset-4">
                <div class="login-panel panel panel-info">
                    <div class="panel-heading">
                        <h3 class="panel-title">Change Password</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form">
                            <fieldset>
                              
                                <div class="form-group">
                                <label> Old Password</label>
                                <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_OldPassword" placeholder="password" class="form-control"></asp:TextBox>
                                </div>
                            </div>
                                <div class="form-group">
                                <label>New Password</label>
                                <div class="form-group input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                    <asp:TextBox runat="Server" ID="txt_NewPassword" placeholder="password" class="form-control"></asp:TextBox>
                                </div>
                            </div>

                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               </fieldset>
                           </form>
                    </div>
                </div>
                 <div class="panel-footer">
                           <div class="form-group">
            <div class="form-group input-group">
                <asp:Button runat="server" ID="btn_Submit" Text="OK" class="btn btn-lg btn-success"
                    style="margin-left: 128px; margin-top: 15px" onclick="btn_Submit_Click" 
                    Width="84px" />
                    
                    <asp:Button ID="btn_Cancel" runat="server" class="btn btn-lg btn-success" 
                    style="margin-left: 42px; margin-top: 15px" Text="CANCEL" 
                    onclick="btn_Cancel_Click" />
                    
                    </div>
                    </div>
                        </div>
                     
            </div>
        </div>
    </div>

   </div>  
  </contenttemplate>
         </asp:UpdatePanel>
    </form>      </div>
</asp:Content>
