<%-- 
    Document   : index
    Created on : 18/05/2014, 04:17:25
    Author     : Daniel
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="_res/css/style.css" type="text/css" rel="stylesheet" />
        <link rel="stylesheet" href="_res/css/font-awesome.min.css" type="text/css">
        <script src="_res/scripts/jquery-1.7.1.min.js" type="text/javascript"></script>
        <script src="_res/scripts/scripts.js" type="text/javascript"></script>
        <title>Appizza</title>
    </head>
    <body>

        <%@include file="_templates/header.jsp" %>
        <main>
            <div class="center">
                <nav id="top-menu">
                    <ul>
                        <li class="selected"><a href="#" id="opt-1"><i class="fa fa-search"></i>Pesquisa</a></li>
                        <li><a href="#" id="opt-2"><i class="fa fa-plus-circle"></i>Novo</a></li>
                        <li><a href="#" id="opt-3"><i class="fa fa-file-text-o"></i>Novo</a></li>
                    </ul>
                </nav>
                <div id="container">
                    <div id="search-container">
                        Search content
                    </div>

                    <div id="add-container">
                        Add content
                    </div>

                    <div id="report-container">
                        Report content
                    </div>
                </div>
            </div>
        </main>
        <%@include file="_templates/footer.jsp" %>
    </body>
</html>
