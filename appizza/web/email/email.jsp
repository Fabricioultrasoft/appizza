<%-- 
    Document   : email
    Created on : 01/06/2014, 03:19:19
    Author     : Antonio
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="net.appizza.model.OracleConnector"%>
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
            <%
                Date data = new Date();
                data.getTime();
                String dataAtual = data.toString();
            %>
            <div class="center">
                <form class="main-form" id="clientes-form" action="enviado.jsp" method="post">
                    <input type="hidden" name="data" value="<%=dataAtual%>">
                    <h1>Enviar E-Mails aos Cliente</h1>
                    <label for="remetente">Remetente</label><br/><input type="text" id="remetente" size="70" required/><br/>
                    <label for="destinatatio">Destinatario</label><br/>
                    <select name="destinatario" style='width: 460px;'>
                            <%
                                Connection con = OracleConnector.getConnection();
                                Statement stmt = con.createStatement();
                                ResultSet rs = stmt.executeQuery("Select nm_email_cliente from clientes");
                                while(rs.next()){
                                %>
                                <option><%=rs.getString("nm_email_cliente")%></option>
                                <%
                                    }
                                %>
                        
                    </select>
                    <br/>
                    <label for="assunto">Assunto</label><br/><input type="text" id="assunto" name="assunto" value="${param.assunto}" size="70" required /><br/>
                    <label for="mensagem">Mensagem</label><br/><textarea cols="55" rows="10" id="mensagem" name="conteudo" required ></textarea><br>
                    <input type="submit" value="Enviar" />
                </form>
            </div>
           
        </main>
        <%@include file="../_templates/footer.jsp" %>
    </body>
</html>
