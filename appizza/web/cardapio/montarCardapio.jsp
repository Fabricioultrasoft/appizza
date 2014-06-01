<%-- 
    Document   : montarCardapio
    Created on : 01/06/2014, 04:02:16
    Author     : Antonio
--%>

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
                    <label for="pizza">Pizza </label><br/>
                    <select id="pizza" class="cardapio">
                        <option>-------</option>
                        <option>Salgada</option>
                        <option>Doce</option>
                    </select>
                    <br/>
                    
                    <label for="sabor">Sabor </label><br/>
                    <select id="sabor" class="cardapio">
                        <option>-------</option>
                        <option>Portuguesa</option>
                        <option>Paulista</option>
                        <option>Mussarela</option>
                        <option>Calabreza</option>
                        <option>4 Queijos</option>
                        <option>Presunto</option>
                        <option>Frango</option>
                        <option>Peperoni</option>
                        <option>Champignon</option>
                        <option>Escarola</option>
                        <option>Atun</option>
                    </select>
                    <br/>
                    
                    <label for="borda">Borda </label><br/>
                    <select id="borda" class="cardapio">
                        <option>-------</option>
                        <option>Sem Recheio</option>
                        <option>Catupiry</option>
                        <option>Cheeder</option>
                    </select>
                    <br/>
                    
                    <label for="bebida">Bebida </label><br/>
                    <select id="bebida" class="cardapio">
                        <option>-------</option>
                        <option>Sem Bebida</option>
                        <option>Agua Mineral</option>
                        <option>Agua Mineral com gas</option>
                        <option>Suco Natural de Laranja</option>
                        <option>Suco Natural de Limão</option>
                        <option>Suco Natural de Uva</option>
                        <option>Refrigerante Coca Cola 2L</option>
                        <option>Refrigerante Coca Cola 600ML</option>
                        <option>Refrigerante Fanta Laranja 2L</option>
                        <option>Refrigerante Fanta Laranja 600ML</option>
                        <option>Refrigerante Guaraná Antartica 2L</option>
                        <option>Refrigerante Guaraná Antartica 600ML</option>
                        <option>Cerveja Brahma</option>
                        <option>Cerveja Antartica</option>
                        <option>Cerveja Itaipava</option>
                        <option>Cerveja Bohemia</option>
                        <option>Cerveja Devasa</option>
                        <option>Cerveja Skol</option>
                    </select>
                    <br/>
                    
                    <label for="outros">Outros Pedidos </label><br/>
                    <select id="outros" class="cardapio">
                        <option>-------</option>
                        <option>Sem mais pedidos</option>
                        <option>Porção de Fritas</option>
                        <option>Porção de Calabreza</option>
                        <option>Porção de Frango</option>
                        <option>Porção de Salame</option>
                    </select>
                    <br/>
                    <input type="submit" value="Gerar Cardápio" />
                </form>
            </div>
            
        </main>
        <%@include file="../_templates/footer.jsp" %>
    </body>
</html>

