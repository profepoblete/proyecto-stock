$(document).ready(function(){
         $("#frmAgregarUsuario").submit(function(e){
               var err = false;
               var errLargo = false;
               var rut = $("#txtRut_Usuario").val();
               var nombre = $("#txtNombreUsuario").val();
               var apellido_paterno = $("#txtApe_paterno_usuario").val();
               var apellido_materno = $("#txtApe_materno_usuario").val();
               var celular = $("#txtCelular_usuario").val();
               var direccion = $("#txtDireccion_usuario").val();
               var correo = $("#txtCorreo_usuario").val();
               var password = $("#txtPassword_usuario").val();
               
               if(rut == ""){
                   err = true;
                   $("#fg_rut").addClass("form-control-error");
               }
                if(rut.length>17){
                   errLargo= true;                  
                   $("#fg_rut").addClass("form-control-error");
               }               
               
               if(nombre == ""){
                   err = true;
                   $("#fg_nombre").addClass("form-control-error");
               }
                if(nombre.length>50){
                   errLargo= true;                  
                   $("#fg_nombre").addClass("form-control-error");
               }               
               
               if(apellido_paterno == ""){
                   err = true;
                   $("#fg_ape_paterno").addClass("form-control-error");
               }
                if(apellido_paterno.length>50){
                   errLargo= true;                  
                   $("#fg_ape_paterno").addClass("form-control-error");
               }               
               
               if(apellido_materno == ""){
                   err = true;
                   $("#fg_ape_materno").addClass("form-control-error");
               }
                if(apellido_materno.length>50){
                   errLargo= true;                  
                   $("#fg_ape_materno").addClass("form-control-error");
               }
               
               if(celular == ""){
                   err = true;
                   $("#fg_celular").addClass("form-control-error");
               }
               
               if(direccion == ""){
                   err = true;
                   $("#fg_direccion").addClass("form-control-error");
               }
               
               if(correo == ""){
                   err = true;
                   $("#fg_correo").addClass("form-control-error");
               }
                if(correo.length>45){
                   errLargo = true;                   
                   $("#fg_correo").addClass("form-control-error");
               }
               
               if(password == ""){
                   err = true;
                   $("#fg_password").addClass("form-control-error");
               }
               
               if(err){
               $("#divAlert").html('<div class="alert alert-danger alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Hay campos vacios, por favor verificalos.</div>');
               e.preventDefault();
                }
                if(errLargo){
               $("#divAlertLargo").html('<div class="alert alert-warning alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Tamaño demasiado largo, por favor verifica los campos.</div>');
               e.preventDefault();
                }
         });
         
         $("#txtRut_Usuario").on('focusin',function(){
                $("#fg_rut").removeClass("form-control-error");
         });
         $("#txtNombreUsuario").on('focusin',function(){
                $("#fg_nombre").removeClass()("form-control-error");
         });
         $("#txtApe_paterno_usuario").on('focusin',function(){
                $("#fg_ape_paterno").removeClass()("form-control-error");
         });
         $("#txtApe_materno_usuario").on('focusin',function(){
                $("#fg_ape_materno").removeClass("form-control-error");
         });
         $("#txtCelular_usuario").on('focusin',function(){
                $("#fg_celular").removeClass("form-control-error");
         });
         $("#txtDireccion_usuario").on('focusin',function(){
                $("#fg_direccion").removeClass("form-control-error");
         });
         $("#txtCorreo_usuario").on('focusin',function(){
                $("#fg_correo").removeClass("form-control-error");
         });
         $("#txtPassword_usuario").on('focusin',function(){
                $("#fg_password").removeClass("form-control-error");
         });
     });
     
     $(document).ready(function(){
         $("#frmEditar").submit(function(e){
               var err = false;
               var rut = $("#txtRut_Usuario").val();
               var nombre = $("#txtNombreUsuario").val();
               var apellido_paterno = $("#txtApe_paterno_usuario").val();
               var apellido_materno = $("#txtApe_materno_usuario").val();
               var celular = $("#txtCelular_usuario").val();
               var direccion = $("#txtDireccion_usuario").val();
               var correo = $("#txtCorreo_usuario").val();
               var password = $("#txtPassword_usuario").val();
               
               if(rut == ""){
                   err = true;
                   //$("#lblNombre").show();
                   $("#fg_rut").addClass("form-control-error");
               }
               if(nombre == ""){
                   err = true;
                   //$("#lblNombre").show();
                   $("#fg_nombre").addClass("form-control-error");
               }
               if(apellido_paterno == ""){
                   err = true;
                   //$("#lblNombre").show();
                   $("#fg_ape_paterno").addClass("form-control-error");
               }
               if(apellido_materno == ""){
                   err = true;
                   //$("#lblNombre").show();
                   $("#fg_ape_materno").addClass("form-control-error");
               }
               if(celular == ""){
                   err = true;
                   //$("#lblNombre").show();
                   $("#fg_celular").addClass("form-control-error");
               }
               if(direccion == ""){
                   err = true;
                   //$("#lblNombre").show();
                   $("#fg_direccion").addClass("form-control-error");
               }
               if(correo == ""){
                   err = true;
                   //$("#lblNombre").show();
                   $("#fg_correo").addClass("form-control-error");
               }
               if(password == ""){
                   err = true;
                   //$("#lblNombre").show();
                   $("#fg_password").addClass("form-control-error");
               }
               if(err){
               $("#divAlert").html('<div class="alert alert-danger alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Hay campos vacios, por favor verificalos.</div>');
               e.preventDefault();
                }
         });
         
         $("#txtRut_Usuario").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_rut").removeClass("form-control-error");
         });
         $("#txtNombreUsuario").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_nombre").removeClass()("form-control-error");
         });
         $("#txtApe_paterno_usuario").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_ape_paterno").removeClass()("form-control-error");
         });
         $("#txtApe_materno_usuario").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_ape_materno").removeClass("form-control-error");
         });
         $("#txtCelular_usuario").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_celular").removeClass("form-control-error");
         });
         $("#txtDireccion_usuario").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_direccion").removeClass("form-control-error");
         });
         $("#txtCorreo_usuario").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_correo").removeClass("form-control-error");
         });
         $("#txtPassword_usuario").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_password").removeClass("form-control-error");
         });
     });
     //Validaciones Agregar Proveedor
     $(document).ready(function(){
         $("#frmAgregarProveedor").submit(function(e){
               var err = false;
               var errLargo = false;
               var rut = $("#txtRut_Proveedor").val();
               var nombre = $("#txtNombre_Proveedor").val();
               var razon_social = $("#txtRazonSocial_Proveedor").val();
               var fono = $("#txtFono_Proveedor").val();
               var direccion = $("#txtDireccion_Proveedor").val();
               var correo = $("#txtCorreo_Proveedor").val();
               
               
               if(rut == ""){
                   err = true;                   
                   $("#fg_rut").addClass("form-control-error");
               }
               if(nombre == ""){
                   err = true;                   
                   $("#fg_nombre").addClass("form-control-error");
               }
                if(nombre.length>45){
                   errLargo= true;                  
                   $("#fg_nombre").addClass("form-control-error");
               }
               if(razon_social == ""){
                   err = true;                   
                   $("#fg_razon_social").addClass("form-control-error");
               }
                if(razon_social.length>50){
                   errLargo = true;                  
                   $("#fg_razon_social").addClass("form-control-error");
               }
               
               if(fono == ""){
                   err = true;                  
                   $("#fg_fono").addClass("form-control-error");
               }
               if(fono.length>15){
                   errLargo = true;                   
                   $("#fg_fono").addClass("form-control-error");
               }
               
               if(direccion == ""){
                   err = true;
                   $("#fg_direccion").addClass("form-control-error");
               }
                if(direccion.length>45){
                   errLargo = true;
                   $("#fg_direccion").addClass("form-control-error");
               }
               
               if(correo == ""){
                   err = true;                   
                   $("#fg_correo").addClass("form-control-error");
               }
                if(correo.length>45){
                   errLargo = true;                   
                   $("#fg_correo").addClass("form-control-error");
               }
               if(err){
               $("#divAlert").html('<div class="alert alert-danger alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Hay campos vacios, por favor verificalos.</div>');
               e.preventDefault();
                }
                 if(errLargo){
               $("#divAlertLargo").html('<div class="alert alert-danger alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Hay campos que exceden el largo permitido, por favor verificalos.</div>');
               e.preventDefault();
                }
         });
         
         $("#txtRut_Proveedor").on('focusin',function(){               
                $("#fg_rut").removeClass("form-control-error");
         });
         $("#txtNombre_Proveedor").on('focusin',function(){               
                $("#fg_nombre").removeClass()("form-control-error");
         });
         $("#txtRazonSocial_Proveedor").on('focusin',function(){              
                $("#fg_razon_social").removeClass()("form-control-error");
         });
         $("#txtFono_Proveedor").on('focusin',function(){              
                $("#fg_fono").removeClass("form-control-error");
         });
         $("#txtDireccion_Proveedor").on('focusin',function(){              
                $("#fg_direccion").removeClass("form-control-error");
         });
         $("#txtCorreo_Proveedor").on('focusin',function(){              
                $("#fg_correo").removeClass("form-control-error");
         });
                 
     });
           
