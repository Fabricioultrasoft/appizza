<%-- 
    Document   : header
    Created on : 20/05/2014, 06:29:52
    Author     : Daniel
--%>

<header>
    <div class="center">
       <a href="#" class="logo">
            <h1>Appizza</h1>
       </a>
        <nav id="main-menu">
            <ul>
                <li><a href="#">Opção 1</a></li>
                <li><a href="#">Opção 2</a></li>
                <li><a href="#">Opção 3</a></li>
                <li><a href="#">Opção 4</a></li>
            </ul>
        </nav>
        <% if (request.getSession().getAttribute("userName") != null) { %>
        <div id="login-area">
            Logado como <a href=""><%=request.getSession().getAttribute("userName")%></a><br>
            <a href="">Sair</a>
        </div>
        <% } %>
    </div>
</header>