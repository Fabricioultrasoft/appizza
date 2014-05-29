<%-- 
    Document   : usuarios
    Created on : 28/05/2014, 23:53:30
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
        <title>Appizza</title>
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
            <form class="main-form" id="pesquisar-form" action="usuarios.jsp">
                <label for="pesquisa"></label><input type="text" id="pesquisa" placeholder="Digite a pesquisa" name="pesquisa"/>
                <label for="lista-pesquisar-form"></label>
                <select id="lista-pesquisar-form" name="pesquisa-parametro">
                    <option value="0">Pesquisar por...</option>
                    <option value="1">Código</option>
                    <option value="2">Nome</option>
                    <option value="3">Email</option>
                </select>
                <input type="submit" value="Enviar" />
            </form>
            <%
                String pesquisa = "";
                pesquisa = request.getParameter("pesquisa");
                String parametro = "";
                parametro = request.getParameter("pesquisa-parametro");
                
                if (pesquisa != null && parametro != "0") {
                    try {

                        Class.forName("oracle.jdbc.OracleDriver");

                        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "appizza", "appizza");

                        Statement stmt = con.createStatement();

                        if (parametro == "1") {
                            ResultSet rs = stmt.executeQuery("SELECT FROM USUARIOS WHERE CD_USUARIO = " + pesquisa + "");
                        }
                        if (parametro == "2") {
                            ResultSet rs = stmt.executeQuery("SELECT FROM USUARIOS WHERE NM_USUARIO = " + pesquisa + "");
                        }
                        if (parametro == "3") {
                            ResultSet rs = stmt.executeQuery("SELECT FROM USUARIOS WHERE NM_EMAIL_USUARIO = " + pesquisa + "");
                        }

                        con.close();
                    } catch (SQLException ex) {

                        System.out.println("Erro: " + ex.getMessage());
                    } catch (ClassNotFoundException ex) {

                        System.out.println("Erro: " + ex.getMessage());
                    }
                }%>
            <br/>
            <table class="main-table" cellspacing="0">
                <tr>
                    <th width="10%">Nome</th>
                    <th width="10%">Telefone</th>
                    <th>Endereço</th>
                </tr>
                <tr>
                    <td>Daniel</td>
                    <td>123</td>
                    <td>abc</td>
                </tr>
                <tr>
                    <td>Daniel</td>
                    <td>123</td>
                    <td>abc</td>
                </tr>
            </table>
            <br/>
            <form class="main-form" id="usuarios-form" action="usuariosEnviar.jsp" method="POST">
                <h1>Novo Usuário</h1>
                <label for="nome">Nome</label><br/><input type="text" id="nome" name="nome"/><br/>
                <label for="login">Login</label><br/><input type="text" id="login" name="login"/><br/>
                <label for="senha">Senha</label><br/><input type="text" id="senha" name="senha"/><br/>
                <label for="email">Email</label><br/><input type="text" id="email" name="email"/><br/>
                <label for="lista-usuarios-form">Selecione um privilégio  </label><br/>
                <select id="lista-usuarios-form" name="lista-usuarios-form">
                    <option value='Administrador'>Administrador</option>
                    <option value='Usuário'>Usuário</option>
                </select>
                <br/>
                <input type="submit" value="Enviar" />
            </form>
        </div>

    </main>
    <%@include file="../../_templates/footer.jsp" %>

    <%
                
                        //MODELO PARA EXIBIÇÃO DE DADOS (FALTA TABELA)
                
        //while (rs.next()) {
        //System.out.print("Departamento: " + rs.getString("Departamento") + " | ");
        //System.out.print("Funcionários (Total): " + rs.getString("Contagem") + " | ");
        //System.out.println("Salários (Soma): " + rs.getString("Soma"));
        // }
%>
</body>
</html>
