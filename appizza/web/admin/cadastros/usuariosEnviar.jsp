<%-- 
    Document   : usuariosEnviar
    Created on : 29/05/2014, 04:48:06
    Author     : Rycardo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>


<%
    String nome = "";
    nome = request.getParameter("nome");
    String login = "";
    login = request.getParameter("login");
    String senha = "";
    senha = request.getParameter("senha");
    String privilegio = "";
    privilegio = request.getParameter("lista-usuarios-form");
    String email = "";
    email = request.getParameter("email");

    session.setAttribute("nome", nome);
    session.setAttribute("login", login);
    session.setAttribute("senha", senha);
    session.setAttribute("privilegio", privilegio);
    session.setAttribute("email", email);

    try {

        Class.forName("oracle.jdbc.OracleDriver");

        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "appizza", "appizza");

        Statement stmt = con.createStatement();
// TODO: Como que eu vou passar o CD_USUARIO?
        stmt.executeUpdate("INSERT INTO USUARIOS VALUES( ??????? ,nome, login, senha, privilegio, email)");

        con.close();

    } catch (SQLException ex) {

        System.out.println("Erro: " + ex.getMessage());
    } catch (ClassNotFoundException ex) {

        System.out.println("Erro: " + ex.getMessage());
    }
%>  

<!DOCTYPE html>
<html>  
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
    </body>
</html>

