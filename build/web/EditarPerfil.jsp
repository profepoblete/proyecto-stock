<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="Conexion.ConexionDB"%>
<%@page import="Modelos.Usuario"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Editar Perfil</title>
        <link href="css/styles.css" rel="stylesheet" />
        <link href="css/validacion.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <link rel="icon" type="image/x-icon" href="assets/img/favicon.png" />
        <script data-search-pseudo-elements defer src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.min.js" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/feather-icons/4.24.1/feather.min.js" crossorigin="anonymous"></script>
    </head>
    <body class="nav-fixed">
        <%
            HttpSession sessionMostrar = request.getSession();
            Usuario objUser = (Usuario)sessionMostrar.getAttribute("objUser");
            String rut_usuario = (String)sessionMostrar.getAttribute("rut_usuario");
            objUser.setRut_usuario(rut_usuario);
        
        %>
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
                                        <div class="card-header justify-content-center"><h3 class="font-weight-light my-4">Editar Perfil</h3></div>
                                    <div class="justify-content-center" style="text-align: center;" id="divAlert"></div>
                                    <div class="card-body">
                                        <form action="UpdPerfil" method="post" id="frmEditar" name="frmEditar" accept-charset="ISO-8859-1" autocomplete="off">
                                            <div class="form-row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputFirstName"><i data-feather="user"></i> Rut</label>
                                                        <div class="form-group"id="fg_rut">
                                                            <input class="form-control py-4" id="txtRut_Usuario" name="txtRut_Usuario" type="text" placeholder="Rut" readonly="" value="<%= objUser.getRut_usuario()%>" /></div>
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputFirstName"><i data-feather="user"></i> Nombre</label>
                                                        <div class="form-group"id="fg_nombre">
                                                            <input class="form-control py-4" id="txtNombreUsuario" name="txtNombreUsuario" type="text" placeholder="Nombre" value="<%= objUser.getNombre_usuario()%>" /></div>
                                                        </div>  
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputLastName"><i data-feather="user"></i> Apellido Paterno</label>
                                                        <div class="form-group"id="fg_ape_paterno">
                                                            <input class="form-control py-4" id="txtApe_paterno_usuario" name="txtApe_paterno_usuario" type="text" placeholder="Apellido Paterno" value="<%= objUser.getApe_paterno_usuario()%>"  /></div>
                                                        </div> 
                                                        
                                                </div>

                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputLastName"><i data-feather="user"></i> Apellido Materno</label>
                                                        <div class="form-group"id="fg_ape_materno">
                                                            <input class="form-control py-4" id="txtApe_materno_usuario" name="txtApe_materno_usuario" type="text" placeholder="Apellido Materno" value="<%= objUser.getApe_materno_usuario()%>"/></div>
                                                        </div> 
                                                </div>
                                                
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputLastName"><i data-feather="smartphone"></i> Celular</label>
                                                        <div class="form-group"id="fg_celular">
                                                            <input class="form-control py-4" id="txtCelular_usuario" name="txtCelular_usuario" type="tel" placeholder=" 9-XXX-XXX-XX" value="<%= objUser.getCelular_usuario()%>"/></div>
                                                        </div> 
                                                        
                                                </div>
                                                
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputLastName"><i data-feather="home"></i> Dirección</label>
                                                        <div class="form-group"id="fg_direccion">
                                                            <input class="form-control py-4" id="txtDireccion_usuario" name="txtDireccion_usuario" type="text" placeholder="Ingrese Dirección" value="<%= objUser.getDireccion_usuario()%>"/></div>
                                                        </div> 
                                                        
                                                </div>
                                                
                                            </div>
                                            <div class="form-row">
                                                <div class="col-md-6">												
                                                    <div class="form-group">
                                                        <label class="small mb-1" for="inputEmailAddress"><i data-feather="mail"></i> Correo</label>
                                                        <div class="form-group"id="fg_correo">
                                                            <input class="form-control py-4" id="txtCorreo_usuario" name="txtCorreo_usuario" type="email" aria-describedby="emailHelp" placeholder="correo@ejemplo.com" value="<%= objUser.getCorreo_usuario()%>" /></div>
                                                        </div> 
                                                        
                                                </div>

                                                <div class="col-md-6">	
                                                    <div class="form-group">
                                                        <label for="exampleSelect1" >Tipo de Usuario</label>
                                                        <select class="form-control" id="ddlTipo_Usuario" name="ddlTipo_Usuario">
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
                                                                       if(rs.getInt(1) == objUser.getId_tipo_usuario()){
                                                                           out.println("<option value = " + rs.getInt(1) + " selected>" + rs.getString(2) + "</option>");
                                                                       }else{
                                                                           out.println("<option value = " + rs.getInt(1) + " disabled>" + rs.getString(2) + "</option>");
                                                                       }
                                                                       
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
                                                        <label for="exampleSelect1" >Codigo Centro de Costo</label>
                                                        <select class="form-control" id="ddlCentro_Costo" name="ddlCentro_Costo">
                                                            <%
                                                            try {
                                                                   objCon.getConn();
                                                                   String query = "SELECT CODIGO_CENTRO_COSTO, NOMBRE_CENTRO_COSTO FROM CENTRO_COSTO";
                                                                   PreparedStatement psI;
                                                                   ResultSet rs;
                                                                   psI = objCon.getConn().prepareStatement(query);
                                                                   rs = psI.executeQuery();
                                                                   while(rs.next()){
                                                                       if(rs.getString(1).equalsIgnoreCase(objUser.getCodigo_centro_costo())){
                                                                           out.println("<option value = " + rs.getString(1) + " selected>" + rs.getString(2) + "</option>");
                                                                       }else{
                                                                           out.println("<option value = " + rs.getString(1) + " disabled>" + rs.getString(2) + "</option>");
                                                                       }
                                                                       
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
                                                            <input class="form-control py-4" id="txtPassword_usuario" name="txtPassword_usuario" type="text" placeholder="Ingrese Contraseña" value="<%= objUser.getPassword_usuario()%>"/></div>
                                                        </div> 
                                                        
                                                </div>
                                            </div>
                                            <div class="form-group mt-4 mb-0">
                                                <input class="btn btn-primary btn-block" name="btnGuardar" type="submit" value="Editar Perfil">
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