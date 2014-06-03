<%-- 
    Document   : entregadores
    Created on : 01/06/2014, 20:11:16
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
        <title>Appizza - Entregadores</title>
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
            <form class="main-form" id="pesquisar-form">
                <label for="pesquisa"></label><input type="text" id="pesquisa" placeholder="Digite a pesquisa" name="pesquisa"/>
                <label for="lista-pesquisar-form"></label>
                <select id="lista-pesquisar-form" name="pesquisa-parametro">
                    <option value="1">Código</option>
                    <option value="2">Nome</option>
                </select>
                <input type="submit" value="Enviar" />
            </form>

            <table class='main-table' cellspacing='0'>
                <tr>
                    <th width='10%'>Código</th>
                    <th width='10%'>Nome</th>
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
                        String sql = "SELECT * FROM ENTREGADORES ";
                        if (pesquisa != null && parametro != null) {
                            if (parametro.equals("1")) {
                                sql += "WHERE CD_ENTREGADOR = " + pesquisa;
                            } else {
                                sql += "WHERE NM_ENTREGADOR LIKE UPPER('%" + pesquisa + "%')";
                            }
                        }
                        Statement stmt = con.createStatement();
                        ResultSet rs = stmt.executeQuery(sql);

                        while (rs.next()) {
                            out.println("<tr>");
                            out.println("<td>" + rs.getString("CD_ENTREGADOR") + "</td>");
                            out.println("<td>" + rs.getString("NM_ENTREGADOR") + "</td>");
                            out.println("<td><center><a href='entregadores_editar.jsp?cd_entregador=" + rs.getString("CD_ENTREGADOR") + "'<i class='fa fa-edit'></center></td>");
                            out.println("<td><center><a href='?acao=delete&cd_entregador=" + rs.getString("CD_ENTREGADOR") + "'<i class='fa fa-times'></a></td></center>");
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

                            sql = "DELETE FROM ENTREGADORES WHERE CD_ENTREGADOR = " + request.getParameter("cd_entregador");
                            try {
                                stmt = con.createStatement();
                                rs = stmt.executeQuery(sql);
                            } catch (Exception ex) {
                                out.println("Erro ao deletar usuário: " + ex);
                            } finally {
                                try {
                                    if (stmt != null) {
                                        con.close();
                                    }
                                } catch (Exception ex) {
                                }
                                try {
                                    if (rs != null) {
                                        rs.close();
                                    }
                                } catch (Exception ex) {
                                }
                                try {
                                    if (con != null) {
                                        con.close();
                                    }
                                } catch (Exception ex) {
                                }
                            }
                            
                            response.sendRedirect("entregadores.jsp");
                        }

                    } %>
            </table>
            <br/>

            <br/>
            <form class="main-form" id="usuarios-form">
                <h1>Novo Entregador</h1>
                <label for="nome">Nome</label><br/><input type="text" id="nome" name="nome"/><br/>
                <br/>
                <input type="submit" value="Enviar" />
            </form>

            <%
                String nome = "";
                nome = request.getParameter("nome");

                if (nome != null && nome != "") {
                    try {

                        Class.forName("oracle.jdbc.OracleDriver");

                        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "appizza", "appizza");

                        Statement stmt = con.createStatement();

                        ResultSet rs = stmt.executeQuery("INSERT INTO ENTREGADORES VALUES(null, UPPER('" + nome + "'))");

                        con.close();

                        response.sendRedirect("entregadores.jsp");

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