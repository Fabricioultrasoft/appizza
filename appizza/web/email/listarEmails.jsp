<%-- 
    Document   : listarEmails
    Created on : 01/06/2014, 03:35:32
    Author     : Antonio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../_res/css/style.css" type="text/css" rel="stylesheet" />
        <title>Appizza</title>
    </head>
    <body>

        <%@include file="../_templates/header.jsp" %>
        <main>
            <div class="center">
                <h1 id="listaEmails">Lista de e-mails de clientes</h1>
                <table class="main-table">
                    <tr><th>Seleção</th><th>Nome do Cliente</th><th>E-mail do Cliente</th></tr>
                </table>
                    
            </div>
            
        </main>
        <%@include file="../_templates/footer.jsp" %>
    </body>
</html>