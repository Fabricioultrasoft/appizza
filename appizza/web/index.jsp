<%-- 
    Document   : index
    Created on : 18/05/2014, 04:17:25
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="_res/css/style.css" type="text/css" rel="stylesheet" />
        <title>Appizza</title>
    </head>
    <body>

        <%@include file="_templates/header.jsp" %>
        <main>
            <div class="center">
                <form class="main-form" id="clientes-form">
                    <h1>Clientes</h1>
                    <label for="nome">Nome</label><br/><input type="text" id="nome"/><br/>
                    <label for="email">Email</label><br/><input type="text" id="email"/><br/>
                    <label for="senha">Senha</label><br/><input type="text" id="senha"/><br/>
                    <label for="lista">Select </label><br/>
                    <select id="lista">
                        <option>Selecione uma opção</option>
                    </select>
                    <br/>
                    <input type="submit" value="Enviar" />
                </form>
            </div>
            
        </main>
        <%@include file="_templates/footer.jsp" %>
    </body>
</html>
