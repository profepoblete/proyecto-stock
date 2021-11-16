t<%@page import="java.sql.PreparedStatement"%>
<%@page import="Conexion.ConexionDB"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DAO.UsuarioDAO"%>
<!DOCTYPE html>
<html lang="en">
    <script>
        function checkRut(rut) {
    // Despejar Puntos
    var valor = rut.value.replace('.','');
    // Despejar Guión
    valor = valor.replace('-','');
    
    // Aislar Cuerpo y Dígito Verificador
    cuerpo = valor.slice(0,-1);
    dv = valor.slice(-1).toUpperCase();
    
    // Formatear RUN
    rut.value = cuerpo + '-'+ dv
    
    // Si no cumple con el mínimo ej. (n.nnn.nnn)
    if(cuerpo.length < 7) { rut.setCustomValidity("RUT Incompleto"); return false;}
    
    // Calcular Dígito Verificador
    suma = 0;
    multiplo = 2;
    
    // Para cada dígito del Cuerpo
    for(i=1;i<=cuerpo.length;i++) {
    
        // Obtener su Producto con el Múltiplo Correspondiente
        index = multiplo * valor.charAt(cuerpo.length - i);
        
        // Sumar al Contador General
        suma = suma + index;
        
        // Consolidar Múltiplo dentro del rango [2,7]
        if(multiplo < 7) { multiplo = multiplo + 1; } else { multiplo = 2; }
  
    }
    
    // Calcular Dígito Verificador en base al Módulo 11
    dvEsperado = 11 - (suma % 11);
    
    // Casos Especiales (0 y K)
    dv = (dv == 'K')?10:dv;
    dv = (dv == 0)?11:dv;
    
    // Validar que el Cuerpo coincide con su Dígito Verificador
    if(dvEsperado != dv) { rut.setCustomValidity("RUT Inválido"); return false; }
    
    // Si todo sale bien, eliminar errores (decretar que es válido)
    rut.setCustomValidity('');
}
    </script>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tabla Sedes</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/validacion.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.24.1/feather.min.js" crossorigin="anonymous"></script>
    </head>
    <%
        HttpSession objsesion = request.getSession();
    
        String rol = (String)objsesion.getAttribute("rol");
        
        if(!rol.equalsIgnoreCase("Administrador")){
            response.sendRedirect("Index.jsp");
        }
        
    %>
    <body class="nav-fixed">
        <jsp:include page="Header.jsp"></jsp:include>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <jsp:include page="Menu.jsp"></jsp:include>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header justify-content-center">
                                        <h3 class="font-weight-light my-4">Registro de Usuario</h3>
                                        
                                    </div>
                                    <div class="justify-content-center" style="text-align: center;" id="divAlert"></div>
                                    
                                    <div class="card-body">
                                        <form action="AddUsuario" id="frmAgregarUsuario" method="post" autocomplete="off" accept-charset="ISO-8859-1">
                                            <div class="form-row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputFirstName"><i data-feather="user-x"></i> Rut</label>
                                                        <div class="form-group"id="fg_rut">
                                                            <input class="form-control py-4" id="txtRut_Usuario" oninput="checkRut(this)"  name="txtRut_Usuario" type="text" placeholder="12345678-K" />
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputFirstName"><i data-feather="user"></i> Nombre</label>
                                                        <div class="form-group"id="fg_nombre">
                                                            <input class="form-control py-4" id="txtNombreUsuario" name="txtNombreUsuario" type="text" placeholder="Nombre" /></div>
                                                        </div>                                                        
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputLastName"><i data-feather="user"></i> Apellido Paterno</label>
                                                        <div class="form-group"id="fg_ape_paterno">
                                                            <input class="form-control py-4" id="txtApe_paterno_usuario" name="txtApe_paterno_usuario" type="text" placeholder="Apellido Paterno" /></div>
                                                        </div>                                                        
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputLastName"><i data-feather="user"></i> Apellido Materno</label>
                                                        <div class="form-group"id="fg_ape_materno">
                                                            <input class="form-control py-4" id="txtApe_materno_usuario" name="txtApe_materno_usuario" type="text" placeholder="Apellido Materno" /></div>
                                                        </div>                                                        
                                                </div>
                                                 
                                                
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputLastName"><i data-feather="smartphone"></i> Celular</label>
                                                        <div class="form-group"id="fg_celular">
                                                            <input class="form-control py-4" id="txtCelular_usuario" name="txtCelular_usuario" type="tel" placeholder=" 9-XXX-XXX-XX" /></div>
                                                        </div>
                                                </div>
                                                
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputLastName"><i data-feather="home"></i> Dirección</label>
                                                        <div class="form-group"id="fg_direccion">
                                                            <input class="form-control py-4" id="txtDireccion_usuario" name="txtDireccion_usuario" type="text" placeholder="Ingrese Dirección" /></div>
                                                        </div>                                                        
                                                </div>
                                                
                                            </div>
                                            <div class="form-row">
                                                <div class="col-md-6">												
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputEmailAddress"><i data-feather="mail"></i> Correo</label>
                                                        <div class="form-group"id="fg_correo">
                                                            <input class="form-control py-4" id="txtCorreo_usuario" name="txtCorreo_usuario" type="email" aria-describedby="emailHelp" placeholder="correo@ejemplo.com" /></div>
                                                        </div>
                                                </div>
                                                <div class="col-md-6">	
                                                    <div class="form-group">
                                                        <label for="exampleSelect1" >Tipo de Usuario</label>
                                                        <select class="form-control" id="ddlTipo_Usuario" name="ddlTipo_Usuario">
                                                        <%--
                                                            UsuarioDAO objUsuarioDAO = new UsuarioDAO();
                                                            ResultSet rs = objUsuarioDAO.cargarUsuario();
                                                            while(rs.next()){
                                                                out.println("<option value = "+rs.getInt(1)+">" + rs.getString(2) + "</option>");
            }
                                                        --%>
                                                        <%
                                                            ConexionDB objCon = new ConexionDB();
                                                            try {
                                                                   objCon.getConn();
                                                                   String query = "SELECT ID_TIPO_USUARIO, CATEGORIA_TIPO_USUARIO FROM TIPO_USUARIO";
                                                                   PreparedStatement psI;
                                                                   ResultSet rs;
                                                                   psI = objCon.getConn().prepareStatement(query);
                                                                   rs = psI.executeQuery();
                                                                   while(rs.next()){
                                                                       out.println("<option value = " + rs.getInt(1) + ">" + rs.getString(2) + "</option>");
                                                                   }
                                                            }catch (Exception e) {
                                                            }
                                                        %>
                                                        </select>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-row">

                                                <div class="col-md-6">	
                                                    <div class="form-group">
                                                        <%--<label for="exampleSelect1" >Centro de Costo</label>--%>
                                                        <label for="exampleSelect1" >Area</label>
                                                        <%--<select class="form-control" id="ddlCentro_Costo" name="ddlCentro_Costo">--%>
                                                        <select class="form-control" id="ddlArea" name="ddlArea">
                                                       
                                                        <%
                                                            try {
                                                                   objCon.getConn();
                                                                   //String query = "SELECT id_area, descripcion_inventario FROM inventario";
                                                                   String query = "SELECT id_area, nombre_area FROM area";
                                                                   PreparedStatement psI;
                                                                   ResultSet rs;
                                                                   psI = objCon.getConn().prepareStatement(query);
                                                                   rs = psI.executeQuery();
                                                                   while(rs.next()){
                                                                       out.println("<option value = " + rs.getString(1) + ">" + rs.getString(2) + "</option>");
                                                                   }
                                                            }catch (Exception e) {
                                                            }
                                                        %>
                                                        </select>
                                                    </div>
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputPassword"><i data-feather="key"></i> Contraseña</label>
                                                        <div class="form-group"id="fg_password">
                                                            <input class="form-control py-4" id="txtPassword_usuario" name="txtPassword_usuario" type="password" placeholder="Ingrese Contraseña" /></div>
                                                        </div>
                                                </div>
                                            </div>
                                            <div class="form-group mt-4 mb-0">
                                                    <button class="btn btn-primary btn-block" type="submit">Registrar Usuario</button>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <jsp:include page="Footer.jsp"></jsp:include>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="assets/demo/datatables-demo.js"></script>
        <script src="js/validacion.js"></script>
    </body>
</html>

