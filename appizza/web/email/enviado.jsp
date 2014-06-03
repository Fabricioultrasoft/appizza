<%-- 
    Document   : enviado
    Created on : 01/06/2014, 13:00:40
    Author     : Antonio
--%>

<%@page import="net.appizza.OracleConnector"%>
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
         <%
            try{
                String data = request.getParameter("data");
                String assunto = request.getParameter("assunto");
                String conteudo = request.getParameter("conteudo");
                Connection con = OracleConnector.getConnection();
                String SQL = "INSERT INTO EMAILS VALUES(null,'"+assunto+"','"+conteudo+"','"+data+"')";
                OracleConnector.executeStatement(SQL);        
                response.sendRedirect("email.jsp");
            }catch(Exception ex){
                out.println("Erro: " + ex.getLocalizedMessage());
            }         
            %>
            
        
        <%@include file="../_templates/footer.jsp" %>
    </body>
</html>
