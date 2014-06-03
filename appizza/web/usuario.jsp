<%-- 
    Document   : index
    Created on : 18/05/2014, 04:17:25
    Author     : Daniel
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="_res/css/style.css" type="text/css" rel="stylesheet" />
        <link rel="stylesheet" href="_res/css/font-awesome.min.css" type="text/css">
        <script src="_res/scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
        <script src="_res/scripts/scripts.js" type="text/javascript"></script>
        <title>Appizza</title>
    </head>
    <body>

        <%@include file="_templates/header.jsp" %>
        <main>
            <div class="center">
                <form class="main-form">
                    <h1>Dados do usuário</h1>
                    <strong>Nome: </strong><%=session.getAttribute("userName")%><br/>
                    <strong>Login: </strong><%=session.getAttribute("userLogin")%><br/>
                    <strong>Privilégio: </strong><%=session.getAttribute("userAccess")%><br/>
                    <strong>Hora do entrada no sistema: </strong><%=new SimpleDateFormat("dd-MM-yyyy hh:mm:ss").format(new Date(session.getCreationTime()))%>
                </form>
                <br/>
                <form class="main-form">
                    <h1>Alterar senha</h1>
                    <label for="password"><strong>Senha:</strong></label><br/>
                    <input type="password" name="password" /><br/>
                    <label for="confirm-password"><strong>Confirmação da senha:</strong></label><br/>
                    <input type="password" name="confirm-password" /><br/>
                    <input type="submit" value="Enviar" />
                </form>
            </div>
        </main>
        <%@include file="_templates/footer.jsp" %>
    </body>
</html>