//Validación Editar Proveedor
     $(document).ready(function(){
         $("#frmEditarProveedor").submit(function(e){
               var err = false;
               var errLargo = false;
               var rut = $("#txtRut_Proveedor").val();
               var nombre = $("#txtNombre_Proveedor").val();
               var razon_social = $("#txtRazonSocial_Proveedor").val();
               var fono = $("#txtFono_Proveedor").val();
               var direccion = $("#txtDireccion_Proveedor").val();
               var correo = $("#txtCorreo_Proveedor").val();
               
               
               if(rut == ""){
                   err = true;                   
                   $("#fg_rut").addClass("form-control-error");
               }
               if(nombre == ""){
                   err = true;                   
                   $("#fg_nombre").addClass("form-control-error");
               }
                if(nombre.length>45){
                   errLargo= true;                  
                   $("#fg_nombre").addClass("form-control-error");
               }
               if(razon_social == ""){
                   err = true;                   
                   $("#fg_razon_social").addClass("form-control-error");
               }
                if(razon_social.length>50){
                   errLargo = true;                  
                   $("#fg_razon_social").addClass("form-control-error");
               }
               
               if(fono == ""){
                   err = true;                  
                   $("#fg_fono").addClass("form-control-error");
               }
               if(fono.length>15){
                   errLargo = true;                   
                   $("#fg_fono").addClass("form-control-error");
               }
               
               if(direccion == ""){
                   err = true;
                   $("#fg_direccion").addClass("form-control-error");
               }
                if(direccion.length>45){
                   errLargo = true;
                   $("#fg_direccion").addClass("form-control-error");
               }
               
               if(correo == ""){
                   err = true;                   
                   $("#fg_correo").addClass("form-control-error");
               }
                if(correo.length>45){
                   errLargo = true;                   
                   $("#fg_correo").addClass("form-control-error");
               }
               if(err){
               $("#divAlert").html('<div class="alert alert-danger alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Hay campos vacios, por favor verificalos.</div>');
               e.preventDefault();
                }
                 if(errLargo){
               $("#divAlertLargo").html('<div class="alert alert-danger alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Hay campos que exceden el largo permitido, por favor verificalos.</div>');
               e.preventDefault();
                }
         });
         
         $("#txtRut_Proveedor").on('focusin',function(){               
                $("#fg_rut").removeClass("form-control-error");
         });
         $("#txtNombre_Proveedor").on('focusin',function(){               
                $("#fg_nombre").removeClass()("form-control-error");
         });
         $("#txtRazonSocial_Proveedor").on('focusin',function(){              
                $("#fg_razon_social").removeClass()("form-control-error");
         });
         $("#txtFono_Proveedor").on('focusin',function(){              
                $("#fg_fono").removeClass("form-control-error");
         });
         $("#txtDireccion_Proveedor").on('focusin',function(){              
                $("#fg_direccion").removeClass("form-control-error");
         });
         $("#txtCorreo_Proveedor").on('focusin',function(){              
                $("#fg_correo").removeClass("form-control-error");
         });
                 
     });
     
