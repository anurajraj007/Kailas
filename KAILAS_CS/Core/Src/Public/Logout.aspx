<%@ Page Title="" Language="C#" MasterPageFile="~/Core/Masters/Main.Master" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="KAILAS_CS.Core.Src.Public.Logout" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<script type="text/jscript">
    function noBack() {
  window.history.forward()
}
noBack();
window.onload = noBack;
window.onpageshow = function (evt) {
if(evt.persisted)noBack()
}
window.onunload = function () { void (0) }
</script>
</asp:Content>
