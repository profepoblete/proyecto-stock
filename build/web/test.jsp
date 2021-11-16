<%-- 
    Document   : test
    Created on : 09-05-2021, 0:58:03
    Author     : Seba_barria
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <div class="">
         <h3>Buscar Ubicacion</h3>
         <label for="txtBuscarUbi">Buscar codigo ubicacion </label>
         <input id="txtBuscarUbi" class="form-control mb-10">
        </div>
        <script>
    $( function() {
         
        var availableTags = new Array();
    
        $("#txtBuscarUbi").bind("keydown", function(event){
            var data = {nombre_ubicacion:$("#txtBuscarUbi").val()};
            $.getJSON("buscarUbi", data, function(res,est,jqXHR){
                availableTags.length = 0;
                $.each(res, function(i, item){
                    availableTags[i] = item;
                    });
            
                });
        
            });

            $("#txtBuscarUbi").autocomplete({
            source: availableTags, 
            minLength : 3
            });
        } );
        </script>
    </body>
</html>
