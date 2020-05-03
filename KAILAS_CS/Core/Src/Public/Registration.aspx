<%@ Page Title="" Language="C#" MasterPageFile="~/Core/Masters/Main.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="KAILAS_CS.Core.Src.Public.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Registration</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
      <div class="login-panel panel panel-default">
         <div class="panel-heading">
            <h3 class="panel-title">Registration</h3>
         </div>
         <div class="panel-body">
            <div class="form-group">
               <label>First Name</label>
               <div class="form-group input-group">
                  <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                  <asp:TextBox runat="Server" ID="txt_FirstName" placeholder="First Name" class="form-control" required="required"></asp:TextBox>
               </div>
            </div>
            <div class="form-group">
               <label>Last Name</label>
               <div class="form-group input-group">
                  <span class="input-group-addon"><i class="glyphicon glyphicon-pencil"></i></span>
                  <asp:TextBox runat="Server" ID="txt_LastName" placeholder="Last Name" class="form-control" required="required"></asp:TextBox>
               </div>
            </div>
            <div class="form-group">
               <label>Email</label>
               <div class="form-group input-group">
                  <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                  <asp:TextBox runat="Server" ID="txt_Email" placeholder="Email" required="required" 
                       class="form-control" TextMode="Email"></asp:TextBox>
               </div>
            </div>
            <div class="form-group">
               <label>Mobile</label>
               <div class="form-group input-group">
                  <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                  <asp:TextBox runat="Server" ID="txt_Mobile" placeholder="Mobile" required="required"
                       class="form-control" MaxLength="10" TextMode="Number"></asp:TextBox>
               </div>
            </div>
            <div class="form-group">
                <div class="form-group input-group">
                    <asp:Button runat="server" ID="btn_Submit" Text="Submit" class="btn btn-outline btn-success"
                        style="margin-left: 103px; margin-top: 15px" onclick="btn_Submit_Click"/>
                    <asp:Button runat="server" ID="btn_Cancel" Text="Cancel" class="btn btn-outline btn-danger" formnovalidate 
                        style="margin-top: 15px; margin-left: 35px;" onclick="btn_Cancel_Click"/>
                </div>
            </div>
         </div>
      </div>
   </div>
</asp:Content>