<%-- 
    Document   : montarCardapio
    Created on : 01/06/2014, 04:02:16
    Author     : Antonio
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="net.appizza.OracleConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="../_res/css/style.css" type="text/css" rel="stylesheet" />
        <title>Appizza</title>
    </head>
    <body>

        <%@include file="../_templates/header.jsp" %>
        <main>
            <div class="center">
                <form class="main-form" id="clientes-form" action="cardapioMontado.jsp">
                    <h1>Montar Cardápio</h1>
                    <label for="tipos_produto">Tipos de Produto</label><br/>
                    <select name="tiposProdutos" style='width: 460px;'>
                        <option></option>
                            <%
                                Connection con = OracleConnector.getConnection();
                                Statement stmt = con.createStatement();
                                ResultSet rs = stmt.executeQuery("Select nm_tipo_produto from tipos_produto");
                                while(rs.next()){
                                %>
                                <option><%=rs.getString("nm_tipo_produto")%></option>
                                <%
                                    }
                                %>                        
                    </select>
                    <br/>
                    <select name="tiposProdutos" style='width: 460px;'>
                        <option></option>
                            <%
                                rs = stmt.executeQuery("Select nm_produto from produtos");
                                while(rs.next()){
                                %>
                                <option><%=rs.getString("nm_produto")%></option>
                                <%
                                    }
                                %>                        
                    </select>
                    
                    <br/>
                    
                    
                    <input type="submit" value="Gerar Cardápio" />
                </form>
            </div>
            
        </main>
        <%@include file="../_templates/footer.jsp" %>
    </body>
</html>

