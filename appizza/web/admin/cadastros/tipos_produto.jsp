<%-- 
    Document   : produtos
    Created on : 31/05/2014, 03:31:06
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
            <form class="main-form" id="pesquisar-form">
                <label for="pesquisa"></label><input type="text" id="pesquisa" placeholder="Digite a pesquisa" name="pesquisa"/>
                <label for="lista-pesquisar-form"></label>
                <select id="lista-pesquisar-form" name="pesquisa-parametro">
                    <option value="1">Código</option>
                    <option value="2">Tipo de Produto</option>
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
                                sql = "SELECT * FROM TIPOS_PRODUTO WHERE CD_TIPO_PRODUTO = " + pesquisa;
                            }else{
                                sql = "SELECT * FROM TIPOS_PRODUTO WHERE NM_TIPO_PRODUTO LIKE UPPER('%" + pesquisa + "%')";
                            } 

                            ResultSet rs = stmt.executeQuery(sql);

                            while (rs.next()) {
                                out.println("<tr>");
                                out.println("<td>" + rs.getString("CD_TIPO_PRODUTO") + "</td>");
                                out.println("<td>" + rs.getString("NM_TIPO_PRODUTO") + "</td>");
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
                <h1>Novo Tipo de Produto</h1>
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

                        ResultSet rs = stmt.executeQuery("INSERT INTO TIPOS_PRODUTO VALUES(null, UPPER('" + nome + "'))");

                        con.close();

                    } catch (SQLException ex) {

                        out.println("Erro: " + ex.getMessage());
                    } catch (ClassNotFoundException ex) {

                        out.println("Erro: " + ex.getMessage());
                    }
                    out.print("<b><font color='green' size='2'>Tipo de produto cadastrado com sucesso!</font></b>");
                }
            %>  

        </div>

    </main>
    <%@include file="../../_templates/footer.jsp" %>


</body>
</html>