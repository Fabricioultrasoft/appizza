<%-- 
    Document   : scriptCommentFace
    Created on : 31/05/2014, 21:09:47
    Author     : Antonio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/pt_BR/sdk.js#xfbml=1&version=v2.0";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>