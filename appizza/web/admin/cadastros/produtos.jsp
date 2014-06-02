<%-- 
    Document   : cadastroProdutos
    Created on : 31/05/2014, 18:42:42
    Author     : Marco
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="<%=request.getContextPath()%>/_res/css/style.css" type="text/css" rel="stylesheet" />
        <link rel="stylesheet" href="<%=request.getContextPath()%>/_res/css/font-awesome.min.css" type="text/css">
        <title>Appizza - Produtos</title>
    </head>
    <body>
        <%@include file="../../_templates/header.jsp" %>
    <main>
        <div class="center">
            <form class="main-form" id="pesquisar-form" action="produtos.jsp">
                <label for="pesquisa"></label><input type="text" id="pesquisa" placeholder="Digite a pesquisa" name="pesquisa"/>
                <label for="lista-pesquisar-form"></label>
                <select id="lista-pesquisar-form" name="pesquisa-parametro">
                    <option value="1">Código</option>
                    <option value="2">Nome</option>
                    <option value="3">Descrição</option>
                </select>
                <input type="submit" value="Enviar" />
            </form>

            <table class='main-table' cellspacing='0'>
                <tr>
                    <th width='10%'>Código do Produto</th>
                    <th width='10%'>Código do Tipo do Produto</th>
                    <th width='10%'>Nome do Produto</th>
                    <th width='10%'>Descrição do Produto</th>
                    <th width='10%'>Valor do Produto</th>
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
                                sql = "SELECT * FROM PRODUTOS WHERE CD_PRODUTO = " + pesquisa;
                            } else if (parametro.equals("2")) {
                                sql = "SELECT * FROM PRODUTOS WHERE NM_PRODUTO LIKE '%" + pesquisa + "%'";
                            } else if (parametro.equals("3")) {
                                sql = "SELECT * FROM PRODUTOS WHERE DS_PRODUTO LIKE '%" + pesquisa + "%'";
                            }

                            ResultSet rs = stmt.executeQuery(sql);

                            while (rs.next()) {
                                out.println("<tr>");
                                out.println("<td>" + rs.getString("CD_PRODUTO") + "</td>");
                                out.println("<td>" + rs.getString("CD_TIPO_PRODUTO") + "</td>");
                                out.println("<td>" + rs.getString("NM_PRODUTO") + "</td>");
                                out.println("<td>" + rs.getString("DS_PRODUTO") + "</td>");
                                out.println("<td>" + rs.getString("VL_PRODUTO") + "</td>");
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
                <h1>Novo Produto</h1>
                <label for="cod">Código do Tipo de Produto</label><br/><input type="text" id="cod" name="cod"/><br/>
                <label for="nome">Nome</label><br/><input type="text" id="nome" name="nome"/><br/>
                <label for="descricao">Descrição</label><br/><input type="text" id="descricao" name="descricao"/><br/>
                <label for="preco">Preço</label><br/><input type="text" id="preco" name="preco"/><br/>
                <br/>
                <input type="submit" value="Enviar" />
            </form>

            <%
                String cod = "";
                cod = request.getParameter("cod");
                String nome = "";
                nome = request.getParameter("nome");
                String descricao = "";
                descricao = request.getParameter("descricao");
                String preco = "";
                preco = request.getParameter("preco");

                if (nome != null && nome != "" && cod != null && cod != "" && descricao != null && descricao != "" && preco != null && preco != null) {
                    try {

                        Class.forName("oracle.jdbc.OracleDriver");

                        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "appizza", "appizza");

                        Statement stmt = con.createStatement();

                        ResultSet rs = stmt.executeQuery("INSERT INTO PRODUTOS VALUES(null, " + cod + ", UPPER('" + nome + "'), '" + descricao + "'," + preco + ")");

                        con.close();

                    } catch (SQLException ex) {

                        out.println("Erro: " + ex.getMessage());
                    } catch (ClassNotFoundException ex) {

                        out.println("Erro: " + ex.getMessage());
                    }
                    out.print("<b><font color='green' size='2'>Cadastro efetuado com sucesso!</font></b>");
                }
            %>  

        </div>

    </main>

    <%@include file="../../_templates/footer.jsp" %>
</body>
</html>
