<%-- 
    Document   : login
    Created on : 28/05/2014, 00:33:23
    Author     : Daniel
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="net.appizza.res.OracleConnector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String erro = "";
    if(session.getAttribute("userName") == null) {
    if (request.getParameter("user") != null && request.getParameter("password") != null) {
        try {
            ArrayList arr = OracleConnector.getQuery("SELECT NM_USUARIO, NM_PRIVILEGIO_USUARIO FROM USUARIOS WHERE NM_LOGIN_USUARIO = '" + request.getParameter("user") + "' AND CD_SENHA_USUARIO = '" + request.getParameter("password") + "'");
            if (arr.size() > 0) {
                Object[] usuario = (Object[]) arr.get(0);
                session.setAttribute("userLogin", request.getParameter("user"));
                session.setAttribute("userName", usuario[0]);
                session.setAttribute("userAccess", usuario[1]);
                response.sendRedirect("index.jsp");
            } else {
                erro = "Credenciais inválidas!";
            }
        } catch (Exception ex) {
            erro = "Erro ao fazer login: " + ex;
        }
    }
    } else {
        response.sendRedirect(request.getContextPath());
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Appizza - Login</title>
        <link rel="stylesheet" href="_res/css/style.css" type="text/css">
    </head>
    <body>
        <div id="login-box">
            <h1>Appizza</h1>
            <form id="login-form" class="main-form" method="POST">
                <label for="user">Usuário </label><br /><input type="text" name="user"/><br />
                <label for="passwd">Senha </label><br /><input type="password" name="password"/><br />
                <input type="submit" value="Entrar" />
                <%if (!erro.equals("")) {%>
                <span><%=erro%></span>
                <%}%>
            </form>
        </div>
    </body>
</html>
