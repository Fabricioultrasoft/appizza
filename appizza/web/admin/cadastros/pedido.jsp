<%-- 
    Document   : pedido
    Created on : 02/06/2014, 21:56:15
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
        <title>Appizza - Pedidos</title>
    </head>
    <body>
        <%@include file="../../_templates/header.jsp" %>
    <main>
        <div class="center">
            <nav id="top-menu">
                <ul>
                    <li><a href="#"><i class="fa fa-file-text-o"></i>Gerar Relatório</a></li>
                </ul>
            </nav> 
            <form class="main-form" id="pesquisar-form" action="produtos.jsp">
                <label for="pesquisa"></label><input type="text" id="pesquisa" placeholder="Digite a pesquisa" name="pesquisa"/>
                <label for="lista-pesquisar-form"></label>
                <select id="lista-pesquisar-form" name="pesquisa-parametro">
                    <option value="1">Código</option>
                    <option value="2">Telefone do Cliente</option>
                    <option value="3">Código do Entregador</option>
                    <option value="4">Nome do Entregador</option>
                </select>
                <input type="submit" value="Enviar" />
            </form>

            <table class='main-table' cellspacing='0'>
                <tr>
                    <th width='10%'>Código do Pedido</th>
                    <th width='10%'>Telefone do Cliente</th>
                    <th width='10%'>Código do Entregador</th>
                    <th width='10%'>Nome do Entregador</th>
                    <th width='10%'>Tipo de Pagamento</th>
                    <th width='10%'>Descrição do Pedido</th>
                    <th width='10%'>Valor do Pedido</th>
                    <th width='10%'>Data de Criação do Pedido</th>
                    <th width='10%'>Data de Envio de Pedido</th>
                    <th width='10%'>Data de Fechamento de Pedido</th>
                    <th width='10%'>Descrição do Tipo de Pedido</th>
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
                                sql = "SELECT * FROM PRODUTOS WHERE CD_PEDIDO = " + pesquisa;
                            } else if (parametro.equals("2")) {
                                sql = "SELECT * FROM PRODUTOS WHERE CLIENTES_CD_TELEFONE_CLIENTE = " + pesquisa;
                            } else if (parametro.equals("3")) {
                                sql = "SELECT * FROM PRODUTOS WHERE ENTREGADORES_CD_ENTREGADOR = " + pesquisa;
                            } else if (parametro.equals("4")) {
                                sql = "SELECT * FROM PRODUTOS WHERE NM_ENTREGADOR LIKE '%" + pesquisa + "%'";
                            }

                            ResultSet rs = stmt.executeQuery(sql);

                            while (rs.next()) {
                                out.println("<tr>");
                                out.println("<td>" + rs.getString("CD_PEDIDO") + "</td>");
                                out.println("<td>" + rs.getString("CLIENTES_CD_TELEFONE_CLIENTE") + "</td>");
                                out.println("<td>" + rs.getString("ENTREGADORES_CD_ENTREGADOR") + "</td>");
                                out.println("<td>" + rs.getString("NM_TIPO_PAGAMENTO") + "</td>");
                                out.println("<td>" + rs.getString("DS_PEDIDO") + "</td>");
                                out.println("<td>" + rs.getString("VL_PEDIDO") + "</td>");
                                out.println("<td>" + rs.getString("DT_CRIACAO_PEDIDO") + "</td>");
                                out.println("<td>" + rs.getString("DT_ENVIO_PEDIDO") + "</td>");
                                out.println("<td>" + rs.getString("DT_FECHAMENTO_PEDIDO") + "</td>");
                                out.println("<td>" + rs.getString("NM_ENTREGADOR") + "</td>");
                                out.println("<td>" + rs.getString("DS_TIPO_PEDIDO") + "</td>");
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
                <h1>Novo Pedido</h1>
                <table class='main-table' cellspacing='0' border='0px'>
                    <tr><td><label for="telefone_cliente">Telefone do Cliente</label><br/><input type="text" id="telefone_cliente" name="telefone_cliente"/><br/></td>
                        <td><label for="cod_entregador">Código do Entregador</label><br/><input type="text" id="cod_entregador" name="cod_entregador"/><br/></td></tr>
                    <tr><td><label for="pagamento">Tipo de Pagamento</label><br/><input type="text" id="pagamento" name="pagamento"/><br/></td>
                        <td><label for="descricao">Descrição de Pedido</label><br/><input type="text" id="descricao" name="descricao"/><br/></td></tr>
                    <tr><td><label for="valor">Valor do Pedido</label><br/><input type="text" id="valor" name="valor"/><br/></td>
                        <td><label for="dt_criacao">Data de Criação do Pedido</label><br/><input type="text" id="dt_criacao" name="dt_criacao"/><br/></td></tr>
                    <tr><td><label for="dt_envio">Data de Envio do Pedido</label><br/><input type="text" id="dt_envio" name="dt_envio"/><br/></td>
                        <td><label for="dt_fechamento">Data de Fechamento do Pedido</label><br/><input type="text" id="dt_fechamento" name="dt_fechamento"/><br/></td></tr>
                    <tr><td><label for="nome_entregador">Nome do Entregador</label><br/><input type="text" id="nome_entregador" name="nome_entregador"/><br/></td>
                        <td><label for="desc_tipo_pedido">Descrição do Tipo de Pedido</label><br/><input type="text" id="desc_tipo_pedido" name="desc_tipo_pedido"/><br/></td></tr>
                </table>
                <br/>

                <input type="submit" value="Enviar" />
            </form>

            <%
                String tel = "";
                tel = request.getParameter("telefone_cliente");
                String codEntregador = "";
                codEntregador = request.getParameter("cod_entregador");
                String pagamento = "";
                pagamento = request.getParameter("pagamento");
                String descricao = "";
                descricao = request.getParameter("descricao");
                String valor = "";
                valor = request.getParameter("valor");
                String dtCriacao = "";
                dtCriacao = request.getParameter("dt_criacao");
                String dtEnvio = "";
                dtEnvio = request.getParameter("dt_envio");
                String dtFechamento = "";
                dtFechamento = request.getParameter("dt_fechamento");
                String nomeEntregador = "";
                nomeEntregador = request.getParameter("nome_entregador");
                String desc_tipo_pedido = "";
                desc_tipo_pedido = request.getParameter("desc_tipo_pedido");

                if (descricao != "" && descricao != null && desc_tipo_pedido != "" && desc_tipo_pedido != null && valor != null && valor != null && dtCriacao != null && dtCriacao != null && dtEnvio != null && dtEnvio != null && dtFechamento != null && dtFechamento != null && nomeEntregador != null && nomeEntregador != null && tel != null && tel != null && codEntregador != null && codEntregador != null && pagamento != null && pagamento != null) {
                    try {

                        Class.forName("oracle.jdbc.OracleDriver");

                        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "appizza", "appizza");

                        Statement stmt = con.createStatement();

                        ResultSet rs = stmt.executeQuery("INSERT INTO PEDIDOS VALUES(null, " + tel + ", " + codEntregador + ", UPPER('" + pagamento + "'), '" + descricao + "'," + valor + ",'" + dtCriacao + "','" + dtEnvio + "' ,'" + dtFechamento + "','" + nomeEntregador + "','" + desc_tipo_pedido + ")");

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
