<%@ Page Title="" Language="C#" MasterPageFile="~/Core/Masters/Main.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="KAILAS_CS.Core.Src.Public.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script type="text/javascript">
//$(document).ready(function () {
    $('[data-toggle="tooltip"]').tooltip();

    function PopupDialog(message) {
        bootbox.alert(message, function () {
        });
    };
//});
</script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div id="Div1" runat="server"  style="min-height: 364px;">
      <div class="login-panel panel panel-info">
         <div class="panel-heading">
            <h3 class="panel-title">Please Sign In</h3>
         </div>
         <div class="panel-body">
            <div class="form-group">
               <label>Username</label>
               <div class="form-group input-group">
                  <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                  <asp:TextBox runat="Server" ID="txt_Email" data-val="true" data-val-required="The Email field is required." placeholder="Username" class="form-control" required="required"></asp:TextBox>
               </div>
            </div>
            <div class="form-group">
               <label>Password</label>
               <div class="form-group input-group">
                  <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                  <asp:TextBox runat="Server" ID="txt_Password" placeholder="Password" class="form-control" required="required" TextMode="Password"></asp:TextBox>
               </div>
            </div>
            <div class="form-group">
               <div class="form-group input-group">
                  <asp:Button runat="server" ID="btn_Login" Text="Login" class="btn btn-outline btn-success btn-lg btn-block"
                     style="margin-top: 15px" onclick="btn_Login_Click" data-toggle="modal" data-target="#compose-modal" />
                  <br /><br />
                  <a href="Registration.aspx">Register</a> if you don't have an account
               </div>
            </div>
         </div>
      </div>
   </div>
</asp:Content>