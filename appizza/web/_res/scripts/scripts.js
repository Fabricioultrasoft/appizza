$(document).ready(function() {
    exibirDiv("#container", "opt-1");
   
    //transição de opções do menu
    $("#top-menu ul li a").click(function(){
        $("#top-menu ul li").removeClass('selected');
        $(this).parent().addClass('selected');
        exibirDiv("#container", $(this).attr("id"));
    });

    //transição de divs com conteúdo para cada página
    function exibirDiv(elementContainer, opt) {
        var elementId = "";
        
        $(elementContainer).children().css("display", "none");

        if (opt === "opt-1") 
            elementId = "#search-container";
        else if (opt === "opt-2")
            elementId = "#add-container";
        else if (opt === "opt-3")
            elementId = "#report-container";

        $(elementId).css("display", "");
    }
    
        $("#top-menu ul li a").mouseover(function() {

        });
});

