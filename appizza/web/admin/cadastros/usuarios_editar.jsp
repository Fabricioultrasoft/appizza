<%-- 
    Document   : usuarios_editar
    Created on : 02/06/2014, 22:33:10
    Author     : Rycardo
--%>

<%@page import="net.appizza.model.OracleConnector"%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<%=request.getContextPath()%>/_res/css/style.css" type="text/css" rel="stylesheet" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/_res/css/font-awesome.min.css" type="text/css">
        <title>Appizza - Usuarios</title>
    </head> 
    <body>
        <%@include file="../../_templates/header.jsp" %>
    <main>
        <div class="center">
            <nav id="top-menu">
                <ul>
                    <li><a href="#"><i class="fa fa-search"></i>Pesquisa</a></li>
                    <li><a href="#"><i class="fa fa-user"></i>Novo</a></li>
                    <li><a href="#"><i class="fa fa-file-text-o"></i>Relatório</a></li>
                </ul>
            </nav> 
            <br/>
            <form class="main-form" id="usuarios-form-editar">
                <h1>Editar Usuário</h1>
                <input type="hidden" name="codigo" value="<%=request.getParameter("cd_usuario")%>"/><br/>
                <label for="nome">Nome</label><br/><input type="text" id="nome" name="nome"/><br/>
                <label for="login">Login</label><br/><input type="text" id="login" name="login"/><br/>
                <label for="senha">Senha</label><br/><input type="password" id="senha" name="senha"/><br/>
                <label for="email">Email</label><br/><input type="text" id="email" name="email"/><br/>
                <label for="lista-usuarios-form">Selecione um privilégio  </label><br/>
                <select id="lista-usuarios-form" name="lista-usuarios-form">
                    <option value='administrador'>Administrador</option>
                    <option selected value='usuario'>Usuário</option>
                </select>
                <br/>
                <input type="submit" value="Enviar" />
            </form>

            <%
                String nome = "";
                nome = request.getParameter("nome");
                String login = "";
                login = request.getParameter("login");
                String senha = "";
                senha = request.getParameter("senha");
                String privilegio = "";
                privilegio = request.getParameter("lista-usuarios-form");
                String email = "";
                email = request.getParameter("email");
                String cd_usuario = "";
                cd_usuario = request.getParameter("codigo");

                if (nome != null && nome != "" && login != null && login != "" && senha != null && senha != "" && privilegio != null && email != null && email != "") {
                    try {

                        Class.forName("oracle.jdbc.OracleDriver");

                        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "appizza", "appizza");

                        Statement stmt = con.createStatement();

                        ResultSet rs = stmt.executeQuery("UPDATE USUARIOS SET NM_USUARIO = UPPER('" + nome + "'), NM_LOGIN_USUARIO = UPPER('" + login + "'), CD_SENHA_USUARIO = '" + senha + "', NM_PRIVILEGIO_USUARIO = UPPER('" + privilegio + "'), NM_EMAIL_USUARIO = UPPER('" + email + "') WHERE CD_USUARIO = '" + cd_usuario + "'");

                        con.close();
                        
                        response.sendRedirect("usuarios.jsp");

                    } catch (SQLException ex) {

                        out.println("Erro: " + ex.getMessage());
                    } catch (ClassNotFoundException ex) {

                        out.println("Erro: " + ex.getMessage());
                    }
                }
            %>  

        </div>

    </main>
    <%@include file="../../_templates/footer.jsp" %>


</body>
</html>