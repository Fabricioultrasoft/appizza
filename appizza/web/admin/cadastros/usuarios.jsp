<%-- 
    Document   : usuarios
    Created on : 28/05/2014, 23:53:30
    Author     : Rycardo
--%>
<%@page import="net.appizza.OracleConnector"%>
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
            <form class="main-form" id="pesquisar-form" action="usuarios.jsp">
                <label for="pesquisa"></label><input type="text" id="pesquisa" placeholder="Digite a pesquisa" name="pesquisa"/>
                <label for="lista-pesquisar-form"></label>
                <select id="lista-pesquisar-form" name="pesquisa-parametro">
                    <option value="1">Código</option>
                    <option value="2">Nome</option>
                    <option value="3">Email</option>
                </select>
                <input type="submit" value="Enviar" />
            </form>

            <table class='main-table' cellspacing='0'>
                <tr>
                    <th width='10%'>Código</th>
                    <th width='10%'>Nome</th>
                    <th width='10%'>Login</th>
                    <th width='10%'>Privilégio</th>
                    <th width='10%'>Email</th>
                    <th width='3%' colspan='2'>Ações</th>
                </tr>
                <%
                    String pesquisa = "";
                    pesquisa = request.getParameter("pesquisa");
                    String parametro = "";
                    parametro = request.getParameter("pesquisa-parametro");
                    String acao = request.getParameter("acao");

                        try {

                            Connection con = OracleConnector.getConnection();
                            String sql = "SELECT * FROM USUARIOS ";

                    if (pesquisa != null && pesquisa != "" && parametro != null) {
                            if (parametro.equals("1")) {
                                sql += "WHERE CD_USUARIO = " + pesquisa;
                            } else if (parametro.equals("2")) {
                                sql += "WHERE NM_USUARIO LIKE UPPER('%" + pesquisa + "%')";
                            } else if (parametro.equals("3")) {
                                sql += "WHERE NM_EMAIL_USUARIO LIKE UPPER('%" + pesquisa + "%')";
                            }
                    }
                            Statement stmt = con.createStatement();
                            ResultSet rs = stmt.executeQuery(sql);

                            while (rs.next()) {
                                out.println("<tr>");
                                out.println("<td>" + rs.getString("CD_USUARIO") + "</td>");
                                out.println("<td>" + rs.getString("NM_USUARIO") + "</td>");
                                out.println("<td>" + rs.getString("NM_LOGIN_USUARIO") + "</td>");
                                out.println("<td>" + rs.getString("NM_PRIVILEGIO_USUARIO") + "</td>");
                                out.println("<td>" + rs.getString("NM_EMAIL_USUARIO") + "</td>");
                                out.println("<td><center><a href='usuarios_editar.jsp?cd_usuario=" + rs.getString("CD_USUARIO") + "'<i class='fa fa-edit'></center></td>");
                                out.println("<td><center><a href='?acao=delete&cd_usuario=" + rs.getString("CD_USUARIO") + "'<i class='fa fa-times'></a></center></td>");
                                out.println("</tr>");
                            }

                            con.close();
                        } catch (SQLException ex) {

                            out.println("Erro: " + ex.getMessage());
                        } catch (ClassNotFoundException ex) {

                            out.println("Erro: " + ex.getMessage());
                        }
                        
                     if (acao != null) {

                        if (acao.equals("delete")) {

                            Connection con = OracleConnector.getConnection();
                            Statement stmt = null;
                            ResultSet rs = null;
                            String sql = "";

                            sql = "DELETE FROM USUARIOS WHERE CD_USUARIO = " + request.getParameter("cd_usuario");
                            try {
                                stmt = con.createStatement();
                                rs = stmt.executeQuery(sql);
                            } catch (Exception ex) {
                                out.println("Erro ao deletar usuário: " + ex);
                            } finally {
                                try{if(stmt != null){con.close();}}catch(Exception ex){}
                                try{if(rs != null){rs.close();}}catch(Exception ex){}
                                try{if(con != null){con.close();}}catch(Exception ex){}
                            }
                            
                            response.sendRedirect("usuarios.jsp");
                        }

                    } %>
            </table>
            <br/>

            <br/>
            <form class="main-form" id="usuarios-form">
                <h1>Novo Usuário</h1>
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

                if (nome != null && nome != "" && login != null && login != "" && senha != null && senha != "" && privilegio != null && email != null && email != "") {
                    try {

                        Class.forName("oracle.jdbc.OracleDriver");

                        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "appizza", "appizza");

                        Statement stmt = con.createStatement();

                        ResultSet rs = stmt.executeQuery("INSERT INTO USUARIOS VALUES(null, UPPER('" + nome + "'), UPPER('" + login + "'), '" + senha + "', UPPER('" + privilegio + "'), UPPER('" + email + "'))");

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