//Validaciones Agregar Area
     $(document).ready(function(){
         $("#frmAgregarArea").submit(function(e){
               var err = false;//error campos vacios
               var errLargo = false;//error largo de los campos
               var codigo = $("#txtCodigo_area").val();
               var nombre = $("#txtNombre_area").val();               
                                             
               if(codigo == ""){
                   err = true;                   
                   $("#fg_codigo").addClass("form-control-error");
               }
               if(codigo.length>10){
                   errLargo = true;                   
                   $("#fg_codigo").addClass("form-control-error");
               }
               if(nombre == ""){
                   err = true;                   
                   $("#fg_nombre").addClass("form-control-error");
               }
               if(nombre.length>45){
                   errLargo = true;                  
                   $("#fg_nombre").addClass("form-control-error");
               }               
               if(err){
               $("#divAlert").html('<div class="alert alert-danger alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Hay campos vacios, por favor verificalos.</div>');
               e.preventDefault();
                }
                if(errLargo){
               $("#divAlertLargo").html('<div class="alert alert-danger alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Hay campos que exceden el largo permitido, por favor verificalos.</div>');
               e.preventDefault();
                }
         });
         
         $("#txtCodigo_area").on('focusin',function(){               
                $("#fg_codigo").removeClass("form-control-error");
         });
         $("#txtNombre_area").on('focusin',function(){               
                $("#fg_nombre").removeClass()("form-control-error");
         });         
                 
     });
     
     //Validaciones Editar Area
     $(document).ready(function(){
         $("#frmEditarArea").submit(function(e){
               var err = false;//error campos vacios
               var errLargo = false;//error largo de los campos
               var codigo = $("#txtCodigo_area").val();
               var nombre = $("#txtNombre_area").val();               
                                             
               if(codigo == ""){
                   err = true;                   
                   $("#fg_codigo").addClass("form-control-error");
               }
               if(codigo.length>10){
                   errLargo = true;                   
                   $("#fg_codigo").addClass("form-control-error");
               }
               if(nombre == ""){
                   err = true;                   
                   $("#fg_nombre").addClass("form-control-error");
               }
               if(nombre.length>45){
                   errLargo = true;                   
                   $("#fg_nombre").addClass("form-control-error");
               }               
               if(err){
               $("#divAlert").html('<div class="alert alert-danger alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Hay campos vacios, por favor verificalos.</div>');
               e.preventDefault();
                }
                if(errLargo){
               $("#divAlertLargo").html('<div class="alert alert-danger alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Hay campos que exceden el largo permitido, por favor verificalos.</div>');
               e.preventDefault();
                }
         });
         
         $("#txtCodigo_area").on('focusin',function(){             
                $("#fg_codigo").removeClass("form-control-error");
         });
         $("#txtNombre_area").on('focusin',function(){               
                $("#fg_nombre").removeClass()("form-control-error");
         });         
                 
     });
     
      //Validaciones Agregar Sede
     $(document).ready(function(){
         $("#frmAgregarSede").submit(function(e){
               var err = false;
               var errLargo = false;
               var codigo = $("#txtCodigo_sede").val();
               var nombre = $("#txtNombre_sede").val();                
               var direccion = $("#txtDireccion_sede").val();
               
               
               if(codigo == ""){
                   err = true;
                   $("#fg_codigo").addClass("form-control-error");
               }
               if(codigo.length>10){
                   errLargo = true;
                   $("#fg_codigo").addClass("form-control-error");
               }
               
               if(nombre == ""){
                   err = true;                   
                   $("#fg_nombre").addClass("form-control-error");
               }
               if(nombre.length>100){
                   errLargo = true;                   
                   $("#fg_nombre").addClass("form-control-error");
               }
               
               if(direccion == ""){
                   err = true;                   
                   $("#fg_direccion").addClass("form-control-error");
               }
                if(direccion.length>200){
                   errLargo = true;                   
                   $("#fg_direccion").addClass("form-control-error");
               }
               
               if(err){
               $("#divAlert").html('<div class="alert alert-danger alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Hay campos vacios, por favor verificalos.</div>');
               e.preventDefault();
                }
                 if(errLargo){
               $("#divAlertLargo").html('<div class="alert alert-danger alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Hay campos que exceden el largo permitido, por favor verificalos.</div>');
               e.preventDefault();
                }
         });
         
         $("#txtCodigo_sede").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_codigo").removeClass("form-control-error");
         });
         $("#txtNombre_sede").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_nombre").removeClass()("form-control-error");
         });    
         $("#txtDireccion_sede").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_direccion").removeClass()("form-control-error");
         });
                 
     });
     
     //Validaciones Editar Sede
     $(document).ready(function(){
         $("#frmEditarSede").submit(function(e){
               var err = false;
               var errLargo = false;
               var codigo = $("#txtCodigo_sede").val();
               var nombre = $("#txtNombre_sede").val();                
               var direccion = $("#txtDireccion_sede").val();
               
               
               if(codigo == ""){
                   err = true;
                   $("#fg_codigo").addClass("form-control-error");
               }
               if(codigo.length>10){
                   errLargo = true;
                   $("#fg_codigo").addClass("form-control-error");
               }
               
               if(nombre == ""){
                   err = true;                   
                   $("#fg_nombre").addClass("form-control-error");
               }
               if(nombre.length>100){
                   errLargo = true;                   
                   $("#fg_nombre").addClass("form-control-error");
               }
               
               if(direccion == ""){
                   err = true;                   
                   $("#fg_direccion").addClass("form-control-error");
               }
               if(direccion.length>200){
                   errLargo = true;                   
                   $("#fg_direccion").addClass("form-control-error");
               }
               
               if(err){
               $("#divAlert").html('<div class="alert alert-danger alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Hay campos vacios, por favor verificalos.</div>');
               e.preventDefault();
                }
                 if(errLargo){
               $("#divAlertLargo").html('<div class="alert alert-danger alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Hay campos que exceden el largo permitido, por favor verificalos.</div>');
               e.preventDefault();
                }
         });
         
         $("#txtCodigo_sede").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_codigo").removeClass("form-control-error");
         });
         $("#txtNombre_sede").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_nombre").removeClass()("form-control-error");
         });    
         $("#txtDireccion_sede").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_direccion").removeClass()("form-control-error");
         });
                 
     });
     
    
     
     //Validaciones Editar Tipo Ubicación
     $(document).ready(function(){
         $("#frmEditarTipoUbicacion").submit(function(e){
               var err = false;
               var errLargo = false;
               var codigo = $("#txtCodigo_tipoUbicacion").val();
               var nombre = $("#txtNombre_tipoUbicacion").val();               
               
               
               
               if(codigo == ""){
                   err = true;                   
                   $("#fg_codigo").addClass("form-control-error");
               }
                if(codigo.length>11){
                   errLargo = true;                  
                   $("#fg_codigo").addClass("form-control-error");
               }
               
               
               if(nombre == ""){
                   err = true;
                   //$("#lblNombre").show();
                   $("#fg_nombre").addClass("form-control-error");
               }
               if(nombre.length>45){
                   errLargo = true;                  
                   $("#fg_nombre").addClass("form-control-error");
               }
               
               if(err){
               $("#divAlert").html('<div class="alert alert-danger alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Hay campos vacios, por favor verificalos.</div>');
               e.preventDefault();
                }
                if(errLargo){
               $("#divAlertLargo").html('<div class="alert alert-danger alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Hay campos que exceden el largo permitido, por favor verificalos.</div>');
               e.preventDefault();
                }
         });
         
         $("#txtCodigo_tipoUbicacion").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_codigo").removeClass("form-control-error");
         });
         $("#txtNombre_tipoUbicacion").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_nombre").removeClass()("form-control-error");
         });         
                 
     });
     
            
     
     
     
     
     
     
     
     //Validaciones Registro Producto
     $(document).ready(function(){
         $("#frmAgregarProducto").submit(function(e){
               var err = false;
               var errLargo = false;
               var codigo_producto = $("#txtCodigo_producto").val();
               var nombre_producto = $("#txtNombre_producto").val();
               var descripcion_producto = $("#txtDescripcion_producto").val();
               var cantidad_producto = $("#txtCantidad_producto").val();
               var valorNeto_producto = $("#txtValorNeto_producto").val();
               var valorIva_producto = $("#txtValorIva_producto").val();
               var valorTotal_producto = $("#txtValorTotal_producto").val();
               var marca_producto = $("#txtMarca_producto").val();
               var serial_producto = $("#txtSerial_producto").val();
               var stock_minimo_producto = $("#txtStock_minimo_producto").val();
               var codigo_activo_producto = $("#txtCodigo_activo_producto").val();
               
               if(codigo_producto == ""){
                   err = true;
                   //$("#lblNombre").show();
                   $("#fg_codigo_producto").addClass("form-control-error");
               }
               
               if(nombre_producto == ""){
                   err = true;
                   //$("#lblNombre").show();
                   $("#fg_nombre_producto").addClass("form-control-error");
               }
               if(descripcion_producto == ""){
                   err = true;
                   //$("#lblNombre").show();
                   $("#fg_descripcion_producto").addClass("form-control-error");
               }
               if(cantidad_producto == ""){
                   err = true;
                   //$("#lblNombre").show();
                   $("#fg_cantidad_producto").addClass("form-control-error");
               }
               if(valorNeto_producto == ""){
                   err = true;
                   //$("#lblNombre").show();
                   $("#fg_valorNeto_producto").addClass("form-control-error");
               }
               if(valorIva_producto == ""){
                   err = true;
                   //$("#lblNombre").show();
                   $("#fg_valorIva_producto").addClass("form-control-error");
               }
               if(valorTotal_producto == ""){
                   err = true;
                   //$("#lblNombre").show();
                   $("#fg_valorTotal_producto").addClass("form-control-error");
               }
               if(marca_producto == ""){
                   err = true;
                   //$("#lblNombre").show();
                   $("#fg_marca_producto").addClass("form-control-error");
               }
               if(serial_producto == ""){
                   err = true;
                   //$("#lblNombre").show();
                   $("#fg_serial_producto").addClass("form-control-error");
               }
               if(stock_minimo_producto == ""){
                   err = true;
                   //$("#lblNombre").show();
                   $("#fg_stock_minimo_producto").addClass("form-control-error");
               }
               if(err){
               $("#divAlert").html('<div class="alert alert-danger alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Hay campos vacios, por favor verificalos.</div>');
               e.preventDefault();
                }
                if(errLargo){
               $("#divAlertLargo").html('<div class="alert alert-warning alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Tamaño demasiado largo, por favor verifica los campos.</div>');
               e.preventDefault();
                }
         });
         
         $("#txtCodigo_producto").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_codigo_producto").removeClass("form-control-error");
         });
         $("#txtNombre_producto").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_nombre_producto").removeClass()("form-control-error");
         });
         $("#txtDescripcion_producto").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_descripcion_producto").removeClass()("form-control-error");
         });
         $("#txtCantidad_producto").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_cantidad_producto").removeClass("form-control-error");
         });
         $("#txtValorNeto_producto").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_valorNeto_producto").removeClass("form-control-error");
         });
         $("#txtValorIva_producto").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_valorIva_producto").removeClass("form-control-error");
         });
         $("#txtValorTotal_producto").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_valorTotal_producto").removeClass("form-control-error");
         });
         $("#txtMarca_producto").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#txtMarca_producto").removeClass("form-control-error");
         });
         $("#txtSerial_producto").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_serial_producto").removeClass("form-control-error");
         });
         $("#txtStock_minimo_producto").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_stock_minimo_producto").removeClass("form-control-error");
         });
         $("#txtCodigo_activo_producto").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_codigo_activo_producto").removeClass("form-control-error"); 
                
                
        });
        
        

    });
    
    $(document).ready(function(){
// Validaciones Ubicacion Agregar
                $("#frmAgregarUbicacion").submit(function(e){
               var err = false;
               var errLargo = false;
               var codigo_ubicacion = $("#txtCodigo_ubicacion").val();
               var descripcion_ubicacion = $("#txtDescripcion_ubicacion").val();

               
               if(codigo_ubicacion == ""){
                   err = true;
                   //$("#lblNombre").show();
                   $("#fg_codigo_ubicacion").addClass("form-control-error");
               }
               if(descripcion_ubicacion == ""){
                   err = true;
                   //$("#lblNombre").show();
                   $("#fg_descripcion_ubicacion").addClass("form-control-error");
               }
               if(err){
               $("#divAlert").html('<div class="alert alert-danger alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Hay campos vacios, por favor verificalos.</div>');
               e.preventDefault();
                }
                if(errLargo){
               $("#divAlertLargo").html('<div class="alert alert-warning alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Tamaño demasiado largo, por favor verifica los campos.</div>');
               e.preventDefault();
                }
                });

                $("#txtCodigo_ubicacion").on('focusin',function(){
                      // $("#lblNombre").hide();
                       $("#fg_codigo_ubicacion").removeClass("form-control-error");
                });
                $("#txtDescripcion_ubicacion").on('focusin',function(){
                      // $("#lblNombre").hide();
                       $("#fg_descripcion_ubicacion").removeClass()("form-control-error");
                });
 });
                $(document).ready(function(){
               // Validaciones Ubicacion Editar
                               $("#frmEditarubicacion").submit(function(e){
                              var err = false;
                              var errLargo = false;
                              var descripcion_ubicacion = $("#txtDescripcion_ubicacion").val();



                              if(descripcion_ubicacion == ""){
                                  err = true;
                                  //$("#lblNombre").show();
                                  $("#fg_descripcion_ubicacion").addClass("form-control-error");
                              }
                              if(err){
                              $("#divAlert").html('<div class="alert alert-danger alert-dismissable">\n\
                               <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                               Hay campos vacios, por favor verificalos.</div>');
                              e.preventDefault();
                               }
                               if(errLargo){
                              $("#divAlertLargo").html('<div class="alert alert-warning alert-dismissable">\n\
                               <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                               Tamaño demasiado largo, por favor verifica los campos.</div>');
                              e.preventDefault();
                               }
                               });

                               $("#txtDescripcion_ubicacion").on('focusin',function(){
                                     // $("#lblNombre").hide();
                                      $("#fg_descripcion_ubicacion").removeClass()("form-control-error");
                               });
                });

            $(document).ready(function(){
           // Validaciones Registrar Tipo Producto
                           $("#frmAgregarTipoProducto").submit(function(e){
                          var err = false;
                          var categoria_tipo_producto = $("#txtCategoria_tipo_producto").val();


                          if(categoria_tipo_producto == ""){
                              err = true;
                              //$("#lblNombre").show();
                              $("#fg_categoria_tipo_producto").addClass("form-control-error");
                          }

                          if(err){
                          $("#divAlert").html('<div class="alert alert-danger alert-dismissable">\n\
                           <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                           Campos vacio, por favor verificalo.</div>');
                          e.preventDefault();
                           }
                           });

                           $("#txtCategoria_tipo_producto").on('focusin',function(){
                                 // $("#lblNombre").hide();
                                  $("#fg_categoria_tipo_producto").removeClass("form-control-error");
                           });

            });
            
            
            $(document).ready(function(){
           // Validaciones Editar Tipo Producto
                           $("#frmEditarTipoProducto").submit(function(e){
                          var err = false;
                          var categoria_tipo_producto = $("#txtCategoria_tipo_producto").val();


                          if(categoria_tipo_producto == ""){
                              err = true;
                              //$("#lblNombre").show();
                              $("#fg_categoria_tipo_producto").addClass("form-control-error");
                          }

                          if(err){
                          $("#divAlert").html('<div class="alert alert-danger alert-dismissable">\n\
                           <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                           Campos vacio, por favor verificalo.</div>');
                          e.preventDefault();
                           }
                           });

                           $("#txtCategoria_tipo_producto").on('focusin',function(){
                                 // $("#lblNombre").hide();
                                  $("#fg_categoria_tipo_producto").removeClass("form-control-error");
                           });

            });
            
            
              $(document).ready(function(){
           // Validaciones Registrar Tipo Unidad
                           $("#frmAgregarTipoUnidad").submit(function(e){
                          var err = false;
                          var nombre_unidad = $("#txtNombre_unidad").val();


                          if(nombre_unidad == ""){
                              err = true;
                              //$("#lblNombre").show();
                              $("#fg_nombre_unidad").addClass("form-control-error");
                          }

                          if(err){
                          $("#divAlert").html('<div class="alert alert-danger alert-dismissable">\n\
                           <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                           Campos vacio, por favor verificalo.</div>');
                          e.preventDefault();
                           }
                           });

                           $("#txtNombre_unidad").on('focusin',function(){
                                 // $("#lblNombre").hide();
                                  $("#fg_nombre_unidad").removeClass("form-control-error");
                           });

            });
            
            
            $(document).ready(function(){
           // Validaciones Editar Tipo Unidad
                           $("#frmEditarTipoUnidad").submit(function(e){
                          var err = false;
                          var nombre_unidad = $("#txtNombre_unidad").val();


                          if(nombre_unidad == ""){
                              err = true;
                              //$("#lblNombre").show();
                              $("#fg_nombre_unidad").addClass("form-control-error");
                          }

                          if(err){
                          $("#divAlert").html('<div class="alert alert-danger alert-dismissable">\n\
                           <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                           Campos vacio, por favor verificalo.</div>');
                          e.preventDefault();
                           }
                           });

                           $("#txtNombre_unidad").on('focusin',function(){
                                 // $("#lblNombre").hide();
                                  $("#fg_nombre_unidad").removeClass("form-control-error");
                           });

            });

     
 //Validaciones Agregar Bodega
            $(document).ready(function(){
                $("#frmAgregarBodega").submit(function(e){
                      var err = false;
                      var errLargo = false;
                      var errNum = false;
                      var codigo = $("#txtCodigo_bodega").val();
                      var volumen = $("#txtVolumen_bodega").val();               
                      var ubicacion = $("#txtUbicacion_bodega").val(); 



                      if(codigo == ""){
                          err = true;                  
                          $("#fg_codigo").addClass("form-control-error");
                      }
                       if(codigo.length>10){
                          errLargo = true;                  
                          $("#fg_codigo").addClass("form-control-error");
                      }

                      if(volumen == ""){
                          err = true;                   
                          $("#fg_volumen").addClass("form-control-error");
                      }
                      if(volumen.length>11){
                          errLargo = true;                   
                          $("#fg_volumen").addClass("form-control-error");
                      }
                      if(isNaN(volumen)){
                          errNum = true;                   
                          $("#fg_volumen").addClass("form-control-error");
                      }

                       if(ubicacion == ""){
                          err = true;                
                          $("#fg_ubicacion").addClass("form-control-error");
                      }
                       if(ubicacion.length>45){
                          errLargo = true;                
                          $("#fg_ubicacion").addClass("form-control-error");
                      }

                      if(err){
                      $("#divAlert").html('<div class="alert alert-danger alert-dismissable">\n\
                       <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                       Hay campos vacios, por favor verificalos.</div>');
                      e.preventDefault();
                       }
                      if(errLargo){
                      $("#divAlertLargo").html('<div class="alert alert-danger alert-dismissable">\n\
                       <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                       Hay campos que exceden el largo permitido, por favor verificalos.</div>');
                      e.preventDefault();
                       }
                       if(errNum){
                      $("#divAlertNum").html('<div class="alert alert-danger alert-dismissable">\n\
                       <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                       Se ingresó letras en campo númerico, por favor verificalos.</div>');
                      e.preventDefault();
                       }
                });                         

                $("#txtCodigo_bodega").on('focusin',function(){              
                       $("#fg_codigo").removeClass("form-control-error");
                });
                $("#txtVolumen_bodega").on('focusin',function(){              
                       $("#fg_volumen").removeClass()("form-control-error");
                });  
                $("#txtUbicacion_bodega").on('focusin',function(){              
                       $("#fg_ubicacion").removeClass()("form-control-error");
                }); 

            });
     

     //Validaciones Editar Bodega
     $(document).ready(function(){
         $("#frmEditarBodega").submit(function(e){
               var err = false;
               var errLargo = false;
               var errNum = false;
               var codigo = $("#txtCodigo_bodega").val();
               var volumen = $("#txtVolumen_bodega").val();               
               var ubicacion = $("#txtUbicacion_bodega").val(); 
              
               
                              
               if(codigo == ""){
                   err = true;                  
                   $("#fg_codigo").addClass("form-control-error");
               }
                if(codigo.length>10){
                   errLargo = true;                  
                   $("#fg_codigo").addClass("form-control-error");
               }
               
               if(volumen == ""){
                   err = true;                   
                   $("#fg_volumen").addClass("form-control-error");
               }
               if(volumen.length>11){
                   errLargo = true;                   
                   $("#fg_volumen").addClass("form-control-error");
               }
               if(isNaN(volumen)){
                   errNum = true;                   
                   $("#fg_volumen").addClass("form-control-error");
               }
               
                if(ubicacion == ""){
                   err = true;                
                   $("#fg_ubicacion").addClass("form-control-error");
               }
                if(ubicacion.length>45){
                   errLargo = true;                
                   $("#fg_ubicacion").addClass("form-control-error");
               }
               
               if(err){
               $("#divAlert").html('<div class="alert alert-danger alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Hay campos vacios, por favor verificalos.</div>');
               e.preventDefault();
                }
               if(errLargo){
               $("#divAlertLargo").html('<div class="alert alert-danger alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Hay campos que exceden el largo permitido, por favor verificalos.</div>');
               e.preventDefault();
                }
                if(errNum){
               $("#divAlertNum").html('<div class="alert alert-danger alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Se ingresó letras en campo númerico, por favor verificalos.</div>');
               e.preventDefault();
                }
         });                         
         
         $("#txtCodigo_bodega").on('focusin',function(){              
                $("#fg_codigo").removeClass("form-control-error");
         });
         $("#txtVolumen_bodega").on('focusin',function(){              
                $("#fg_volumen").removeClass()("form-control-error");
         });  
         $("#txtUbicacion_bodega").on('focusin',function(){              
                $("#fg_ubicacion").removeClass()("form-control-error");
         }); 
                 
     });
     
     //Validaciones Agregar Tipo Ubicación
     $(document).ready(function(){
         $("#frmAgregarTipoUbicacion").submit(function(e){
               var err = false;        
               var errNum = false;
               var codigo = $("#txtCodigo_tipoUbicacion").val();
               var nombre = $("#txtNombre_tipoUbicacion").val();               
               
               
               
               if(codigo == ""){
                   err = true;                   
                   $("#fg_codigo").addClass("form-control-error");
               }
                if(codigo.length>11){
                   errLargo = true;                  
                   $("#fg_codigo").addClass("form-control-error");
               }
                                           
               if(nombre == ""){
                   err = true;
                   //$("#lblNombre").show();
                   $("#fg_nombre").addClass("form-control-error");
               }
               if(nombre.length>45){
                   errLargo = true;                  
                   $("#fg_nombre").addClass("form-control-error");
               }
               
               if(err){
               $("#divAlert").html('<div class="alert alert-danger alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Hay campos vacios, por favor verificalos.</div>');
               e.preventDefault();
                }
                if(errLargo){
               $("#divAlertLargo").html('<div class="alert alert-danger alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Hay campos que exceden el largo permitido, por favor verificalos.</div>');
               e.preventDefault();
                }
              
         });
         
         $("#txtCodigo_tipoUbicacion").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_codigo").removeClass("form-control-error");
         });
         $("#txtNombre_tipoUbicacion").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_nombre").removeClass()("form-control-error");
         });         
                 
     });
     
     
     //Validaciones Registro Producto
     $(document).ready(function(){
         $("#frmEditarProducto").submit(function(e){
               var err = false;
               var errLargo = false;
               var codigo_producto = $("#txtCodigo_producto").val();
               var nombre_producto = $("#txtNombre_producto").val();
               var descripcion_producto = $("#txtDescripcion_producto").val();
               var cantidad_producto = $("#txtCantidad_producto").val();
               var valorNeto_producto = $("#txtValorNeto_producto").val();
               var valorIva_producto = $("#txtValorIva_producto").val();
               var valorTotal_producto = $("#txtValorTotal_producto").val();
               var marca_producto = $("#txtMarca_producto").val();
               var serial_producto = $("#txtSerial_producto").val();
               var stock_minimo_producto = $("#txtStock_minimo_producto").val();
               var codigo_activo_producto = $("#txtCodigo_activo_producto").val();
               
               if(codigo_producto == ""){
                   err = true;
                   //$("#lblNombre").show();
                   $("#fg_codigo_producto").addClass("form-control-error");
               }
               
               if(nombre_producto == ""){
                   err = true;
                   //$("#lblNombre").show();
                   $("#fg_nombre_producto").addClass("form-control-error");
               }
               if(descripcion_producto == ""){
                   err = true;
                   //$("#lblNombre").show();
                   $("#fg_descripcion_producto").addClass("form-control-error");
               }
               if(cantidad_producto == ""){
                   err = true;
                   //$("#lblNombre").show();
                   $("#fg_cantidad_producto").addClass("form-control-error");
               }
               if(valorNeto_producto == ""){
                   err = true;
                   //$("#lblNombre").show();
                   $("#fg_valorNeto_producto").addClass("form-control-error");
               }
               if(valorIva_producto == ""){
                   err = true;
                   //$("#lblNombre").show();
                   $("#fg_valorIva_producto").addClass("form-control-error");
               }
               if(valorTotal_producto == ""){
                   err = true;
                   //$("#lblNombre").show();
                   $("#fg_valorTotal_producto").addClass("form-control-error");
               }
               if(marca_producto == ""){
                   err = true;
                   //$("#lblNombre").show();
                   $("#fg_marca_producto").addClass("form-control-error");
               }
               if(serial_producto == ""){
                   err = true;
                   //$("#lblNombre").show();
                   $("#fg_serial_producto").addClass("form-control-error");
               }
               if(stock_minimo_producto == ""){
                   err = true;
                   //$("#lblNombre").show();
                   $("#fg_stock_minimo_producto").addClass("form-control-error");
               }
               if(err){
               $("#divAlert").html('<div class="alert alert-danger alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Hay campos vacios, por favor verificalos.</div>');
               e.preventDefault();
                }
                if(errLargo){
               $("#divAlertLargo").html('<div class="alert alert-warning alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Tamaño demasiado largo, por favor verifica los campos.</div>');
               e.preventDefault();
                }
         });
         
         $("#txtCodigo_producto").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_codigo_producto").removeClass("form-control-error");
         });
         $("#txtNombre_producto").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_nombre_producto").removeClass()("form-control-error");
         });
         $("#txtDescripcion_producto").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_descripcion_producto").removeClass()("form-control-error");
         });
         $("#txtCantidad_producto").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_cantidad_producto").removeClass("form-control-error");
         });
         $("#txtValorNeto_producto").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_valorNeto_producto").removeClass("form-control-error");
         });
         $("#txtValorIva_producto").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_valorIva_producto").removeClass("form-control-error");
         });
         $("#txtValorTotal_producto").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_valorTotal_producto").removeClass("form-control-error");
         });
         $("#txtMarca_producto").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#txtMarca_producto").removeClass("form-control-error");
         });
         $("#txtSerial_producto").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_serial_producto").removeClass("form-control-error");
         });
         $("#txtStock_minimo_producto").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_stock_minimo_producto").removeClass("form-control-error");
         });
         $("#txtCodigo_activo_producto").on('focusin',function(){
               // $("#lblNombre").hide();
                $("#fg_codigo_activo_producto").removeClass("form-control-error"); 
                
                
        });
        
        

    });
    
    //Validaciones Agregar Centro de Costo
     $(document).ready(function(){
         $("#frmAgregarCentroCosto").submit(function(e){
               var err = false;
               var errLargo = false;
               var errNum = false;
               var codigo = $("#txt_codigo_CCosto").val();
               var nombre = $("#txt_nombre_CCosto").val();               
               var gastoTotal = $("#txt_GastoTotal").val(); 
              
               
                              
               if(codigo == ""){
                   err = true;                  
                   $("#fg_codigo").addClass("form-control-error");
               }
                if(codigo.length>10){
                   errLargo = true;                  
                   $("#fg_codigo").addClass("form-control-error");
               }
               
               if(nombre == ""){
                   err = true;                   
                   $("#fg_nombre").addClass("form-control-error");
               }
               if(nombre.length>100){
                   errLargo = true;                   
                   $("#fg_nombre").addClass("form-control-error");
               }
              
               
                if(gastoTotal == ""){
                   err = true;                
                   $("#fg_gastoTotal").addClass("form-control-error");
               }
                if(gastoTotal.length>11){
                   errLargo = true;                
                   $("#fg_gastoTotal").addClass("form-control-error");
               }
                if(isNaN(gastoTotal)){
                   errNum = true;                   
                   $("#fg_gastoTotal").addClass("form-control-error");
               }
               
               if(err){
               $("#divAlert").html('<div class="alert alert-danger alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Hay campos vacios, por favor verificalos.</div>');
               e.preventDefault();
                }
               if(errLargo){
               $("#divAlertLargo").html('<div class="alert alert-danger alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Hay campos que exceden el largo permitido, por favor verificalos.</div>');
               e.preventDefault();
                }
                if(errNum){
               $("#divAlertNum").html('<div class="alert alert-danger alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Se ingresó letras en campo númerico, por favor verificalos.</div>');
               e.preventDefault();
                }
         });                         
         
         $("#txt_codigo_CCosto").on('focusin',function(){              
                $("#fg_codigo").removeClass("form-control-error");
         });
         $("#txt_nombre_CCosto").on('focusin',function(){              
                $("#fg_nombre").removeClass()("form-control-error");
         });  
         $("#txt_GastoTotal").on('focusin',function(){              
                $("#fg_gastoTotal").removeClass()("form-control-error");
         }); 
                 
     });
               
     //Validaciones Editar Centro de Costo
     $(document).ready(function(){
         $("#frmEditarCentroCosto").submit(function(e){
               var err = false;
               var errLargo = false;
               var errNum = false;
               var codigo = $("#txt_codigo_CCosto").val();
               var nombre = $("#txt_nombre_CCosto").val();               
               var gastoTotal = $("#txt_GastoTotal").val(); 
              
               
                              
               if(codigo == ""){
                   err = true;                  
                   $("#fg_codigo").addClass("form-control-error");
               }
                if(codigo.length>10){
                   errLargo = true;                  
                   $("#fg_codigo").addClass("form-control-error");
               }
               
               if(nombre == ""){
                   err = true;                   
                   $("#fg_nombre").addClass("form-control-error");
               }
               if(nombre.length>100){
                   errLargo = true;                   
                   $("#fg_nombre").addClass("form-control-error");
               }
              
               
                if(gastoTotal == ""){
                   err = true;                
                   $("#fg_gastoTotal").addClass("form-control-error");
               }
                if(gastoTotal.length>11){
                   errLargo = true;                
                   $("#fg_gastoTotal").addClass("form-control-error");
               }
                if(isNaN(gastoTotal)){
                   errNum = true;                   
                   $("#fg_gastoTotal").addClass("form-control-error");
               }
               
               if(err){
               $("#divAlert").html('<div class="alert alert-danger alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Hay campos vacios, por favor verificalos.</div>');
               e.preventDefault();
                }
               if(errLargo){
               $("#divAlertLargo").html('<div class="alert alert-danger alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Hay campos que exceden el largo permitido, por favor verificalos.</div>');
               e.preventDefault();
                }
                if(errNum){
               $("#divAlertNum").html('<div class="alert alert-danger alert-dismissable">\n\
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>\n\
                Se ingresó letras en campo númerico, por favor verificalos.</div>');
               e.preventDefault();
                }
         });                         
         
         $("#txt_codigo_CCosto").on('focusin',function(){              
                $("#fg_codigo").removeClass("form-control-error");
         });
         $("#txt_nombre_CCosto").on('focusin',function(){              
                $("#fg_nombre").removeClass()("form-control-error");
         });  
         $("#txt_GastoTotal").on('focusin',function(){              
                $("#fg_gastoTotal").removeClass()("form-control-error");
         }); 
                 
     });