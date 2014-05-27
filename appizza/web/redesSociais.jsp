<%-- 
    Document   : teste_antonio
    Created on : 20/05/2014, 00:01:19
    Author     : Antonio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <style type="text/css" media="all">
            #box-toggle {
                    width:500px;
                    margin:0 ;
                    text-align:justify;
                    font:12px/1.4 Arial, Helvetica, sans-serif;
                    }
            #box-toggle .tgl {margin-bottom:30px;}
            #box-toggle span {
                    display:block;
                    cursor:pointer;
                    font-weight:bold;
                    font-size:14px;
                    color:#c30; 
                    margin-top:15px;
                    }
        </style>
        <script type="text/javascript" src="http://code.jquery.com/jquery-2.0.0.min.js"></script> 
        <script type="text/javascript"> 
            jQuery.fn.toggleText = function(a,b) {
            return   this.html(this.html().replace(new RegExp("("+a+"|"+b+")"),function(x){return(x==a)?b:a;}));
            }

            $(document).ready(function(){
                    $('.tgl').before('<span>Facebook</span>');
                    $('.tgl').css('display', 'none')
                    $('span', '#box-toggle').click(function() {
                            $(this).next().slideToggle('slow')
                            .siblings('.tgl:visible').slideToggle('fast');

                            $(this).toggleText('Revelar','Esconder')
                            .siblings('span').next('.tgl:visible').prev()
                            .toggleText('Revelar','Esconder')
                    });
            })
            
            $(document).ready(function(){
                    $('.tg2').before('<span>Twitter</span>');
                    $('.tg2').css('display', 'none')
                    $('span', '#box-toggle').click(function() {
                            $(this).next().slideToggle('slow')
                            .siblings('.tgl:visible').slideToggle('fast');

                            $(this).toggleText('Revelar','Esconder')
                            .siblings('span').next('.tgl:visible').prev()
                            .toggleText('Revelar','Esconder')
                    });
            })
            
            $(document).ready(function(){
                    $('.tg3').before('<span>Google+</span>');
                    $('.tg3').css('display', 'none')
                    $('span', '#box-toggle').click(function() {
                            $(this).next().slideToggle('slow')
                            .siblings('.tgl:visible').slideToggle('fast');

                            $(this).toggleText('Revelar','Esconder')
                            .siblings('span').next('.tgl:visible').prev()
                            .toggleText('Revelar','Esconder')
                    });
            })
        </script>
        <script type="text/javascript">
            window.___gcfg = {lang: 'pt-BR'};

            (function() {
              var po = document.createElement('script'); po.type = 'text/javascript'; po.async = true;
              po.src = 'https://apis.google.com/js/platform.js';
              var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(po, s);
            })();
        </script>

        <title>Redes Sociais</title>
    </head>
    <body>
        <script type="text/javascript" src="https://apis.google.com/js/platform.js">
            {lang: 'pt-BR'}
        </script>
        <div id="fb-root"></div>
                    <script>(function(d, s, id) {
                      var js, fjs = d.getElementsByTagName(s)[0];
                      if (d.getElementById(id)) return;
                      js = d.createElement(s); js.id = id;
                      js.src = "//connect.facebook.net/pt_BR/sdk.js#xfbml=1&version=v2.0";
                      fjs.parentNode.insertBefore(js, fjs);
                    }(document, 'script', 'facebook-jssdk'));</script>              
                
        <div id="box-toggle">

            <div class="tgl">
                <div class="fb-comments" data-href="https://www.facebook.com/groups/625494227546170/" data-width="400" data-numposts="5" data-colorscheme="light"></div>
                <div class="fb-facepile" data-href="https://www.facebook.com/groups/625494227546170/" data-max-rows="1" data-colorscheme="light" data-size="medium" data-show-count="true"></div>
                <div class="fb-like" data-href="https://www.facebook.com/groups/625494227546170/" data-layout="box_count" data-action="like" data-show-faces="true" data-share="true"></div>
                
            </div>

            <div class="tg2">
                <p></p>
            </div>

            <div class="tg3">
                <div class="g-person" data-width="197" data-href="https://plus.google.com/108216137743624517730" data-rel="author"></div><br/>
                <div class="g-plusone" data-size="medium" data-annotation="inline" data-width="300"></div>       
                
                
            </div>

        </div>
    </body>
</html>
