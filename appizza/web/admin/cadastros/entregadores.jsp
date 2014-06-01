<%-- 
    Document   : entregadores
    Created on : 01/06/2014, 20:11:16
    Author     : Rycardo
--%>

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
                    <th width='10%'>Tipo</th>
                </tr>
                <%
                    String pesquisa = "";
                    pesquisa = request.getParameter("pesquisa");
                    String parametro = "";
                    parametro = request.getParameter("pesquisa-parametro");

                    if (pesquisa != null && pesquisa != "" && parametro != null) {
                        try {

                            Class.forName("oracle.jdbc.driver.OracleDriver");

                            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "appizza", "appizza");

                            Statement stmt = con.createStatement();

                            String sql = "";

                            if (parametro.equals("1")) {
                                sql = "SELECT * FROM ENTREGADORES WHERE CD_ENTREGADOR = " + pesquisa;
                            }else{
                                sql = "SELECT * FROM ENTREGADORES WHERE NM_ENTREGADOR LIKE UPPER('%" + pesquisa + "%')";
                            } 

                            ResultSet rs = stmt.executeQuery(sql);

                            while (rs.next()) {
                                out.println("<tr>");
                                out.println("<td>" + rs.getString("CD_ENTREGADOR") + "</td>");
                                out.println("<td>" + rs.getString("NM_ENTREGADOR") + "</td>");
                                out.println("</tr>");
                            }

                            con.close();
                        } catch (SQLException ex) {

                            out.println("Erro: " + ex.getMessage());
                        } catch (ClassNotFoundException ex) {

                            out.println("Erro: " + ex.getMessage());
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

                    } catch (SQLException ex) {

                        out.println("Erro: " + ex.getMessage());
                    } catch (ClassNotFoundException ex) {

                        out.println("Erro: " + ex.getMessage());
                    }
                    out.print("<b><font color='green' size='2'>Entregador cadastrado com sucesso!</font></b>");
                }
            %>  

        </div>

    </main>
    <%@include file="../../_templates/footer.jsp" %>


</body>
</html>