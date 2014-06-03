<%-- 
    Document   : entregadores_editar
    Created on : 02/06/2014, 23:40:12
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
        <title>Appizza - Tipos de Produto</title>
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
                <h1>Editar Entregador</h1>
                <input type="hidden" name="codigo" value="<%=request.getParameter("cd_entregador")%>"/><br/>
                <label for="nome">Nome</label><br/><input type="text" id="nome" name="nome"/><br/>
                <br/>
                <input type="submit" value="Enviar" />
            </form>

            <%
                String nome = "";
                nome = request.getParameter("nome");
                String cd_entregador = "";
                cd_entregador = request.getParameter("codigo");

                if (nome != null && nome != "") {
                    try {

                        Class.forName("oracle.jdbc.OracleDriver");

                        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "appizza", "appizza");

                        Statement stmt = con.createStatement();

                        ResultSet rs = stmt.executeQuery("UPDATE ENTREGADORES SET NM_ENTREGADOR = UPPER('" + nome + "') WHERE CD_ENTREGADOR = '" + cd_entregador + "'");

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