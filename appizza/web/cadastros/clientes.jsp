<%-- 
    Document   : clientes
    Created on : 29/05/2014, 13:56:34
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Appizza - Clientes</title>
        <link rel="stylesheet" href="../_res/css/style.css" type="text/css" />
        <link rel="stylesheet" href="../_res/css/font-awesome.min.css" type="text/css">
        <script src="../_res/scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
        <script src="../_res/scripts/scripts.js" type="text/javascript"></script>
    </head>

    <body>
    <%@include file="../_templates/header.jsp" %>
    <main>
        <div class="center">
            <nav id="top-menu">
                <ul>
                    <li class="selected"><a href="#"><i class="fa fa-search"></i>Pesquisa</a></li>
                    <li><a href="#"><i class="fa fa-user"></i>Novo</a></li>
                    <li><a href="#"><i class="fa fa-plus-circle"></i>Novo</a></li>
                </ul>
            </nav>
            <form id="search-form" class="main-form">
                <input type="text" id="search" />
                <input type="submit" value="Filtrar" />
            </form>
            <table class="main-table" cellspacing="0">
                <tr>
                    <th width="10%">Nome</th>
                    <th width="10%">Telefone</th>
                    <th>Endereço</th>
                </tr>
                <tr>
                    <td>Daniel</td>
                    <td>123</td>
                    <td>abc</td>
                </tr>
                <tr>
                    <td>Daniel</td>
                    <td>123</td>
                    <td>abc</td>
                </tr>
            </table>

            <br />
            <form class="main-form clear" id="clientes-form">
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
    <%@include file="../_templates/footer.jsp" %>
</body>
</html>