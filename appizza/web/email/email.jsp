<%-- 
    Document   : email
    Created on : 01/06/2014, 03:19:19
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
                <form class="main-form" id="clientes-form">
                    <input type="hidden" name="id_email"/>
                    <h1>Enviar E-Mails aos Cliente</h1>
                    <label for="remetente">Remetente</label><br/><input type="text" id="remetente" size="70"/><br/>
                    <label for="destinatario">Destinatário(s)</label><br/><input type="text" id="destinatario" size="70"/> <a href="listarEmails.jsp"><img src="../_res/images/busca.gif" alt="Listar E-Mails dos Clientes"></a><br/>
                    <label for="assunto">Assunto</label><br/><input type="text" id="assunto" size="70"/><br/>
                    <label for="mensagem">Mensagem</label><br/><textarea cols="55" rows="10" id="mensagem"></textarea><br>
                    <input type="submit" value="Enviar" />
                </form>
            </div>
            
        </main>
        <%@include file="../_templates/footer.jsp" %>
    </body>
</html>
