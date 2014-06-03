<%-- 
    Document   : header
    Created on : 20/05/2014, 06:29:52
    Author     : Daniel
--%>

<%
    if(session.getAttribute("userName") == null) {
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
    
    if(request.getParameter("logoff") != null) {
        session.removeAttribute("userName");
        session.removeAttribute("userLogin");
        session.removeAttribute("userAccess");
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
    
%>
<header>
    <div class="center">
       <a href="#" class="logo">
            <h1>Appizza</h1>
       </a>
        <%@include file="menu.jsp"%>
        <% if (request.getSession().getAttribute("userName") != null) { %>
        <div id="login-area">
            Logado como <a href=""><%=request.getSession().getAttribute("userName")%></a><br>
            <a href="?logoff=true" >Sair</a>
        </div>
        <% } %>
    </div>
</header>