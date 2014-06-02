<%-- 
    Document   : controle
    Created on : 31/05/2014, 18:48:49
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
        <title>Appizza - Controle de Pedidos</title>
    </head>
    <body>
        <%@include file="../_templates/header.jsp" %>
    <main>
        <div class="center">
            <nav id="top-menu">
                <ul>
                    <li><a href="#"><i class="fa fa-file-text-o"></i>Gerar Relatório</a></li>
                </ul>
            </nav> 
            <form class="main-form" id="pesquisar-form" action="controle.jsp">
                <label for="pesquisa"></label><input type="text" id="pesquisa" placeholder="Digite a pesquisa" name="pesquisa"/>
                <label for="lista-pesquisar-form"></label>
                <select id="lista-pesquisar-form" name="pesquisa-parametro">
                    <option value="1">Código do Pedido</option>
                    <option value="2">Código do Entregador</option>
                    <option value="3">Nome do Entregador</option>
                    <option value="4">Telefone do Cliente</option>
                    <option value="5">Descrição do Pedido</option>
                </select>
                <input type="submit" value="Enviar" />
            </form>

            <table class='main-table' cellspacing='0'>
                <tr>
                    <th width='10%'>Cód. Pedido</th>
                    <th width='10%'>Telefone Cliente</th>
                    <th width='10%'>Cód. Entregador</th>
                    <th width='10%'>Nome do Entregador</th>
                    <th width='10%'>Tipo de Pagamento</th>
                    <th width='10%'>Descrição do Pedido</th>
                    <th width='10%'>Valor do Pedido</th>
                    <th width='10%'>Criação do Pedido</th>
                    <th width='10%'>Envio do Pedido</th>
                    <th width='10%'>Fechamento do Pedido</th>
                    <th width='10%'>Descrição do Tipo do Pedido</th>
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
                                sql = "SELECT * FROM PEDIDOS WHERE CD_PEDIDO = " + pesquisa;
                            } else if (parametro.equals("2")) {
                                sql = "SELECT * FROM PEDIDOS WHERE ENTREGADORES_CD_ENTREGADOR = " + pesquisa;
                            } else if (parametro.equals("3")) {
                                sql = "SELECT * FROM PEDIDOS WHERE NM_ENTREGADOR LIKE '%" + pesquisa + "%')";
                            } else if (parametro.equals("4")) {
                                sql = "SELECT * FROM PEDIDOS WHERE CLIENTES_CD_TELEFONE_CLIENTE = " + pesquisa;
                            } else if (parametro.equals("5")) {
                                sql = "SELECT * FROM PEDIDOS WHERE DS_PEDIDO LIKE '%" + pesquisa + "%')";
                            }

                            ResultSet rs = stmt.executeQuery(sql);

                            while (rs.next()) {
                                out.println("<tr>");
                                out.println("<td>" + rs.getString("CD_PEDIDO") + "</td>");
                                out.println("<td>" + rs.getString("CLIENTE_CD_TELEFONE_CLIENTE") + "</td>");
                                out.println("<td>" + rs.getString("ENTREGADORES_CD_ENTREGADOR") + "</td>");
                                out.println("<td>" + rs.getString("NM_ENTREGADOR") + "</td>");
                                out.println("<td>" + rs.getString("NM_TIPO_PAGAMENTO") + "</td>");
                                out.println("<td>" + rs.getString("DS_PEDIDO") + "</td>");
                                out.println("<td>" + rs.getString("VL_PEDIDO") + "</td>");
                                out.println("<td>" + rs.getString("DT_CRIACAO_PEDIDO") + "</td>");
                                out.println("<td>" + rs.getString("DT_ENVIO_PEDIDO") + "</td>");
                                out.println("<td>" + rs.getString("DT_FECHAMENTO_PEDIDO") + "</td>");
                                out.println("<td>" + rs.getString("DS_TIPO_PEDIDO") + "</td>");
                                out.println("</tr>");
                            }

                            con.close();
                        } catch (SQLException ex) {

                            out.println("Erro: " + ex.getMessage());
                        } catch (ClassNotFoundException ex) {

                            out.println("Erro: " + ex.getMessage());
                        }
                    }%>
            </table>
        </div>
    </main>
    <%@include file="../_templates/footer.jsp" %>
</body>
</html>
