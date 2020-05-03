<%@ Page Title="" Language="C#" MasterPageFile="~/Core/Masters/Main.Master" AutoEventWireup="true" CodeBehind="Facebook_Test.aspx.cs" Inherits="KAILAS_CS.Core.Public.Facebook_Test" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<%--<div
  class="fb-like"
  data-share="true"
  data-width="450"
  data-show-faces="true">
</div>--%>

<div class="fb-like" data-href="https://developers.facebook.com/docs/plugins/" data-layout="standard" data-action="like" data-show-faces="true" data-share="true"></div>

<div id="fb-root"></div>
<script type="text/javascript">
    (function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&appId=295872143956678&version=v2.0";
        fjs.parentNode.insertBefore(js, fjs);
    } (document, 'script', 'facebook-jssdk'));</script>

</asp:Content>
